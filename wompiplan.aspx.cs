using NPOI.OpenXmlFormats.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Net.Http;
using System.Runtime.InteropServices.ComTypes;
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
    public partial class wompiplan : System.Web.UI.Page
    {
        private string _strMonto;
        private string _strReferencia;
        private string _strHash256;
        private string _strRedireccion;
        protected string strMonto { get { return this._strMonto; } }
        protected string strReferencia { get { return this._strReferencia; } }
        protected string strHash256 { get { return this._strHash256; } }
        protected string strRedireccion { get { return this._strRedireccion; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidarTokenURLEncryptor();

                //CargarInformacion();
            }

            //string strCode = Request.QueryString["code"];
            //string strData = Encoding.Unicode.GetString(Convert.FromBase64String(strCode));

            //string[] codes = strData.Split('_');

            //string strDocumento = codes[0];

            ////Referencia unica para el pago.
            //_strReferencia = strDocumento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";

            ////Hash Sha256 para Wompi
            //_strMonto = codes[1] + "00";




            //string strDocumento = Request.QueryString["nroDoc"];

            //_strReferencia = strDocumento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";
            //_strMonto = Request.QueryString["valorPlan"] + "00";

            //string moneda = "COP";
            //string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            //string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
            //_strHash256 = ComputeSha256Hash(concatenado);

            //AlmacenarDatosPago(_strReferencia, strDocumento);

            //string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(strDocumento));

            //_strRedireccion = "https://fitnesspeoplecolombia.com/wompidata?code=" + strString;





            //string token = Request.QueryString["data"];
            //if (!string.IsNullOrEmpty(token) && UrlEncryptor.TryDecrypt(token, out string payload))
            //{
            //    var qs = HttpUtility.ParseQueryString(payload);
            //    string nroDoc = qs["nroDoc"];
            //    string valorPlan = qs["valorPlan"];

            //    _strReferencia = nroDoc + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";
            //    _strMonto = $"{valorPlan}00";

            //    string moneda = "COP";
            //    string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";
            //    string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
            //    _strHash256 = ComputeSha256Hash(concatenado);

            //    AlmacenarDatosPago(_strReferencia, nroDoc);

            //    string strString = Convert.ToBase64String(Encoding.UTF8.GetBytes(nroDoc));
            //    _strRedireccion = "https://fitnesspeoplecolombia.com/wompidata?code=" + strString;
            //}
            //else
            //{
            //    Response.Redirect("default");
            //}
        }

        private void ValidarTokenURLEncryptor()
        {
            string token = Request.QueryString["data"];

            if (string.IsNullOrEmpty(token))
            {
                Response.Redirect("default");
                return;
            }

            if (UrlEncryptor.TryDecryptToCollection(token, out NameValueCollection q, out DateTime? expiresUtc))
            {
                if (expiresUtc.HasValue && expiresUtc.Value < DateTime.UtcNow)
                {
                    Response.Redirect("default", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                int idAfiliado = Convert.ToInt32(q["idAfi"]);
                string documento = q["nroDoc"];
                int idPlan = Convert.ToInt32(q["idPlan"]);
                int valorPlan = Convert.ToInt32(q["valorPlan"]);
                string fechaInicioPlan = q["fechaIni"];
                string fechaFinPlan = q["fechaFin"];
                int totalMeses = Convert.ToInt32(q["totalMeses"]);
                int idVendedor = Convert.ToInt32(q["idVendedor"]);
                int idSede = Convert.ToInt32(q["idSede"]);

                clasesglobales cg = new clasesglobales();

                DataTable dtPlan = cg.ConsultarPlanPorId(idPlan);
                string nombrePlan = dtPlan.Rows[0]["NombrePlan"].ToString();
                dtPlan.Dispose();

                string descripcion = $"Pago único de {nombrePlan}";
                string estado = "Pendiente";

                //Referencia unica para el pago.
                _strReferencia = documento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";

                //Hash Sha256 para Wompi
                _strMonto = $"{valorPlan}00";

                string moneda = "COP";
                string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

                string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
                _strHash256 = ComputeSha256Hash(concatenado);


                //cg.InsertarPagoPlanAfiliadoPendienteWeb(_strReferencia, idAfiliado, documento, idPlan, fechaInicioPlan, fechaFinPlan, totalMeses, valorPlan);

                string payload = $"idAfi={HttpUtility.UrlEncode(idAfiliado.ToString())}" +
                                 $"&nroDoc={HttpUtility.UrlEncode(documento)}" +
                                 $"&idPlan={HttpUtility.UrlEncode(idPlan.ToString())}" +
                                 $"&fechaIni={HttpUtility.UrlEncode(fechaInicioPlan)}" +
                                 $"&fechaFin={HttpUtility.UrlEncode(fechaFinPlan)}" +
                                 $"&valor={HttpUtility.UrlEncode(valorPlan.ToString())}" +
                                 $"&totalMeses={HttpUtility.UrlEncode(totalMeses.ToString())}" +
                                 $"&descripcion{HttpUtility.UrlEncode(descripcion)}" +
                                 $"&estado{HttpUtility.UrlEncode(estado)}" +
                                 $"&refe={HttpUtility.UrlEncode(_strReferencia)}" +
                                 $"&idVendedor={HttpUtility.UrlEncode(idVendedor.ToString())}" +
                                 $"&idSede={HttpUtility.UrlEncode(idSede.ToString())}" +
                                 $"&pagoUnico=true";

                TimeSpan ttl = TimeSpan.FromMinutes(100000); // Token válido 10 minutos
                string tokenUrl = UrlEncryptor.Encrypt(payload, ttl);

                //string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(documento));

                //_strRedireccion = "https://fitnesspeoplecolombia.com/wompidata?code=" + strString;


                //_strRedireccion = "https://localhost:44382/wompidata?code=" + strString;

                _strRedireccion = $"https://localhost:44382/verificacion?data={HttpUtility.UrlEncode(tokenUrl)}";
            }
            else
            {
                Response.Redirect("default");
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
    }
}