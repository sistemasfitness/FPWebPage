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
                CargarTipoDocumento();
                CargarGeneros();
                CargarCiudades();

                DateTime dt14 = DateTime.Now.AddYears(-14);
                DateTime dt100 = DateTime.Now.AddYears(-100);
                txbFechaNac.Attributes.Add("min", dt100.Year.ToString() + "-" + string.Format("{0:MM}", dt100) + "-" + String.Format("{0:dd}", dt100));
                txbFechaNac.Attributes.Add("max", dt14.Year.ToString() + "-" + string.Format("{0:MM}", dt14) + "-" + String.Format("{0:dd}", dt14));

                txbFechaNac.Attributes.Add("type", "date");
                txbFechaIni.Attributes.Add("type", "date");
                txbFechaFin.Attributes.Add("type", "date");

                txbDocumento.Attributes.Add("type", "number");
                txbCelular.Attributes.Add("type", "number");

                // Datos de Pruebas
                txbNombre.Text = "Brayan Stiven";
                txbApellido.Text = "Ochoa Pineda";
                ddlTipoDocumento.SelectedItem.Text = "Cédula de Ciudadanía";
                ddlTipoDocumento.SelectedItem.Value = "1";
                txbDocumento.Text = "1005139501";
                txbEmail.Text = "b.ochoa12@gmail.com";
                txbCelular.Text = "3156552301";
                txbFechaNac.Text = "2000-01-01";            
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
            }

            dt.Dispose();
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
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected async void btnRegistrar(object sender, EventArgs e)
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
                string strValorPlan = hfValorPlan.Value;
                Session.Add("valorPlan", strValorPlan);
                string strLtValor = ltValor.Text.ToString();
                Session.Add("ltValorPlan", strLtValor);

                //Buscamos el documento en la tabla afiliados. Si no existe, creamos el afiliado. Si existe, actualizamos Correo, Celular, Ciudad, Sede y Plan
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

                    cg.ActualizarAfiliadoWeb(
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

                var siigoClient = new SiigoClient(
                    new HttpClient(),
                    "https://api.siigo.com/",
                    "sandbox@siigoapi.com",
                    "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=",
                    "SandboxSiigoApi"
                );

                await siigoClient.ManageCustomerAsync(strCedula, strNombre, strApellido, strCelular, strEmail);

                string origen = Session["origenPlanes"] != null ? Session["origenPlanes"].ToString() : "";

                if (origen == "KIOSCO")
                {
                    Response.Redirect("pagoRedeban", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                if (Session["idPlan"].ToString() == "1")
                {
                    Response.Redirect("wompipay", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
                else
                {
                    Response.Redirect("wompiplan", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
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

            // Calcular la fecha final sumando meses y días
            DateTime fechaFin = fechaInicio.AddMonths(totalMeses);

            dt.Dispose();

            // Devolverla en formato yyyy-MM-dd (puedes cambiarlo si quieres otro)
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