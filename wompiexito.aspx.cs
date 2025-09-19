using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class wompiexito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idAfiliado"].ToString() != "")
                {
                    ltValor1.Text = Session["ltValorPlan"].ToString();
                    ltValor2.Text = Session["ltValorPlan"].ToString();

                    if (Session["idPlan"].ToString() == "12" || Session["idPlan"].ToString() == "17")
                    {
                        pnlActivarPlan.Visible = false; // Ocultar si el plan es 12 o 17
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
        }

        protected void btnRedireccionarActivarPlan_Click(object sender, EventArgs e)
        {
            string idAfiliado = Session["idAfiliado"].ToString();

            Response.Redirect($"verificacion?id={idAfiliado}&web=true");
        }
    }
}