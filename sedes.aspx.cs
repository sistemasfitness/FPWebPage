using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class sedes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"].ToString() != "")
                {
                    CargarSede();
                    CargarGaleria();
                }
            }
        }

        private void CargarSede()
        {
            string strQuery = "SELECT * FROM Sedes s " +
                        "INNER JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                        "WHERE s.idSede = " + Request.QueryString["id"].ToString();
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                ltNombreSede.Text = dt.Rows[0]["NombreSede"].ToString();
                ltCiudadSede.Text = dt.Rows[0]["NombreCiudadSede"].ToString();
                ltNombreSede2.Text = dt.Rows[0]["NombreSede"].ToString();
                ltCiudadSede2.Text = dt.Rows[0]["NombreCiudadSede"].ToString();
                ltDireccionSede.Text = dt.Rows[0]["DireccionSede"].ToString();
                ltTelefonoSede.Text = "<a href='https://wa.me/57" + dt.Rows[0]["TelefonoSede"].ToString() + "' target='_blank'>" + dt.Rows[0]["TelefonoSede"].ToString() + "</a>";
                ltHorarioSede.Text = dt.Rows[0]["HorarioSede"].ToString();
                ltMapa.Text = dt.Rows[0]["GoogleMaps"].ToString();

                //ltImagenBG.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"https://fpadmin.fitnesspeoplecolombia.com/img/sedes/banners/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                ltImagenBG.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/sedes/banners/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                //ltImagenRecuadro.Text = "<img src=\"img/sedes/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" alt=\"\" class=\"img-responsive\" />";
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void CargarGaleria()
        {
            string strQuery = "SELECT NombreImagen, NombreSede FROM GaleriaSedes gs " +
                        "INNER JOIN Sedes s ON gs.idSede = s.idSede " +
                        "WHERE s.idSede = " + Request.QueryString["id"].ToString();
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                rpGaleria.DataSource = dt;
                rpGaleria.DataBind();
            }
        }
    }
}