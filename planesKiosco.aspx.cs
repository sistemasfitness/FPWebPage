using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class planesData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConsultarCodDatafono();

                // Bloquear que el usuario vuelva a Register o PagoRedeban
                BloquearPaginaAnterior();
            }

            Session["origenPlanes"] = "KIOSCO";
        }

        private void ConsultarCodDatafono()
        {
            if (Request.QueryString.Count > 0)
            {
                clasesglobales cg = new clasesglobales();

                string codDatafonoQS = Request.QueryString["codDatafono"];

                DataTable dt = cg.ConsultarDatafonoPorCodigo(codDatafonoQS);

                string codDatafono = dt != null && dt.Rows.Count > 0 ? dt.Rows[0]["codDatafono"].ToString() : "";

                if (codDatafono != codDatafonoQS || codDatafono == "")
                {
                    Response.Redirect("default");
                    return;
                }

                Session["codDatafono"] = codDatafono;
            }
            else
            {
                Response.Redirect("default");

            }
        }

        private void BloquearPaginaAnterior()
        {
            string codDatafono = Session["codDatafono"].ToString();

            string script = $@"
                (function() {{
                    // Empuja un estado falso al historial
                    window.history.pushState(null, null, window.location.href);
            
                    window.onpopstate = function () {{
                        // Cada vez que el usuario presione atrás, lo redirigimos otra vez aquí
                        window.location.replace('planesKiosco?codDatafono={codDatafono}');
                    }};
                }})();
            ";

            ScriptManager.RegisterStartupScript(this, GetType(), "BloquearPaginaAnterior", script, true);
        }
    }
}