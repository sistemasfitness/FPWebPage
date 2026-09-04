using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage.controls
{
    public partial class PlanCard : System.Web.UI.UserControl
    {
        /// <summary>
        /// Identificador del plan que se desea mostrar.
        /// Ejemplo: MES_A_MES, FLEXIBLE_PRO, ANIO_IMPARABLE
        /// </summary>
        public string PlanId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPlan();
            }

            // Identificar el plan en el botón
            btnComprar.Attributes["data-plan-id"] = PlanId;
        }

        private void CargarPlan()
        {
            if (string.IsNullOrWhiteSpace(PlanId))
            {
                return;
            }

            Plan plan = ObtenerPlan(PlanId);

            if (plan == null)
            {
                return;
            }

            // ============================
            // INFORMACIÓN GENERAL
            // ============================

            litNombre.Text = plan.Nombre;
            litModalidad.Text = plan.Modalidad;
            litTagline.Text = plan.Tagline;

            // ============================
            // PRECIO ANTERIOR / PROMOCIÓN
            // ============================

            if (!string.IsNullOrWhiteSpace(plan.PrecioAntes))
            {
                divPrecioAntes.Visible = true;
                litPrecioAntes.Text = plan.PrecioAntes;
            }
            else
            {
                divPrecioAntes.Visible = false;
            }

            // ============================
            // PRECIO ACTUAL
            // ============================

            litLabelPrecio.Text = plan.LabelPrecio;
            litPrecio.Text = plan.Precio;
            litPeriodo.Text = plan.Periodo;

            // ============================
            // PERMANENCIA
            // ============================

            litPermanencia.Text = plan.Permanencia;

            // ============================
            // NOTA DE PAGO
            // ============================

            if (!string.IsNullOrWhiteSpace(plan.Nota))
            {
                spanNota.Visible = true;
                litNota.Text = plan.Nota;
            }
            else
            {
                spanNota.Visible = false;
            }

            // ============================
            // BENEFICIOS
            // ============================

            rptBeneficios.DataSource = plan.Beneficios;
            rptBeneficios.DataBind();

            // ============================
            // DESTACADO
            // ============================

            if (plan.EsDestacado)
            {
                cardPlan.Attributes["class"] = "fpp-card fpp-card--featured";
                divBadge.Visible = true;
                btnComprar.Attributes["class"] = "fpp-btn fpp-btn--solid btn-comprar-plan";

                divPackBienvenida.Visible = true;
            }
            else
            {
                cardPlan.Attributes["class"] = "fpp-card";
                divBadge.Visible = false;
                btnComprar.Attributes["class"] = "fpp-btn fpp-btn--outline btn-comprar-plan";

                divPackBienvenida.Visible = false;
            }

            // ============================
            // GOOGLE TAG MANAGER
            // ============================

            btnComprar.Attributes["data-plan-name"] = plan.Nombre;

            string precioTexto = plan.Precio.ToString();

            int precio = 0;

            if (plan.Nombre.ToString() == "Flexible Pro" &&
                precioTexto.Equals("GRATIS", StringComparison.OrdinalIgnoreCase))
            {
                precio = 9900;
            }
            else
            {
                string soloNumeros = Regex.Replace(precioTexto, @"[^\d]", "");

                if (!string.IsNullOrEmpty(soloNumeros))
                {
                    precio = int.Parse(soloNumeros);
                }
            }

            btnComprar.Attributes["data-plan-price"] = precio.ToString();
        }

        private Plan ObtenerPlan(string planId)
        {
            switch (planId.ToUpper())
            {
                case "MES_A_MES":

                    return new Plan
                    {
                        Nombre = "Mes a Mes",
                        Modalidad = "Pago Mes a Mes",
                        Tagline = "Empieza y termina cuando quieras.",

                        PrecioAntes = "Sin inscripción",
                        LabelPrecio = "",
                        Precio = "$165.000",
                        Periodo = "/mes",

                        Permanencia = "Renovación mes a mes<br />Sin fidelidad",

                        Nota = "No aplica para pagos en efectivo, transferencia ni datáfono.",

                        EsDestacado = false,

                        Beneficios = new List<string>
                        {
                            "Acceso a todas las sedes de Fitness People.",
                            "Clases grupales con instructores certificados.",
                            "FP App con planes de entrenamiento y tips de nutrición.",
                            "5 pases de invitado al mes.",
                            "Valoración física inicial."
                        }
                    };


                case "FLEXIBLE_PRO":

                    return new Plan
                    {
                        Nombre = "Flexible Pro",
                        Modalidad = "Débito automático",
                        Tagline = "Más beneficios desde el primer mes.",

                        PrecioAntes = "Sin inscripción",
                        LabelPrecio = "1er mes",
                        Precio = "$49.500",
                        Periodo = "",

                        Permanencia = "Después $99.000/mes<br />Fidelidad mínima de 12 meses, aplica cobro por retiro anticipado",

                        Nota = "No aplica para pagos en efectivo, transferencia ni datáfono.",

                        EsDestacado = true,

                        Beneficios = new List<string>
                        {
                            "Acceso a todas las sedes de Fitness People.",
                            "Clases grupales con instructores certificados.",
                            "FP App con planes de entrenamiento y tips de nutrición.",
                            "5 pases de invitado al mes.",
                            "Valoración física inicial."
                        }
                    };


                case "ANIO_IMPARABLE":

                    return new Plan
                    {
                        Nombre = "Año Imparable",
                        Modalidad = "Pago único anual",
                        Tagline = "Entrena sin pausas durante todo un año.",

                        PrecioAntes = "+ 2 meses GRATIS",
                        LabelPrecio = "",
                        Precio = "$990.000",
                        Periodo = "/año",

                        Permanencia = "Equivale a $70.700/mes aprox.<br />Sin fidelidad",

                        EsDestacado = false,

                        Beneficios = new List<string>
                        {
                            "Acceso a todas las sedes de Fitness People.",
                            "Clases grupales con instructores certificados.",
                            "FP App con planes de entrenamiento y tips de nutrición.",
                            "5 pases de invitado al mes.",
                            "Valoración física inicial."
                        }
                    };


                case "ESTUDIANTES":

                    return new Plan
                    {
                        Nombre = "Estudiantes",
                        Modalidad = "Débito automático",
                        Tagline = "Haz de tu bienestar parte del día.",

                        PrecioAntes = "Sin inscripción",
                        LabelPrecio = "1er mes",
                        Precio = "$59.700",
                        Periodo = "",

                        Permanencia = "Después $79.600/mes<br />Fidelidad de 6 meses, aplica cobro por retiro anticipado",

                        Nota = "No aplica para pagos en efectivo, transferencia ni datáfono. <br /> VIGENCIA: Hasta el 31 de diciembre de 2026.",

                        EsDestacado = false,

                        Beneficios = new List<string>
                        {
                            "Acceso a única sede de Fitness People.",
                            "Precio preferencial durante 6 meses.",
                            "3 días de cortesía para redimir.",
                            "Beneficio exclusivo para estudiantes.",
                            "Presenta tu carné estudiantil vigente."
                        }
                    };


                case "RESIDENTES":

                    return new Plan
                    {
                        Nombre = "Residentes",
                        Modalidad = "Débito automático",
                        Tagline = "Tu salud más cerca de ti.",

                        PrecioAntes = "Sin inscripción",
                        LabelPrecio = "",
                        Precio = "$89.900",
                        Periodo = "/mes",

                        Permanencia = "Fidelidad de 6 meses, aplica cobro por retiro anticipado",

                        Nota = "No aplica para pagos en efectivo, transferencia ni datáfono. <br /> VIGENCIA: Hasta el 31 de diciembre de 2026.",

                        EsDestacado = false,

                        Beneficios = new List<string>
                        {
                            "Acceso a única sede de Fitness People.",
                            "Precio preferencial durante 6 meses.",
                            "3 días de cortesía para redimir.",
                            "Beneficio exclusivo para residentes.",
                            "Plan pensado para entrenar cerca de casa."
                        }
                    };


                default:

                    return null;
            }
        }

        private class Plan
        {
            public string Nombre { get; set; }

            public string Modalidad { get; set; }

            public string Tagline { get; set; }

            public string PrecioAntes { get; set; }

            public string LabelPrecio { get; set; }

            public string Precio { get; set; }

            public string Periodo { get; set; }

            public string Permanencia { get; set; }

            public string Nota { get; set; }

            public bool EsDestacado { get; set; }

            public List<string> Beneficios { get; set; }
        }
    }
}