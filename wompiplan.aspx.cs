using NPOI.OpenXmlFormats.Wordprocessing;
using NPOI.POIFS.Crypt.Agile;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Net.Http;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Security.Policy;
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
        // PRUEBAS
        //static int idIntegracionWompi = 1; // WOMPI


        // PRODUCCIÓN
        static int idIntegracionWompi = 4; // WOMPI

        private string _strMonto;
        private string _strHash256;
        private string _strRedireccion;
        private string _strCorreo;
        private string _strNombre;
        private string _strTelefono;
        protected string strMonto { get { return this._strMonto; } }
        protected string strHash256 { get { return this._strHash256; } }
        protected string strRedireccion { get { return this._strRedireccion; } }
        protected string strCorreo { get { return this._strCorreo; } }
        protected string strNombre { get { return this._strNombre; } }
        protected string strTelefono { get { return this._strTelefono; } }

        protected string IdReferencia
        {
            get { return Session["idReferencia"]?.ToString(); }
            set { Session["idReferencia"] = value; }
        }

        protected int IdAfiliado
        {
            get { return ViewState["idAfi"] != null ? (int)ViewState["idAfi"] : 0; }
            set { ViewState["idAfi"] = value; }
        }

        protected string DocumentoAfiliado
        {
            get { return ViewState["documentoAfi"]?.ToString(); }
            set { ViewState["documentoAfi"] = value; }
        }

        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
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

        protected string DescripcionPlan
        {
            get { return ViewState["descripcionPlan"]?.ToString(); }
            set { ViewState["descripcionPlan"] = value; }
        }

        protected string EstadoPago
        {
            get { return ViewState["estadoPago"]?.ToString(); }
            set { ViewState["estadoPago"] = value; }
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

        protected string IntegritySecret
        {
            get { return ViewState["integrity_secret"]?.ToString(); }
            set { ViewState["integrity_secret"] = value; }
        }

        protected string KeyPub
        {
            get { return ViewState["keyPub"]?.ToString(); }
            set { ViewState["keyPub"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!ValidarTokenURLEncryptor()) return;

                PrepararPago();
            }
        }

        private bool ValidarTokenURLEncryptor()
        {
            string token = Request.QueryString["data"];

            if (string.IsNullOrEmpty(token))
            {
                Response.Redirect("default", true);
                return false;
            }

            if (!UrlEncryptor.TryDecryptToCollection(token, out NameValueCollection q, out DateTime? expiresUtc))
            {
                Response.Redirect("default", true);
                return false;
            }

            if (expiresUtc.HasValue && expiresUtc.Value < DateTime.UtcNow)
            {
                Response.Redirect("default", true);
                return false;
            }

            DocumentoAfiliado = q["nroDoc"];
            IdPlan = Convert.ToInt32(q["idPlan"]);
            ValorPlan = Convert.ToInt32(q["valorPlan"]);
            FechaInicioPlan = q["fechaIni"];
            FechaFinPlan = q["fechaFin"];
            MesesPlan = Convert.ToInt32(q["totalMeses"]);
            IdVendedor = Convert.ToInt32(q["idVendedor"]);
            IdSede = Convert.ToInt32(q["idSede"]);

            return true;
        }

        private void PrepararPago()
        {
            ConsultarIntegracionWompi();

            clasesglobales cg = new clasesglobales();

            DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(DocumentoAfiliado);

            if (dtAfiliado.Rows.Count <= 0) return;

            IdAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);

            _strCorreo = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
            _strNombre = $"{dtAfiliado.Rows[0]["NombreAfiliado"]} {dtAfiliado.Rows[0]["ApellidoAfiliado"]}";
            _strTelefono = dtAfiliado.Rows[0]["CelularAfiliado"].ToString();

            dtAfiliado.Dispose();

            DataTable dtPlan = cg.ConsultarPlanPorId(IdPlan);
            string nombrePlan = dtPlan.Rows[0]["NombrePlan"].ToString();
            dtPlan.Dispose();

            DescripcionPlan = $"Pago de {nombrePlan}";
            EstadoPago = "PENDING";


            _strMonto = $"{ValorPlan}00";
            string moneda = "COP";
            //string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            IdReferencia = $"FP_{DocumentoAfiliado}_{DateTime.Now.ToString("yyyyMMddHHmmss")}";

            string concatenado = $"{IdReferencia}{_strMonto}{moneda}{IntegritySecret}";

            _strHash256 = ComputeSha256Hash(concatenado);

            cg.InsertarPagoPlanAfiliadoPendienteWeb(
                IdAfiliado,
                DocumentoAfiliado,
                IdPlan,
                FechaInicioPlan,
                FechaFinPlan,
                EstadoPago,
                ValorPlan,
                MesesPlan,
                DescripcionPlan,
                IdReferencia,
                IdVendedor,
                IdSede
            );

            //string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(DocumentoAfiliado));

            string data = $"{DocumentoAfiliado}|{IdPlan}|{IdVendedor}|{IdSede}";

            string strData = Convert.ToBase64String(Encoding.Unicode.GetBytes(data));

            // PRODUCCIÓN
            _strRedireccion = $"https://fitnesspeoplecolombia.com/wompidata?code={strData}";

            // PRUEBAS
            //_strRedireccion = $"https://localhost:44382/wompidata?code={strString}";

            //_strRedireccion = $"https://judicable-kale-lilied.ngrok-free.dev/wompidata?code={strData}";
        }

        private void ConsultarIntegracionWompi()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtIntegracionWompi = cg.ConsultarIntegracionPorId(idIntegracionWompi);

            IntegritySecret = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["integrity_secret"].ToString() : null;
            KeyPub = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["keyPub"].ToString() : null;

            dtIntegracionWompi.Dispose();
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