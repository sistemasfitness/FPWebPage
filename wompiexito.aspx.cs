using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
    public partial class wompiexito : System.Web.UI.Page
    {
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidarTokenURLEncryptor();

                GestionarActivarPlan();
            }
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
                IdAfiliado = Convert.ToInt32(q["idAfi"]);
                IdPlan = Convert.ToInt32(q["idPlan"]);
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void GestionarActivarPlan()
        {
            if (IdAfiliado != 0)
            {
                ltValor1.Text = Session["ltValorPlan"].ToString();
                ltValor2.Text = Session["ltValorPlan"].ToString();

                if (IdPlan == 12 || IdPlan == 17)
                {
                    pnlActivarPlan.Visible = false; // Ocultar si el plan es 12 o 17

                    clasesglobales cg = new clasesglobales();

                    cg.ActualizarEstadoAfiliado("Activo", IdAfiliado);
                }
                else
                {
                    pnlActivarPlan.Visible = true;
                }
            }
            else
            {
                Response.Redirect("default");
            }
        }

        protected void btnRedireccionarActivarPlan_Click(object sender, EventArgs e)
        {
            string payload = $"idAfi={HttpUtility.UrlEncode(IdAfiliado.ToString())}";

            TimeSpan ttl = TimeSpan.FromMinutes(10); // Token válido 10 minutos
            string token = UrlEncryptor.Encrypt(payload, ttl);

            Response.Redirect($"verificacion.aspx?data={HttpUtility.UrlEncode(token)}", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}