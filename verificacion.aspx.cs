using MySql.Data.MySqlClient;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Net.Http;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
    public partial class verificacion : System.Web.UI.Page
    {
        protected int IdAfiliado
        {
            get { return ViewState["idAfi"] != null ? (int)ViewState["idAfi"] : 0; }
            set { ViewState["idAfi"] = value; }
        }

        protected string DocumentoAfiliado
        {
            get { return ViewState["nroDoc"]?.ToString(); }
            set { ViewState["nroDoc"] = value; }
        }

        protected string CorreoAfiliado
        {
            get { return ViewState["correo"]?.ToString(); }
            set { ViewState["correo"] = value; }
        }

        protected int IdAfiliadoPlan
        {
            get { return ViewState["idAfiPlan"] != null ? (int)ViewState["idAfiPlan"] : 0; }
            set { ViewState["idAfiPlan"] = value; }
        }

        protected bool PagoUnico
        {
            get { return ViewState["pagoUnico"] != null ? (bool)ViewState["pagoUnico"] : false; }
            set { ViewState["pagoUnico"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ValidarTokenURLEncryptor();

                CargarInformacion();
            }
        }

        private void ValidarTokenURLEncryptor()
        {
            string token = Request.QueryString["data"];

            if (string.IsNullOrEmpty(token))
            {
                Response.Redirect("default");
                return;
            }

            if (UrlEncryptor.TryDecryptToCollection(token, out NameValueCollection q, out DateTime? expiresUtc))
            {
                if (expiresUtc.HasValue && expiresUtc.Value < DateTime.UtcNow)
                {
                    Response.Redirect("default");
                    return;
                }

                IdAfiliado = Convert.ToInt32(q["idAfi"]);
                string nroDoc = q["nroDoc"];
                int idPlan = Convert.ToInt32(q["idPlan"]);
                string fechaIniPlan = q["fechaIni"];
                string fechaFinPlan = q["fechaFin"];
                int totalMeses = Convert.ToInt32(q["totalMeses"]);
                int valor = Convert.ToInt32(q["valor"]);
                string descripcion = q["descripcion"];
                string estado = q["estado"];
                string referencia = q["refe"];
                int idVendedor = Convert.ToInt32(q["idVendedor"]);
                int idSede = Convert.ToInt32(q["idSede"]);

                string pagoUnico = q["pagoUnico"].ToString();

                if (bool.TryParse(pagoUnico, out bool esPagoUnico) && esPagoUnico)
                {
                    string idTransaccion = Request.QueryString["id"];

                    AlmacenarInformacionPagoUnico(nroDoc, idPlan, fechaIniPlan, fechaFinPlan, totalMeses, valor, descripcion, estado, referencia, idTransaccion, idVendedor, idSede);
                }
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void CargarInformacion()
        {
            try
            {
                DocumentoAfiliado = Request.QueryString["nroDoc"];

                clasesglobales cg = new clasesglobales();

                DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(DocumentoAfiliado);

                if (dtAfiliado.Rows.Count == 0)
                {
                    Response.Redirect("default", false);
                    return;
                }

                IdAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);

                DataTable dtAfiliadoPlan = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(IdAfiliado);

                if (dtAfiliadoPlan.Rows.Count == 0)
                {
                    Response.Redirect("default", false);
                    return;
                }

                IdAfiliadoPlan = int.Parse(dtAfiliadoPlan.Rows[0]["idAfiliadoPlan"].ToString());

                dtAfiliadoPlan.Dispose();

                CargarEps();

                txbFechaNacimiento.Attributes.Add("type", "date");

                hfIdAfiliado.Value = IdAfiliado.ToString();
                txbNombres.Text = dtAfiliado.Rows[0]["NombreAfiliado"].ToString();
                txbApellidos.Text = dtAfiliado.Rows[0]["ApellidoAfiliado"].ToString();
                txbCorreo.Text = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                txbCelular.Text = dtAfiliado.Rows[0]["CelularAfiliado"].ToString();
                txbDireccion.Text = dtAfiliado.Rows[0]["DireccionAfiliado"].ToString();
                txbFechaNacimiento.Text = dtAfiliado.Rows[0]["FechaNacAfiliado"].ToString();

                if (dtAfiliado.Rows[0]["idEps"].ToString() != "")
                {
                    ddlEPS.SelectedIndex = Convert.ToInt16(ddlEPS.Items.IndexOf(ddlEPS.Items.FindByValue(dtAfiliado.Rows[0]["idEps"].ToString())));
                }

                txbResponsable.Text = dtAfiliado.Rows[0]["ResponsableAfiliado"].ToString();

                if (dtAfiliado.Rows[0]["idTipoDocumento"].ToString() == "3")
                {
                    ddlParentesco.Items.Add(new ListItem("Selecciona una opción", ""));
                    ddlParentesco.Items.Add(new ListItem("Padre/Madre", "Padre/Madre"));
                    ddlParentesco.Items.Add(new ListItem("Tutor/a", "Tutor/a"));
                }
                else
                {
                    ddlParentesco.Items.Add(new ListItem("Selecciona una opción", ""));
                    ddlParentesco.Items.Add(new ListItem("Padre/Madre", "Padre/Madre"));
                    ddlParentesco.Items.Add(new ListItem("Esposo/a", "Esposo/a"));
                    ddlParentesco.Items.Add(new ListItem("Hermano/a ", "Hermano/a"));
                    ddlParentesco.Items.Add(new ListItem("Hijo/a", "Hijo/a"));
                    ddlParentesco.Items.Add(new ListItem("Primo/a", "Primo/a"));
                    ddlParentesco.Items.Add(new ListItem("Sobrino/a", "Sobrino/a"));
                    ddlParentesco.Items.Add(new ListItem("Tutor/a", "Tutor/a"));
                }

                if (dtAfiliado.Rows[0]["Parentesco"].ToString() != "")
                {
                    ddlParentesco.SelectedValue = dtAfiliado.Rows[0]["Parentesco"].ToString();
                }

                txbContacto.Text = dtAfiliado.Rows[0]["ContactoAfiliado"].ToString();
                CorreoAfiliado = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                //ViewState["ClaveAfiliado"] = dtAfiliado.Rows[0]["ClaveAfiliado"].ToString();

                dtAfiliado.Dispose();

                ListaPreguntasParq();

            } catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al cargar la información: " + ex.ToString());
            }
        }

        private void CargarEps()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarEpss();

            ddlEPS.DataSource = dt;
            ddlEPS.DataBind();

            dt.Dispose();
        }

        private void AlmacenarInformacionPagoUnico(string nroDoc, int idPlan, string fechaIniPlan, string fechaFinPlan, int totalMeses, int valor, string descripcion, string estado, string referencia, string idTransaccion, int idVendedor, int idSede)
        {
            clasesglobales cg = new clasesglobales();
            int idAfiliadoPlan = 0;
            int idPago = 0;

            try
            {
                // 1. Inserción de AfiliadoPlan en la Base de Datos
                idAfiliadoPlan = cg.InsertarAfiliadoPlanYDevolverId(
                    IdAfiliado,
                    idPlan,
                    fechaIniPlan,
                    fechaFinPlan,
                    totalMeses,
                    valor,
                    descripcion,
                    estado
                );

                // 2. Inserción de PagoPlanAfiliado en la Base de Datos
                idPago = cg.InsertarPagoPlanAfiliadoWebYDevolverId(
                    idAfiliadoPlan,
                    valor,
                    4,
                    referencia,
                    "Wompi",
                    idVendedor, // TODO: QUEMADO DE MOMENTO
                    "Aprobado",
                    null,
                    null,
                    null,
                    idTransaccion,
                    null,
                    null,
                    null
                );
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error registrando el AfiliadoPlan y PagoPlanPlanAfiliado: " + ex.ToString());
            }

            // 3. Facturar en Siigo
            //try
            //{
            //    //DataTable dtIntegracion = cg.ConsultarIntegracion(IdSede);
            //    //string url = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["urlTest"].ToString() : "0";
            //    //string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : "0";
            //    //string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : "0";
            //    //string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : "0";
            //    //dtIntegracion.Dispose();

            //    string url = "https://api.siigo.com/";
            //    string username = "sandbox@siigoapi.com";
            //    string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";
            //    string partnerId = "SandboxSiigoApi";

            //    // Creación de factura
            //    var siigoClient = new SiigoClient(
            //        new HttpClient(),
            //        url,
            //        username,
            //        accessKey,
            //        partnerId
            //    );

            //    // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
            //    // ESTÁ COMENTADO PARA PRUEBAS LOCALES
            //    //idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
            //    //    DocumentoAfiliado,
            //    //    CodSiigoPlan,
            //    //    NombrePlan,
            //    //    ValorPlan,
            //    //    IdSede
            //    //);

            //    // Siigo Pruebas
            //    //    //int idTipoDocumento = 28006;
            //    //    //int costCenterDefault = 621;
            //    //    //int idVendedor = 856;
            //    //    //int idPayment = 9438;
            //    string codSiigoPlan = "COD2433";
            //    string nombrePlan = "Pago de suscripción";
            //    int precioPlan = 10000;
            //    string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
            //        nroDoc,
            //        codSiigoPlan,
            //        nombrePlan,
            //        precioPlan,
            //        idSede
            //    );

            //    // Actualizar pago con id de factura
            //    cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idPago, idSiigoFactura);
            //}
            //catch (Exception siigoEx)
            //{
            //    System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
            //}
        }

        private void ValidarAfiliadoWeb()
        {
            string origenWeb = Request.QueryString["web"];
            ViewState["origenWeb"] = origenWeb;

            if (!string.IsNullOrEmpty(origenWeb) && origenWeb.ToLower() == "true")
            {
                //id_parrafo.Visible = false;
                //txbNombres.Enabled = false;
                //txbApellidos.Enabled = false;
                //txbCorreo.Enabled = false;
                //txbCelular.Enabled = false;
            }
        }

        //private void CargarDatosAfiliado(int idAfiliado)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dt = cg.ConsultarAfiliadoPorId(idAfiliado);

        //    if (dt.Rows.Count > 0)
        //    {
        //        hfIdAfiliado.Value = dt.Rows[0]["IdAfiliado"].ToString();
        //        ViewState["idAfiliado"] = hfIdAfiliado.Value;
        //        txbNombres.Text = dt.Rows[0]["NombreAfiliado"].ToString();
        //        txbApellidos.Text = dt.Rows[0]["ApellidoAfiliado"].ToString();
        //        txbCorreo.Text = dt.Rows[0]["EmailAfiliado"].ToString();
        //        txbCelular.Text = dt.Rows[0]["CelularAfiliado"].ToString();
        //        ViewState["EmailAfiliado"] = dt.Rows[0]["EmailAfiliado"].ToString();
        //        ViewState["ClaveAfiliado"] = dt.Rows[0]["ClaveAfiliado"].ToString();
        //    }
        //}

        private void ListaPreguntasParq()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPreguntasParQPorEstado("Activo");

            if (dt.Rows.Count > 0)
            {
                rpParq.DataSource = dt;
                rpParq.DataBind();
                dt.Dispose();
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                // TODO: Validar que si el afiliado ya ha respondido las preguntas, no se vuelvan a insertar.

                foreach (RepeaterItem item in rpParq.Items)
                {
                    if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
                    {
                        CheckBox chbRespuesta = (CheckBox)item.FindControl("chbRespuesta");
                        HiddenField hfidParq = (HiddenField)item.FindControl("hfidParq");

                        int respuestaPARQ = chbRespuesta != null && chbRespuesta.Checked ? 1 : 0;

                        cg.InsertarRespuestasDePreguntasParQPorIdAfiliadoWeb(
                            int.Parse(hfidParq.Value.ToString()),
                            IdAfiliado,
                            IdAfiliadoPlan,
                            respuestaPARQ
                        );
                    }
                }

                // Actualizar el estado del plan del afiliado
                cg.ActualizarEstadoAfiliadoPlan(
                    "Activo",
                    IdAfiliado,
                    IdAfiliadoPlan
                );

                // Actualizar la información y estado del afiliado
                cg.ActualizarAfiliadoWeb(
                    DocumentoAfiliado,
                    txbNombres.Text,
                    txbApellidos.Text,
                    txbCelular.Text,
                    txbCorreo.Text,
                    txbDireccion.Text,
                    txbFechaNacimiento.Text, 
                    int.Parse(ddlEPS.SelectedItem.Value.ToString()),
                    txbResponsable.Text, 
                    ddlParentesco.SelectedItem.Value.ToString(),
                    txbContacto.Text, 
                    "Activo", 
                    txbObservacionesPARQ.Text
                );


                // ConsultarPreguntaParQPorEstado


                //foreach (RepeaterItem item in rpParq.Items)
                //{
                //    if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
                //    {
                //        CheckBox chbRespuesta = (CheckBox)item.FindControl("chbRespuesta");
                //        HiddenField hfidParqAfiliado = (HiddenField)item.FindControl("hfidParqAfiliado");
                //        if (chbRespuesta != null && chbRespuesta.Checked)
                //        {
                //            // Aquí se puede acceder al valor del checkbox seleccionado
                //            string strQuery = "UPDATE ParqAfiliados SET Respuesta = 1 WHERE idParqAfiliado = " + hfidParqAfiliado.Value.ToString();

                //            try
                //            {
                //                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                //                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                //                {
                //                    mysqlConexion.Open();
                //                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                //                    {
                //                        cmd.CommandType = CommandType.Text;
                //                        cmd.ExecuteNonQuery();
                //                    }
                //                    mysqlConexion.Close();
                //                }
                //            }
                //            catch (Exception ex)
                //            {
                //                string respuesta = "ERROR: " + ex.Message;
                //            }
                //        }
                //    }
                //}

                // TODO: Comentado para realizar pruebas
                // Enviar correo de confirmación
                //EnviarConfirmacion();

                Response.Redirect("gracias", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ocurrió un error inesperado al realizar la verificación.", "error");
                System.Diagnostics.Debug.WriteLine("Error en btnVerificar_Click: " + ex.ToString());
            }
        }

        private void EnviarConfirmacion()
        {
            clasesglobales cg = new clasesglobales();

            string strAsunto = "Bienvenido a Fitness People CMD";
            string strRemitente = "sistemas@fitnesspeoplecmd.com";
            string strDestinatario = CorreoAfiliado;
            //string strDestinatario = "chrislemoce@gmail.com";
            string strMensaje = "Bienvenido a Fitness People CMD.\r\n\r\n" +
                "Ahora haces parte de la familia Fitness People CMD. Ingresa a nuestra página web: fitnesspeoplecolombia.com\r\n"; // +
                //"Contrato: fitnesspeoplecolombia.com/contrato \r\n\r\n";

            cg.EnviarCorreo(strRemitente, strDestinatario, strAsunto, strMensaje);
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
                showCloseButton: true, 
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