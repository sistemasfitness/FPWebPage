using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;
using static WebPage.register;

namespace WebPage
{
    public partial class wompipay : System.Web.UI.Page
    {
        static int idIntegracion = 1; // Pruebas
        //static int idIntegracion = 4; // Producción

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

        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
        }

        protected string NombrePlan
        {
            get { return ViewState["nombrePlan"]?.ToString(); }
            set { ViewState["nombrePlan"] = value; }
        }

        protected int MesesPlan
        {
            get { return ViewState["meses"] != null ? (int)ViewState["meses"] : 0; }
            set { ViewState["meses"] = value; }
        }

        protected int ValorPlan
        {
            get { return ViewState["valorPlan"] != null ? (int)ViewState["valorPlan"] : 0; }
            set { ViewState["valorPlan"] = value; }
        }

        protected string CodSiigoPlan
        {
            get { return ViewState["codSiigoPlan"]?.ToString(); }
            set { ViewState["codSiigoPlan"] = value; }
        }

        protected string FechaInicioPlan
        {
            get { return ViewState["fechaInicioPlan"]?.ToString(); }
            set { ViewState["fechaInicioPlan"] = value; }
        }

        protected string FechaFinPlan
        {
            get { return ViewState["fechaFinPlan"]?.ToString(); }
            set { ViewState["fechaFinPlan"] = value; }
        }

        protected int IdVendedor
        {
            get { return ViewState["idVendedor"] != null ? (int)ViewState["idVendedor"] : 0; }
            set { ViewState["idVendedor"] = value; }
        }

        protected int IdSede
        {
            get { return ViewState["idSede"] != null ? (int)ViewState["idSede"] : 0; }
            set { ViewState["idSede"] = value; }
        }

        //

        protected string IdReferencia
        {
            get { return ViewState["idReferencia"]?.ToString(); }
            set { ViewState["idReferencia"] = value; }
        }

        protected string DataIdToken
        {
            get { return ViewState["dataIdToken"]?.ToString(); }
            set { ViewState["dataIdToken"] = value; }
        }

        protected string DataIdFuentePago
        {
            get { return ViewState["dataIdFuentePago"]?.ToString(); }
            set { ViewState["dataIdFuentePago"] = value; }
        }

        protected string DataIdTransaccion
        {
            get { return ViewState["dataIdTransaccion"]?.ToString(); }
            set { ViewState["dataIdTransaccion"] = value; }
        }

        protected string AcceptanceToken
        {
            get { return ViewState["acceptance_token"]?.ToString(); }
            set { ViewState["acceptance_token"] = value; }
        }

