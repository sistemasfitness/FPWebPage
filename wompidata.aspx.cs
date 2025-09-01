using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using static WebPage.register;

namespace WebPage
{
	public partial class wompidata : System.Web.UI.Page
	{
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
		{
            string strCode = Request.QueryString["code"];
            string strDocumento = Encoding.Unicode.GetString(Convert.FromBase64String(strCode));
            string strReferencia = Request.QueryString["id"].ToString();
            string strEnv = Request.QueryString["env"].ToString();

            string strQuery = "SELECT * FROM Afiliados WHERE DocumentoAfiliado = '" + strDocumento + "'";
            DataTable dt = TraerDatos(strQuery);

            if (dt.Rows.Count > 0)
            {
                strQuery = "SELECT * FROM AfiliadosPlanes WHERE idAfiliado = " + dt.Rows[0]["idAfiliado"].ToString() + " " +
                    "AND EstadoPlan = 'Inactivo' ";
                DataTable dt2 = TraerDatos(strQuery);

                if (dt2.Rows.Count > 0)
                {
                    try
                    {
                        strQuery = "INSERT INTO PagosPlanAfiliado (idAfiliadoPlan, Valor, idReferenciaWompi, env, fechahorapago) " +
                            "VALUES (" + dt2.Rows[0]["idAfiliadoPlan"].ToString() + ", " +
                            "" + dt2.Rows[0]["Valor"].ToString() + ", " +
                            "'" + strReferencia + "', " +
                            "'" + strEnv + "', NOW()) ";
                        OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                        myConnection.Open();
                        command.ExecuteNonQuery();
                        command.Dispose();
                        myConnection.Close();
                    }
                    catch (Exception ex)
                    {
                        string strMensaje = ex.Message;
                    }

                    try
                    {
                        strQuery = "UPDATE AfiliadosPlanes SET EstadoPlan = 'Activo' " +
                            "WHERE idAfiliadoPlan = " + dt2.Rows[0]["idAfiliadoPlan"].ToString();
                        OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                        myConnection.Open();
                        command.ExecuteNonQuery();
                        command.Dispose();
                        myConnection.Close();
                    }
                    catch (Exception ex)
                    {
                        string strMensaje = ex.Message;
                    }

                    // Post a Armatura para crear el usuario
                    PostArmatura(strDocumento);

                }
            }
        }

        private DataTable TraerDatos(string strQuery)
        {
            myConnection.Open();
            DataTable dt = new DataTable();

            OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
            OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
            sqlDA.Fill(dt);
            myConnection.Close();

            return dt;
        }

        private void PostArmatura(string strDocumento)
        {
            string strQuery = "SELECT * FROM Afiliados WHERE DocumentoAfiliado = '" + strDocumento + "'";
            DataTable dt = TraerDatos(strQuery);

            string strGenero = "";
            if (dt.Rows[0]["idGenero"].ToString() == "1")
            {
                strGenero = "M";
            }
            if (dt.Rows[0]["idGenero"].ToString() == "2")
            {
                strGenero = "F";
            }

            Persona oPersona = new Persona()
            {
                pin = "" + dt.Rows[0]["DocumentoAfiliado"].ToString() + "",
                name = "" + dt.Rows[0]["NombreAfiliado"].ToString() + "",
                lastName = "" + dt.Rows[0]["ApellidoAfiliado"].ToString() + "",
                gender = strGenero,
                personPhoto = "",
                certType = "",
                certNumber = "",
                mobilePhone = "" + dt.Rows[0]["CelularAfiliado"].ToString() + "",
                personPwd = "",
                birthday = "" + String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(dt.Rows[0]["FechaNacAfiliado"].ToString())) + "",
                isSendMail = "false",
                email = "" + dt.Rows[0]["EmailAfiliado"].ToString() + "",
                deptCode = "01",
                ssn = "",
                cardNo = "",
                supplyCards = "",
                carPlate = "",
                accStartTime = "2025-01-01 08:00:00",
                accEndTime = "2025-02-25 23:00:00",
                accLevelIds = "402883f08df57ba4018df57cddf70490",
                hireDate = ""
            };

            string contenido = JsonConvert.SerializeObject(oPersona, Formatting.Indented);
            
            string url = "https://aone.armaturacolombia.co/api/person/add/?access_token=D2BCF6E6BD09DECAA1266D9F684FFE3F5310AD447D107A29974F71E1989AABDB";
            string rta = EnviarPeticion(url, contenido);

            ltMensaje.Text = rta;

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