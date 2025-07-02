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

namespace WebPage
{
    public partial class register : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
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


                txbNombre.Text = "Brayan Stiven";
                txbApellido.Text = "Ochoa Pineda";
                ddlTipoDocumento.SelectedItem.Text = "Cédula de Ciudadanía";
                ddlTipoDocumento.SelectedItem.Value = "1";
                txbDocumento.Text = "1005139501";
                txbEmail.Text = "b.ochoa12@gmail.com";
                txbCelular.Text = "3156552301";
                txbFechaNac.Text = "2000-01-01";
                //ddlCiudad.SelectedItem.Text = "Bucaramanga";
                //ddlCiudad.SelectedItem.Value = "1";
                //ddlSedes.SelectedItem.Text = "Boulevard";
                //ddlCiudad.SelectedItem.Value = "1";
                //txbFechaIni.Text = "2025-07-01";


                //if (Request.Form.Count > 0)
                //{
                //    //Guardamos los datos del afiliado
                //    string strCedula = txbDocumento.Text.ToString();
                //    Session.Add("idAfiliado", strCedula);
                //    string strEmail = txbEmail.Text.ToString();
                //    Session.Add("emailAfiliado", strEmail);
                //    string strFechaInicioPlan = Request.Form["txbFechaInicio"].ToString();
                //    Session.Add("fechaInicioPlan", strFechaInicioPlan);
                //    //Buscamos el documento en la tabla afiliados. Si no existe, creamos el afiliado. Si existe, actualizamos Correo, Celular, Ciudad, Sede y Plan
                //    if (ExisteAfiliado(strCedula))
                //    {
                //        string strQuery = "UPDATE Afiliados SET " +
                //            "NombreAfiliado = '" + txbNombre.Text.ToString() + "', " +
                //            "ApellidoAfiliado = '" + txbApellido.Text.ToString() + "', " +
                //            "CelularAfiliado = '" + txbCelular.Text.ToString() + "', " +
                //            "EmailAfiliado = '" + strEmail + "', " +
                //            "idGenero = " + ddlGenero.SelectedItem.Value.ToString() + ", " +
                //            "FechaNacAfiliado = '" + txbFechaNac.Text.ToString() + "' " +
                //            "WHERE DocumentoAfiliado = '" + strCedula + "' ";
                //        OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                //        myConnection.Open();
                //        command.ExecuteNonQuery();
                //        command.Dispose();
                //        myConnection.Close();
                //    }
                //    else
                //    {
                //        //Si no existe el documento del afiliado, lo creamos como nuevo.
                //        string strQuery = "INSERT INTO Afiliados " +
                //            "(DocumentoAfiliado, idTipoDocumento, NombreAfiliado, ApellidoAfiliado, CelularAfiliado, EmailAfiliado, " +
                //            "idGenero, FechaNacAfiliado, EstadoAfiliado) " +
                //            "VALUES ('" + strCedula + "', " + ddlTipoDocumento.SelectedItem.Value.ToString() + ", " +
                //            "'" + txbNombre.Text.ToString() + "', '" + txbApellido.Text.ToString() + "', " +
                //            "'" + txbCelular.Text.ToString() + "', '" + strEmail + "', " +
                //            "" + ddlGenero.SelectedItem.Value.ToString() + ", '" + txbFechaNac.Text.ToString() + "', 'Pendiente') ";
                //        OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                //        myConnection.Open();
                //        command.ExecuteNonQuery();
                //        command.Dispose();
                //        myConnection.Close();

                //        //EnviarCorreoBienvenida();
                //    }

