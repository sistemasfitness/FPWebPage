using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class descripcionPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tipoPlan = Request.QueryString["plan"];

                if (string.IsNullOrEmpty(tipoPlan))
                {
                    Response.Redirect("default.aspx");
                    return;
                }

                CargarPlan(tipoPlan);
            }
        }

        private void CargarPlan(string tipoPlan)
        {
            List<string> beneficios = new List<string>();

            imgPlan.Visible = false;

            string linkPago = "";

            switch (tipoPlan.ToLower())
            {
                // ===============================
                // EASY FAST
                // ===============================
                case "easy-fast":

                    linkPago = "register?token=DrgZnojOsKdggSIcXL0x";

                    lnkBanner.HRef = linkPago;
                    imgPlan.Src = "img/planes/plan-easy-fast_2026-01-05.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "EASY FAST";
                    lblDescripcion.InnerText = "Empezar fácil y sin costos extra.";
                    lblPrecio.InnerText = "$ 109.900/mes";
                    lblPermanencia.InnerText = "Permanencia mínima: 12 meses";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Pago mensual automático.");
                    beneficios.Add("Plan recurrente.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // EASY PRO
                // ===============================
                case "easy-pro":

                    linkPago = "register?token=EvdXpvlvF6zFWrKFwZfu";

                    lnkBanner.HRef = linkPago;
                    imgPlan.Src = "img/planes/plan-easy-pro_2026-01-05.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "EASY PRO";
                    lblDescripcion.InnerText = "Más beneficios desde el primer mes.";
                    lblPrecio.InnerText = "$ 129.900/mes";
                    lblPermanencia.InnerText = "Sin permanencia";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Pago mensual automático.");
                    beneficios.Add("Plan recurrente.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Cita inicial con nutricionista.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // EASY FLEX
                // ===============================
                case "easy-flex":

                    linkPago = "register?token=QTXXAbI22Wv9gJcNALSH";

                    lnkBanner.HRef = linkPago;
                    imgPlan.Src = "img/planes/plan-easy-flex_2026-01-05.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "EASY FLEX";
                    lblDescripcion.InnerText = "Un solo mes, sin débito automático.";
                    lblPrecio.InnerText = "$ 165.900";
                    lblPermanencia.InnerText = "Sin permanencia";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Plan por un solo mes.");
                    beneficios.Add("Pago adicional de membresía ($190.000).");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 3 MESES
                // ===============================
                case "3-meses":

                    linkPago = "register?token=SuNLgEJA8mDDRgPB4EhN";

                    lnkBanner.HRef = linkPago;
                    lblTitulo.InnerText = "Plan 3 Meses";
                    lblDescripcion.InnerText = "Compromiso corto, resultados reales.";
                    lblPrecio.InnerText = "$ 349.000";
                    lblPermanencia.InnerText = "Sin permanencia";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("5 cortesías mensuales para amigos nuevos.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Acompañamiento profesional.");
                    beneficios.Add("Acceso al programa Extreme.");
                    beneficios.Add("Precio especial en nutrición y medicina deportiva.");
                    beneficios.Add("Valoración física inicial.");
                    beneficios.Add("Descuentos en marcas aliadas.");

                    break;

                // ===============================
                // PLAN 6 MESES
                // ===============================
                case "6-meses":

                    linkPago = "register?token=W70qV5GRiVWaIBk6ysD0";

                    lnkBanner.HRef = linkPago;
                    lblTitulo.InnerText = "Plan 6 Meses";
                    lblDescripcion.InnerText = "Invierte en ti y entrena sin excusas.";
                    lblPrecio.InnerText = "$ 590.000";
                    lblPermanencia.InnerText = "Sin permanencia";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("5 cortesías mensuales para amigos nuevos.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Acompañamiento profesional.");
                    beneficios.Add("Acceso al programa Extreme.");
                    beneficios.Add("Precio especial en nutrición y medicina deportiva.");
                    beneficios.Add("Valoración física inicial.");
                    beneficios.Add("Descuentos en marcas aliadas.");

                    break;

                // ===============================
                // PLAN 12 MESES
                // ===============================
                case "12-meses":

                    linkPago = "register?token=x6Is0joow5GVB8WVW9Rd";

                    lnkBanner.HRef = linkPago;
                    lblTitulo.InnerText = "Plan 12 Meses";
                    lblDescripcion.InnerText = "Entrena sin pausas durante todo un año.";
                    lblPrecio.InnerText = "$ 990.000";
                    lblPermanencia.InnerText = "Sin permanencia";
                    lnkComprar.NavigateUrl = linkPago;
                    lnkComprar2.NavigateUrl = linkPago;

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("5 cortesías mensuales para amigos nuevos.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("Acompañamiento profesional.");
                    beneficios.Add("Acceso al programa Extreme.");
                    beneficios.Add("Precio especial en nutrición y medicina deportiva.");
                    beneficios.Add("Valoración física inicial.");
                    beneficios.Add("Descuentos en marcas aliadas.");

                    break;

                // ===============================
                // DEFAULT
                // ===============================
                default:
                    Response.Redirect("default.aspx");
                    return;
            }

            rptBeneficios.DataSource = beneficios.Select(x => new { Texto = x });
            rptBeneficios.DataBind();
        }
    }
}