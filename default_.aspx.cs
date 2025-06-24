using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clasesglobales cg = new clasesglobales();

                string strQuery = "SELECT * FROM CiudadesSedes " +
                "WHERE idCiudadSede <> 5 ";
                DataTable dt = cg.TraerDatos(strQuery);

                ddlCiudad.DataSource = dt;
                ddlCiudad.DataBind();

                dt.Dispose();

                ddlSedes.Enabled = false;
            }

            Random aleatorio = new Random();
            //int numero = aleatorio.Next(2, 3);
            int numero = aleatorio.Next(1, 2);
            switch (numero)
            {
                case 1:
                    divVideo.Visible = true;
                    break;
                case 2:
                    //divImage.Visible = true;
                    break;
                default:
                    break;
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