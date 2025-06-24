using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            string strCode = Request.QueryString["code"];
            string strData = Encoding.Unicode.GetString(Convert.FromBase64String(strCode));

            string[] codes = strData.Split('_');

            string strDocumento = codes[0];

            //Referencia unica para el pago.
            _strReferencia = strDocumento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";

            //Hash Sha256 para Wompi
            _strMonto = codes[1] + "00";
            string moneda = "COP";
            string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
            _strHash256 = ComputeSha256Hash(concatenado);

            string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(strDocumento));

            _strRedireccion = "https://localhost:44382/wompidata?code=" + strString;
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