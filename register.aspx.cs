using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Newtonsoft.Json;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;
using static WebPage.Services.SiigoClient;

namespace WebPage
{
    public partial class register : System.Web.UI.Page
    {
        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
        }

        protected int ValorPlan
        {
            get { return ViewState["valorPlan"] != null ? (int)ViewState["valorPlan"] : 0; }
            set { ViewState["valorPlan"] = value; }
        }

        protected int TotalMeses
        {
            get { return ViewState["totalMeses"] != null ? (int)ViewState["totalMeses"] : 0; }
            set { ViewState["totalMeses"] = value; }
        }

        protected int IdVendedor
        {
            get { return ViewState["idVendedor"] != null ? (int)ViewState["idVendedor"] : 0; }
            set { ViewState["idVendedor"] = value; }
        }

        // Siigo

        protected string UrlSiigo
        {
            get { return ViewState["urlSiigo"]?.ToString(); }
            set { ViewState["urlSiigo"] = value; }
        }

        protected string UserName
        {
            get { return ViewState["username"]?.ToString(); }
            set { ViewState["username"] = value; }
        }

        protected string AccessKey
        {
            get { return ViewState["accessKey"]?.ToString(); }
            set { ViewState["accessKey"] = value; }
        }

        protected string PartnerId
        {
            get { return ViewState["partnerId"]?.ToString(); }
            set { ViewState["partnerId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("default", true);

            if (!IsPostBack)
            {
                Session["PagoCompletado"] = false;

                if (ValidarParametrosURL())
                {
                    ValidarPlan();

                    GestionarIntegracionSiigo();

                    ConfigurarCamposFecha();

                    CargarInformacionPlan();

                    CargarTipoDocumento();
                    //CargarGeneros();
                    //CargarCiudadesYSedes();

                    if (!string.IsNullOrEmpty(txbFechaIni.Text))
                    {
                        txbFechaFin.Text = CalcularFechaFinPlan(txbFechaIni.Text);
                    }
                }
            }

            // Agregar manualmente el onchange que llama al postback
            //txbFechaIni.Attributes["onchange"] = Page.ClientScript.GetPostBackEventReference(txbFechaIni, "");
        }

        // - COMENTADO HASTA NUEVO AVISO -
        //protected void btnValidarCodEmbajador_Click(object sender, EventArgs e)
        //{
        //    string codigo = txtCodigoEmbajador.Text.Trim().ToLower();

        //    if (string.IsNullOrEmpty(codigo))
        //    {
        //        lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:orange;'>Por favor, ingresa un código para continuar.</span>";
        //        return;
        //    }

        //    try
        //    {
        //        clasesglobales cg = new clasesglobales();

        //        DataTable dtCodEmbajador = cg.ConsultarCodigoEmbajador(codigo);

        //        if (dtCodEmbajador.Rows.Count > 0)
        //        {
        //            Session["CodEmbajador"] = codigo;
        //            Response.Redirect("register?idPlan=20&idVendedor=156", false); // OJO CAMBIO POR ACTUALIZACIÓN DE TOKEN EN LA URL
        //            Context.ApplicationInstance.CompleteRequest();
        //        }
        //        else
        //        {
        //            lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:red;'>El código de embajador que ingresaste no es válido. Verifica y vuelve a intentarlo.</span>";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:red;'>Error: " + ex.Message + "</span>";
        //    }
        //}

        private bool ValidarParametrosURL()
        {
            // 1. Validar parámetro idPlan
            string token = Request.QueryString["token"];

            if (string.IsNullOrEmpty(token)) Response.Redirect("default", true);

            clasesglobales cg = new clasesglobales();

            // Validar que el plan exista
            DataTable dtToken = cg.ConsultarToken(token);

            if (dtToken == null || dtToken.Rows.Count == 0) Response.Redirect("default", true);

            // TODO: Consultar si el afiliado ya tiene una gestión en CRM
            // Si lo tiene: Cambiar idVendedor
            // Si no lo tiene: Continuar proceso con idVendedor inicial

            // Guardar resultados
            IdPlan = Convert.ToInt32(dtToken.Rows[0]["idPlan"]);
            IdVendedor = Convert.ToInt32(dtToken.Rows[0]["idVendedor"]);

            return true;
        }

        private void GestionarIntegracionSiigo()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtVendedor = cg.ConsultarUsuarioEmpleadoPorId(IdVendedor);
            int idCanalVenta = dtVendedor.Rows.Count > 0 ? Convert.ToInt32(dtVendedor.Rows[0]["idCanalVenta"]) : 0;
            dtVendedor.Dispose();

            DataTable dtIntegracion = cg.ConsultarIntegracionEmpresaPorIdCanalVenta(idCanalVenta);
            
            foreach (DataRow row in dtIntegracion.Rows)
            {
                string codigo = row["codigo"].ToString();

                if (codigo == "SIIGO")
                {
                    UrlSiigo = row["url"].ToString();
                    UserName = row["username"].ToString();
                    AccessKey = row["accessKey"].ToString();
                    PartnerId = row["partnerId"].ToString();
                }
            }
        }
        
        private void CargarInformacionPlan()
        {
            if (IdPlan == 40)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 9.900</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 99.000/mes
                                    </div>
                                    <div class='total_cart'>
                                        SIN INSCRIPCIÓN
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 9.900</span>
                                    </div>";
            }

            if (IdPlan == 41)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 39.800</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 79.600/mes
                                    </div>
                                    <div class='total_cart'>
                                        INSCRIPCIÓN <span class='pull-right'>$ 19.900</span>
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 59.700</span>
                                    </div>";
            }

