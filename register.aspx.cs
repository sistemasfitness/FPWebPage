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
        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
        }

        protected int IdVendedor
        {
            get { return ViewState["idVendedor"] != null ? (int)ViewState["idVendedor"] : 0; }
            set { ViewState["idVendedor"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // TODO: ESTE SOLO SE REALIZA PARA EL SERVER DE CAMILOWEB - BORRAR DESPUES
                string urlRedirect = $"https://fitnesspeoplecmdcolombia.com/register?idPlan={Request.QueryString["idPlan"]}";
                Response.Redirect(urlRedirect);

                ValidarPlan();

                ConfigurarCamposFecha();

                CambiarPlanSeleccionado();

                CargarTipoDocumento();
                CargarGeneros();
                CargarCiudades();
            }
        }

        private void ConfigurarCamposFecha()
        {
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
            txbFechaIni.Attributes.Add("min", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
        }

        private void ValidarPlan()
        {
            try
            {
                /*
                 * 1. Plan de Asesores Comerciales:
                 * idPlanQS = "1"   ->  $99.000
                 * 
                 * 2. Planes de Migración:
                 * idPlanQS = "12"   -> $2.000
                 * idPlanQS = "17"   -> $89.000
                 * 
                 * 3. Planes de Página Web:
                 * idPlanQS = "18"   -> $99.000
                 * idPlanQS = "19"   -> $89.000
                */

                clasesglobales cg = new clasesglobales();
                DataTable dt = cg.ConsultarPlanesWeb();

                if (dt != null && dt.Rows.Count > 0 && Request.QueryString.Count > 0)
                {
                    IdPlan = Convert.ToInt32(Request.QueryString["idPlan"]);

                    DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);

                    int idPlanBD = dtPlan != null && dtPlan.Rows.Count > 0 ? Convert.ToInt32(dtPlan.Rows[0]["idPlan"]) : 0;

                    if (idPlanBD != IdPlan || idPlanBD == 0)
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

                    dtPlan.Dispose();

                    if (IdPlan == 12 || IdPlan == 17)  // Plan de migracion 2.000 y 89.000
                    {
                        txbFechaIni.Enabled = false;
                        txbFechaFin.Enabled = false;
                    }
                }

                dt.Dispose();

                GestionarVendedor(IdPlan);

            } catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ValidarPlan: " + ex.ToString());
            }
        }

        private void GestionarVendedor(int idPlan)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["idVendedor"]))
            {
                IdVendedor = Convert.ToInt32(Request.QueryString["idVendedor"]);
            }

            if (string.IsNullOrEmpty(Request.QueryString["idVendedor"]) && idPlan == 1 || idPlan == 12 || idPlan == 17)
            {
                IdVendedor = 152;
            }

            if (string.IsNullOrEmpty(Request.QueryString["idVendedor"]) && idPlan == 18 || idPlan == 19)
            {
                IdVendedor = 156;
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
            ddlSedes.Items.Add(new ListItem("Selecciona una opción", ""));
            ddlSedes.Enabled = false;

            if (string.IsNullOrEmpty(ddlCiudad.SelectedValue)) return;

            ddlSedes.Enabled = true;

            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(ddlCiudad.SelectedItem.Value.ToString()));

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

                // Almacenar datos del afiliado
                string strCedula = txbDocumento.Text.ToString();
                int idTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedItem.Value.ToString());

                int idAfiliado = 0;

                DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(strCedula);
                if (dtAfiliado.Rows.Count > 0)
                {
                    idAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);
                }
                dtAfiliado.Dispose();

                string strNombre = txbNombre.Text.ToString();
                string strApellido = txbApellido.Text.ToString();
                string strCelular = txbCelular.Text.ToString();
                string strEmail = txbEmail.Text.ToString();
                int idGenero = Convert.ToInt32(ddlGenero.SelectedItem.Value.ToString());
                string strFechaNac = txbFechaNac.Text.ToString();

                string strFechaInicioPlan = txbFechaIni.Text.ToString();
                string strFechaFinPlan = CalcularFechaFinPlan(strFechaInicioPlan);

                int idCiudad = Convert.ToInt32(ddlCiudad.SelectedItem.Value.ToString());
                int idSede = Convert.ToInt32(ddlSedes.SelectedItem.Value.ToString());
                string strValorPlan = hfValorPlan.Value;
                string strLtValor = ltValor.Text.ToString();
                Session.Add("ltValorPlan", strLtValor);

                // 1. Actualizar afiliado
                if (idAfiliado != 0)
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
                        idSede,
                        "Pendiente"
                    );
                }
                else
                {
                    // 2. Si no, registrar afiliado
                    cg.InsertarAfiliadoWeb(
                        strCedula,
                        idTipoDocumento,
                        strNombre,
                        strApellido,
                        strCelular,
                        strEmail,
                        idGenero,
                        strFechaNac,
                        idSede
                    );

                    //EnviarCorreoBienvenida();
                }

                // Registrar o consultar cliente en Siigo
                try
                {
                    DataTable dtIntegracion = cg.ConsultarIntegracion(idSede);
                    string url = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["urlTest"].ToString() : "0";
                    string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : "0";
                    string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : "0";
                    string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : "0";
                    dtIntegracion.Dispose();

                    //string url = "https://api.siigo.com/";
                    //string username = "sandbox@siigoapi.com";
                    //string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";
                    //string partnerId = "SandboxSiigoApi";

                    var siigoClient = new SiigoClient(
                        new HttpClient(),
                        url,
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


                if (IdPlan == 1 || IdPlan == 12 || IdPlan == 17 || IdPlan == 18 || IdPlan == 19)
                {
                    string payload = $"nroDoc={HttpUtility.UrlEncode(strCedula)}" +
                                     $"&idPlan={HttpUtility.UrlEncode(IdPlan.ToString())}" +
                                     $"&fechaIni={HttpUtility.UrlEncode(strFechaInicioPlan)}" +
                                     $"&fechaFin={HttpUtility.UrlEncode(strFechaFinPlan)}" +
                                     $"&idVendedor={HttpUtility.UrlEncode(IdVendedor.ToString())}" +
                                     $"&idSede={HttpUtility.UrlEncode(idSede.ToString())}";

                    TimeSpan ttl = TimeSpan.FromMinutes(10); // Token válido 10 minutos
                    string token = UrlEncryptor.Encrypt(payload, ttl);

                    Response.Redirect($"wompipay.aspx?data={HttpUtility.UrlEncode(token)}", false);
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
                ddlSedes.Items.Add(new ListItem("Selecciona una opción", ""));
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

                json = json.Replace("\\u00a5", "Ñ").Replace("\\u00a4", "ñ");

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
            ddlSedes.Items.Add(new ListItem("Selecciona una opción", ""));
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

            // Consultar datos del plan
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPlanWebPorId(IdPlan);

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