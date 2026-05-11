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
    public partial class promo : System.Web.UI.Page
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
            lblPrecioDesUnico.Visible = false;

            string linkPago = "";

            string itemId = "";
            string itemName = "";
            string price = "";

            switch (tipoPlan.ToLower())
            {
                // ===============================
                // PLAN BÁSICO MENSUAL
                // ===============================
                //case "basico-mensual":

                //    linkPago = "register?token=4wCAVQZWA8KMirx9Q8hs0";

                //    itemId = "41";
                //    itemName = "Plan Básico Mensual";
                //    price = "59700";

                //    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-basico-mensual_2026-03-04.jpg');";
                //    imgPlan.Src = "img/planes-cards/plan-basico-mensual_2026-02-27.jpg";
                //    imgPlan.Visible = true;
                //    lblTitulo.InnerText = itemName;
                //    lblSubTitulo.InnerText = "Plan Débito Automático";
                //    lblDescripcion.InnerText = "Entrena en una sola sede.";
                //    lblPrecio.InnerText = "$ 39.800 1er Mes";
                //    lblPrecioAdd.InnerText = "+ $ 19.900 de Inscripción";
                //    lblPrecioDes.InnerText = "DESPUÉS $79.600/mes";
                //    lblFidelidad.InnerText = "Fidelidad de 6 meses";
                //    ConfigurarBtns(itemId, itemName, price, linkPago);

                //    beneficios.Add("Acceso a ÚNICA sede.");
                //    beneficios.Add("Acceso a todas las áreas de la sede.");
                //    beneficios.Add("Clases grupales con profesores.");
                //    beneficios.Add("FP App (Plan de entrenamiento).");
                //    beneficios.Add("1 cortesía mensual para un amigo.");
                //    beneficios.Add("Pago mensual automático.");
                //    beneficios.Add("Membresía incluida.");
                //    beneficios.Add("Valoración física inicial.");

                //    break;

                // ===============================
                // PLAN TRANSFORMATE
                // ===============================
                case "transformate":

                    linkPago = "register?token=XK6ZYbmaYkihB41O73I8";

                    itemId = "43";
                    itemName = "Plan Transformate";
                    price = "29900";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-basico-mensual_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-transformate.jpeg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = itemName;
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Entrena para lograr tu mejor versión.";
                    lblPrecio.InnerText = "$ 29.900 1er Mes";
                    lblPrecioAdd.InnerText = "Sin inscripción";
                    lblPrecioDes.InnerText = "DESPUÉS $130.000/mes";
                    lblFidelidad.InnerText = "Fidelidad de 6 meses";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para un amigos.");
                    beneficios.Add("Pago mensual automático.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Comunidad VIP.");
                    beneficios.Add("Valoración física trimestral (4 en un año).");

                    break;

                // ===============================
                // PLAN FLEXIBLE PRO
                // ===============================
                case "flexible-pro":

                    linkPago = "register?token=aKsoXcm34Ca4sMKeHraR";

                    itemId = "40";
                    itemName = "Plan Flexible Pro";
                    price = "9900";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-flexible-pro_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-flexible-pro_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = itemName;
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Entrena en todas nuestra sedes.";
                    lblPrecio.InnerText = "$ 9.900 1er Mes";
                    lblPrecioAdd.InnerText = "Sin inscripción";
                    lblPrecioDes.InnerText = "DESPUÉS $99.000/mes";
                    lblFidelidad.InnerText = "Fidelidad de 6 meses";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Pago mensual automático.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN MES A MES
                // ===============================
                case "mes-a-mes":

                    linkPago = "register?token=nji06llzEYJSdjPNh2Dg";

                    itemId = "42";
                    itemName = "Plan Mes a Mes";
                    price = "165000";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-mes-a-mes_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-mes-a-mes.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = itemName;
                    lblSubTitulo.InnerText = "Plan Débito Automático";
                    lblDescripcion.InnerText = "Empieza y termina cuando quieras.";
                    lblPrecio.InnerText = "$ 165.000 1er Mes";
                    lblPrecioDes.InnerText = "RENOVACIÓN MES A MES";
                    lblPrecioAdd.InnerText = "Sin inscripción";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Pago mensual automático.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Comunidad VIP.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 3 MESES
                // ===============================
                case "3-meses":

                    linkPago = "https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3705";

                    lblPrecio.Attributes["style"] += "margin-bottom: 10px;";
                    lblPrecioAdd.Attributes["style"] += "display: none;";
                    lblPrecioDes.Visible = false;
                    lblPrecioDesUnico.Visible = true;

                    itemId = "4";
                    itemName = "Plan Trimestral (Plan 3 Meses)";
                    price = "350000";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-3-meses_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-3-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Trimestral";
                    lblSubTitulo.InnerText = "Plan 3 Meses";
                    lblDescripcion.InnerText = "Compromiso corto, resultados reales.";
                    lblPrecio.InnerText = "$ 350.000";
                    lblPrecioDesUnico.InnerText = "≈ $ 116.666/mes";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 6 MESES
                // ===============================
                case "6-meses":

                    linkPago = "https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3704";

                    lblPrecio.Attributes["style"] += "margin-bottom: 10px;";
                    lblPrecioAdd.Attributes["style"] += "display: none;";
                    lblPrecioDes.Visible = false;
                    lblPrecioDesUnico.Visible = true;

                    itemId = "5";
                    itemName = "Plan Pro (Plan 6 Meses)";
                    price = "590000";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-6-meses_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-6-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Pro";
                    lblSubTitulo.InnerText = "Plan 6 Meses";
                    lblDescripcion.InnerText = "Invierte en ti y entrena sin excusas.";
                    lblPrecio.InnerText = "$ 590.000";
                    lblPrecioDesUnico.InnerText = "≈ $ 98.333/mes";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
                    beneficios.Add("Valoración física inicial.");

                    break;

                // ===============================
                // PLAN 12 MESES
                // ===============================
                case "12-meses":

                    linkPago = "https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3703";

                    lblPrecioDesUnico.Visible = true;

                    itemId = "7";
                    itemName = "Plan Año Imparable (Plan 12 Meses)";
                    price = "990000";

                    //secBanner.Attributes["style"] += "background-image:url('img/banners/plan-12-meses_2026-03-04.jpg');";
                    imgPlan.Src = "img/planes-cards/plan-12-meses_2026-02-27.jpg";
                    imgPlan.Visible = true;
                    lblTitulo.InnerText = "Plan Año Imparable";
                    lblSubTitulo.InnerText = "Plan 12 Meses";
                    lblDescripcion.InnerText = "Entrena sin pausas durante todo un año.";
                    lblPrecio.InnerText = "$ 990.000";
                    lblPrecioAdd.InnerText = "+ 2 meses gratis";
                    lblPrecioDesUnico.InnerText = "≈ $ 70.714/mes";
                    lblFidelidad.InnerText = "Sin fidelidad";
                    ConfigurarBtns(itemId, itemName, price, linkPago);

                    beneficios.Add("2 meses de cortesía.");
                    beneficios.Add("Acceso a TODAS las sedes.");
                    beneficios.Add("Acceso a todas las áreas de la sede.");
                    beneficios.Add("Clases grupales con profesores.");
                    beneficios.Add("FP App (Plan de entrenamiento).");
                    beneficios.Add("FP App (Tips de nutrición).");
                    beneficios.Add("5 cortesías mensuales para amigos.");
                    beneficios.Add("Membresía incluida.");
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

            //lnkBanner.Attributes["onclick"] = script;
            lnkComprar1.Attributes["onclick"] = script;
            //lnkComprar2.Attributes["onclick"] = script;
        }                                              
    }
}