            if (IdPlan == 42)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 165.000</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        RENOVACIÓN MES A MES
                                    </div>
                                    <div class='total_cart'>
                                        SIN INSCRIPCIÓN
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 165.000</span>
                                    </div>";
            }

            if (IdPlan == 43)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 29.900</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 130.000/mes
                                    </div>
                                    <div class='total_cart'>
                                        SIN INSCRIPCIÓN
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 29.900</span>
                                    </div>";
            }

            if (IdPlan == 45)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart info-plan'>
                                        <p class='title'>PLAN</p>

                                        <p class='sub-title'>FLEXIBLE PRO</p>

                                        <p class='text'>Acceso total a sedes y áreas, clases grupales, plan de entrenamiento y nutrición en la FP App, 5 cortesías mensuales, membresía incluida, pago automático y valoración física inicial.</p>
                                    </div>
                                    <div class='total_cart info-plan-conditions'>
                                        <p class='condition-pri'>DÉBITO AUTOMÁTICO</p>

                                        <p class='condition-sec'>FIDELIDAD DE 12 MESES, APLICA MULTA</p>
                                    </div>
                                    <div class='total_cart info-plan-precie'>
                                        <p class='title'>PRIMER MES <span class='pull-right'>GRATIS</span></p>

                                        <p class='sub-title'>DESPUÉS $ 99.000/mes</p>

                                        <p class='registration'>INSCRIPCIÓN <span class='pull-right'>$ 9.900</span></p>

                                        <p class='total'>TOTAL <span class='pull-right'>$ 9.900</span></p>
                                    </div>";
            }

            if (IdPlan == 46)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart info-plan'>
                                        <p class='title'>PLAN</p>

                                        <p class='sub-title'>SEMESTRAL</p>

                                        <p class='text'>Acceso total a sedes y áreas, clases grupales, FP App, 5 cortesías mensuales, membresía incluida y valoración física inicial.</p>
                                    </div>
                                    <div class='total_cart info-plan-conditions'>
                                        <p class='condition-pri'>PAGO ÚNICO</p>

                                        <p class='condition-sec'>SIN FIDELIDAD</p>
                                    </div>
                                    <div class='total_cart info-plan-precie'>
                                        <p class='title'>PAGA HOY <span class='pull-right'>$ 590.000</span></p>
                                    </div>";
            }
        }

        private void ConfigurarCamposFecha()
        {
            txbFechaIni.Attributes.Add("type", "date");
            txbFechaFin.Attributes.Add("type", "date");

            DateTime dtHoy = DateTime.Now;
            DateTime dtHoyUnAnnio = DateTime.Now.AddYears(1);
            DateTime dt14 = DateTime.Now.AddYears(-14);
            DateTime dt100 = DateTime.Now.AddYears(-100);

            string fechaHoy = dtHoy.ToString("yyyy-MM-dd");
            txbFechaIni.Attributes["value"] = fechaHoy;
            txbFechaIni.Text = fechaHoy;

            string fechaUnAnnio = dtHoyUnAnnio.ToString("yyyy-MM-dd");
            txbFechaFin.Attributes["value"] = fechaUnAnnio;
            txbFechaFin.Text = fechaUnAnnio;

            txbFechaIni.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");

            if (IdPlan != 12)
                txbFechaIni.Attributes["max"] = DateTime.Now.AddDays(3).ToString("yyyy-MM-dd");
        }

        private void ValidarPlan()
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);

                if (dtPlan == null || dtPlan.Rows.Count == 0) Response.Redirect("default", true);

                bool esDebitoAutomatico = dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1";

                // Mostrar tipo de pago
                //txbMetodoPago.Text = esDebitoAutomatico
                //    ? "Débito Automático"
                //    : "Pago Único";

                // Texto en autorización
                //lbTipoCobro.Text = esDebitoAutomatico ? " recurrente" : null;

                DataTable dtPlanProm = cg.ConsultarPlanPromocionPorId(IdPlan);

                if (dtPlanProm.Rows.Count > 0 && !dtPlanProm.Columns.Contains("Error"))
                {
                    ValorPlan = Convert.ToInt32(dtPlanProm.Rows[0]["PrecioProm"].ToString());
                }
                else
                {
                    ValorPlan = Convert.ToInt32(dtPlan.Rows[0]["PrecioTotal"].ToString());
                }

                //txbValorPlan.Text = ValorPlan.ToString();
                //hfValorPlan.Value = ValorPlan.ToString();
                ltValor.Text = "$" + ValorPlan.ToString("N0");

                dtPlanProm?.Dispose();
                dtPlan.Dispose();

            } catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ValidarPlan: " + ex.ToString());
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

        //private void CargarGeneros()
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dt = cg.ConsultarGeneros();

        //    ddlGenero.DataSource = dt;
        //    ddlGenero.DataBind();

        //    if (EsPlanDuo)
        //    {
        //        ddlGenero2.DataSource = dt;
        //        ddlGenero2.DataBind();
        //    }

        //    dt.Dispose();
        //}

        //private void CargarCiudadesYSedes()
        //{
        //    clasesglobales cg = new clasesglobales();

        //    DataTable dtCiudad = cg.ConsultarCiudadesSedesWeb();
        //    ddlCiudad.DataSource = dtCiudad;
        //    ddlCiudad.DataTextField = "NombreCiudadSede";
        //    ddlCiudad.DataValueField = "idCiudadSede";
        //    ddlCiudad.DataBind();
        //    ddlCiudad.Items.Insert(0, new ListItem("Selecciona una opción", ""));
        //    dtCiudad.Dispose();

        //    DataTable dtSede = cg.ConsultarSedesWeb();
        //    ddlSede.DataSource = dtSede;
        //    ddlSede.DataTextField = "NombreSede";
        //    ddlSede.DataValueField = "IdSede";
        //    ddlSede.DataBind();
        //    ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
        //    dtSede.Dispose();
        //}

        //protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    ddlSede.Items.Clear();

        //    // Si no seleccionó ciudad, mostrar todas las sedes
        //    if (string.IsNullOrEmpty(ddlCiudad.SelectedValue))
        //    {
        //        DataTable dtTodasSedes = cg.ConsultarSedesWeb();
        //        ddlSede.DataSource = dtTodasSedes;
        //        ddlSede.DataTextField = "NombreSede";
        //        ddlSede.DataValueField = "IdSede";
        //        ddlSede.DataBind();
        //        ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
        //        dtTodasSedes.Dispose();
        //        return;
        //    }

        //    // Si seleccionó una ciudad válida, filtrar las sedes
        //    DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(ddlCiudad.SelectedValue));
        //    ddlSede.DataSource = dt;
        //    ddlSede.DataTextField = "NombreSede";
        //    ddlSede.DataValueField = "IdSede";
        //    ddlSede.DataBind();
        //    ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
        //    dt.Dispose();
        //}

        //protected void ddlSede_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (string.IsNullOrEmpty(ddlSede.SelectedValue)) return;

        //    clasesglobales cg = new clasesglobales();

        //    DataTable dtSede = cg.ConsultarSedePorId(Convert.ToInt32(ddlSede.SelectedValue));

        //    if (dtSede != null && dtSede.Rows.Count > 0)
        //    {
        //        DataRow sedeInfo = dtSede.Rows[0];
        //        string idCiudad = sedeInfo["idCiudadSede"].ToString();

        //        if (ddlCiudad.Items.FindByValue(idCiudad) != null)
        //        {
        //            ddlCiudad.SelectedValue = idCiudad;
        //        }
        //    }

        //    // liberar si tu implementación lo requiere
        //    if (dtSede != null) dtSede.Dispose();
        //}

        protected async void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                // 1. Extraer la información del formulario
                string strCedula = txbDocumento.Text.Trim();
                //int idTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedItem.Value.ToString());

                int idTipoDocumento = 0;

                int.TryParse(
                    ddlTipoDocumento.SelectedValue, 
                    out idTipoDocumento
                );

                string strNombre = txbNombre.Text.Trim().ToUpper();
                string strApellido = txbApellido.Text.Trim().ToUpper();
                string strCelular = txbCelular.Text.Trim();
                string strEmail = txbEmail.Text.Trim().ToLower();
                //int idGenero = Convert.ToInt32(ddlGenero.SelectedItem.Value.ToString());
                //string strFechaNac = txbFechaNac.Text.ToString();

                string strFechaInicioPlan = txbFechaIni.Text.Trim();
                string strFechaFinPlan = txbFechaFin.Text.Trim();

                bool validacionesOk = Validaciones(strCedula, idTipoDocumento, strNombre, strApellido, strCelular, strEmail);

                if (!validacionesOk) return;

                //int idCiudad = Convert.ToInt32(ddlCiudad.SelectedItem.Value.ToString());
                //int idSede = Convert.ToInt32(ddlSede.SelectedItem.Value.ToString());

                //DataTable dtSede = cg.ConsultarSedePorId(idSede);
                //string direccion = dtSede.Rows[0]["DireccionSede"].ToString();
                //dtSede.Dispose();

                //DataTable dtCiudad = cg.ConsultarCiudadSedeSiigoPorId(idCiudad);
                //string codEstado = dtCiudad.Rows[0]["CodigoEstado"].ToString();
                //string codCiudad = dtCiudad.Rows[0]["CodigoCiudad"].ToString();
                //dtCiudad.Dispose();

                string strLtValor = ltValor.Text.ToString();
                Session.Add("ltValorPlan", strLtValor);

                //int idAfiliado = await GestionarAfiliado(strCedula, idTipoDocumento, strNombre, strApellido, strCelular, strEmail, idGenero, strFechaNac, strFechaInicioPlan, idSede, direccion, codEstado, codCiudad);

                await GestionarAfiliado(strCedula, idTipoDocumento, strNombre, strApellido, strCelular, strEmail, strFechaInicioPlan);

                DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);
                bool esDebitoAutomatico = dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1";
                dtPlan.Dispose();

                // Construir payload base
                var parametros = new NameValueCollection
                {
                    { "nroDoc", strCedula },
                    { "idPlan", IdPlan.ToString() },
                    { "valorPlan", ValorPlan.ToString() },
                    { "fechaIni", strFechaInicioPlan },
                    { "fechaFin", strFechaFinPlan },
                    { "idVendedor", IdVendedor.ToString() },
                    //{ "idSede", idSede.ToString() }
                };

                // Agregar solo si NO es débito automático
                if (!esDebitoAutomatico) parametros.Add("totalMeses", TotalMeses.ToString());

                // Convertir NameValueCollection → querystring
                string payload = string.Join("&", parametros.AllKeys.Select(key => $"{key}={HttpUtility.UrlEncode(parametros[key])}"));

                string token = UrlEncryptor.Encrypt(payload, TimeSpan.FromMinutes(10));

                // URL destino
                string destino = esDebitoAutomatico ? "wompipay" : "wompiplan";

                // Redirigir
                Response.Redirect($"{destino}?data={HttpUtility.UrlEncode(token)}", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            catch (Exception ex)
            {
                if (ex.Message == "PLAN_ACTIVO") return;

                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        private bool Validaciones(string strCedula, int idTipoDocumento, string strNombre, string strApellido, string strCelular, string strEmail)
        {
            strNombre = Regex.Replace(strNombre, @"\s+", " ").Trim();
            strApellido = Regex.Replace(strApellido, @"\s+", " ").Trim();

            // DOCUMENTO

            if (string.IsNullOrWhiteSpace(strCedula))
            {
                MostrarAlerta("Campo requerido", "Por favor, ingresa tu número de documento.", "warning");
                return false;
            }

            if (!Regex.IsMatch(strCedula, @"^\d{5,10}$"))
            {
                MostrarAlerta("Error", "Ingresa un número de documento válido. Debe contener entre 5 y 10 dígitos.", "error");
                return false;
            }

            if (Regex.IsMatch(strCedula, @"^0+$"))
            {
                MostrarAlerta("Error", "El número de documento no es válido.", "error");
                return false;
            }

            // TIPO DOCUMENTO

            if (idTipoDocumento <= 0)
            {
                MostrarAlerta("Campo requerido", "Por favor, selecciona el tipo de documento.", "warning");
                return false;
            }

            // NOMBRE

            if (string.IsNullOrWhiteSpace(strNombre))
            {
                MostrarAlerta("Campo requerido", "Por favor, ingresa tu nombre.", "warning");
                return false;
            }

            if (!Regex.IsMatch(strNombre, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"))
            {
                MostrarAlerta("Error", "El nombre solo debe contener letras y espacios.", "error");
                return false;
            }

            if (strNombre.Length < 2)
            {
                MostrarAlerta("Error", "El nombre debe tener al menos 2 caracteres.", "error");
                return false;
            }

            // APELLIDO

            if (string.IsNullOrWhiteSpace(strApellido))
            {
                MostrarAlerta("Campo requerido", "Por favor, ingresa tus apellidos.", "warning");
                return false;
            }

            if (!Regex.IsMatch(strApellido, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"))
            {
                MostrarAlerta("Error", "El apellido solo debe contener letras y espacios.", "error");
                return false;
            }

            if (strApellido.Length < 2)
            {
                MostrarAlerta("Error", "El apellido debe tener al menos 2 caracteres.", "error");
                return false;
            }

            // CELULAR

            if (string.IsNullOrWhiteSpace(strCelular))
            {
                MostrarAlerta("Campo requerido", "Por favor, ingresa tu número de celular.", "warning");
                return false;
            }

            if (!Regex.IsMatch(strCelular, @"^3\d{9}$"))
            {
                MostrarAlerta("Error", "Ingresa un número de celular válido. Debe iniciar en 3 y tener 10 dígitos.", "error");
                return false;
            }

            // EMAIL

            if (string.IsNullOrWhiteSpace(strEmail))
            {
                MostrarAlerta("Campo requerido", "Por favor, ingresa tu correo electrónico.", "warning");
                return false;
            }

            // Validar email
            try
            {
                var mail = new System.Net.Mail.MailAddress(strEmail);
            }
            catch
            {
                MostrarAlerta("Error", "El formato del correo electrónico no es válido. Ej: usuario@dominio.com.", "error");
                return false;
            }

            return true;
        }

        //private async Task<int> GestionarAfiliado(string documento, int tipoDoc, string nombre, string apellido, string celular, string email, int genero, string fechaNac, string fechaIniPlan, int idSede, string direccion, string codEstado, string codCiudad)
        //{
        //    clasesglobales cg = new clasesglobales();

        //    int idAfiliado = 0;

        //    DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(documento);

        //    if (dtAfiliado.Rows.Count > 0)
        //    {
        //        idAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);

        //        bool tienePlanActivo = ConsultarPlanActivoAfiliado(documento, fechaIniPlan);

        //        if (tienePlanActivo) throw new Exception("PLAN_ACTIVO");

        //        cg.ActualizarAfiliadoRegister(
        //            documento,
        //            nombre,
        //            apellido,
        //            celular,
        //            email,
        //            genero,
        //            fechaNac,
        //            idSede,
        //            "Pendiente"
        //        );
        //    }
        //    else
        //    {
        //        cg.InsertarAfiliadoWeb(
        //            documento,
        //            tipoDoc,
        //            nombre,
        //            apellido,
        //            celular,
        //            email,
        //            genero,
        //            fechaNac,
        //            idSede
        //        );

        //        // Vuelves a consultar para obtener el id
        //        DataTable dtNew = cg.ConsultarAfiliadoPorDocumento(documento);
        //        idAfiliado = Convert.ToInt32(dtNew.Rows[0]["IdAfiliado"]);
        //        dtNew.Dispose();
        //    }

        //    dtAfiliado.Dispose();

        //    // ---- Gestionar en Siigo ----
        //    try
        //    {
        //        DataTable dtAfi = cg.ConsultarCodigoSiigoPorDocumento(documento);
        //        string idTipoDocSiigo = dtAfi.Rows[0]["CodSiigo"].ToString();
        //        dtAfi.Dispose();

        //        var siigoClient = new SiigoClient(
        //            new HttpClient(),
        //            UrlSiigo,
        //            UserName,
        //            AccessKey,
        //            PartnerId
        //        );

        //        await siigoClient.ManageCustomerAsync(
        //            idTipoDocSiigo,
        //            documento,
        //            nombre,
        //            apellido,
        //            direccion,
        //            codEstado,
        //            codCiudad,
        //            celular,
        //            email
        //        );
        //    }
        //    catch (Exception ex)
        //    {
        //        System.Diagnostics.Debug.WriteLine("Error Siigo: " + ex.Message);
        //    }

        //    return idAfiliado;
        //}

        private async Task GestionarAfiliado(string documento, int idTipoDocumento, string nombres, string apellidos, string celular, string correo, string fechaInicioPlan)
        {
            clasesglobales cg = new clasesglobales();

            bool planActivo = ConsultarPlanActivoAfiliado(documento, fechaInicioPlan);
            if (planActivo) throw new Exception("PLAN_ACTIVO");

            DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dtAfiliado.Rows.Count > 0)
            {
                cg.ActualizarAfiliadoRegister(
                    documento,
                    nombres,
                    apellidos,
                    celular,
                    correo,
                    1,
                    "",
                    1,
                    "Pendiente"
                );
            }
            else
            {
                cg.InsertarAfiliadoWeb(
                    documento,
                    idTipoDocumento,
                    nombres,
                    apellidos,
                    celular,
                    correo,
                    1,
                    "",
                    1
                );
            }

            dtAfiliado.Dispose();

            // ---- Gestionar en Siigo ----
            try
            {
                DataTable dtAfi = cg.ConsultarCodigoSiigoPorDocumento(documento);
                string idTipoDocSiigo = dtAfi.Rows[0]["CodSiigo"].ToString();
                dtAfi.Dispose();

                var siigoClient = new SiigoClient(
                    new HttpClient(),
                    UrlSiigo,
                    UserName,
                    AccessKey,
                    PartnerId
                );

                await siigoClient.ManageCustomerAsync(
                    idTipoDocSiigo,
                    documento,
                    nombres,
                    apellidos,
                    "Boulevard Santander No. 18-45",
                    "68",
                    "68001",
                    celular,
                    correo
                );
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error Siigo: " + ex.Message);
            }
        }

        private bool ConsultarPlanActivoAfiliado(string cedula, string fechaInicioPlan)
        {
            // IMPORTANTE: NO ELIMINAR - SOLO SE COMENTA PARA REALIZAR PRUEBAS
            clasesglobales cg = new clasesglobales();

            DataTable dtFechaFinPlan = cg.ConsultarFechaFinPlanPorDocumento(cedula);

            if (dtFechaFinPlan.Rows.Count > 0)
            {
                // Obtener fecha de fin anterior
                DateTime fechaFinAnterior = Convert.ToDateTime(dtFechaFinPlan.Rows[0]["FechaFinalPlan"]);
                DateTime fechaInicioNuevo = Convert.ToDateTime(fechaInicioPlan);

                if (fechaInicioNuevo <= fechaFinAnterior)
                {
                    MostrarAlerta(
                        "Tienes un plan activo",
                        "Ya tienes un plan en curso que cubre las fechas seleccionadas. Nuestro sistema procesará el cobro automáticamente cuando corresponda, así que no es necesario realizar otro pago. Solo asegúrate de tener saldo disponible en tu tarjeta.",
                        "warning"
                    );

                    return true;
                }
            }

            dtFechaFinPlan.Dispose();

            return false;
        }

        public class FormularioAfiliado
        {
            public TextBox txbDocumento { get; set; }
            public DropDownList ddlTipoDocumento { get; set; }
            public TextBox txbNombre { get; set; }
            public TextBox txbApellido { get; set; }
            public TextBox txbEmail { get; set; }
            public TextBox txbCelular { get; set; }
            //public TextBox txbFechaNac { get; set; }
            //public DropDownList ddlGenero { get; set; }
            //public DropDownList ddlCiudad { get; set; }
            //public DropDownList ddlSede { get; set; }
        }

        private FormularioAfiliado ObtenerFormulario()
        {
            return new FormularioAfiliado
            {
                txbDocumento = txbDocumento,
                ddlTipoDocumento = ddlTipoDocumento,
                txbNombre = txbNombre,
                txbApellido = txbApellido,
                txbEmail = txbEmail,
                txbCelular = txbCelular,
                //txbFechaNac = txbFechaNac,
                //ddlGenero = ddlGenero,
                //ddlCiudad = ddlCiudad,
                //ddlSede = ddlSede,
            };
        }

        protected async void GestionarDatosUsuario(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            string documento = txt.Text.Trim();

            FormularioAfiliado form;

            form = ObtenerFormulario();

            if (string.IsNullOrEmpty(documento))
            {
                LimpiarCampos(form);
                return;
            }

            bool existe = BuscarAfiliado(documento, form);

            if (!existe)
            {
                await BuscarPersonaADRES(documento, form);
            }
        }

        protected bool BuscarAfiliado(string documento, FormularioAfiliado form)
        {
            if (string.IsNullOrEmpty(documento)) return false;

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dt.Rows.Count == 0)
            {
                dt.Dispose();
                return false;
            }

            DataRow afiliado = dt.Rows[0];

            form.txbDocumento.Text = documento;
            form.ddlTipoDocumento.SelectedValue = afiliado["idTipoDocumento"]?.ToString() ?? "";
            form.txbNombre.Text = afiliado["NombreAfiliado"]?.ToString() ?? "";
            form.txbApellido.Text = afiliado["ApellidoAfiliado"]?.ToString() ?? "";
            form.txbEmail.Text = afiliado["EmailAfiliado"]?.ToString() ?? "";
            form.txbCelular.Text = afiliado["CelularAfiliado"]?.ToString() ?? "";

            dt.Dispose();

            return true;
        }

        protected async Task BuscarPersonaADRES(string documento, FormularioAfiliado form)
        {
            if (string.IsNullOrEmpty(documento))
            {
                return;
            }

            string url = $"https://pqrdsuperargo.supersalud.gov.co/api/api/adres/0/{documento}";

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    var response = await client.GetAsync(url);

                    if (!response.IsSuccessStatusCode)
                    {
                        return;
                    }

                    string json = await response.Content.ReadAsStringAsync();

                    json = json.Replace("\\u00a5", "Ñ")
                               .Replace("\\u00a4", "ñ");

                    dynamic personaADRES = JsonConvert.DeserializeObject<dynamic>(json);

                    if (personaADRES == null ||
                        personaADRES.nombre == null ||
                        personaADRES.apellido == null)
                    {
                        return;
                    }

                    // Campos comunes (principal y secundario)
                    form.txbDocumento.Text = documento;

                    if (string.IsNullOrWhiteSpace(form.txbNombre.Text))
                    {
                        form.txbNombre.Text =
                            $"{(string)personaADRES.nombre} {(string)personaADRES.s_nombre}"
                            .Trim()
                            .ToUpper();
                    }

                    if (string.IsNullOrWhiteSpace(form.txbApellido.Text))
                    {
                        form.txbApellido.Text =
                            $"{(string)personaADRES.apellido} {(string)personaADRES.s_apellido}"
                            .Trim()
                            .ToUpper();
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(
                        "Error ADRES: " + ex.Message
                    );
                }
            }
        }

        private void LimpiarCampos(FormularioAfiliado form)
        {
            form.ddlTipoDocumento.ClearSelection();
            form.txbNombre.Text = "";
            form.txbApellido.Text = "";
            form.txbEmail.Text = "";
            form.txbCelular.Text = "";
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

            TotalMeses = meses + mesesCortesia;

            // Calcular la fecha final sumando meses
            DateTime fechaFin = fechaInicio.AddMonths(TotalMeses);

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

        // - COMENTADO HASTA NUEVO AVISO -
        //protected void btnRedireccionarRegresarRegister_Click(object sender, EventArgs e)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dtToken = cg.ConsultarTokenPorIdPlanYIdVendedor(21, 156);

        //    string token = dtToken.Rows.Count > 0 ? dtToken.Rows[0]["token"].ToString() : "";

        //    Response.Redirect($"register.aspx?token={token}", false);
        //    Context.ApplicationInstance.CompleteRequest();
        //}
    }
}