using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class planes : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"].ToString() != "")
                {
                    string strQuery = "SELECT * " +
                        "FROM Planes WHERE idPlan = " + Request.QueryString["id"].ToString();
                    DataTable dt = TraerDatos(strQuery);
                    if (dt.Rows.Count > 0)
                    {
                        ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/banners/" + dt.Rows[0]["BannerWeb"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                        ltBannerFull.Text += "<div id=\"sub_content_in\">";
                        ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dt.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
                        ltBannerFull.Text += "</div>";
                        ltBannerFull.Text += "</section>";

                        ltTitulo.Text = dt.Rows[0]["TituloPlan"].ToString();
                        ltDescripcion.Text = dt.Rows[0]["DescripcionPlanWeb"].ToString();

                        ltBotonPago.Text = "<a href=\"" + dt.Rows[0]["EnlacePago"].ToString() + "\" target=\"_blank\" style=\"margin: 4rem 3rem 0 3rem;\">";
                        ltBotonPago.Text += "<button class=\"btn_1 add_bottom_15\" style=\"width: 100%; background-color: black; font-size: x-large; margin-bottom: 0;\">";
                        ltBotonPago.Text += "¡COMPRAR AQUI!";
                        ltBotonPago.Text += "</button>";
                        ltBotonPago.Text += "</a>";

                        ltImagenMarketing.Text = "<div class=\"col-md-5 col-md-offset-1 hidden-sm hidden-xs\" style=\"display: flex; flex-direction: column; justify-content: center; cursor: pointer;\" onclick=\"window.open('" + dt.Rows[0]["EnlacePago"].ToString() + "', '_blank')\">";
                        ltImagenMarketing.Text += "<img src=\"img/slides/" + dt.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\">";
                        ltImagenMarketing.Text += "</div>";

                        //ltPrecioTotal.Text = dt.Rows[0]["PrecioTotal"].ToString();

                        //ltNombrePlan.Text = dt.Rows[0]["NombrePlan"].ToString().ToUpper();

                    }
                    else
                    {
                        Response.Redirect("default");
                    }
                }
            }
        }

        private DataTable TraerDatos(string strQuery)
        {
            myConnection.Open();
            DataTable dt = new DataTable();

            OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
            OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
            sqlDA.Fill(dt);
            myConnection.Close();

            return dt;
        }
    }
}