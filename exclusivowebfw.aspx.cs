using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class exclusivowebfw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tipoPlan = Request.QueryString["plan"];

            if (string.IsNullOrEmpty(tipoPlan))
            {
                Response.Redirect("default.aspx");
                return;
            }

            CargarPlan(tipoPlan);
        }

        private void CargarPlan(string tipoPlan)
        {
            string itemId;
            string itemName;
            string price;
            string texto;

            lblSubTituloUp.Visible = false;

            lnkComprar2.Visible = false;
            lnkComprar4.Visible = false;

            switch (tipoPlan.ToLower())
            {
                // ===============================
                // PLAN FLEXIBLE PRO
                // ===============================
                case "flexible-pro":

                    lblTitulo.InnerText = "PLAN FLEXIBLE PRO";
                    lblSubTitulo.InnerText = "PLAN DÉBITO AUTOMÁTICO";

                    lblTituloPrecio.InnerHtml = "PRIMER MES <br /> GRATIS";
                    lblSubTituloPrecio1.InnerText = "$ 9.900 DE INSCRIPCIÓN";
                    lblSubTituloPrecio2.InnerText = "DESPUÉS $99.000/MES";
                    lblFidelidad.InnerText = "FIDELIDAD DE 12 MESES, APLICA MULTA";

                    itemId = "1";
                    itemName = "Plan Flexible Pro";
                    price = "9900";
                    texto = "ACTIVA TU PLAN";
                    ConfigurarBtn(lnkComprar1, texto, itemId, itemName, price);
                    ConfigurarBtn(lnkComprar3, texto, itemId, itemName, price);

                    lblTextoFinal.InnerHtml = "Pago mensual mediante débito automático. <br /> No aplica para pagos en efectivo, transferencia ni datáfono.";

                    break;

                default:
                    Response.Redirect("default.aspx");
                    return;
            }
        }

        private void ConfigurarBtn(HyperLink boton, string texto, string itemId, string itemName, string price)
        {
            boton.Text = texto;

            boton.Attributes["onclick"] =
                $@"planAddToCart(
                    ['{itemId}'], 
                    '{itemName}', 
                    '{price}'); 
                return false;";
        }
    }
}