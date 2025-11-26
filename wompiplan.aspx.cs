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
        private string _strCorreo;
        private string _strNombre;
        private string _strTelefono;
        protected string strMonto { get { return this._strMonto; } }
        protected string strReferencia { get { return this._strReferencia; } }
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!ValidarTokenURLEncryptor()) return;

                GenerarReferencia(_nroDocumento);

                PrepararPago();
            }
            else
            {
                // en postbacks solo recuperar el valor del ViewState
                if (IdReferencia != null)
                    _strReferencia = IdReferencia;
            }
        }

        private string _nroDocumento;

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

            IdAfiliado = Convert.ToInt32(q["idAfi"]);
            _nroDocumento = q["nroDoc"];
            IdPlan = Convert.ToInt32(q["idPlan"]);
            ValorPlan = Convert.ToInt32(q["valorPlan"]);
            FechaInicioPlan = q["fechaIni"];
            FechaFinPlan = q["fechaFin"];
            MesesPlan = Convert.ToInt32(q["totalMeses"]);
            IdVendedor = Convert.ToInt32(q["idVendedor"]);
            IdSede = Convert.ToInt32(q["idSede"]);
            

            clasesglobales cg = new clasesglobales();

            DataTable dtAfi = cg.ConsultarAfiliadoPorDocumento(_nroDocumento);

            if (dtAfi.Rows.Count > 0)
            {
                _strCorreo = dtAfi.Rows[0]["EmailAfiliado"].ToString();
                _strNombre = dtAfi.Rows[0]["NombreAfiliado"].ToString() + " " + dtAfi.Rows[0]["ApellidoAfiliado"].ToString();
                _strTelefono = dtAfi.Rows[0]["CelularAfiliado"].ToString();
            }

            dtAfi.Dispose();

            DataTable dtPlan = cg.ConsultarPlanPorId(IdPlan);
            string nombrePlan = dtPlan.Rows[0]["NombrePlan"].ToString();
            dtPlan.Dispose();

            DescripcionPlan = $"Pago de {nombrePlan}";
            EstadoPago = "PENDING";

            return true;
        }

        private void GenerarReferencia(string documento)
        {
            if (IdReferencia == null)
            {
                _strReferencia = documento + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "fp";
                IdReferencia = _strReferencia;
            }
            else
            {
                _strReferencia = IdReferencia;
            }
        }

        private void PrepararPago()
        {
            clasesglobales cg = new clasesglobales();

            _strMonto = $"{ValorPlan}00";
            string moneda = "COP";
            string integrity_secret = "test_integrity_ECI40KcjCePVzQFu1rlkqQDWxwnQ6lAD";

            string concatenado = _strReferencia + _strMonto + moneda + integrity_secret;
            _strHash256 = ComputeSha256Hash(concatenado);

            // Insertar pago si no existe
            DataTable dtPago = cg.ConsultarPagoPlanAfiliadoPendienteWeb(_strReferencia);

            if (dtPago.Rows.Count == 0)
            {
                cg.InsertarPagoPlanAfiliadoPendienteWeb(
                    IdAfiliado,
                    _nroDocumento,
                    IdPlan,
                    FechaInicioPlan,
                    FechaFinPlan,
                    EstadoPago,
                    ValorPlan,
                    MesesPlan,
                    DescripcionPlan,
                    _strReferencia,
                    IdVendedor,
                    IdSede
                );
            }

            dtPago.Dispose();

            string strString = Convert.ToBase64String(Encoding.Unicode.GetBytes(_nroDocumento));
            _strRedireccion = $"https://localhost:44382/wompidata?code={strString}";
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