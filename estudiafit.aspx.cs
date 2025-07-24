using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
	public partial class estudiafit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                clasesglobales cg = new clasesglobales();
                string strQuery = "SELECT * " +
                    "FROM Planes WHERE idPlan = " + 9;
                DataTable dt = cg.TraerDatos(strQuery);

                if (dt.Rows.Count > 0)
                {
                    ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/banners/" + dt.Rows[0]["BannerWeb"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                    ltBannerFull.Text += "<div id=\"sub_content_in\" style='align-content: end;' >";
                    ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dt.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
                    ltBannerFull.Text += "<p style=\"font-weight: 900; color: #e3ff00;\">¡Estudiar y Entrenar nunca fue tan fácil!</p>";
                    ltBannerFull.Text += "</div>";
                    ltBannerFull.Text += "</section>";

                    ltTitulo.Text = dt.Rows[0]["TituloPlan"].ToString();
                    ltDescripcion.Text = dt.Rows[0]["DescripcionPlanWeb"].ToString();

                    ltBotonPago.Text = "<a href=\"" + dt.Rows[0]["EnlacePago"].ToString() + "\" target=\"_blank\" class='img_container' style='height: 100%;' >";
                    ltBotonPago.Text += "<img src=\"img/comprar_ahora.png\" style=\"width: 350px;\">";
                    ltBotonPago.Text += "</a>";

                    ltImagenMarketing.Text = "<img src=\"img/planes/" + dt.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\" style=\"border-radius: 15px;\" />";
                }
                else
                {
                    Response.Redirect("default");
                }

                strQuery = "SELECT * FROM CiudadesSedes " +
                    "WHERE idCiudadSede <> 5 ";
                DataTable dt1 = cg.TraerDatos(strQuery);

                ddlCiudad.DataSource = dt1;
                ddlCiudad.DataBind();

                dt1.Dispose();
                ddlSedes.Enabled = false;
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