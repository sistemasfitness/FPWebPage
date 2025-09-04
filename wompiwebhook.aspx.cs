using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
	public partial class wompiwebhook : System.Web.UI.Page
	{
        // Llave secreta de eventos de Dashboard Wompi
        private const string EVENT_SECRET = "prod_events_qNoVyjX3vk7AtP9XtltSiPzrxz8PYsEi";
        protected void Page_Load(object sender, EventArgs e)
		{
            if (Request.HttpMethod == "POST")
            {
                ProcesarWebhook();
            }
            else
            {
                Response.StatusCode = 405; // Method Not Allowed
                Response.End();
            }
        }

        private void ProcesarWebhook()
        {
            try
            {
                // 1. Leer JSON que envía Wompi
                string body;
                using (var reader = new StreamReader(Request.InputStream))
                {
                    body = reader.ReadToEnd();
                }

                if (string.IsNullOrEmpty(body))
                {
                    Response.StatusCode = 400; // Bad Request
                    Response.Write("Empty body");
                    return;
                }

                // 2. Validar firma
                string headerSignature = Request.Headers["X-Event-Signature"];
                if (!ValidarFirma(body, headerSignature))
                {
                    Response.StatusCode = 401; // Unauthorized
                    Response.Write("Invalid signature");
                    return;
                }

                // 3. Deserializar
                dynamic webhook = JsonConvert.DeserializeObject(body);

                string evento = webhook.@event;
                string idTransaccion = webhook.data.transaction.id;
                string estado = webhook.data.transaction.status;
                string referencia = webhook.data.transaction.reference;
                string moneda = webhook.data.transaction.currency;
                long montoCents = webhook.data.transaction.amount_in_cents;

                // 4. Registrar en BD
                ProcesarTransaccion(idTransaccion, referencia, estado);

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

        private void ProcesarTransaccion(string transaccionId, string referencia, string estado)
        {
            if (estado == "APPROVED")
            {
                // TODO: Buscar en la base de datos si existe una transacción con esta idTransaccion
                //ConsultarTransaccionWompiPorId(transaccionId);

                // Si no existe:
                //InsertarTransaccionWompi();

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

            // Calculamos HMAC SHA256 del body
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(EVENT_SECRET)))
            {
                var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(body));
                string hashHex = BitConverter.ToString(hash).Replace("-", "").ToLower();

                // El header de Wompi tiene formato: "t=xxxxxx,v1=hash"
                var parts = headerSignature.Split(',');
                foreach (var part in parts)
                {
                    if (part.StartsWith("v1="))
                    {
                        string firmaWompi = part.Substring(3);
                        return hashHex.Equals(firmaWompi, StringComparison.OrdinalIgnoreCase);
                    }
                }
            }
            return false;
        }
    }
}