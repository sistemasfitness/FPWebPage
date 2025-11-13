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

                //Referencia unica para el pago.
                _strReferencia = documento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";

                //Hash Sha256 para Wompi
                _strMonto = $"{valorPlan}00";

                string moneda = "COP";
                string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

                string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
                _strHash256 = ComputeSha256Hash(concatenado);

                clasesglobales cg = new clasesglobales();

                cg.InsertarPagoPlanAfiliadoPendienteWeb(_strReferencia, idAfiliado, idPlan, fechaInicioPlan, fechaFinPlan, totalMeses, valorPlan);

                string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(documento));

                _strRedireccion = "https://fitnesspeoplecolombia.com/wompidata?code=" + strString;
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void AlmacenarDatosPago(string referencia, int idAfiliado, int valorPlan, int idPlan)
        {
            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.ConsultarPlanPorId(Convert.ToInt32(idPlan));

            if (dt.Rows.Count > 0)
            {
                int mesesPlan = Convert.ToInt32(dt.Rows[0]["meses"].ToString());
                string fechaInicioPlan = DateTime.Now.ToString("yyyy-MM-dd");
                string fechaFinPlan = DateTime.Now.AddMonths(mesesPlan).ToString("yyyy-MM-dd");

                cg.InsertarPagoPlanAfiliadoPendienteWeb(referencia, idAfiliado, idPlan, fechaInicioPlan, fechaFinPlan, mesesPlan, valorPlan);
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