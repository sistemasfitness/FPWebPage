using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NPOI.POIFS.Crypt.Agile;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;
using static WebPage.register;

namespace WebPage
{
	public partial class wompidata : System.Web.UI.Page
	{
        protected string DocumentoAfiliado
        {
            get { return ViewState["nroDoc"]?.ToString(); }
            set { ViewState["nroDoc"] = value; }
        }

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

        protected int IdCanalVenta
        {
            get { return ViewState["idCanalVenta"] != null ? (int)ViewState["idCanalVenta"] : 0; }
            set { ViewState["idCanalVenta"] = value; }
        }

        protected int IdSede
        {
            get { return ViewState["idSede"] != null ? (int)ViewState["idSede"] : 0; }
            set { ViewState["idSede"] = value; }
        }

        protected string IdTransaccion
        {
            get { return ViewState["idTransaccion"]?.ToString(); }
            set { ViewState["idTransaccion"] = value; }
        }

        // Wompi

        protected string UrlWompi
        {
            get { return ViewState["urlWompi"]?.ToString(); }
            set { ViewState["urlWompi"] = value; }
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

        //

        protected int IdDocumentType
        {
            get { return ViewState["idDocumentType"] != null ? (int)ViewState["idDocumentType"] : 0; }
            set { ViewState["idDocumentType"] = value; }
        }

        protected int IdCostCenter
        {
            get { return ViewState["idCostCenter"] != null ? (int)ViewState["idCostCenter"] : 0; }
            set { ViewState["idCostCenter"] = value; }
        }

        protected int IdSellerUser
        {
            get { return ViewState["idSellerUser"] != null ? (int)ViewState["idSellerUser"] : 0; }
            set { ViewState["idSellerUser"] = value; }
        }

        protected int IdPayment
        {
            get { return ViewState["idPayment"] != null ? (int)ViewState["idPayment"] : 0; }
            set { ViewState["idPayment"] = value; }
        }

        //

        protected string NombrePlan
        {
            get { return ViewState["nombrePlan"]?.ToString(); }
            set { ViewState["nombrePlan"] = value; }
        }

        protected string CodSiigoPlan
        {
            get { return ViewState["codSiigoPlan"]?.ToString(); }
            set { ViewState["codSiigoPlan"] = value; }
        }

        protected async void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                string code = Request.QueryString["code"];
                IdTransaccion = Request.QueryString["id"] ?? Request.QueryString["transaction_id"];

                if (string.IsNullOrEmpty(code) || string.IsNullOrEmpty(IdTransaccion)) 
                { 
                    Response.Redirect("default", false);
                    return;
                }

                // Decodificar y almacenar
                string decoded = Encoding.Unicode.GetString(Convert.FromBase64String(code));
                string[] partes = decoded.Split('|');

                DocumentoAfiliado = partes.Length > 0 ? partes[0] : null;
                IdPlan = partes.Length > 1 ? Convert.ToInt32(partes[1]) : 0;
                IdVendedor = partes.Length > 2 ? Convert.ToInt32(partes[2]) : 0;
                IdSede = partes.Length > 3 ? Convert.ToInt32(partes[3]) : 0;

                ConsultarIntegracion();

                // Procesa todo
                await ProcesarTransaccionWompiAsync();
            }

            //        //// Post a Armatura para crear el usuario
            //        //PostArmatura(strDocumento);

            //    //}
            //}
        }

        private void ConsultarIntegracion()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtVendedor = cg.ConsultarUsuarioEmpleadoPorId(IdVendedor);
            IdCanalVenta = dtVendedor.Rows.Count > 0 ? Convert.ToInt32(dtVendedor.Rows[0]["idCanalVenta"]) : 0;
            dtVendedor.Dispose();

            DataTable dtIntegracion = cg.ConsultarIntegracionEmpresaPorIdCanalVenta(IdCanalVenta);

