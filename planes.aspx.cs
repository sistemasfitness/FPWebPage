using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class planes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"].ToString() != "")
                {
                    clasesglobales cg = new clasesglobales();
                    string strQuery = "SELECT * " +
                        "FROM Planes WHERE idPlan <> 9 AND idPlan <> 12 AND idPlan = " + Request.QueryString["id"].ToString();
                    DataTable dt = cg.TraerDatos(strQuery);
                    if (dt.Rows.Count > 0)
                    {
                        ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/banners/" + dt.Rows[0]["BannerWeb"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                        ltBannerFull.Text += "<div id=\"sub_content_in\" style='align-content: end;'>";
                        ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dt.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
                        ltBannerFull.Text += "<p>ENTRENA SIN PAUSAS, SIN VUELTAS, SIN EXCUSAS.</p>";
                        ltBannerFull.Text += "</div>";
                        ltBannerFull.Text += "</section>";

                        ltTitulo.Text = dt.Rows[0]["TituloPlan"].ToString();
                        ltDescripcion.Text = dt.Rows[0]["DescripcionPlanWeb"].ToString();

                        ltImagenMarketing.Text = "<a href=\"" + dt.Rows[0]["EnlacePago"].ToString() + "\" target=\"_blank\" >";
                        ltImagenMarketing.Text += "<img src=\"img/planes/" + dt.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\" style=\"border-radius: 15px;\" />";
                        ltImagenMarketing.Text += "</a>";

                        string enlacePago = dt.Rows[0]["EnlacePago"].ToString();
                        string htmlBoton = GenerarBotonPago(enlacePago);

                        ltBotonPago.Text = htmlBoton;
                        ltBotonPago2.Text = htmlBoton;
                        ltBotonPago3.Text = htmlBoton;
                    }
                    else
                    {
                        Response.Redirect("default");
                    }

                    GenerarBarraProgreso();

                    strQuery = "SELECT * FROM CiudadesSedes " +
                        "WHERE idCiudadSede <> 5 ";
                    DataTable dt1 = cg.TraerDatos(strQuery);

                    ddlCiudad.DataSource = dt1;
                    ddlCiudad.DataBind();

                    dt1.Dispose();
                    ddlSedes.Enabled = false;
                }
            }
        }

        private string GenerarBotonPago(string enlace)
        {
            return $"<a href=\"{enlace}\" target=\"_blank\" >" +
                   "<img src=\"img/comprar_ahora.png\" style=\"width: 300px;\"></a>";
        }

        private void GenerarBarraProgreso()
        {
            int idPlan = int.Parse(Request.QueryString["id"].ToString());

            if (idPlan == 15)
            {
                clasesglobales cg = new clasesglobales();

                DataTable dt = cg.ConsultarPlanPorId(15);

                if (dt.Rows.Count > 0)
                {
                    // Mostrar barra de retroceso
                    barraProgreso.Visible = true;

                    // Fechas de ejemplo (puedes cargarlas de base de datos o lógica de negocio)
                    DateTime fechaInicio = new DateTime(2025, 8, 11, 0, 0, 0);
                    DateTime fechaFin = new DateTime(2025, 8, 15, 23, 59, 59); // AAAA,MM,DD,HH,MM,SS

                    string script = $@"
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {{
                            iniciarTemporizador('{fechaInicio:yyyy-MM-ddTHH:mm:ss}', '{fechaFin:yyyy-MM-ddTHH:mm:ss}');
                        }});
                    </script>";

                    litScriptFechas.Text = script;
                }
            }
            else
            {
                // Ocultar el section si no se cumple la condición
                barraProgreso.Visible = false;
            }
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSedes.Enabled = true;
            clasesglobales cg = new clasesglobales();

            string strQuery = "SELECT * " +
            "FROM Sedes " +
            "WHERE idCiudadSede = " + ddlCiudad.SelectedItem.Value.ToString() + " " +
            "AND idSede <> 11 ";
            DataTable dt = cg.TraerDatos(strQuery);

            ListItem li = new ListItem("Seleccione", "");
            ddlSedes.Items.Clear();
            ddlSedes.Items.Add(li);
            ddlSedes.DataSource = dt;
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected void ddlSedes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("sedes?id=" + ddlSedes.SelectedItem.Value.ToString());
        }
    }
}