using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebPage.register;

namespace WebPage
{
    public partial class wompipay : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["idAfiliado"] = "91491754";
                //Session["fechaInicioPlan"] = "2025-05-01";
                //Session["fechaFinalPlan"] = "2025-12-01";
                if (Session["idAfiliado"].ToString() != "")
                {
                    //string strCedula = Session["idAfiliado"].ToString();
                    //string strQuery = "SELECT * FROM Afiliados WHERE DocumentoAfiliado = " + strCedula;
                    //DataTable dt = TraerDatos(strQuery);

                    ltValor.Text = Session["ltValorPlan"].ToString();

                    //if (Request.Form.Count > 0)
                    //{
                    //    TokenizarTarjeta(Request.Form["creditcard"].ToString(), Request.Form["cvc"].ToString(), Request.Form["ddlMes"].ToString(), Request.Form["ddlAnho"].ToString(), Request.Form["nombretarjeta"].ToString());
                    //}
                }
                else
                {
                    Response.Redirect("default");
                }
            }

            string strPublicKeySandbox = "pub_test_Mp5JzDLXitLu7W0I3Gea5OXotOExpFjv";
            string strPublicKeyProduction = "pub_prod_9kHE7xJALv0kDfoSLxQAul1dY141BdR2";

            string strPrivateKeySandbox = "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2";
            string strPrivateKeyProduction = "prv_prod_h7JHlOIL6EjCzotPnupYSbzy16ulQ5DO";

        }

        public DataTable TraerDatos(string strQuery)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{tipo}',
                showCloseButton: true,
                confirmButtonText: 'Aceptar'
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }

        protected async void btnPagar_Click(object sender, EventArgs e)
        {
            try
            {
                await TokenizarTarjetaAsync(
                    txbCreditCard.Text.Trim(),
                    txbCVC.Text.Trim(),
                    ddlMes.SelectedValue,
                    ddlAnho.SelectedValue,
                    txbNombreTarjeta.Text.Trim()
                );
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ocurrió un error inesperado al procesar el pago.", "error");
                System.Diagnostics.Debug.WriteLine("Error en btnPagar_Click: " + ex.ToString());

                ScriptManager.RegisterStartupScript(this, GetType(), "habilitarBoton", @"
                    document.getElementById('" + btnPagar.ClientID + @"').disabled = false;", true);
            }
        }

        private async Task TokenizarTarjetaAsync(string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            try
            {
                // Validar sesiones necesarias
                if (Session["idAfiliado"] == null || Session["idPlan"] == null ||
                    Session["fechaInicioPlan"] == null || Session["fechaFinPlan"] == null ||
                    Session["meses"] == null || Session["valorPlan"] == null ||
                    Session["emailAfiliado"] == null)
                {
                    MostrarAlerta("Sesión incompleta", "Faltan datos requeridos para procesar el pago.", "warning");
                    return;
                }

                //Tokenizar una tarjeta
                string url = "https://sandbox.wompi.co/v1/tokens/cards";
                string respuesta = await GetPostAsync(url, creditcard, cvc, mes, anho, cardholder);

                Root1 rObjetc = JsonConvert.DeserializeObject<Root1>(respuesta);

                if (rObjetc.status == "CREATED" && rObjetc.data != null && !string.IsNullOrEmpty(rObjetc.data.id))
                {
                    string dataid = rObjetc.data.id;
                    ltMensaje.Value = dataid;

                    // 1. Creación de fuente de pago en Wompi
                    bool fuentePagoCreada = await CrearFuentePagoAsync(
                        Session["emailAfiliado"].ToString(),
                        "CARD",
                        dataid,
                        Session["acceptance_token"].ToString(),
                        Session["accept_personal_auth"].ToString()
                    );

                    if (!fuentePagoCreada)
                    {
                        string estado = rObjetc?.status ?? "Respuesta desconocida";
                        MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                        return;
                    }

                    clasesglobales cg = new clasesglobales();

                    // 2. Inserción de afiliación de cliente al plan
                    cg.InsertarAfiliadoPlan(
                        int.Parse(Session["idAfiliado"].ToString()),
                        int.Parse(Session["idPlan"].ToString()),
                        Session["fechaInicioPlan"].ToString(),
                        Session["fechaFinPlan"].ToString(),
                        int.Parse(Session["meses"].ToString()),
                        int.Parse(Session["valorPlan"].ToString()),
                        "Débito automático",
                        "Pendiente"
                    );

                    // 3. Obtención de idAfiliadoPlan recién creado
                    DataTable dtIdAfiliadoPlan = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(int.Parse(Session["idAfiliado"].ToString()));
                    if (dtIdAfiliadoPlan.Rows.Count == 0)
                    {
                        MostrarAlerta("Error", "No se pudo recuperar el plan del afiliado.", "error");
                        return;
                    }

                    int idAfiliadoPlan = int.Parse(dtIdAfiliadoPlan.Rows[0]["idAfiliadoPlan"].ToString());
                    Session["idAfiliadoPlan"] = idAfiliadoPlan;

                    // 4. Inserción de pago en base de datos
                    DataTable dtCanalVentas = cg.ConsultarCanalesVentaPorNombre(Session["nombreSede"].ToString());

                    if (dtCanalVentas.Rows.Count == 0)
                    {
                        MostrarAlerta("Canal no encontrado", "No se encontró el canal de ventas para esta sede.", "error");
                        return;
                    }

                    int idCanalVenta = int.Parse(dtCanalVentas.Rows[0]["idCanalVenta"].ToString());

                    cg.InsertarPagoPlanAfiliado(
                        idAfiliadoPlan,
                        int.Parse(Session["valorPlan"].ToString()),
                        "Wompi",
                        Session["idReferencia"].ToString(),
                        "Ninguno",
                        "Aprobado",
                        idCanalVenta
                    );

                    // 5. Actualización de token del pago
                    cg.ActualizarPagoPlanAfiliadoToken(dataid, idAfiliadoPlan);

                    // 6. Actualización de fuente de pago en base de datos
                    cg.ActualizarPagoPlanAfiliadoFuentePago(
                        Session["dataIdFuentePago"].ToString(),
                        idAfiliadoPlan
                    );

                    // 7. Actualización de transacción en base de datos
                    cg.ActualizarPagoPlanAfiliadoTransaccion(
                        Session["dataIdTransaccion"].ToString(),
                        idAfiliadoPlan
                    );

                    dtIdAfiliadoPlan.Dispose();
                    dtCanalVentas.Dispose();
                }
                else
                {
                    string estado = rObjetc?.status ?? "Respuesta desconocida";
                    MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Ocurrió un error al procesar la transacción.", "error");
                System.Diagnostics.Debug.WriteLine("Error en TokenizarTarjetaAsync: " + ex.ToString());
            }
        }
        private async Task<bool> CrearFuentePagoAsync(string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            try
            {
                string url = "https://sandbox.wompi.co/v1/payment_sources";
                string respuesta = await GetPostFuentePagoAsync(url, customer_email, type, token, acceptance_token, accept_personal_auth);

                Root2 rObjetc = JsonConvert.DeserializeObject<Root2>(respuesta);

                if (rObjetc.data.status != "AVAILABLE" || rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id.ToString()))
                {
                    MostrarAlerta("Error en fuente de pago", "No se pudo crear la fuente de pago en Wompi.", "error");
                    return false;
                }

                string dataid = rObjetc.data.id.ToString();
                Session["dataIdFuentePago"] = dataid;

                // Crear referencia única para el cobro
                string reference = Session["documentoAfiliado"].ToString() + "-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                Session["idReferencia"] = reference;

                // Calcular hash SHA256
                string monto = Session["valorPlan"].ToString() + "00"; // en centavos
                string moneda = "COP";
                string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

                string concatenado = reference + monto + moneda + integrity_secret;
                string hash256 = ComputeSha256Hash(concatenado);

                // Ejecutar el cobro inicial
                bool transaccionCreada = await CrearTransaccionAsync(
                    int.Parse(monto), 
                    moneda, 
                    hash256, 
                    Session["emailAfiliado"].ToString(), 
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

                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Ocurrió un error al crear la fuente de pago o procesar el primer cobro.", "error");
                System.Diagnostics.Debug.WriteLine("Error en CrearFuentePagoAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<bool> CrearTransaccionAsync(int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        {
            try
            {
                string url = "https://sandbox.wompi.co/v1/transactions";
                string respuesta = await GetPostTransaccionAsync(url, amount_in_cents, currency, signature, customer_email, installments, reference, payment_source_id);

                Root3 rObjetc = JsonConvert.DeserializeObject<Root3>(respuesta);

                // Consulta de estado de pago realizado en Wompi
                string estado = await ConsultarTransaccionPorReferencia(reference);

                if (estado != "APPROVED")
                {
                    MostrarAlerta("Transacción rechazada", $"Estado de la tarjeta: {estado ?? "Desconocido"}", "error");
                    return false;
                }

                if (rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id))
                {
                    MostrarAlerta("Error", "No se recibió un ID válido para la transacción.", "error");
                    return false;
                }

                string dataid2 = rObjetc.data.id;
                Session["dataIdTransaccion"] = dataid2;

                // Redireccionar solo si todo está OK
                Response.Redirect("wompiexito", false);
                Context.ApplicationInstance.CompleteRequest();
                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Ocurrió un error al intentar crear la transacción con Wompi.", "error");
                System.Diagnostics.Debug.WriteLine("Error en CrearTransaccionAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<string> ConsultarTransaccionPorReferencia(string referencia)
        {
            try
            {
                string respuesta = await GetPostConsultaTransaccionAsync(referencia);

                // Clase sugerida para deserializar respuesta de Wompi
                var json = JsonConvert.DeserializeObject<dynamic>(respuesta);

                if (json.status == "ERROR")
                {
                    MostrarAlerta("Error al consultar", (string)json.message, "error");
                    return null;
                }

                var data = json.data;
                if (data == null || data.Count == 0)
                {
                    MostrarAlerta("Sin resultados", "No se encontraron transacciones con esta referencia.", "info");
                    return null;
                }

                string estado = data[0].status;
                return estado; // Ejemplo: "APPROVED", "DECLINED", "PENDING"
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No se pudo consultar el estado de la transacción.", "error");
                System.Diagnostics.Debug.WriteLine("Error en ConsultarTransaccionPorReferencia: " + ex.ToString());
                return null;
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
                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "pub_test_Mp5JzDLXitLu7W0I3Gea5OXotOExpFjv");

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

        //public static string GetPost(string url, string creditcard, string cvc, string mes, string anho, string cardholder)
        //{
        //    Tarjeta oTarjeta = new Tarjeta() { number = "" + creditcard + "", cvc = "" + cvc + "", exp_month = "" + mes + "", exp_year = "" + anho + "", card_holder = "" + cardholder + "" };

        //    string result = "";
        //    WebRequest wRequest = WebRequest.Create(url);
        //    wRequest.Method = "post";
        //    wRequest.ContentType = "application/json;charset=UTF-8";
        //    wRequest.Headers.Add("Authorization", "Bearer pub_test_Mp5JzDLXitLu7W0I3Gea5OXotOExpFjv");

        //    using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
        //    {
        //        string json = JsonConvert.SerializeObject(oTarjeta);
        //        oSW.Write(json);
        //        oSW.Flush();
        //        oSW.Close();
        //    }

        //    WebResponse wResponse = wRequest.GetResponse();

        //    using (var oSR = new StreamReader(wResponse.GetResponseStream()))
        //    {
        //        result = oSR.ReadToEnd().Trim();
        //    }

        //    return result;
        //}

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
                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

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

        //public static string GetPost2(string url, string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        //{
        //    FuentePago oFuentePago = new FuentePago() { type = "" + type + "", token = "" + token + "", customer_email = "" + customer_email + "", acceptance_token = "" + acceptance_token + "", accept_personal_auth = "" + accept_personal_auth + "" };

        //    string result = "";
        //    WebRequest wRequest = WebRequest.Create(url);
        //    wRequest.Method = "post";
        //    wRequest.ContentType = "application/json;charset=UTF-8";
        //    wRequest.Headers.Add("Authorization", "Bearer prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

        //    using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
        //    {
        //        string json = JsonConvert.SerializeObject(oFuentePago);
        //        oSW.Write(json);
        //        oSW.Flush();
        //        oSW.Close();
        //    }

        //    WebResponse wResponse = wRequest.GetResponse();

        //    using (var oSR = new StreamReader(wResponse.GetResponseStream()))
        //    {
        //        result = oSR.ReadToEnd().Trim();
        //    }

        //    return result;
        //}

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
                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

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

            //var oTransaccion = new Transaccion
            //{
            //    amount_in_cents = amount_in_cents,
            //    currency = currency,
            //    signature = signature,
            //    customer_email = customer_email,
            //    payment_method = new PaymentMethod { installments = installments },
            //    reference = reference,
            //    payment_source_id = payment_source_id
            //};

            //string json = JsonConvert.SerializeObject(oTransaccion);

            //using (HttpClient client = new HttpClient())
            //{
            //    client.DefaultRequestHeaders.Authorization =
            //        new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

            //    var content = new StringContent(json, Encoding.UTF8, "application/json");
            //    HttpResponseMessage response = await client.PostAsync(url, content);
            //    response.EnsureSuccessStatusCode();

            //    string result = await response.Content.ReadAsStringAsync();
            //    return result;
            //}
        }

        //public static string GetPost3(string url, int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        //{
        //    PaymentMethod oPM = new PaymentMethod() { installments = installments };
        //    Transaccion oTransaccion = new Transaccion() { amount_in_cents = amount_in_cents, currency = "" + currency + "", signature = "" + signature + "", customer_email = "" + customer_email + "", payment_method = oPM, reference = "" + reference + "", payment_source_id = payment_source_id };

        //    Transaccion oTrans = new Transaccion() { };

        //    string result = "";
        //    WebRequest wRequest = WebRequest.Create(url);
        //    wRequest.Method = "post";
        //    wRequest.ContentType = "application/json;charset=UTF-8";
        //    wRequest.Headers.Add("Authorization", "Bearer prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

        //    using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
        //    {
        //        string json = JsonConvert.SerializeObject(oTransaccion);
        //        oSW.Write(json);
        //        oSW.Flush();
        //        oSW.Close();
        //    }

        //    WebResponse wResponse = wRequest.GetResponse();

        //    using (var oSR = new StreamReader(wResponse.GetResponseStream()))
        //    {
        //        result = oSR.ReadToEnd().Trim();
        //    }

        //    return result;
        //}

        public static async Task<string> GetPostConsultaTransaccionAsync(string idReferencia)
        {
            string url = $"https://sandbox.wompi.co/v1/transactions?reference={idReferencia}";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

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