            foreach (DataRow row in dtIntegracion.Rows)
            {
                string codigo = row["codigo"].ToString();

                switch (codigo)
                {
                    case "WOMPI":
                        UrlWompi = row["url"].ToString();
                        break;

                    case "SIIGO":
                        UrlSiigo = row["url"].ToString();
                        UserName = row["username"].ToString();
                        AccessKey = row["accessKey"].ToString();
                        PartnerId = row["partnerId"].ToString();

                        IdDocumentType = Convert.ToInt32(row["idDocumentTypeSiigo"].ToString());
                        IdSellerUser = Convert.ToInt32(row["idSellerUser"].ToString());
                        IdPayment = Convert.ToInt32(row["idPayment"].ToString());
                        IdCostCenter = Convert.ToInt32(row["idCostCenterSiigo"].ToString());
                        break;
                }
            }
        }

        private async Task ProcesarTransaccionWompiAsync()
        {
            try
            {
                const int maxIntentos = 15;
                int intentos = 0;

                string estado = null;
                string mensajeEstado = null;
                string referencia = null;
                int valorPlan = 0;

                // 1. Polling del estado
                do
                {
                    await Task.Delay(1000);
                    (referencia, estado, mensajeEstado, valorPlan) = await ObtenerEstadoTransaccionAsync(IdTransaccion);
                    valorPlan = valorPlan / 100;
                    intentos++;
                }
                while (estado == "PENDING" && intentos < maxIntentos);

                // Si Wompi no devolvió referencia → no podemos continuar
                if (string.IsNullOrEmpty(referencia))
                {
                    RenderizarVistaSegunEstado("ERROR", "No se pudo consultar el estado de la transacción.", valorPlan);
                    return;
                }

                estado = estado ?? "ERROR";

                clasesglobales cg = new clasesglobales();

                bool existePendiente = false;

                // 2. Buscar el pago pendiente
                using (var dtPagoPen = cg.ConsultarPagoPorReferenciaPendienteWeb(referencia))
                {
                    existePendiente = dtPagoPen.Rows.Count > 0;

                    // SI EXISTE PENDIENTE → obtener valor del plan, incluso si no fue aprobado
                    if (existePendiente) valorPlan = Convert.ToInt32(dtPagoPen.Rows[0]["valorPlan"]);

                    // Si no existe pendiente, igual mostramos la vista (porque ya se usó o fue procesado antes)
                    if (!existePendiente)
                    {
                        RenderizarVistaSegunEstado(estado, mensajeEstado, valorPlan);
                        return;
                    }

                    // 3. Si está aprobado → registrar el pago
                    if (estado == "APPROVED")
                    {
                        // 3.1 Validar si ya fue registrado antes
                        using (var dtPagoReg = cg.ConsultarPagoPorReferencia(referencia))
                        {
                            if (dtPagoReg.Rows.Count > 0)
                            {
                                // Ya fue registrado antes → solo limpiar el pendiente
                                cg.EliminarRegistroPagoPlanAfiliadoPendienteWeb(referencia);
                                RenderizarVistaSegunEstado(estado, mensajeEstado, valorPlan);
                                return;
                            }
                        }

                        // 3.2 Registrar el pago aprobado
                        var row = dtPagoPen.Rows[0];

                        await RegistrarPagoAprobadoAsync(
                            Convert.ToInt32(row["idAfiliado"]),
                            row["documentoAfiliado"].ToString(),
                            Convert.ToInt32(row["idPlan"]),
                            Convert.ToDateTime(row["fechaInicioPlan"]).ToString("yyyy-MM-dd"),
                            Convert.ToDateTime(row["fechaFinPlan"]).ToString("yyyy-MM-dd"),
                            Convert.ToInt32(row["mesesPlan"]),
                            valorPlan,
                            row["descripcionPlan"].ToString(),
                            referencia,
                            IdTransaccion,
                            Convert.ToInt32(row["idVendedor"])
                        );
                    }
                }

                // 4. Actualizar estado real del pago pendiente - NO ES NECESARIO, PERO PUEDE QUE LO SEA EN UN FUTURO
                //cg.ActualizarEstadoPagoPlanAfiliadoPendienteWeb(DocumentoAfiliado, referencia, estado);

                // 5. Si NO está pendiente → eliminar registro
                if (estado != "PENDING") cg.EliminarRegistroPagoPlanAfiliadoPendienteWeb(referencia);

                RenderizarVistaSegunEstado(estado, mensajeEstado, valorPlan);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ProcesarTransaccionWompiAsync: " + ex.ToString());
            }
        }

        private async Task RegistrarPagoAprobadoAsync(int idAfiliadoPrincipal, string documento, int idPlan, string fechaIniPlan, string fechaFinPlan, int totalMeses, int valorPlan, string descripcion, string referencia, string idTransaccion, int idVendedor)
        {
            clasesglobales cg = new clasesglobales();

            try
            {
                string[] documentos = documento.Split('|');
                bool esPlanDuo = idPlan == 32 && documentos.Length == 2;

                int valorPrincipal = valorPlan;
                int valorSecundario = 0;

                int mesesPlanPrincipal = totalMeses;
                string fechaFinPrincipal = fechaFinPlan;

                if (esPlanDuo)
                {
                    valorPrincipal = valorPlan / 2;
                    valorSecundario = valorPlan - valorPrincipal; // evita problema de redondeo

                    int mesesPorPersona = totalMeses / 2;

                    DateTime fechaInicio = Convert.ToDateTime(fechaIniPlan);
                    DateTime nuevaFechaFin = fechaInicio.AddMonths(mesesPorPersona);

                    mesesPlanPrincipal = mesesPorPersona;
                    fechaFinPrincipal = nuevaFechaFin.ToString("yyyy-MM-dd");
                }

                // ===============================
                // 1️. CREAR AFILIADO PLAN PRINCIPAL
                // ===============================
                int idAfiliadoPlanPrincipal = cg.InsertarAfiliadoPlanYDevolverId(
                    idAfiliadoPrincipal,
                    idPlan,
                    fechaIniPlan,
                    fechaFinPrincipal,
                    mesesPlanPrincipal,
                    valorPrincipal,
                    descripcion,
                    "Activo"
                );

                int idPagoPrincipal = cg.InsertarPagoPlanAfiliadoWebYDevolverId(
                    idAfiliadoPlanPrincipal,
                    valorPlan,
                    4,
                    referencia,
                    "Wompi",
                    idVendedor,
                    "Aprobado",
                    null,
                    IdCanalVenta,
                    null,
                    null,
                    idTransaccion,
                    null,
                    null,
                    null
                );

                // ===============================
                // 2. SI ES PLAN DÚO → CREAR SEGUNDO AFILIADO
                // ===============================
                if (esPlanDuo)
                {
                    string documentoSecundario = documentos[1];

                    DataTable dtAfiSec = cg.ConsultarAfiliadoPorDocumento(documentoSecundario);

                    if (dtAfiSec.Rows.Count > 0)
                    {
                        int idAfiliadoSecundario = Convert.ToInt32(dtAfiSec.Rows[0]["IdAfiliado"]);
                        dtAfiSec.Dispose();

                        int idAfiliadoPlanSecundario = cg.InsertarAfiliadoPlanYDevolverId(
                            idAfiliadoSecundario,
                            idPlan,
                            fechaIniPlan,
                            fechaFinPrincipal,
                            mesesPlanPrincipal,
                            valorSecundario,
                            descripcion,
                            "Activo"
                        );

                        cg.ActualizarPagoGrupoAfiliadoPlan(idAfiliadoPlanSecundario, idPagoPrincipal);
                    }
                }

                // ===============================
                // 3️. FACTURACIÓN EN SIIGO (solo una vez)
                // ===============================

                try
                {
                    string fechaActual = DateTime.Now.ToString("yyyy-MM-dd");

                    var siigoClient = new SiigoClient(
                        new HttpClient(),
                        UrlSiigo,
                        UserName,
                        AccessKey,
                        PartnerId
                    );

                    DataTable dtPlan = cg.ConsultarPlanPorId(idPlan);
                    string nombrePlan = dtPlan.Rows[0]["nombrePlan"].ToString();
                    string codSiigoPlan = dtPlan.Rows[0]["codSiigoPlan"].ToString();
                    dtPlan.Dispose();

                    // PRUEBA
                    codSiigoPlan = "COD2433";
                    nombrePlan = "Pago de suscripción";

                    string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                        documentos[0], // siempre facturamos al principal
                        codSiigoPlan,
                        nombrePlan,
                        valorPlan, // FACTURA POR EL TOTAL
                        IdSellerUser,
                        IdDocumentType,
                        fechaActual,
                        IdCostCenter,
                        IdPayment
                    );

                    cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idPagoPrincipal, idSiigoFactura);
                }
                catch (Exception siigoEx)
                {
                    System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error registrando Plan: " + ex.ToString());
            }
        }

        protected async Task<(string idReferencia, string estado, string estadoMensaje, int precio)> ObtenerEstadoTransaccionAsync(string idTransaccion)
        {
            try
            {
                string url = $"{UrlWompi}transactions/{idTransaccion}";

                using (HttpClient client = new HttpClient())
                {
                    var response = await client.GetAsync(url);

                    if (!response.IsSuccessStatusCode)
                    {
                        return (null, null, null, 0);
                    }

                    string json = await response.Content.ReadAsStringAsync();

                    dynamic transaccion = JsonConvert.DeserializeObject<dynamic>(json);

                    if (transaccion == null)
                    {
                        return (null, null, null, 0);
                    }

                    string idReferencia = transaccion.data.reference;
                    string estado = transaccion.data.status;
                    string mensajeEstado = transaccion.data.status_message;
                    int precio = transaccion.data.amount_in_cents;

                    return (idReferencia, estado, mensajeEstado, precio);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ConsultarEstadoTransaccion: " + ex.ToString());
                return (null, null, null, 0);
            }
        }

        private void RenderizarVistaSegunEstado(string estado, string mensajeEstado, int valorPago)
        {
            switch (estado)
            {
                case "APPROVED":
                    ltTituloPrincipal.Text = "<h1 style='font-weight: 900'>¡Pago Exitoso!</h1>";
                    ltTitulo.Text = "<h3 style='font-weight: 900; color: #e3ff00;'>¡Gracias por ser parte de la familia Fitness People!</h3>";
                    ltMensaje.Text = "<p style='color: #fff; font-weight: 700;'>Confirmamos que tu pago fue recibido.</p>";

                    pnlResumen.Visible = true;
                    ltValor.Text = valorPago.ToString("C0");
                    ltTotal.Text = valorPago.ToString("C0");

                    pnlContinuar.Visible = true;
                    pnlRegresar.Visible = false;
                    break;

                case "DECLINED":
                    ltTituloPrincipal.Text = "<h1 style='font-weight: 900'>Pago Rechazado</h1>";
                    ltTitulo.Text = "<h3 style='font-weight: 900; color: #ff4d4d;'>¡Ups!</h3>";
                    ltMensaje.Text = $"<p style='color: #fff;'>Tu pago fue rechazado: <br /><b>{mensajeEstado}</b></p>";

                    pnlResumen.Visible = false;
                    pnlContinuar.Visible = false;
                    pnlRegresar.Visible = true;
                    break;

                case "VOIDED":
                case "ERROR":
                    ltTituloPrincipal.Text = "<h1 style='font-weight: 900'>Error en el pago</h1>";
                    ltTitulo.Text = "<h3 style='font-weight: 900; color: #ff4d4d;'>Algo salió mal</h3>";
                    ltMensaje.Text = $"<p style='color: #fff;'>No pudimos procesar tu pago: <br /><b>{mensajeEstado}</b></p>";

                    pnlResumen.Visible = false;
                    pnlContinuar.Visible = false;
                    pnlRegresar.Visible = true;
                    break;

                case "PENDING":
                default:
                    ltTituloPrincipal.Text = "<h1 style='font-weight: 900'>Procesando...</h1>";
                    ltTitulo.Text = "<h3 style='font-weight: 900; color: #e3ff00;'>Estamos verificando tu pago</h3>";
                    ltMensaje.Text = "<p style='color: #fff; font-weight: 700;'>Esto puede tardar algunos segundos...</p>";

                    pnlResumen.Visible = false;
                    pnlContinuar.Visible = false;
                    pnlRegresar.Visible = false;
                    break;
            }
        }

        protected void btnRedireccionarActivarPlan_Click(object sender, EventArgs e)
        {
            Response.Redirect($"verificacion.aspx?nroDoc={DocumentoAfiliado}", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnRedireccionarRegresarRegister_Click(object sender, EventArgs e)
        {
            clasesglobales cg = new clasesglobales();
            DataTable dtToken = cg.ConsultarTokenPorIdPlanYIdVendedor(IdPlan, IdVendedor);

            string token = dtToken.Rows.Count > 0 ? dtToken.Rows[0]["token"].ToString() : "";

            Response.Redirect($"register.aspx?token={token}", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        private void PostArmatura(string strDocumento)
        {
            //string strQuery = "SELECT * FROM Afiliados WHERE DocumentoAfiliado = '" + strDocumento + "'";
            //DataTable dt = TraerDatos(strQuery);

            //string strGenero = "";
            //if (dt.Rows[0]["idGenero"].ToString() == "1")
            //{
            //    strGenero = "M";
            //}
            //if (dt.Rows[0]["idGenero"].ToString() == "2")
            //{
            //    strGenero = "F";
            //}

            //Persona oPersona = new Persona()
            //{
            //    pin = "" + dt.Rows[0]["DocumentoAfiliado"].ToString() + "",
            //    name = "" + dt.Rows[0]["NombreAfiliado"].ToString() + "",
            //    lastName = "" + dt.Rows[0]["ApellidoAfiliado"].ToString() + "",
            //    gender = strGenero,
            //    personPhoto = "",
            //    certType = "",
            //    certNumber = "",
            //    mobilePhone = "" + dt.Rows[0]["CelularAfiliado"].ToString() + "",
            //    personPwd = "",
            //    birthday = "" + String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(dt.Rows[0]["FechaNacAfiliado"].ToString())) + "",
            //    isSendMail = "false",
            //    email = "" + dt.Rows[0]["EmailAfiliado"].ToString() + "",
            //    deptCode = "01",
            //    ssn = "",
            //    cardNo = "",
            //    supplyCards = "",
            //    carPlate = "",
            //    accStartTime = "2025-01-01 08:00:00",
            //    accEndTime = "2025-02-25 23:00:00",
            //    accLevelIds = "402883f08df57ba4018df57cddf70490",
            //    hireDate = ""
            //};

            //string contenido = JsonConvert.SerializeObject(oPersona, Formatting.Indented);
            
            //string url = "https://aone.armaturacolombia.co/api/person/add/?access_token=D2BCF6E6BD09DECAA1266D9F684FFE3F5310AD447D107A29974F71E1989AABDB";
            //string rta = EnviarPeticion(url, contenido);

            //ltMensaje.Text = rta;

        }

        public static string EnviarPeticion(string url, string contenido)
        {
            string result = "";
            string resultadoj = "";
            try
            {

                WebRequest oRequest = WebRequest.Create(url);
                oRequest.Method = "post";
                oRequest.ContentType = "application/json;charset-UTF-8";

                using (var oSw = new StreamWriter(oRequest.GetRequestStream()))
                {
                    oSw.Write(contenido);
                    oSw.Flush();
                    oSw.Close();
                }

                WebResponse oResponse = oRequest.GetResponse();
                using (var oSr = new StreamReader(oResponse.GetResponseStream(), System.Text.Encoding.UTF8))
                {
                    result = oSr.ReadToEnd().Trim();
                    JObject jsonObj = JObject.Parse(result);
                    resultadoj = jsonObj["message"].ToString();
                }
                return resultadoj;
            }
            catch (Exception ex)
            {
                string error = "Error al enviar la petición: " + ex.Message;
                return error;
            }
        }

        public class Persona
        {
            public string pin { get; set; }
            public string name { get; set; }
            public string lastName { get; set; }
            public string gender { get; set; }
            public string personPhoto { get; set; }
            public string certType { get; set; }
            public string certNumber { get; set; }
            public string mobilePhone { get; set; }
            public string personPwd { get; set; }
            public string birthday { get; set; }
            public string isSendMail { get; set; }
            public string email { get; set; }
            public string deptCode { get; set; }
            public string ssn { get; set; }
            public string cardNo { get; set; }
            public string supplyCards { get; set; }
            public string carPlate { get; set; }
            public string accStartTime { get; set; }
            public string accEndTime { get; set; }
            public string accLevelIds { get; set; }
            public string hireDate { get; set; }

        }
    }
}