                //    Response.Redirect("wompipay");
                //}
            }

            txbFechaIni.Attributes.Add("min", String.Format("{0:yyyy-MM-dd}", DateTime.Now));

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPlanesWeb();

            if (dt != null && dt.Rows.Count > 0 && Request.QueryString.Count > 0)
            {
                string idPlanQS = Request.QueryString["idPlan"];

                DataTable dtPlan = cg.ConsultarPlanWebPorId(int.Parse(idPlanQS));

                string idPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["idPlan"].ToString() : "0";

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

                dtPlan.Dispose();
            }

            dt.Dispose();


            //if (Request.QueryString.Count > 0)
            //{
            //    if (Request.QueryString["idPlan"].ToString() == "1")
            //    {
            //        //Plan Deluxe 4 meses
            //        //ltValor.Text = "$510.000";
            //        //txbMetodoPago.Text = "Tarjeta";

            //        txbValor.Text = "510000";
            //        txbMetodoPago.Text = "Tarjeta";
            //        ltValor.Text = "$510.000";
            //        Session["idPlan"] = "1";
            //    }
            //    if (Request.QueryString["idPlan"].ToString() == "2")
            //    {
            //        //Plan Deluxe 10 meses
            //        txbValor.Text = "890000";
            //        txbMetodoPago.Text = "Tarjeta";
            //        ltValor.Text = "$890.000";
            //        Session["idPlan"] = "2";
            //    }
            //    if (Request.QueryString["idPlan"].ToString() == "3")
            //    {
            //        //Plan Debito Automatico
            //        txbValor.Text = "99000";
            //        txbMetodoPago.Text = "Débito automático";
            //        ltValor.Text = "$99.000";
            //        Session["idPlan"] = "3";
            //    }
            //}
            //else
            //{
            //    //Response.Redirect("default");
            //}

            string strPublicKeySandbox = "pub_test_Mp5JzDLXitLu7W0I3Gea5OXotOExpFjv";
            //string strPublicKeyProduction = "pub_prod_9kHE7xJALv0kDfoSLxQAul1dY141BdR2";

            //string strPrivateKeySandbox = "prv_test_GWPWL8e9md24zYyTuF5KojJmH7Y4Sez2";
            //string strPrivateKeyProduction = "prv_prod_h7JHlOIL6EjCzotPnupYSbzy16ulQ5DO";


            //Obtener los Tokens de Aceptación prefirmados
            string URLTokenAceptacion = "https://sandbox.wompi.co/v1/merchants/" + strPublicKeySandbox;
            string respuesta = GetHTTP(URLTokenAceptacion);
            Root rObjetc = JsonConvert.DeserializeObject<Root>(respuesta);
            Session.Add("acceptance_token", rObjetc.data.presigned_acceptance.acceptance_token.ToString());
            Session.Add("accept_personal_auth", rObjetc.data.presigned_personal_data_auth.acceptance_token.ToString());

            //Referencia unica para el pago.
            //string strDocumento = Request.Form["txbDocumento"].ToString();
            //string strDocumento = "91491754";
            //string strReferencia = strDocumento + "-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            //Hash Sha256 para Wompi
            //string monto = Request.Form["txbPrecio"].ToString() + "00";
            //string monto = "8900000";
            //string moneda = "COP";
            //string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            //string concatenado = strReferencia + monto + moneda + integrity_secret;
            //string strHash = ComputeSha256Hash(concatenado);
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
            string strQuery = "SELECT * FROM generos ORDER BY idGenero";
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.TraerDatos(strQuery);

            ddlGenero.DataSource = dt;
            ddlGenero.DataBind();

            dt.Dispose();
        }

        private void CargarCiudades()
        {
            clasesglobales cg = new clasesglobales();

            string strQuery = "SELECT * FROM CiudadesSedes " +
            "WHERE idCiudadSede <> 5 ";
            DataTable dt = cg.TraerDatos(strQuery);

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

            //hlContacto.Enabled = false;
            string strQuery = "SELECT * " +
            "FROM Sedes " +
            "WHERE idCiudadSede = " + ddlCiudad.SelectedItem.Value.ToString() + " " +
            "AND idSede <> 11 ";
            DataTable dt = cg.TraerDatos(strQuery);

            ddlSedes.DataSource = dt;
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected void btnRegistrar(object sender, EventArgs e)
        {
            clasesglobales cg = new clasesglobales();

            //Guardamos los datos del afiliado
            string strCedula = txbDocumento.Text.ToString();
            Session.Add("documentoAfiliado", strCedula);

            DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(int.Parse(Session["documentoAfiliado"].ToString()));
            Session.Add("idAfiliado", dtAfiliado.Rows[0]["IdAfiliado"]);

            string strNombre = txbNombre.Text.ToString();
            Session.Add("nombreAfiliado", strNombre);
            string strApellido = txbApellido.Text.ToString();
            Session.Add("apellidoAfiliado", strApellido);
            string strEmail = txbEmail.Text.ToString();
            Session.Add("emailAfiliado", strEmail);
            string strCelular = txbCelular.Text.ToString();
            Session.Add("celularAfiliado", strCelular);

            string strFechaInicioPlan = txbFechaIni.Text.ToString();
            Session.Add("fechaInicioPlan", strFechaInicioPlan);
            string strFechaFinPlan = CalcularFechaFinPlan(strFechaInicioPlan);
            Session.Add("fechaFinPlan", strFechaFinPlan);

            DataTable dtPlan = cg.ConsultarPlanWebPorId(int.Parse(Session["idPlan"].ToString()));
            Session.Add("meses", dtPlan.Rows[0]["Meses"]);
            string strCiudad = ddlCiudad.SelectedItem.Value.ToString();
            Session.Add("idCiudad", strCiudad);
            string strSede = ddlSedes.SelectedItem.Value.ToString();
            Session.Add("idSede", strSede);
            string strNombreSede = ddlSedes.SelectedItem.Text.ToString();
            Session.Add("nombreSede", strNombreSede);
            string strValorPlan = hfValorPlan.Value;
            Session.Add("valorPlan", strValorPlan);
            string strLtValor = ltValor.Text.ToString();
            Session.Add("ltValorPlan", strLtValor);

            //Buscamos el documento en la tabla afiliados. Si no existe, creamos el afiliado. Si existe, actualizamos Correo, Celular, Ciudad, Sede y Plan
            if (Session["idAfiliado"].ToString() != "")
            {
                string strQuery = "UPDATE Afiliados SET " +
                    "NombreAfiliado = '" + strNombre + "', " +
                    "ApellidoAfiliado = '" + strApellido + "', " +
                    "CelularAfiliado = '" + strCelular + "', " +
                    "EmailAfiliado = '" + strEmail + "', " +
                    "idGenero = " + ddlGenero.SelectedItem.Value.ToString() + ", " +
                    "FechaNacAfiliado = '" + txbFechaNac.Text.ToString() + "', " +
                    "idCiudadAfiliado = " + strCiudad + ", " + 
                    "idSede = " + strSede + " " +
                    "WHERE DocumentoAfiliado = '" + strCedula + "' ";

                try
                {
                    string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                    using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                    {
                        mysqlConexion.Open();
                        using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }
                        mysqlConexion.Close();
                    }
                }
                catch (Exception ex)
                {
                    string respuesta = "ERROR: " + ex.Message;
                }
            }
            else
            {
                //Si no existe el documento del afiliado, lo creamos como nuevo.
                string strQuery = "INSERT INTO Afiliados " +
                    "(DocumentoAfiliado, idTipoDocumento, NombreAfiliado, ApellidoAfiliado, CelularAfiliado, EmailAfiliado, " +
                    "idGenero, FechaNacAfiliado, idCiudadAfiliado, idSede, EstadoAfiliado) " +
                    "VALUES ('" + strCedula + "', " + ddlTipoDocumento.SelectedItem.Value.ToString() + ", " +
                    "'" + strNombre + "', '" + strApellido + "', " +
                    "'" + strCelular + "', '" + strEmail + "', " +
                    "" + ddlGenero.SelectedItem.Value.ToString() + ", '" + txbFechaNac.Text.ToString() + "', " + strCiudad + ", " + strSede + ", 'Pendiente') ";

                try
                {
                    string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                    using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                    {
                        mysqlConexion.Open();
                        using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }
                        mysqlConexion.Close();
                    }
                }
                catch (Exception ex)
                {
                    string respuesta = "ERROR: " + ex.Message;
                }

                //EnviarCorreoBienvenida();
            }

            dtAfiliado.Dispose();
            dtPlan.Dispose();

            // Siigo API
            string token = ObtenerTokenSiigo(strSede);
            Session.Add("token", token);
            bool exists = ConsultSiigoCustomer(strCedula, token);
            ManageCustomer(exists, token);

            if (Session["idPlan"].ToString() == "1")
            {
                Response.Redirect("wompipay");
            }

            Response.Redirect("wompiplan");
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

        public static string GetHTTP(string url)
        {
            WebRequest wRequest = WebRequest.Create(url);
            WebResponse wResponse = wRequest.GetResponse();
            StreamReader sReader = new StreamReader(wResponse.GetResponseStream());
            return sReader.ReadToEnd().Trim();
        }

        public class Data
        {
            public int id { get; set; }
            public string name { get; set; }
            public string email { get; set; }
            public string contact_name { get; set; }
            public string phone_number { get; set; }
            public bool active { get; set; }
            public object logo_url { get; set; }
            public string legal_name { get; set; }
            public string legal_id_type { get; set; }
            public string legal_id { get; set; }
            public string public_key { get; set; }
            public List<string> accepted_currencies { get; set; }
            public string fraud_javascript_key { get; set; }
            public List<FraudGroup> fraud_groups { get; set; }
            public List<string> accepted_payment_methods { get; set; }
            public List<PaymentMethod> payment_methods { get; set; }
            public PresignedAcceptance presigned_acceptance { get; set; }
            public PresignedPersonalDataAuth presigned_personal_data_auth { get; set; }
        }

        public class FraudGroup
        {
            public string provider { get; set; }
            public PublicData public_data { get; set; }
        }

        public class Meta
        {
        }

        public class PaymentMethod
        {
            public string name { get; set; }
            public List<PaymentProcessor> payment_processors { get; set; }
        }

        public class PaymentProcessor
        {
            public string name { get; set; }
        }

        public class PresignedAcceptance
        {
            public string acceptance_token { get; set; }
            public string permalink { get; set; }
            public string type { get; set; }
        }

        public class PresignedPersonalDataAuth
        {
            public string acceptance_token { get; set; }
            public string permalink { get; set; }
            public string type { get; set; }
        }

        public class PublicData
        {
            public string javascript_key { get; set; }
        }

        public class Root
        {
            public Data data { get; set; }
            public Meta meta { get; set; }
        }

        //
        // Siigo API
        public static string ObtenerTokenSiigo(string idSede)
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarSedePorId(int.Parse(idSede));

            if (dt == null || dt.Rows.Count == 0)
            {
                throw new Exception("Sede no encontrada.");
            }

            // Usar los datos de la sede para obtener el token
            string url = "https://api.siigo.com/auth";
            string username = "";
            string accessKey = "";

            if (dt.Rows[0]["idEmpresaFP"].ToString() == "1")
            {
                // Empresa FITNESS PEOPLE CENTRO MÉDICO DEPORTIVO S.A.S.
                //username = "contabilidad@fitnesspeoplecmd.com";
                //accessKey = "YjU2NWE3YjktYjlhZS00OTRkLWE3NDgtODc0MGUyYjhmYzNlOjh9QDZyKDdwPkE=";

                username = "sandbox@siigoapi.com";
                accessKey = "NDllMzI0NmEtNjExZC00NGM3LWE3OTQtMWUyNTNlZWU0ZTM0OkosU2MwLD4xQ08=";
            }
            if (dt.Rows[0]["idEmpresaFP"].ToString() == "2")
            {
                // Empresa INVERSIONES FITNESS S.A.S.
                //username = "contabilidad@fitnesspeoplecmd.com";
                //accessKey = "NDIzNDc5YmYtMDQ4Yi00NjE2LWI0MmItZGE3YjBmY2IyZmUwOjMvdTI0LT9HZU4=";

                username = "sandbox@siigoapi.com";
                accessKey = "NDllMzI0NmEtNjExZC00NGM3LWE3OTQtMWUyNTNlZWU0ZTM0OkosU2MwLD4xQ08=";
            }

            dt.Dispose();

            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = new JavaScriptSerializer().Serialize(new
                {
                    username = username,
                    access_key = accessKey
                });

                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                string result = streamReader.ReadToEnd();
                dynamic obj = new JavaScriptSerializer().Deserialize<dynamic>(result);
                return obj["access_token"];
            }
        }

        public static bool ConsultSiigoCustomer(string identificacion, string token)
        {
            string URL = "https://api.siigo.com/v1/customers?identification=" + identificacion;

            WebRequest request = WebRequest.Create(URL);
            request.Method = "GET";
            request.ContentType = "application/json;charset=UTF-8";
            request.Headers.Add("Partner-Id", "SandboxSiigoApi");
            request.Headers.Add("Authorization", "Bearer " + token);

            try
            {
                using (WebResponse response = request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                    {
                        string respuesta = reader.ReadToEnd();

                        // Deserializamos para acceder a pagination.total_results
                        var serializer = new JavaScriptSerializer();
                        dynamic json = serializer.Deserialize<dynamic>(respuesta);

                        int totalResultados = json["pagination"]["total_results"];

                        return totalResultados > 0;
                    }
                }
            }
            catch (WebException ex)
            {
                using (StreamReader reader = new StreamReader(ex.Response.GetResponseStream()))
                {
                    string error = reader.ReadToEnd();
                    
                    throw new Exception("Error al consultar cliente en Siigo: " + error);
                }
            }
        }

        public void ManageCustomer(bool exists, string token)
        {
            if (!exists)
            {
                RegisterCustomer(token);
            }
        }

        private void RegisterCustomer(string token)
        {
            string URLRegisterCustomer = "https://api.siigo.com/v1/customers";

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarCodigoSiigoPorDocumento(Session["documentoAfiliado"].ToString());
            string codSiigo = dt.Rows[0]["CodSiigo"].ToString();

            Customer oCustomer = new Customer()
            {
                person_type = "Person",
                id_type = codSiigo,
                identification = Session["documentoAfiliado"].ToString(),
                name = new List<string> { Session["nombreAfiliado"].ToString(), Session["apellidoAfiliado"].ToString() },
                phones = new List<Phone> {
                    new Phone { number = Session["celularAfiliado"].ToString() }
                },
                contacts = new List<Contact> {
                    new Contact
                    {
                        first_name = Session["nombreAfiliado"].ToString(),
                        last_name = Session["apellidoAfiliado"].ToString(),
                        email = Session["emailAfiliado"].ToString()
                    }
                }
            };

            string respuesta = GetPostCustomer(URLRegisterCustomer, oCustomer, token);
            dt.Dispose();

            Console.WriteLine(respuesta);
        }

        public static string GetPostCustomer(string url, Customer oCustomer, string token)
        {
            string result = "";
            WebRequest wRequest = WebRequest.Create(url);
            wRequest.Method = "post";
            wRequest.ContentType = "application/json;charset=UTF-8";
            wRequest.Headers.Add("Partner-Id", "SandboxSiigoApi");
            wRequest.Headers.Add("Authorization", "Bearer " + token);

            using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oCustomer);
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

        public class Customer
        {
            public string person_type { get; set; }
            public string id_type { get; set; }
            public string identification { get; set; }
            public List<string> name { get; set; }
            public List<Phone> phones { get; set; }
            public List<Contact> contacts { get; set; }
        }

        public class Phone
        {
            public string number { get; set; }
        }

        public class Contact
        {
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string email { get; set; }
        }




        //public void CrearFactura()
        //{
        //    string URLCrearFactura = "https://api.siigo.com/v1/invoices";

        //    // Obtener información de la sesión del afiliado
        //    string strCedula = Session["document"].ToString();
        //    string strFechaInicioPlan = Session["fechaInicioPlan"].ToString();

        //    Invoice oInvoice = new Invoice()
        //    {
        //        document = new DocumentType { id = 28006 },
        //        date = strFechaInicioPlan,
        //        customer = new Customer
        //        {
        //            identification = "1005137101"
        //        },
        //        seller = 856,
        //        items = new List<Items>
        //        {
        //            new Items
        //            {
        //                code = "product-genericagua-TAX",
        //                description = "AGUA",
        //                quantity = 1,
        //                price = 10000
        //            }
        //        },
        //        stamp = new Stamp { send = true },
        //        mail = new Mail { send = true },
        //        observations = "Observaciones",
        //        payments = new List<Payments>
        //        {
        //            new Payments
        //            {
        //                id = 9438,
        //                value = 10000
        //            }
        //        }
        //    };

        //    string token = ObtenerTokenSiigo();

        //    string respuesta = GetPostFactura(URLCrearFactura, oInvoice, token);

        //    Console.WriteLine(respuesta);
        //}

        //public static string GetPostFactura(string url, Invoice oInvoice, string token)
        //{
        //    string result = "";
        //    WebRequest wRequest = WebRequest.Create(url);
        //    wRequest.Method = "post";
        //    wRequest.ContentType = "application/json;charset=UTF-8";
        //    wRequest.Headers.Add("Partner-Id", "SandboxSiigoApi");
        //    wRequest.Headers.Add("Authorization", "Bearer " + token);

        //    using (var oSW = new StreamWriter(wRequest.GetRequestStream()))
        //    {
        //        string json = JsonConvert.SerializeObject(oInvoice);
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

        //public class Invoice
        //{
        //    public DocumentType document { get; set; }
        //    public string date { get; set; }
        //    public Customer customer { get; set; }
        //    public int seller { get; set; }
        //    public List<Items> items { get; set; }
        //    public Stamp stamp { get; set; }
        //    public Mail mail { get; set; }
        //    public string observations { get; set; }
        //    public List<Payments> payments { get; set; }
        //}

        //public class DocumentType
        //{
        //    public int id { get; set; }
        //}

        //public class Customer
        //{
        //    public string identification { get; set; }
        //}

        //public class Items
        //{
        //    public string code { get; set; }
        //    public string description { get; set; }
        //    public int quantity { get; set; }
        //    public int price { get; set; }
        //}

        //public class Stamp
        //{
        //    public bool send { get; set; }
        //}

        //public class Mail
        //{
        //    public bool send { get; set; }
        //}

        //public class Payments
        //{
        //    public int id { get; set; }
        //    public int value { get; set; }
        //    public string due_date { get; set; }
        //}
    }
}