using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class resultado : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            string q1 = Request.QueryString["q1"];
            string q2 = Request.QueryString["q2"];
            string q3 = Request.QueryString["q3"];
            string q4 = Request.QueryString["q4"];
            string q5 = Request.QueryString["q5"];

            VisualizarResultadoPlan(q1, q2);
        }

        private void MostrarInfoPlan(string respuestaClases, string respuestaPlan)
        {
            string imgInfo = respuestaPlan == "1" ? "resultado_03_transformacion-total-info-1.png" :
                             respuestaPlan == "2" ? "resultado_01_plan-easy-info.png" : "resultado_02_plan-6-meses-info.png";

            string imgFoto = respuestaPlan == "1" ? "resultado_03_transformacion-total-foto.png" :
                             respuestaPlan == "2" ? "resultado_01_plan-easy-foto.png" : "resultado_02_plan-6-meses-foto.png";

            //string imgInfoTT = respuestaPlan == "1" ? "resultado_03_transformacion-total-info-2.png" : "";

            ltImagenInfoPlan.Text = "<img src=\"img/descubrir-plan/" + imgInfo + "\" alt=\"\" class=\"img-responsive\" />";
            //ltImagenInfoPlanTT.Text = "<img src=\"img/descubrir-plan/" + imgInfoTT + "\" alt=\"\" class=\"img-responsive\" />";
            ltImagenInfoFoto.Text = "<img src=\"img/descubrir-plan/" + imgFoto + "\" alt=\"\" class=\"img-responsive\" />";
            MostrarInfoClasesPlan(respuestaClases);
        }

        private void MostrarInfoClasesPlan(string respuesta)
        {
            string clasesInfo = respuesta == "1" ?
                            @"• Combat : Pelea contra el estrés y gana fuerza. <br/>
                              • Funcional: Hasta 420 kcal en 45 minutos. <br/>
                              • Xtreme +: Quema grasa, reta tu cuerpo." :
                             respuesta == "2" ?
                            @"• Core: Abdomen fuerte, cuerpo estable. <br/>
                              • Funcional: Repara, fortalece y previene. <br/>
                              • Pilates: Tonifica, corrige tu postura y conecta contigo. <br/> 
                              • Rumba: Suda y tonifica mientras te diviertes. <br/> 
                              • Aeróbicos: Quema, tonifica y sonríe." :
                              respuesta == "3" ?
                            @"• Xtreme: Al límite de tu fuerza, al máximo tus resultados. <br/>
                              • Xtreme +: Construye músculo con alta intensidad. <br/>
                              • Core: Abdomen fuerte, cuerpo estable." :
                            @"• Rumba: Ritmo, cardio y diversión en una sola clase. <br/>
                              • Aeróbicos: terapia en movimiento. <br/>
                              • Spinning: Fortalece piernas, Quema grasa y libera mente.";

            ltImagenInfoClases.Text = $"<p style='color: #FFFFFF; font-weight: bold;'>{clasesInfo}</p>";
        }

        private void MostrarBotonPlan(string respuesta)
        {
            string linkBoton = respuesta == "1" ? "https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=20341" :
                               respuesta == "2" ? "https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=20732" : "https://app.clez.co/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=24641";

            ltBotonPago.Text = "<a href=\"" + linkBoton + "\" target=\"_blank\" class='img_container' style='height: 100%;' >";
            ltBotonPago.Text += "<img src=\"img/descubrir-plan/resultado_btn_lo-quiero.png\" style=\"width: 350px;\">";
            ltBotonPago.Text += "</a>";
        }

        private void MostrarBannerPlan(string respuesta)
        {
            string imgBanner = respuesta == "1" ? "resultado_03_transformacion-total-banner.png" : 
                               respuesta == "2" ? "resultado_01_plan-easy-banner.png" : "resultado_02_plan-6-meses-banner.png";

            ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/descubrir-plan/" + imgBanner + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
            //ltBannerFull.Text += "<div id=\"sub_content_in\">";
            //ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dt.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
            //ltBannerFull.Text += "<p>ENTRENA SIN PAUSAS, SIN VUELTAS, SIN EXCUSAS.</p>";
            //ltBannerFull.Text += "</div>";
            ltBannerFull.Text += "</section>";
        }

        private void VisualizarResultadoPlan(string respuestaClases, string respuestaPlan)
        {
            MostrarBannerPlan(respuestaPlan);
            MostrarInfoPlan(respuestaClases, respuestaPlan);
            MostrarBotonPlan(respuestaPlan);
        }
    }
}