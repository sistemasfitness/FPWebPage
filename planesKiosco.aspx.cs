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

                // Controla y evita posibles errores de regresar a página anterior
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

        // TODO: ARREGLAR PORQUE NO ESTÁ FUNCIONANDO
        private void BloquearPaginaAnterior()
        {
            string codDatafono = Session["codDatafono"].ToString();

            string script = $@"
                <script type='text/javascript'>
                    // Empuja un nuevo estado al historial
                    window.history.pushState(null, '', window.location.href);

                    // Si el usuario intenta retroceder, se envía a planesKiosco
                    window.onpopstate = function () {{
                        window.location.replace('planesKiosco?codDatafono={codDatafono}');
                    }};
                </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "BackPlanes", script, false);
        }
    }
}