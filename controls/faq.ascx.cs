using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage.controls
{
    public partial class faq1 : System.Web.UI.UserControl
    {
        // Configuración del encabezado
        public string SectionId { get; set; } = "faq";

        public string Kicker { get; set; } = "Preguntas frecuentes";

        public string Title { get; set; } = "¿Tienes";

        public string Highlight { get; set; } = "dudas?";

        public string Description { get; set; } = "Resolvemos lo que más nos preguntan.";

        // Configuración del botón
        public string WhatsAppUrl { get; set; } = "https://wa.me/573107842151";

        public string WhatsAppText { get; set; } = "Hablar con un asesor";

        // Lista de preguntas
        public List<FaqItem> Items { get; set; } = new List<FaqItem>();

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            // Cargar preguntas y respuestas
            rptPreguntas.DataSource = Items;
            rptPreguntas.DataBind();
        }
    }

    // Modelo de cada pregunta
    public class FaqItem
    {
        public string Question { get; set; }

        public string Answer { get; set; }

        // Indica si la pregunta aparece abierta inicialmente
        public bool Open { get; set; }

        public FaqItem()
        {
            Open = false;
        }
    }
}