        protected string AcceptPersonalAuth
        {
            get { return ViewState["accept_personal_auth"]?.ToString(); }
            set { ViewState["accept_personal_auth"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidarTokenURLEncryptor();

                if (Session["idAfiliado"] != null)
                {
                    ltValor.Text = Session["ltValorPlan"].ToString();
                }
                else
                {
                    Response.Redirect("default");
                }
            }
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo, bool esHtml = false)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string contenido = esHtml ? $"html: '{mensaje}'" : $"text: '{mensaje}'";

            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                {contenido},
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

        private void ValidarTokenURLEncryptor()
        {
            string token = Request.QueryString["data"];

            if (string.IsNullOrEmpty(token)) return;

            if (UrlEncryptor.TryDecryptToCollection(token, out NameValueCollection q, out DateTime? expiresUtc))
            {
                DocumentoAfiliado = q["nroDoc"];
                IdPlan = Convert.ToInt32(q["idPlan"]);
                FechaInicioPlan = q["fechaIni"];
                FechaFinPlan = q["fechaFin"];
                IdVendedor = Convert.ToInt32(q["idVendedor"]);
                IdSede = Convert.ToInt32(q["idSede"]);
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void ConsultarDatosAfiliadoYPlan()
        {
            try
            {
                clasesglobales cg = new clasesglobales();
                DataTable dtAfi = cg.ConsultarAfiliadoPorDocumento(DocumentoAfiliado);

                IdAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? Convert.ToInt32(dtAfi.Rows[0]["idAfiliado"].ToString()) : 0;
                CorreoAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? dtAfi.Rows[0]["emailAfiliado"].ToString() : null;

                DataTable dtPlan = cg.ConsultarPlanPorId(IdPlan);

                MesesPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? Convert.ToInt32(dtPlan.Rows[0]["meses"].ToString()) : 0;
                ValorPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? Convert.ToInt32(dtPlan.Rows[0]["valor"].ToString()) : 0;

                NombrePlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["nombrePlan"].ToString() : null;
                CodSiigoPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["codSiigoPlan"].ToString() : null;

                dtAfi.Dispose();
                dtPlan.Dispose();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos confirmar tu información.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en CrearFuentePagoAsync: " + ex.ToString());
            }
        }
        
        protected async void btnPagar_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Obtener datos necesarios del afiliado y del plan
                ConsultarDatosAfiliadoYPlan();

                string cardNumber = txbCreditCard.Text.Replace(" ", "");
                if (!cardNumber.All(char.IsDigit))
                {
                    MostrarAlerta("Error", "El número de tarjeta no es válido.", "error");
                    return;
                }

                string cvc = txbCVC.Text.Trim();
                if (cvc.Length < 3 || cvc.Length > 4 || !cvc.All(char.IsDigit))
                {
                    MostrarAlerta("Error", "El CVC debe ser numérico y de 3 o 4 dígitos.", "error");
                    return;
                }

                bool tarjetaTokenizada = await TokenizarTarjetaAsync(
                    cardNumber,
                    cvc,
                    ddlMes.SelectedValue,
                    ddlAnho.SelectedValue,
                    txbNombreTarjeta.Text.Trim()
                );

                if (!tarjetaTokenizada)
                {
                    MostrarAlerta("Error de tokenización", "La tarjeta no pudo ser procesada.", "error");
                    return;
                }

                string strDescripcion = "Débito automático";
                string strEstado = "Pendiente";

                if (IdPlan == 12 || IdPlan == 17)
                {
                    strDescripcion = "Débito automático Migración Clez";
                    strEstado = "Activo";
                }

                // TODO: CAMBIAR LÓGICA: AL INSERTAR EL AFILIADO PLAN, DEVUELVE EL ID DEL REGISTRO CREADO

                clasesglobales cg = new clasesglobales();

                cg.InsertarAfiliadoPlan(
                    IdAfiliado,
                    IdPlan,
                    FechaInicioPlan,
                    FechaFinPlan,
                    MesesPlan,
                    ValorPlan,
                    strDescripcion,
                    strEstado
                );

                // 2. Obtención de idAfiliadoPlan recién creado
                DataTable dt = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(IdAfiliado);
                if (dt.Rows.Count == 0)
                {
                    MostrarAlerta("Error", "No se pudo recuperar el plan del afiliado.", "error");
                    return;
                }

                int idAfiliadoPlan = Convert.ToInt32(dt.Rows[0]["idAfiliadoPlan"].ToString());
                //Session["idAfiliadoPlan"] = idAfiliadoPlan;

                //

                // 3. Inserción de pago en base de datos
                string idSiigoFactura = null;

                cg.InsertarPagoPlanAfiliadoWeb(
                    idAfiliadoPlan,
                    ValorPlan,
                    4,
                    IdReferencia, 
                    "Ninguno",
                    IdVendedor, // TODO: Cambiar cuando se realice lógica [Validar que si la persona que intenta comprar un plan por la página, PERO tiene un registro en el CRM del mismo plan que está comprando por web, no queda la compra por web, sino, tiene en cuenta el CRM realizado anteriormente]
                    "Aprobado",
                    idSiigoFactura,
                    DataIdToken, 
                    DataIdFuentePago, 
                    DataIdTransaccion, 
                    null,
                    null,
                    null
                );

                if (IdPlan != 12)
                {
                    // 4. Intentar facturar en Siigo
                    try
                    {
                        //int idSede = Convert.ToInt32(Session["idSede"].ToString());
                        //int idSede = Session["idSede"] != null ? Convert.ToInt32(Session["idSede"].ToString()) : 0;

                        DataTable dtIntegracion = cg.ConsultarIntegracion(IdSede);
                        string urlTest = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["urlTest"].ToString() : "0";
                        string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : "0";
                        string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : "0";
                        string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : "0";

                        //string urlTest = "https://api.siigo.com/";
                        //string username = "sandbox@siigoapi.com";
                        //string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";
                        //string partnerId = "SandboxSiigoApi";

                        // Creación de factura
                        var siigoClient = new SiigoClient(
                            new HttpClient(),
                            urlTest,
                            username,
                            accessKey,
                            partnerId
                        );

                        // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
                        // ESTÁ COMENTADO PARA PRUEBAS LOCALES
                        idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                            DocumentoAfiliado,
                            CodSiigoPlan,
                            NombrePlan,
                            ValorPlan,
                            IdSede
                        );

                        // Siigo Pruebas
                        //    //int idTipoDocumento = 28006;
                        //    //int costCenterDefault = 621;
                        //    //int idVendedor = 856;
                        //    //int idPayment = 9438;
                        //string codSiigoPlan = "COD2433";
                        //string nombrePlan = "Pago de suscripción";
                        //int precioPlan = 10000;
                        //idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                        //    Session["documentoAfiliado"].ToString(),
                        //    codSiigoPlan,
                        //    nombrePlan,
                        //    precioPlan,
                        //    idSede
                        //);

                        // Actualizar pago con id de factura
                        cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idSiigoFactura, idAfiliadoPlan);

                        dtIntegracion.Dispose();
                    }
                    catch (Exception siigoEx)
                    {
                        System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
                    }
                }

                dt.Dispose();

                Response.Redirect("wompiexito", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Hubo un problema interno al procesar tu pago.<br>Por favor, toma una captura de pantalla y comunícate con nosotros al número de WhatsApp para ayudarte.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en btnPagar_Click: " + ex.ToString());
            }
        }

