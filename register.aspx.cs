using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Data.Common;
using System.Data.Odbc;
using System.Configuration;
using System.Data;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using System.Threading.Tasks;
using MySqlX.XDevAPI;
using NPOI.SS.Formula.Functions;
using System.Globalization;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Security.Policy;
using WebPage.Services;

namespace WebPage
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                validarPlanes();

                CambiarPlanSeleccionado();

                CargarTipoDocumento();
                CargarGeneros();
                CargarCiudades();

                txbFechaNac.Attributes.Add("type", "date");
                txbFechaIni.Attributes.Add("type", "date");
                txbFechaFin.Attributes.Add("type", "date");

                DateTime dtHoy = DateTime.Now;
                DateTime dtHoyUnAnnio = DateTime.Now.AddYears(1);
                DateTime dt14 = DateTime.Now.AddYears(-14);
                DateTime dt100 = DateTime.Now.AddYears(-100);
                txbFechaNac.Attributes.Add("min", dt100.Year.ToString() + "-" + string.Format("{0:MM}", dt100) + "-" + String.Format("{0:dd}", dt100));
                txbFechaNac.Attributes.Add("max", dt14.Year.ToString() + "-" + string.Format("{0:MM}", dt14) + "-" + String.Format("{0:dd}", dt14));

                txbFechaIni.Attributes.Add("value", dtHoy.Year.ToString() + "-" + string.Format("{0:MM}", dtHoy) + "-" + String.Format("{0:dd}", dtHoy));
                txbFechaFin.Attributes.Add("value", dtHoyUnAnnio.Year.ToString() + "-" + string.Format("{0:MM}", dtHoyUnAnnio) + "-" + String.Format("{0:dd}", dtHoyUnAnnio));

                txbDocumento.Attributes.Add("type", "number");
                txbCelular.Attributes.Add("type", "number");     
            }

            txbFechaIni.Attributes.Add("min", String.Format("{0:yyyy-MM-dd}", DateTime.Now));

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPlanesWeb();

            if (dt != null && dt.Rows.Count > 0 && Request.QueryString.Count > 0)
            {
                string idPlanQS = Request.QueryString["idPlan"];

                DataTable dtPlan = cg.ConsultarPlanWebPorId(int.Parse(idPlanQS));

                string idPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["idPlan"].ToString() : "0";
                string nombrePlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["NombrePlan"].ToString() : "";
                string codSiigoPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["CodSiigoPlan"].ToString() : "";

                if (idPlan != idPlanQS || idPlan == "0")
                {
                    Response.Redirect("default");
                }

                if (dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1")
                {
                    txbMetodoPago.Text = "Débito Automático";
                } 
                else
                {
                    txbMetodoPago.Text = "Pago Único";
                }

                txbValorPlan.Text = dtPlan.Rows[0]["PrecioTotal"].ToString();
                hfValorPlan.Value = dtPlan.Rows[0]["PrecioTotal"].ToString();
                ltValor.Text = "$" + string.Format("{0:N0}", Convert.ToDecimal(dtPlan.Rows[0]["PrecioTotal"]));

                Session["idPlan"] = idPlanQS;
                Session["nombrePlan"] = nombrePlan;
                Session["codSiigoPlan"] = codSiigoPlan;

                dtPlan.Dispose();

                if (idPlanQS == "12" || idPlanQS == "17")  // Plan de migracion 2.000 y 89.000
                {
                    txbFechaIni.Enabled = false;
                    txbFechaFin.Enabled = false;
                }
            }

            dt.Dispose();
        }

        private void validarPlanes()
        {
            string idPlanQS = Request.QueryString["idPlan"];

            //if (idPlanQS != "1" && idPlanQS != "10" && idPlanQS != "12" && idPlanQS != "16" && idPlanQS != "17")  // Planes: Migracion 2.000 y 89.000 - Easy 99.000 - 6+2 590.000 - 3+1 349.000
            //{
            //    Response.Redirect("default");
            //}

            if (idPlanQS != "1" && idPlanQS != "10" && idPlanQS != "12")  // Planes: Migracion 2.000 y 89.000 - Easy 99.000
            {
                Response.Redirect("default");
            }
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            dt.Dispose();
        }

        private void CargarGeneros()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarGeneros();

            ddlGenero.DataSource = dt;
            ddlGenero.DataBind();

            dt.Dispose();
        }

        private void CargarCiudades()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.ConsultarCiudadesSedesWeb();

            ddlCiudad.DataSource = dt;
            ddlCiudad.DataTextField = "NombreCiudadSede";
            ddlCiudad.DataValueField = "idCiudadSede";
            ddlCiudad.DataBind();

            dt.Dispose();

            ddlSedes.Enabled = false;
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSedes.Items.Clear();
            ddlSedes.Items.Add(new ListItem("Seleccione", ""));
            ddlSedes.Enabled = false;

            if (string.IsNullOrEmpty(ddlCiudad.SelectedValue)) return;

            ddlSedes.Enabled = true;

            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(int.Parse(ddlCiudad.SelectedItem.Value.ToString()));

            ddlSedes.DataSource = dt;
            ddlCiudad.DataTextField = "NombreSede";
            ddlCiudad.DataValueField = "IdSede";
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected async void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                //Guardamos los datos del afiliado
                string strCedula = txbDocumento.Text.ToString();
                Session.Add("documentoAfiliado", strCedula);
                int idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedItem.Value.ToString());

                Session.Add("idAfiliado", "");

                DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(strCedula);
                if (dtAfiliado.Rows.Count > 0)
                {
                    Session.Add("idAfiliado", dtAfiliado.Rows[0]["IdAfiliado"]);
                }

                string strNombre = txbNombre.Text.ToString();
                Session.Add("nombreAfiliado", strNombre);
                string strApellido = txbApellido.Text.ToString();
                Session.Add("apellidoAfiliado", strApellido);
                string strCelular = txbCelular.Text.ToString();
                Session.Add("celularAfiliado", strCelular);
                string strEmail = txbEmail.Text.ToString();
                Session.Add("emailAfiliado", strEmail);
                int idGenero = int.Parse(ddlGenero.SelectedItem.Value.ToString());
                string strFechaNac = txbFechaNac.Text.ToString();

                string strFechaInicioPlan = txbFechaIni.Text.ToString();
                Session.Add("fechaInicioPlan", strFechaInicioPlan);
                string strFechaFinPlan = CalcularFechaFinPlan(strFechaInicioPlan);
                Session.Add("fechaFinPlan", strFechaFinPlan);

                DataTable dtPlan = cg.ConsultarPlanWebPorId(int.Parse(Session["idPlan"].ToString()));
                Session.Add("meses", dtPlan.Rows[0]["Meses"]);
                int idCiudad = int.Parse(ddlCiudad.SelectedItem.Value.ToString());
                int idSede = int.Parse(ddlSedes.SelectedItem.Value.ToString());
                Session.Add("idSede", idSede);
                string strValorPlan = hfValorPlan.Value;
                Session.Add("valorPlan", strValorPlan);
                string strLtValor = ltValor.Text.ToString();
                Session.Add("ltValorPlan", strLtValor);

                //Buscamos el documento en la tabla afiliados. Si no existe, creamos el afiliado. Si existe, actualizamos sus datos
                if (Session["idAfiliado"].ToString() != "")
                {
                    // IMPORTANTE: NO ELIMINAR - SOLO SE COMENTA PARA REALIZAR PRUEBAS
                    //DataTable dtFechaFinPlan = cg.ConsultarFechaFinPlanPorDocumento(strCedula);

                    //if (dtFechaFinPlan.Rows.Count > 0)
                    //{
                    //    // Obtener fecha de fin anterior
                    //    DateTime fechaFinAnterior = Convert.ToDateTime(dtFechaFinPlan.Rows[0]["FechaFinalPlan"]);
                    //    DateTime fechaInicioNuevo = Convert.ToDateTime(strFechaInicioPlan);

                    //    if (fechaInicioNuevo <= fechaFinAnterior)
                    //    {
                    //        MostrarAlerta(
                    //            "Fecha de inicio inválida",
                    //            "La fecha de inicio del plan debe ser posterior a la fecha de finalización de un plan activo.",
                    //            "warning"
                    //        );

                    //        return;
                    //    }
                    //}

                    //dtFechaFinPlan.Dispose();

                    cg.ActualizarAfiliadoRegister(
                        strCedula,
                        strNombre,
                        strApellido,
                        strCelular,
                        strEmail,
                        idGenero,
                        strFechaNac,
                        idCiudad,
                        idSede, 
                        "Pendiente"
                    );
                }
                else
                {
                    //Si no existe el documento del afiliado, lo creamos como nuevo.
                    cg.InsertarAfiliadoWeb(
                        strCedula,
                        idTipoDocumento,
                        strNombre,
                        strApellido,
                        strCelular,
                        strEmail,
                        idGenero,
                        strFechaNac,
                        idCiudad,
                        idSede
                    );

                    //EnviarCorreoBienvenida();
                }

                DataTable dtAfiliado2 = cg.ConsultarAfiliadoPorDocumento(strCedula);
                Session.Add("idAfiliado", dtAfiliado2.Rows[0]["IdAfiliado"]);

                dtAfiliado.Dispose();
                dtAfiliado2.Dispose();
                dtPlan.Dispose();

                // Consultamos los datos de Siigo

                string idPlanQS = Request.QueryString["idPlan"];
                
                try
                {
                    DataTable dtIntegracion = cg.ConsultarIntegracion(idSede);
                    string urlTest = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["urlTest"].ToString() : "0";
                    string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : "0";
                    string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : "0";
                    string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : "0";

                    var siigoClient = new SiigoClient(
                        new HttpClient(),
                        urlTest,
                        username,
                        accessKey,
                        partnerId
                    );

                    await siigoClient.ManageCustomerAsync(strCedula, strNombre, strApellido, strCelular, strEmail);
                }
                catch (Exception siigoEx)
                {
                    System.Diagnostics.Debug.WriteLine("Error en ManageCustomer Siigo: " + siigoEx.Message);
                }

                if (idPlanQS == "1" || idPlanQS == "12" || idPlanQS == "17")
                {
                    Response.Redirect("wompipay", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
                //else if (idPlanQS == "10" || idPlanQS == "16")
                //{
                //    string payload = $"nroDoc={HttpUtility.UrlEncode(strCedula)}&valorPlan={HttpUtility.UrlEncode(strValorPlan)}";
                //    string token = UrlEncryptor.Encrypt(payload);
                //    Response.Redirect($"wompiplan?data={HttpUtility.UrlEncode(token)}", false);
                //    Context.ApplicationInstance.CompleteRequest();
                //    return;


                //    //Response.Redirect($"wompiplan?nroDoc={strCedula}&valorPlan={strValorPlan}", false);
                //    //Context.ApplicationInstance.CompleteRequest();
                //    //return;
                //}
                else
                {
                    Response.Redirect("default", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                //string origen = Session["origenPlanes"] != null ? Session["origenPlanes"].ToString() : "";

                //if (origen == "KIOSCO")
                //{
                //    Response.Redirect("pagoRedeban", false);
                //    Context.ApplicationInstance.CompleteRequest();
                //    return;
                //}
                //else if (origen == "WEB")
                //{
                //    if (Session["idPlan"].ToString() == "1" || Session["idPlan"].ToString() == "12" || Session["idPlan"].ToString() == "17")
                //    {
                //        Response.Redirect("wompipay", false);
                //        Context.ApplicationInstance.CompleteRequest();
                //        return;
                //    }
                //    else
                //    {
                //        //string strDataWompi = Convert.ToBase64String(Encoding.Unicode.GetBytes(strCedula + "_" + strValorPlan));

                //        //string strDataWompi = strCedula + "_" + strValorPlan;

                //        // TODO: Encriptar strDataWompi
                //        // Response.Redirect("wompipay?data=" + HttpUtility.UrlEncode(strDataWompi), false);


                //        Response.Redirect($"wompiplan?nroDoc={strCedula}&valorPlan={strValorPlan}", false);
                //        Context.ApplicationInstance.CompleteRequest();
                //        return;
                //    }
                //}
                //else
                //{
                //    Response.Redirect("default", false);
                //    Context.ApplicationInstance.CompleteRequest();
                //    return;
                //}
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        protected async void GestionarDatosUsuario(object sender, EventArgs e)
        {
            string documento = txbDocumento.Text.Trim();

            if (string.IsNullOrEmpty(documento))
            {
                LimpiarCampos();
                return;
            }

            // 1. Buscar en BD
            bool afiliadoExistente = BuscarAfiliado(documento);

            if (!afiliadoExistente)
            {
                // 2. Si no, buscar en ADRES
                await BuscarPersonaADRES(documento);
            }
        }

        protected bool BuscarAfiliado(string documento)
        {
            if (string.IsNullOrEmpty(documento)) return false;

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dt.Rows.Count > 0)
            {
                ddlTipoDocumento.SelectedValue = dt.Rows[0]["idTipoDocumento"].ToString();
                txbNombre.Text = dt.Rows[0]["NombreAfiliado"].ToString();
                txbApellido.Text = dt.Rows[0]["ApellidoAfiliado"].ToString();
                txbEmail.Text = dt.Rows[0]["EmailAfiliado"].ToString();
                txbCelular.Text = dt.Rows[0]["CelularAfiliado"].ToString();
                txbFechaNac.Text = dt.Rows[0]["FechaNacAfiliado"].ToString();
                ddlGenero.SelectedValue = dt.Rows[0]["idGenero"].ToString();

                DataTable dtCiudad = cg.ConsultarCiudadSedePorIdSede(Convert.ToInt32(dt.Rows[0]["idSede"].ToString()));
                ddlCiudad.SelectedValue = dtCiudad.Rows[0]["idCiudadSede"].ToString();

                // Cargar las sedes de esa ciudad
                DataTable dtSedes = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(dtCiudad.Rows[0]["idCiudadSede"].ToString()));
                ddlSedes.Items.Clear();
                ddlSedes.Items.Add(new ListItem("Seleccione", ""));
                ddlSedes.DataSource = dtSedes;
                ddlSedes.DataTextField = "NombreSede";
                ddlSedes.DataValueField = "IdSede";
                ddlSedes.DataBind();

                ddlSedes.SelectedValue = dt.Rows[0]["idSede"].ToString();

                dt.Dispose();
                dtCiudad.Dispose();
                dtSedes.Dispose();

                return true;
            }
            else
            {
                LimpiarCampos();
                dt.Dispose();
                return false;
            }
        }

        protected async Task BuscarPersonaADRES(string documento)
        {
            string url = $"https://pqrdsuperargo.supersalud.gov.co/api/api/adres/0/{documento}";

            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetAsync(url);

                if (!response.IsSuccessStatusCode)
                {
                    LimpiarCampos();
                    return;
                }

                string json = await response.Content.ReadAsStringAsync();
                dynamic personaADRES = JsonConvert.DeserializeObject<dynamic>(json);

                if (personaADRES == null || personaADRES.nombre == null || personaADRES.apellido == null)
                {
                    LimpiarCampos();
                    return;
                }

                txbNombre.Text = $"{(string)personaADRES.nombre} {(string)personaADRES.s_nombre}".Trim().ToUpper();
                txbApellido.Text = $"{(string)personaADRES.apellido} {(string)personaADRES.s_apellido}".Trim().ToUpper();
                txbFechaNac.Text = personaADRES.fecha_nacimiento;
                ddlGenero.SelectedValue = personaADRES.sexo;
            }
        }

        private void LimpiarCampos()
        {
            ddlTipoDocumento.ClearSelection();
            txbNombre.Text = "";
            txbApellido.Text = "";
            txbEmail.Text = "";
            txbCelular.Text = "";
            ddlGenero.ClearSelection();
            txbFechaNac.Text = "";
            ddlCiudad.ClearSelection();
            ddlSedes.Items.Clear();
            ddlSedes.Items.Add(new ListItem("Seleccione", ""));
        }

        private void CambiarPlanSeleccionado()
        {
            string origen = Session["origenPlanes"] != null ? Session["origenPlanes"].ToString() : "";

            if (origen == "KIOSCO")
            {
                btnElegirPlanLink.NavigateUrl = $"planesKiosco?codDatafono={Session["codDatafono"]}";
            }
            else if (origen == "WEB")
            {
                btnElegirPlanLink.NavigateUrl = "default#planes";
            }
        }

        public string CalcularFechaFinPlan(string strFechaInicio)
        {
            DateTime fechaInicio;

            // Validar fecha
            if (!DateTime.TryParse(strFechaInicio, out fechaInicio)) return null;
            
            // Obtener el ID del plan desde la sesión
            if (Session["idPlan"] == null) return null;

            string idPlan = Session["idPlan"].ToString();

            // Consultar datos del plan
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPlanWebPorId(int.Parse(idPlan));

            if (dt == null || dt.Rows.Count == 0) return null;

            DataRow row = dt.Rows[0];


            int meses = 0;
            int mesesCortesia = 0;

            int.TryParse(row["Meses"].ToString(), out meses);
            int.TryParse(row["MesesCortesia"].ToString(), out mesesCortesia);

            int totalMeses = meses + mesesCortesia;

            // Calcular la fecha final sumando meses
            DateTime fechaFin = fechaInicio.AddMonths(totalMeses);

            dt.Dispose();

            return fechaFin.ToString("yyyy-MM-dd");
        }

        protected void CambiarFechaFin(object sender, EventArgs e)
        {
            string strFechaInicio = txbFechaIni.Text;

            string strFechaFin = CalcularFechaFinPlan(strFechaInicio);

            txbFechaFin.Text = strFechaFin;
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{tipo}', 
                background: '#3C3C3C', 
                showCloseButton: false, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }
    }
}