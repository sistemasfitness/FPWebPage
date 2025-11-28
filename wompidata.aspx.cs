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
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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

        protected string IdTransaccion
        {
            get { return ViewState["idTransaccion"]?.ToString(); }
            set { ViewState["idTransaccion"] = value; }
        }

        protected async void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                string code = Request.QueryString["code"];
                string id = Request.QueryString["id"]
                                ?? Request.QueryString["transaction_id"];

                if (string.IsNullOrEmpty(code) || string.IsNullOrEmpty(id)) 
                { 
                    Response.Redirect("default", false);
                    return;
                }

                // Decodifica y guarda el documento
                DocumentoAfiliado = Encoding.Unicode.GetString(Convert.FromBase64String(code));
                IdTransaccion = id;

                // Procesa todo
                await ProcesarTransaccionWompiAsync();
            }

            //        //// Post a Armatura para crear el usuario
            //        //PostArmatura(strDocumento);

            //    //}
            //}
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

                // 1. Polling del estado
                do
                {
                    await Task.Delay(1000);
                    (referencia, estado, mensajeEstado) = await ObtenerEstadoTransaccionAsync(IdTransaccion);
                    intentos++;
                }
                while (estado == "PENDING" && intentos < maxIntentos);

                // Si Wompi no devolvió referencia, no hay nada más que hacer
                if (string.IsNullOrEmpty(referencia)) return;

                estado = estado ?? "ERROR";

                clasesglobales cg = new clasesglobales();

                bool existePendiente = false;

                // 2. Buscar el pago pendiente
                using (var dtPagoPen = cg.ConsultarPagoPlanAfiliadoPendienteWeb(referencia))
                {
                    existePendiente = dtPagoPen.Rows.Count > 0;

                    if (!existePendiente) return;

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
                                return;
                            }
                        }

                        // 3.2 Registrar el pago aprobado
                        var row = dtPagoPen.Rows[0];

                        await RegistrarPagoAprobadoAsync(
                            Convert.ToInt32(row["idAfiliado"]),
                            DocumentoAfiliado,
                            Convert.ToInt32(row["idPlan"]),
                            Convert.ToDateTime(row["fechaInicioPlan"]).ToString("yyyy-MM-dd"),
                            Convert.ToDateTime(row["fechaFinPlan"]).ToString("yyyy-MM-dd"),
                            Convert.ToInt32(row["mesesPlan"]),
                            Convert.ToInt32(row["valorPlan"]),
                            row["descripcionPlan"].ToString(),
                            referencia,
                            IdTransaccion,
                            Convert.ToInt32(row["idVendedor"]),
                            Convert.ToInt32(row["idSede"])
                        );
                    }
                }

                // 4. Actualizar estado real del pago pendiente - NO ES NECESARIO, PERO PUEDE QUE LO SEA EN UN FUTURO
                //cg.ActualizarEstadoPagoPlanAfiliadoPendienteWeb(DocumentoAfiliado, referencia, estado);

                // 5. Si NO está pendiente → eliminar registro
                if (estado != "PENDING")
                {
                    cg.EliminarRegistroPagoPlanAfiliadoPendienteWeb(referencia);
                }

                Session["idReferencia"] = null;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ProcesarTransaccionWompiAsync: " + ex.ToString());
            }
        }

        private async Task RegistrarPagoAprobadoAsync(int idAfiliado, string nroDoc, int idPlan, string fechaIniPlan, string fechaFinPlan, int totalMeses, int valor, string descripcion, string referencia, string idTransaccion, int idVendedor, int idSede)
        {
            clasesglobales cg = new clasesglobales();
            int idAfiliadoPlan = 0;
            int idPago = 0;

            try
            {
                // 1. Inserción de AfiliadoPlan en la Base de Datos
                idAfiliadoPlan = cg.InsertarAfiliadoPlanYDevolverId(
                    idAfiliado,
                    idPlan,
                    fechaIniPlan,
                    fechaFinPlan,
                    totalMeses,
                    valor,
                    descripcion,
                    "Activo"
                );

                // 2. Inserción de PagoPlanAfiliado en la Base de Datos
                idPago = cg.InsertarPagoPlanAfiliadoWebYDevolverId(
                    idAfiliadoPlan,
                    valor,
                    4,
                    referencia,
                    "Wompi",
                    idVendedor,
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
            try
            {
                //DataTable dtIntegracion = cg.ConsultarIntegracion(IdSede);
                //string url = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["urlTest"].ToString() : "0";
                //string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : "0";
                //string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : "0";
                //string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : "0";
                //dtIntegracion.Dispose();

                string url = "https://api.siigo.com/";
                string username = "sandbox@siigoapi.com";
                string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";
                string partnerId = "SandboxSiigoApi";

                // Creación de factura
                var siigoClient = new SiigoClient(
                    new HttpClient(),
                    url,
                    username,
                    accessKey,
                    partnerId
                );

                // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
                // ESTÁ COMENTADO PARA PRUEBAS LOCALES
                //idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                //    DocumentoAfiliado,
                //    CodSiigoPlan,
                //    NombrePlan,
                //    ValorPlan,
                //    IdSede
                //);

                // Siigo Pruebas
                //    //int idTipoDocumento = 28006;
                //    //int costCenterDefault = 621;
                //    //int idVendedor = 856;
                //    //int idPayment = 9438;
                string codSiigoPlan = "COD2433";
                string nombrePlan = "Pago de suscripción";
                int precioPlan = 10000;
                string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                    nroDoc,
                    codSiigoPlan,
                    nombrePlan,
                    precioPlan,
                    idSede
                );

                // Actualizar pago con id de factura
                cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idPago, idSiigoFactura);
            }
            catch (Exception siigoEx)
            {
                System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
            }
        }

        protected async Task<(string idReferencia, string estado, string estadoMensaje)> ObtenerEstadoTransaccionAsync(string idTransaccion)
        {
            try
            {
                // PRUEBAS:
                string url = $"https://sandbox.wompi.co/v1/transactions/{idTransaccion}";

                // PRODUCCION:
                //string url = $"https://production.wompi.co/v1/transactions/{idTransaccion}";

                using (HttpClient client = new HttpClient())
                {
                    var response = await client.GetAsync(url);

                    if (!response.IsSuccessStatusCode)
                    {
                        return (null, null, null);
                    }

                    string json = await response.Content.ReadAsStringAsync();

                    dynamic transaccion = JsonConvert.DeserializeObject<dynamic>(json);

                    if (transaccion == null)
                    {
                        return (null, null, null);
                    }

                    string idReferencia = transaccion.data.reference;
                    string estado = transaccion.data.status;
                    string mensajeEstado = transaccion.data.status_message;

                    return (idReferencia, estado, mensajeEstado);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ConsultarEstadoTransaccion: " + ex.ToString());
                return (null, null, null);
            }
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