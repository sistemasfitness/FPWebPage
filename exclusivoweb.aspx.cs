using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebPage.Services.SiigoClient;

namespace WebPage
{
    public partial class exclusivoweb : System.Web.UI.Page
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
            int price;
            string texto;
            string tokenId;
            string urlKey;

            lblTituloMeses.Visible = false;

            lnkComprar2.Visible = false;
            lnkComprar4.Visible = false;

            switch (tipoPlan.ToLower())
            {
                // ===============================
                // PLAN FLEXIBLE PRO [47]
                // ===============================
                case "flexible-pro":

                    lblTitulo.InnerText = "PLAN FLEXIBLE PRO";
                    lblSubTitulo.InnerText = "PLAN DÉBITO AUTOMÁTICO";

                    lblTituloPrecio.InnerHtml = "PRIMER MES <br /> $ 49.500";
                    lblSubTituloPrecio1.InnerText = "SIN INSCRIPCIÓN";
                    lblSubTituloPrecio2.InnerText = "DESPUÉS $99.000/MES";
                    lblSubTituloUp.InnerText = "ANTES $165.000";
                    lblFidelidad.InnerText = "FIDELIDAD MÍNIMA DE 12 MESES";
                    lblNotaFidelidad.InnerText = "APLICA COBRO POR RETIRO ANTICIPADO";

                    divPackBienvenida.Visible = true;

                    itemId = "1";
                    itemName = "Plan Flexible Pro";
                    price = 49500;
                    texto = "ACTIVA TU PLAN";
                    tokenId = "register?token=ONiORcTGWT6e8D2QxFgV";
                    urlKey = "";
                    ConfigurarBtn(lnkComprar1, texto, itemId, itemName, price, tokenId, urlKey);
                    ConfigurarBtn(lnkComprar3, texto, itemId, itemName, price, tokenId, urlKey);

                    lblTextoFinal.InnerHtml = "Pago mensual mediante débito automático. <br /> No aplica para pagos en efectivo, transferencia ni datáfono.";

                    break;

                // ===============================
                // PLAN FLEXIBLE PRO PROMO [45]
                // ===============================
                //case "flexible-pro-promo":

                //    lblTitulo.InnerText = "PLAN FLEXIBLE PRO";
                //    lblSubTitulo.InnerText = "PLAN DÉBITO AUTOMÁTICO";

                //    lblTituloPrecio.InnerHtml = "PRIMER MES <br /> $ 9.900";
                //    lblSubTituloPrecio1.InnerText = "SIN INSCRIPCIÓN";
                //    lblSubTituloPrecio2.InnerText = "DESPUÉS $99.000/MES";
                //    lblSubTituloUp.InnerText = "ANTES $165.000";
                //    lblFidelidad.InnerText = "FIDELIDAD MÍNIMA DE 12 MESES";
                //    lblNotaFidelidad.InnerText = "APLICA COBRO POR RETIRO ANTICIPADO";

                //    divPackBienvenida.Visible = false;

                //    itemId = "2";
                //    itemName = "Plan Flexible Pro Promo";
                //    price = 9900;
                //    texto = "ACTIVA TU PLAN";
                //    tokenId = "register?token=TKIlFPP8XYRC9l1rfGjR";
                //    urlKey = "";
                //    ConfigurarBtn(lnkComprar1, texto, itemId, itemName, price, tokenId, urlKey);
                //    ConfigurarBtn(lnkComprar3, texto, itemId, itemName, price, tokenId, urlKey);

                //    lblTextoFinal.InnerHtml = "Pago mensual mediante débito automático. <br /> No aplica para pagos en efectivo, transferencia ni datáfono.";

                //    break;

                // ===============================
                // PLAN SORPRÉNDETE EN DICIEMBRE
                // ===============================
                case "sorprendete-en-diciembre":

                    lblTitulo.InnerText = "PLAN SORPRÉNDETE EN DICIEMBRE";
                    lblSubTitulo.InnerHtml = "PLAN PAGO ÚNICO <br /> EXCLUSIVO PARA RENOVADOS";

                    lblTituloMeses.Visible = true;
                    lblTituloMeses.InnerHtml = "2 MESES + 1 MES GRATIS";
                    lblTituloPrecio.InnerHtml = "PAGA HOY <br /> $249.000";
                    lblSubTituloPrecio1.Visible = false;
                    lblSubTituloPrecio2.Visible = false;

                    lblSubTituloUp.InnerText = "ANTES $350.000";
                    lblFidelidad.Visible = false;
                    lblNotaFidelidad.Visible = false;

                    divPackBienvenida.Visible = false;

                    itemId = "4";
                    itemName = "Plan Sorpréndete en Diciembre";
                    price = 249000;
                    texto = "ACTIVA TU PLAN";
                    tokenId = "";
                    urlKey = "SORPRENDETE_EN_DICIEMBRE";
                    ConfigurarBtn(lnkComprar1, texto, itemId, itemName, price, tokenId, urlKey);
                    ConfigurarBtn(lnkComprar3, texto, itemId, itemName, price, tokenId, urlKey);

                    lblTextoFinal.InnerHtml = "Sin inscripción <br /> Sin administración <br /> Sin permanencia obligatoria";

                    break;

                // ===============================
                // PLAN SEMESTRAL
                // ===============================
                case "semestral":

                    lblTitulo.InnerText = "PLAN SEMESTRAL";
                    lblSubTitulo.InnerText = "PLAN PAGO ÚNICO";

                    lblTituloPrecio.InnerHtml = "PAGA HOY <br /> $590.000";
                    lblSubTituloPrecio1.InnerText = "6 MESES DE ACCESO";
                    lblSubTituloPrecio2.Visible = false;

                    lblSubTituloUp.InnerText = "ANTES $790.000";
                    lblFidelidad.Visible = false;
                    lblNotaFidelidad.Visible = false;

                    divPackBienvenida.Visible = false;

                    itemId = "4";
                    itemName = "Plan 6 Meses + 2 Meses";
                    price = 590000;
                    texto = "COMPRAR CON 2 MESES GRATIS";
                    tokenId = "register?token=iIcy3afZs7mlj4oUOKT8";
                    urlKey = "";
                    ConfigurarBtn(lnkComprar1, texto, itemId, itemName, price, tokenId, urlKey);
                    ConfigurarBtn(lnkComprar3, texto, itemId, itemName, price, tokenId, urlKey);

                    lnkComprar2.Visible = true;
                    lnkComprar4.Visible = true;

                    string itemId2 = "3";
                    string itemName2 = "Plan 6 Meses";
                    int price2 = 590000;
                    string texto2 = "COMPRAR SIN 2 MESES GRATIS";
                    ConfigurarBtn(lnkComprar2, texto2, itemId2, itemName2, price2, tokenId, urlKey);
                    ConfigurarBtn(lnkComprar4, texto2, itemId2, itemName2, price2, tokenId, urlKey);

                    lblTextoFinal.InnerHtml = "Sin inscripción <br /> Sin administración <br /> Sin permanencia obligatoria";

                    break;

                default:
                    Response.Redirect("default.aspx");
                    return;
            }
        }

        private void ConfigurarBtn(HyperLink boton, string texto, string itemId, string itemName, int price, string tokenId, string urlKey)
        {
            boton.Text = texto;

            boton.NavigateUrl = "#";

            boton.CssClass = "switch-btn btn-comprar-plan";

            boton.Attributes["data-plan-id"] = itemId;

            boton.Attributes["data-plan-name"] = itemName;

            boton.Attributes["data-plan-price"] = price.ToString();

            boton.Attributes["data-plan-token"] = tokenId;

            boton.Attributes["data-plan-url-key"] = urlKey;
        }
    }
}