        private async Task<bool> TokenizarTarjetaAsync(string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            try
            {
                //// Validar sesiones necesarias
                //if (Session["idAfiliado"] == null || Session["idPlan"] == null ||
                //    Session["fechaInicioPlan"] == null || Session["fechaFinPlan"] == null ||
                //    Session["meses"] == null || Session["valorPlan"] == null ||
                //    Session["emailAfiliado"] == null)
                //{
                //    MostrarAlerta("Información incompleta", "Parece que nos faltó un dato para seguir con tu pago.<br>Por favor, cierra esta página y vuelve a intentarlo para que todo funcione correctamente.", "warning", true);
                //    return false;
                //}

                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                //Tokenizar una tarjeta
                
                string url = dtIntegracionWompi.Rows[0]["urlTest"] + "tokens/cards";
                string respuesta = await GetPostAsync(url, creditcard, cvc, mes, anho, cardholder);

                Root1 rObjetc = JsonConvert.DeserializeObject<Root1>(respuesta);

                if (rObjetc.status == "CREATED" && rObjetc.data != null && !string.IsNullOrEmpty(rObjetc.data.id))
                {
                    ObtenerTokensDeAceptacion();

                    string dataIdToken = rObjetc.data.id;
                    DataIdToken = dataIdToken;

                    // Creación de fuente de pago en Wompi
                    bool fuentePagoCreada = await CrearFuentePagoAsync(
                        CorreoAfiliado,
                        "CARD",
                        dataIdToken,
                        AcceptanceToken,
                        AcceptPersonalAuth
                    );

                    if (!fuentePagoCreada)
                    {
                        string estado = rObjetc?.status ?? "Respuesta desconocida";
                        MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                        return false;
                    }

                    return true;
                }
                else
                {
                    string estado = rObjetc?.status ?? "Respuesta desconocida";
                    MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                    return false;
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Hubo un problema al procesar la tarjeta.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en TokenizarTarjetaAsync: " + ex.ToString());
                return false;
            }
        }
        private async Task<bool> CrearFuentePagoAsync(string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            try
            {
                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                string url = dtIntegracionWompi.Rows[0]["urlTest"].ToString() + "payment_sources";

                string respuesta = await GetPostFuentePagoAsync(url, customer_email, type, token, acceptance_token, accept_personal_auth);

                Root2 rObjetc = JsonConvert.DeserializeObject<Root2>(respuesta);

                if (rObjetc.data.status != "AVAILABLE" || rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id.ToString()))
                {
                    MostrarAlerta("Error en fuente de pago", "No se pudo crear la fuente de pago en Wompi.", "error");
                    return false;
                }

                string dataid = rObjetc.data.id.ToString();
                DataIdFuentePago = dataid;

                // Crear referencia única para el cobro
                string reference = DocumentoAfiliado + "-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                IdReferencia = reference;

                // Calcular hash SHA256
                string monto = ValorPlan + "00"; // en centavos
                string moneda = "COP";

                string integrity_secret = dtIntegracionWompi.Rows[0]["integrity_secret"].ToString();

                string concatenado = reference + monto + moneda + integrity_secret;
                string hash256 = ComputeSha256Hash(concatenado);

                // Ejecutar el cobro inicial
                bool transaccionCreada = await CrearTransaccionAsync(
                    Convert.ToInt32(monto), 
                    moneda, 
                    hash256, 
                    CorreoAfiliado, 
                    1, 
                    reference, 
                    Convert.ToInt32(dataid)
                );

                if (!transaccionCreada) 
                {
                    string estado = rObjetc?.data?.status ?? "Respuesta desconocida";
                    MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                    return false;
                }

                dtIntegracionWompi.Dispose();

                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos registrar el método de pago.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en CrearFuentePagoAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<bool> CrearTransaccionAsync(int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        {
            try
            {
                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                string url = dtIntegracionWompi.Rows[0]["urlTest"].ToString() + "transactions";

                string respuesta = await GetPostTransaccionAsync(url, amount_in_cents, currency, signature, customer_email, installments, reference, payment_source_id);

                Root3 rObjetc = JsonConvert.DeserializeObject<Root3>(respuesta);

                if (rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id))
                {
                    MostrarAlerta("Error", "No se recibió un ID válido para la transacción.", "error");
                    return false;
                }

                string dataid2 = rObjetc.data.id;
                DataIdTransaccion = dataid2;

                // Espera y reintentos para obtener estado definitivo
                string estado = null;
                string estadoMensaje = null;
                int maxIntentos = 15;
                int intentos = 0;

                do
                {
                    await Task.Delay(1000); // Espera 1 segundos
                    (estado, estadoMensaje) = await ConsultarTransaccionPorReferencia(reference);
                    intentos++;
                }
                while (estado == "PENDING" && intentos < maxIntentos);

                if (estado != "APPROVED")
                {
                    if (estado == "DECLINED")
                    {
                        MostrarAlerta("Transacción rechazada", $"{estadoMensaje}.", "error");
                    } 
                    else
                    {
                        MostrarAlerta("Transacción rechazada", $"Estado de la tarjeta: {estado ?? "Desconocido"}", "error");
                    }
                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos procesar tu transacción.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en CrearTransaccionAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<(string Estado, string EstadoMensaje)> ConsultarTransaccionPorReferencia(string referencia)
        {
            try
            {
                string respuesta = await GetPostConsultaTransaccionAsync(referencia);

                // Clase sugerida para deserializar respuesta de Wompi
                var json = JsonConvert.DeserializeObject<dynamic>(respuesta);

                if (json.status == "ERROR")
                {
                    MostrarAlerta("Error al consultar", (string)json.message, "error");
                    return (null, null);
                }

                var data = json.data;
                if (data == null || data.Count == 0)
                {
                    MostrarAlerta("Sin resultados", "No se encontraron transacciones con esta referencia.", "info");
                    return (null, null);
                }

                string estado = data[0].status;
                string estadoMensaje = data[0].status_message;
                return (estado, estadoMensaje); // Ejemplo: "APPROVED", "DECLINED", "PENDING"
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No se pudo consultar el estado de la transacción.", "error");
                System.Diagnostics.Debug.WriteLine("Error en ConsultarTransaccionPorReferencia: " + ex.ToString());
                return (null, null);
            }
        }

        static string ComputeSha256Hash(string rawData)
        {
            // Crea un SHA256
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - devuelve una matriz de bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convierte una matriz de bytes en una cadena
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public static async Task<string> GetPostAsync(string url, string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            // Validaciones básicas
            if (string.IsNullOrWhiteSpace(creditcard) || creditcard.Length < 13 || creditcard.Length > 19)
                throw new ArgumentException("Número de tarjeta inválido.");

            if (string.IsNullOrWhiteSpace(cvc) || cvc.Length < 3 || cvc.Length > 4)
                throw new ArgumentException("Código CVC inválido.");

            if (!int.TryParse(mes, out int mesInt) || mesInt < 1 || mesInt > 12)
                throw new ArgumentException("Mes de expiración inválido.");

            if (!int.TryParse(anho, out int anhoInt))
                throw new ArgumentException("Año de expiración inválido.");

            if (string.IsNullOrWhiteSpace(cardholder))
                throw new ArgumentException("Nombre del titular inválido.");

            var oTarjeta = new Tarjeta
            {
                number = creditcard,
                cvc = cvc,
                exp_month = mes,
                exp_year = anho,
                card_holder = cardholder
            };

            string json = JsonConvert.SerializeObject(oTarjeta);

            using (HttpClient client = new HttpClient())
            {
                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                string keyPub = dtIntegracionWompi.Rows[0]["keyPub"].ToString();

                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", keyPub);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public static async Task<string> GetPostFuentePagoAsync(string url, string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            if (string.IsNullOrWhiteSpace(customer_email) ||
                string.IsNullOrWhiteSpace(type) ||
                string.IsNullOrWhiteSpace(token) ||
                string.IsNullOrWhiteSpace(acceptance_token) ||
                string.IsNullOrWhiteSpace(accept_personal_auth))
            {
                throw new ArgumentException("Todos los campos son obligatorios para crear una fuente de pago.");
            }

            var oFuentePago = new FuentePago
            {
                type = type,
                token = token,
                customer_email = customer_email,
                acceptance_token = acceptance_token,
                accept_personal_auth = accept_personal_auth
            };

            string json = JsonConvert.SerializeObject(oFuentePago);

            using (HttpClient client = new HttpClient())
            {
                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                string keyPriv = dtIntegracionWompi.Rows[0]["keyPriv"].ToString();

                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", keyPriv);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public static async Task<string> GetPostTransaccionAsync(string url, int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        {
            if (amount_in_cents <= 0 || string.IsNullOrWhiteSpace(currency) || string.IsNullOrWhiteSpace(signature) ||
                string.IsNullOrWhiteSpace(customer_email) || string.IsNullOrWhiteSpace(reference) || payment_source_id <= 0)
            {
                throw new ArgumentException("Los datos enviados para crear la transacción no son válidos.");
            }

            var oTransaccion = new Transaccion
            {
                amount_in_cents = amount_in_cents,
                currency = currency,
                signature = signature,
                customer_email = customer_email,
                payment_method = new PaymentMethod { installments = installments },
                reference = reference,
                payment_source_id = payment_source_id
            };

            string json = JsonConvert.SerializeObject(oTransaccion);

            using (HttpClient client = new HttpClient())
            {

                clasesglobales cg = new clasesglobales();
                DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

                string keyPriv = dtIntegracionWompi.Rows[0]["keyPriv"].ToString();

                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", keyPriv);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public static async Task<string> GetPostConsultaTransaccionAsync(string idReferencia)
        {
            clasesglobales cg = new clasesglobales();
            DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

            string url = dtIntegracionWompi.Rows[0]["urlTest"].ToString() + $"transactions?reference={idReferencia}";

            using (HttpClient client = new HttpClient())
            {
                string keyPriv = dtIntegracionWompi.Rows[0]["keyPriv"].ToString();

                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", keyPriv);

                try
                {
                    HttpResponseMessage response = await client.GetAsync(url);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        private void ObtenerTokensDeAceptacion()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dtIntegracionWompi = cg.ConsultarIntegracionWompi(idIntegracion);

            string keyPub = dtIntegracionWompi.Rows[0]["keyPub"].ToString();
            string url = dtIntegracionWompi.Rows[0]["urlTest"].ToString() + "merchants/" + keyPub;

            try
            {
                // Realizar la petición HTTP tipo GET
                string respuesta = GetHTTP(url);

                // Deserializar la respuesta JSON
                Root rObjetc = JsonConvert.DeserializeObject<Root>(respuesta);

                // Guardar los tokens en la sesión
                AcceptanceToken = rObjetc.data.presigned_acceptance.acceptance_token;
                AcceptPersonalAuth = rObjetc.data.presigned_personal_data_auth.acceptance_token;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los tokens de aceptación de Wompi: " + ex.Message);
            }
        }

        //
        // Wompi API - Tokenización
        public static string GetHTTP(string url)
        {
            WebRequest wRequest = WebRequest.Create(url);
            WebResponse wResponse = wRequest.GetResponse();
            StreamReader sReader = new StreamReader(wResponse.GetResponseStream());
            return sReader.ReadToEnd().Trim();
        }

        public class PresignedAcceptance
        {
            public string acceptance_token { get; set; }
        }

        public class PresignedPersonalDataAuth
        {
            public string acceptance_token { get; set; }
        }

        public class Data
        {
            public PresignedAcceptance presigned_acceptance { get; set; }
            public PresignedPersonalDataAuth presigned_personal_data_auth { get; set; }
        }

        public class Root
        {
            public Data data { get; set; }
        }

        // 
        public class Tarjeta
        {
            public string number { get; set; }
            public string cvc { get; set; }
            public string exp_month { get; set; }
            public string exp_year { get; set; }
            public string card_holder { get; set; }
        }

        public class FuentePago
        {
            public string type { get; set; }
            public string token { get; set; }
            public string customer_email { get; set; }
            public string acceptance_token { get; set; }
            public string accept_personal_auth { get; set; }
        }

        public class Transaccion
        {
            public int amount_in_cents { get; set; }
            public string currency { get; set; }
            public string signature { get; set; }
            public string customer_email { get; set; }
            public PaymentMethod payment_method { get; set; }
            public string reference { get; set; }
            public int payment_source_id { get; set; }
        }

        public class PaymentMethod
        {
            public int installments { get; set; }
        }

        public class Data1
        {
            public string id { get; set; }
            public DateTime created_at { get; set; }
            public string brand { get; set; }
            public string name { get; set; }
            public string last_four { get; set; }
            public string bin { get; set; }
            public string exp_year { get; set; }
            public string exp_month { get; set; }
            public string card_holder { get; set; }
            public DateTime expires_at { get; set; }
        }

        public class Root1
        {
            public string status { get; set; }
            public Data1 data { get; set; }
        }

        public class Data2
        {
            public int id { get; set; }
            public PublicData public_data { get; set; }
            public string type { get; set; }
            public string status { get; set; }
        }

        public class PublicData
        {
            public string type { get; set; }
        }

        public class Root2
        {
            public Data2 data { get; set; }
        }

        public class Data3
        {
            public string id { get; set; }
            public DateTime created_at { get; set; }
            public object finalized_at { get; set; }
            public int amount_in_cents { get; set; }
            public string reference { get; set; }
            public string customer_email { get; set; }
            public string currency { get; set; }
            public string payment_method_type { get; set; }
            public PaymentMethod2 payment_method { get; set; }
            public string status { get; set; }
            public object status_message { get; set; }
            public object billing_data { get; set; }
            public object shipping_address { get; set; }
            public object redirect_url { get; set; }
            public int payment_source_id { get; set; }
            public object payment_link_id { get; set; }
            public object customer_data { get; set; }
            public object bill_id { get; set; }
            public List<object> taxes { get; set; }
            public object tip_in_cents { get; set; }
        }

        public class Extra
        {
            public bool is_three_ds { get; set; }
            public object three_ds_auth_type { get; set; }
        }

        public class Meta
        {
        }

        public class PaymentMethod2
        {
            public string type { get; set; }
            public Extra extra { get; set; }
            public string phone_number { get; set; }
        }

        public class Root3
        {
            public Data3 data { get; set; }
            public Meta meta { get; set; }
        }
    }
}