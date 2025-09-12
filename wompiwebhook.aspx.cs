using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
	public partial class wompiwebhook : System.Web.UI.Page
	{
        // Llave secreta de eventos de Dashboard Wompi
        private const string EVENT_SECRET = "prod_events_qNoVyjX3vk7AtP9XtltSiPzrxz8PYsEi";
        protected async void Page_Load(object sender, EventArgs e)
		{
            if (Request.HttpMethod == "POST")
            {
                await ProcesarWebhook();
            }
            else
            {
                Response.StatusCode = 405; // Method Not Allowed
                Response.SuppressContent = true;
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }

        private async Task ProcesarWebhook()
        {
            try
            {
                // 1. Leer JSON que envía Wompi
                string body;
                using (var reader = new StreamReader(Request.InputStream))
                {
                    body = await reader.ReadToEndAsync();
                }

                if (string.IsNullOrEmpty(body))
                {
                    Response.StatusCode = 400; // Bad Request
                    return;
                }

                // 2. Validar firma
                string headerSignature = Request.Headers["X-Event-Signature"];
                if (!ValidarFirma(body, headerSignature))
                {
                    Response.StatusCode = 401; // Unauthorized
                    return;
                }

                // 3. Deserializar (modelo tipado)
                var webhook = JsonConvert.DeserializeObject<WompiWebhook>(body);

                if (webhook?.Data?.Transaction == null)
                {
                    Response.StatusCode = 400;
                    return;
                }

                string evento = webhook.Event;
                string idTransaccion = webhook.Data.Transaction.Id;
                string estado = webhook.Data.Transaction.Status;
                string referencia = webhook.Data.Transaction.Reference;

                // 4. Procesar la transacción
                await ProcesarTransaccion(idTransaccion, referencia, estado);

                // 5. Confirmar recepción a Wompi
                Response.StatusCode = 200;
            }
            catch (Exception ex)
            {
                // Loguear el error
                System.Diagnostics.Debug.WriteLine("Error en Webhook: " + ex.ToString());
                Response.StatusCode = 500;
            }
        }

        private async Task ProcesarTransaccion(string idTransaccion, string referencia, string estado)
        {
            clasesglobales cg = new clasesglobales();

            if (estado == "APPROVED")
            {
                // TODO: Buscar en la base de datos si existe una transacción con esta idTransaccion
                //ConsultarTransaccionWompiPorId(transaccionId);



                // Si no existe:
                //InsertarTransaccionWompi();

                // 1. Consultar datos de pago pendiente
                DataTable dtPagoPendiente = cg.ConsultarPagoPlanAfiliadoPendienteWeb(referencia);

                int idAfiliado = Convert.ToInt32(dtPagoPendiente.Rows[0]["idAfiliado"].ToString());
                string documentoAfiliado = dtPagoPendiente.Rows[0]["documentoAfiliado"].ToString();
                int idPlan = Convert.ToInt16(dtPagoPendiente.Rows[0]["idPlan"].ToString());
                string fechaInicioPlan = Convert.ToDateTime(dtPagoPendiente.Rows[0]["fechaInicioPlan"].ToString()).ToString("yyyy-MM-dd");
                string fechaFinPlan = Convert.ToDateTime(dtPagoPendiente.Rows[0]["fechaFinPlan"].ToString()).ToString("yyyy-MM-dd");
                int meses = Convert.ToInt16(dtPagoPendiente.Rows[0]["meses"].ToString());
                int valorPlan = Convert.ToInt32(dtPagoPendiente.Rows[0]["valorPlan"].ToString());

                // 2. Inserción de afiliación de cliente al plan
                cg.InsertarAfiliadoPlan(
                    idAfiliado,
                    idPlan,
                    fechaInicioPlan,
                    fechaFinPlan,
                    meses,
                    valorPlan,
                    "Pago Único",
                    "Pendiente"
                );

                // 3. Obtención de idAfiliadoPlan recién creado
                DataTable dt = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(idAfiliado);

                int idAfiliadoPlan = int.Parse(dt.Rows[0]["idAfiliadoPlan"].ToString());

                // 4. Inserción de pago en base de datos
                string idSiigoFactura = null;

                cg.InsertarPagoPlanAfiliadoWeb(
                    idAfiliadoPlan,
                    valorPlan,
                    4,
                    referencia,
                    "Ninguno",
                    152,
                    "Aprobado",
                    idSiigoFactura,
                    null,
                    null,
                    idTransaccion,
                    null,
                    null,
                    null
                );

                // 5. Intentar facturar en Siigo
                try
                {
                    // Creación de factura
                    var siigoClient = new SiigoClient(
                        new HttpClient(),
                        "https://api.siigo.com/",
                        "sandbox@siigoapi.com",
                        "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=",
                        "SandboxSiigoApi"
                    );

                    // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
                    // ESTÁ COMENTADO PARA PRUEBAS LOCALES
                    //string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                    //    Session["documentoAfiliado"].ToString(), 
                    //    Session["codSiigoPlan"].ToString(), 
                    //    Session["nombrePlan"].ToString(),
                    //    int.Parse(Session["valorPlan"].ToString())
                    //);

                    // Siigo Pruebas
                    //    //int idTipoDocumento = 28006;
                    //    //int costCenterDefault = 621;
                    //    //int idVendedor = 856;
                    //    //int idPayment = 9438;
                    int idSede = Session["idSede"] != null ? Convert.ToInt32(Session["idSede"].ToString()) : 0;
                    string codSiigoPlan = "COD2433";
                    string nombrePlan = "Pago de suscripción";
                    int precioPlan = 10000;
                    idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                        documentoAfiliado,
                        codSiigoPlan,
                        nombrePlan,
                        precioPlan,
                        idSede
                    );

                    // Actualizar pago con id de factura
                    cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idSiigoFactura, idAfiliadoPlan);
                }
                catch (Exception siigoEx)
                {
                    System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
                }

                dt.Dispose();



                // Si existe y tiene estado "PENDING":
                //CambiarEstadoTransaccionWompi(transaccionId, estado);
            }

            if (estado == "PENDING")
            {
                // TODO: Buscar en la base de datos si existe una transacción con esta idTransaccion
                //ConsultarTransaccionWompiPorId(transaccionId);

                // Si no existe:
                //InsertarTransaccionWompi();
            }

            if (estado == "DECLINED" || estado == "VOIDED")
            {
                // TODO: Buscar en la base de datos si existe una transacción con esta idTransaccion
                //ConsultarTransaccionWompiPorId(transaccionId);

                // Si existe y tiene estado "PENDING":
                //CambiarEstadoTransaccionWompi(transaccionId, estado);
            }
        }

        private bool ValidarFirma(string body, string headerSignature)
        {
            if (string.IsNullOrEmpty(headerSignature)) return false;

            // Header tiene formato: "t=xxxx,v1=hash"
            var parts = headerSignature.Split(',');
            string timestamp = null, firmaWompi = null;

            foreach (var part in parts)
            {
                if (part.StartsWith("t=")) timestamp = part.Substring(2);
                if (part.StartsWith("v1=")) firmaWompi = part.Substring(3);
            }

            if (timestamp == null || firmaWompi == null) return false;

            // Generar firma local: HMAC_SHA256(secret, t + "." + body)
            string data = timestamp + "." + body;
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(EVENT_SECRET)))
            {
                var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(data));
                string hashHex = BitConverter.ToString(hash).Replace("-", "").ToLower();
                return hashHex.Equals(firmaWompi, StringComparison.OrdinalIgnoreCase);
            }
        }

        // Modelos para deserializar
        public class WompiWebhook
        {
            [JsonProperty("event")]
            public string Event { get; set; }

            [JsonProperty("data")]
            public WompiData Data { get; set; }
        }

        public class WompiData
        {
            [JsonProperty("transaction")]
            public WompiTransaction Transaction { get; set; }
        }

        public class WompiTransaction
        {
            [JsonProperty("id")]
            public string Id { get; set; }

            [JsonProperty("status")]
            public string Status { get; set; }

            [JsonProperty("reference")]
            public string Reference { get; set; }
        }
    }
}