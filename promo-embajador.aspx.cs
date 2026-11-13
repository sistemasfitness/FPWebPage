using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class promo_embajador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPromocion();
            }
        }

        private void CargarPromocion()
        {
            // Obtener el código del embajador desde la URL
            string codigoEmbajador = Request.QueryString["ig"];

            // Normalizar el código
            codigoEmbajador = (codigoEmbajador ?? "").Trim().ToLowerInvariant();

            // Variables de configuración
            string bannerEscritorio = "";
            string bannerMovil = "";
            string enlaceIframe = "";

            switch (codigoEmbajador)
            {
                case "carlos420":
                    bannerEscritorio = "banner_2026-11-11.webp";
                    bannerMovil = "banner_2026-11-11_mobile.webp";

                    enlaceIframe = "https://dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-5144";

                    break;

                case "alexguarin145":
                    bannerEscritorio = "banner_2026-09-04.png";
                    bannerMovil = "banner_2026-09-04_mobile.png";

                    enlaceIframe = "https://dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-5144";

                    break;

                default:
                    Response.Redirect("default.aspx");
                    return;
            }

            // Asignar las imágenes
            bannerDesktop.Src = ResolveUrl("~/img/banners/" + bannerEscritorio);
            bannerMobile.Attributes["srcset"] = ResolveUrl("~/img/banners/" + bannerMovil);

            // Asignar el enlace del iframe
            iframePlan.Attributes["src"] = enlaceIframe;
        }
    }
}