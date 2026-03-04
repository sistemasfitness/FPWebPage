using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using WebPage.controls;
using static NPOI.SS.Formula.PTG.ArrayPtg;
using static WebPage.Services.SiigoClient;

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

            string itemId = "";
            string itemName = "";
            string price = "";

            switch (tipoPlan.ToLower())
            {
                // ===============================
                // PLAN BÁSICO MENSUAL
                // ===============================
                case "basico-mensual":

                    linkPago = "register?token=l1KUGxZPIEegdYnaJLP7";

                    itemId = "35";
                    itemName = "Plan Básico Mensual";
                    price = "39800";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan_6-mas-2_2025-08-21.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-basico-mensual_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Básico Mensual";
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Empezar fácil y sin costos extra.";
                    lblPrecio.InnerText = "$ 19.900 1er Mes";
                    lblPrecioAdd.InnerText = "+ $ 19.900 de Inscripción";
                    lblPrecioDes.InnerText = "DESPUÉS $79.600/mes";
                    lblFidelidad.InnerText = "Fidelidad de 6 meses";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a ÚNICA sede.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App(Valoración y entrenamiento).");
                    beneficios.Add("1 cortesía mensual para un amigo.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN FLEXIBLE PRO
                // ===============================
                case "flexible-pro":

                    linkPago = "register?token=4MexIhysX3mcTNlQnfaN";

                    itemId = "36";
                    itemName = "Plan Flexible Pro";
                    price = "29800";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan-pro-flexible_2026-03-03.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-flexible-pro_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Flexible Pro";
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Más beneficios desde el primer mes.";
                    lblPrecio.InnerText = "$ 19.900 1er Mes";
                    lblPrecioAdd.InnerText = "+ $ 9.900 de Inscripción";
                    lblPrecioDes.InnerText = "DESPUÉS $99.500/mes";
                    lblFidelidad.InnerText = "Fidelidad de 6 meses";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App(Valoración y entrenamiento).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN MES A MES
                // ===============================
                case "mes-a-mes":

                    linkPago = "register?token=qIKhrR9D6Jk3xbPRz4JX";

                    itemId = "37";
                    itemName = "Plan Mes a Mes Débito Automático";
                    price = "199900";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan-mes-a-mes_2026-03-03.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-mes-a-mes_2026-03-03.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Mes a Mes";
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Impulso rápido, resultados visibles.";
                    lblPrecio.InnerText = "$ 9.900 1er Mes";
                    lblPrecioDes.InnerText = "DESPUÉS $165.000/mes";
                    lblPrecioAdd.InnerText = "+ $ 190.000 de Inscripción";
                    lblFidelidad.InnerText = "Sin fidelidad (Renovación solo por 1 mes)";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App(Valoración y entrenamiento).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Pago adicional de membresía ($190.000).");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 3 MESES
                // ===============================
                case "3-meses":

                    linkPago = "register?token=SuNLgEJA8mDDRgPB4EhN";

                    itemId = "4";
                    itemName = "Plan Trimestral (Plan 3 Meses)";
                    price = "350000";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan_6-mas-2_2025-08-21.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-3-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Trimestral";
                    lblSubTitulo.InnerText = "Plan 3 Meses";
                    lblDescripcion.InnerText = "Compromiso corto, resultados reales.";
                    lblPrecio.InnerText = "$ 350.000";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Valoración, entrenamiento y nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Cita inicial con nutricionista.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 6 MESES
                // ===============================
                case "6-meses":

                    linkPago = "register?token=W70qV5GRiVWaIBk6ysD0";

                    itemId = "5";
                    itemName = "Plan Pro (Plan 6 Meses)";
                    price = "590000";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan_6-mas-2_2025-08-21.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-6-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Pro";
                    lblSubTitulo.InnerText = "Plan 6 Meses";
                    lblDescripcion.InnerText = "Invierte en ti y entrena sin excusas.";
                    lblPrecio.InnerText = "$ 590.000";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Valoración, entrenamiento y nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Cita inicial con nutricionista.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 12 MESES
                // ===============================
                case "12-meses":

                    linkPago = "register?token=x6Is0joow5GVB8WVW9Rd";

                    itemId = "7";
                    itemName = "Plan Año Imparable (Plan 12 Meses)";
                    price = "990000";

                    secBanner.Attributes["style"] += "background-image:url('img/banners/plan-12-meses_2026-03-03.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-12-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Año Imparable";
                    lblSubTitulo.InnerText = "Plan 12 Meses";
                    lblDescripcion.InnerText = "Entrena sin pausas durante todo un año.";
                    lblPrecio.InnerText = "$ 990.000";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("2 meses de cortesía.");
                    beneficios.Add("Acceso a todas las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Valoración, entrenamiento y nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Cita inicial con nutricionista.");
                    beneficios.Add("Valoración física inicial.");

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

        private void ConfigurarBtns(string itemId, string itemName, string price, string linkPago)
        {
            string script = $"return planAddToCart(['{itemId}'], '{itemName}', '{price}', '{linkPago}');";

            lnkBanner.Attributes["onclick"] = script;
            lnkComprar1.Attributes["onclick"] = script;
            lnkComprar2.Attributes["onclick"] = script;
        }                                              
    }
}