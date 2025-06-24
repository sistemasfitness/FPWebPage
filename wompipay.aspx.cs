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
using System.Security.Cryptography;
using System.Text;
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

                    if (Request.Form.Count > 0)
                    {
                        TokenizarTarjeta(Request.Form["creditcard"].ToString(), Request.Form["cvc"].ToString(), Request.Form["ddlMes"].ToString(), Request.Form["ddlAnho"].ToString(), Request.Form["nombretarjeta"].ToString());
                    }
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

        //private DataTable TraerDatos(string strQuery)
        //{
        //    myConnection.Open();
        //    DataTable dt = new DataTable();

        //    OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
        //    OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
        //    sqlDA.Fill(dt);
        //    myConnection.Close();

        //    return dt;
        //}

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

        private void TokenizarTarjeta(string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            //Tokenizar una tarjeta
            string URLTokenizarTarjeta = "https://sandbox.wompi.co/v1/tokens/cards";
            string respuesta = GetPost(URLTokenizarTarjeta, creditcard, cvc, mes, anho, cardholder);
            Root1 rObjetc = JsonConvert.DeserializeObject<Root1>(respuesta);
            string status = rObjetc.status.ToString();
            if (status == "CREATED")
            {
                //La tarjeta ha sido tokenizada correctamente
                string dataid = rObjetc.data.id.ToString();
                ltMensaje.Text = dataid;

                int idAfiliado = int.Parse(Session["idAfiliado"].ToString());
                int idPlan = int.Parse(Session["idPlan"].ToString());
                string fechaInicioPlan = Session["fechaInicioPlan"].ToString();
                string fechaFinPlan = Session["fechaFinPlan"].ToString();
                int meses = int.Parse(Session["meses"].ToString());
                int valor = int.Parse(Session["valor"].ToString());


                try
                {
                    clasesglobales cg = new clasesglobales();
                    string mensaje = cg.InsertarAfiliadoPlan(int.Parse(Session["idAfiliado"].ToString()), int.Parse(Session["idPlan"].ToString()), Session["fechaInicioPlan"].ToString(), Session["fechaFinPlan"].ToString(), int.Parse(Session["meses"].ToString()), int.Parse(Session["valor"].ToString()), "Debito automatico", "Pendiente", dataid);

                    CrearFuentePago(Session["emailAfiliado"].ToString(), "CARD", dataid, Session["acceptance_token"].ToString(), Session["accept_personal_auth"].ToString());

                } catch (Exception ex)
                {
                    string mensajeError = "ERROR: " + ex.Message;
                }

                

                //string strQuery = @"INSERT INTO AfiliadosPlanes 
                //                    (idAfiliado, idPlan, FechaInicioPlan, FechaFinalPlan, Meses, Valor, ObservacionesPlan, EstadoPlan, DataIdToken) 
                //                    VALUES (" + int.Parse(dt.Rows[0]["IdAfiliado"].ToString()) + ", " + Session["idPlan"].ToString() + ", " +
                //                    "'" + Session["fechaInicioPlan"].ToString() + "', '" + Session["fechaFinPlan"].ToString() + "', " + 
                //                    int.Parse(Session["Meses"].ToString()) + ", " + int.Parse(Session["txbValorPlan"].ToString()) + ", " +
                //                    "'Debito automatico', 'Pendiente', '" + dataid + "');";

                //try
                //{
                //    string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                //    using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                //    {
                //        mysqlConexion.Open();
                //        using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                //        {
                //            cmd.CommandType = CommandType.Text;
                //            cmd.ExecuteNonQuery();
                //        }
                //        mysqlConexion.Close();
                //    }
                //}
                //catch (Exception ex)
                //{
                //    string respuestaConexion = "ERROR: " + ex.Message;
                //}

                //Creamos la fuente de pago
                
            }
            else
            {
                ltMensaje.Text = status;
            }
        }
        private void CrearFuentePago(string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            //Crear Fuente de Pago
            string URLFuentePago = "https://sandbox.wompi.co/v1/payment_sources";
            string respuesta = GetPost2(URLFuentePago, customer_email, type, token, acceptance_token, accept_personal_auth);
            Root2 rObjetc = JsonConvert.DeserializeObject<Root2>(respuesta);

            string dataid = rObjetc.data.id.ToString();

            //Guardar en BD el dataid para generar pagos posteriores.
            string strQuery = "SELECT idAfiliadoPlan FROM AfiliadosPlanes ORDER BY idAfiliado DESC LIMIT 1 ";
            DataTable dt = TraerDatos(strQuery);

            Session.Add("idAfiliadoPlan", dt.Rows[0]["idAfiliadoPlan"].ToString());

            strQuery = "UPDATE AfiliadosPlanes SET DataIdFuente = '" + dataid + "' WHERE idAfiliadoPlan = " + dt.Rows[0]["idAfiliadoPlan"].ToString();
            OdbcCommand command = new OdbcCommand(strQuery, myConnection);
            myConnection.Open();
            command.ExecuteNonQuery();
            command.Dispose();
            myConnection.Close();

            //Creamos la primera transaccion (primer cobro)
            string strDocumento = Session["idAfiliado"].ToString();

            //Referencia unica para el pago.
            string reference = strDocumento + "-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            //Hash Sha256 para Wompi
            string monto = "8900000";
            string moneda = "COP";
            string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            string concatenado = reference + monto + moneda + integrity_secret;
            string hash256 = ComputeSha256Hash(concatenado);

            CrearTransaccion(8900000, "COP", hash256, Session["emailAfiliado"].ToString(), 1, reference, Convert.ToInt32(dataid));
        }

        private void CrearTransaccion(int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        {
            //Crear Transacción
            string URLTransacciones = "https://sandbox.wompi.co/v1/transactions";
            string respuesta = GetPost3(URLTransacciones, amount_in_cents, currency, signature, customer_email, installments, reference, payment_source_id);
            Root3 rObjetc = JsonConvert.DeserializeObject<Root3>(respuesta);

            //En esta variable queda el id de la transaccion guardada.
            string dataid2 = rObjetc.data.id.ToString();

            //Guardar en BD el dataid para generar pagos posteriores.
            string strQuery = "UPDATE AfiliadosPlanes SET DataIdTransaction = '" + dataid2 + "' WHERE idAfiliadoPlan = " + Session["idAfiliadoPlan"].ToString();
            OdbcCommand command = new OdbcCommand(strQuery, myConnection);
            myConnection.Open();
            command.ExecuteNonQuery();
            command.Dispose();
            myConnection.Close();

            Response.Redirect("wompiexito");
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

        public static string GetPost(string url, string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            Tarjeta oTarjeta = new Tarjeta() { number = "" + creditcard + "", cvc = "" + cvc + "", exp_month = "" + mes + "", exp_year = "" + anho + "", card_holder = "" + cardholder + "" };

            string result = "";
            WebRequest wRequest = WebRequest.Create(url);
            wRequest.Method = "post";
            wRequest.ContentType = "application/json;charset=UTF-8";
            wRequest.Headers.Add("Authorization", "Bearer pub_test_Mp5JzDLXitLu7W0I3Gea5OXotOExpFjv");

            using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oTarjeta);
                oSW.Write(json);
                oSW.Flush();
                oSW.Close();
            }

            WebResponse wResponse = wRequest.GetResponse();

            using (var oSR = new StreamReader(wResponse.GetResponseStream()))
            {
                result = oSR.ReadToEnd().Trim();
            }

            return result;
        }

        public static string GetPost2(string url, string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            FuentePago oFuentePago = new FuentePago() { type = "" + type + "", token = "" + token + "", customer_email = "" + customer_email + "", acceptance_token = "" + acceptance_token + "", accept_personal_auth = "" + accept_personal_auth + "" };

            string result = "";
            WebRequest wRequest = WebRequest.Create(url);
            wRequest.Method = "post";
            wRequest.ContentType = "application/json;charset=UTF-8";
            wRequest.Headers.Add("Authorization", "Bearer prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

            using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oFuentePago);
                oSW.Write(json);
                oSW.Flush();
                oSW.Close();
            }

            WebResponse wResponse = wRequest.GetResponse();

            using (var oSR = new StreamReader(wResponse.GetResponseStream()))
            {
                result = oSR.ReadToEnd().Trim();
            }

            return result;
        }

        public static string GetPost3(string url, int amount_in_cents, string currency, string signature, string customer_email, int installments, string reference, int payment_source_id)
        {
            PaymentMethod oPM = new PaymentMethod() { installments = installments };
            Transaccion oTransaccion = new Transaccion() { amount_in_cents = amount_in_cents, currency = "" + currency + "", signature = "" + signature + "", customer_email = "" + customer_email + "", payment_method = oPM, reference = "" + reference + "", payment_source_id = payment_source_id };

            Transaccion oTrans = new Transaccion() { };

            string result = "";
            WebRequest wRequest = WebRequest.Create(url);
            wRequest.Method = "post";
            wRequest.ContentType = "application/json;charset=UTF-8";
            wRequest.Headers.Add("Authorization", "Bearer prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2");

            using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oTransaccion);
                oSW.Write(json);
                oSW.Flush();
                oSW.Close();
            }

            WebResponse wResponse = wRequest.GetResponse();

            using (var oSR = new StreamReader(wResponse.GetResponseStream()))
            {
                result = oSR.ReadToEnd().Trim();
            }

            return result;
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