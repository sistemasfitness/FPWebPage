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
                        "FROM Planes WHERE idPlan = " + Request.QueryString["id"].ToString();
                    DataTable dt = cg.TraerDatos(strQuery);
                    if (dt.Rows.Count > 0)
                    {
                        ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/banners/" + dt.Rows[0]["BannerWeb"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                        ltBannerFull.Text += "<div id=\"sub_content_in\">";
                        ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dt.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
                        ltBannerFull.Text += "<p>ENTRENA SIN PAUSAS, SIN VUELTAS, SIN EXCUSAS.</p>";
                        ltBannerFull.Text += "</div>";
                        ltBannerFull.Text += "</section>";

                        ltTitulo.Text = dt.Rows[0]["TituloPlan"].ToString();
                        ltDescripcion.Text = dt.Rows[0]["DescripcionPlanWeb"].ToString();

                        ltBotonPago.Text = "<a href=\"" + dt.Rows[0]["EnlacePago"].ToString() + "\" target=\"_blank\" >";
                        ltBotonPago.Text += "<img src=\"img/comprar_ahora.png\" style=\"width: 300px;\">";
                        //ltBotonPago.Text += "<button class=\"btn_1 add_bottom_15\" style=\"width: 100%; background-color: black; font-size: x-large; margin-bottom: 0;\">";
                        //ltBotonPago.Text += "¡COMPRAR AQUI!";
                        //ltBotonPago.Text += "</button>";
                        ltBotonPago.Text += "</a>";

                        //ltImagenMarketing.Text = "<div class=\"col-md-5 col-md-offset-1 hidden-sm hidden-xs\" style=\"display: flex; flex-direction: column; justify-content: center; cursor: pointer;\" >";
                        //ltImagenMarketing.Text += "<img src=\"img/planes/" + dt.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\">";
                        //ltImagenMarketing.Text += "</div>";

                        ltImagenMarketing.Text = "<img src=\"img/planes/" + dt.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\" />";

                        //ltPrecioTotal.Text = dt.Rows[0]["PrecioTotal"].ToString();

                        //ltNombrePlan.Text = dt.Rows[0]["NombrePlan"].ToString().ToUpper();

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