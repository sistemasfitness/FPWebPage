using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class sedespg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clasesglobales cg = new clasesglobales();

                string strQuery = "SELECT * FROM CiudadesSedes " +
                "WHERE idCiudadSede <> 5 ";
                DataTable dt1 = cg.TraerDatos(strQuery);

                ddlCiudad.DataSource = dt1;
                ddlCiudad.DataBind();

                dt1.Dispose();

                ddlSedes.Enabled = false;

                strQuery = "SELECT * FROM Sedes s " +
                    "INNER JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                    "WHERE idSede <> 11 " +
                    "ORDER BY NombreCiudadSede ";

                DataTable dt2 = cg.TraerDatos(strQuery);
                if (dt2.Rows.Count > 0)
                {
                    rpSedes.DataSource = dt2;
                    rpSedes.DataBind();
                    dt2.Dispose();
                }
                else
                {
                    Response.Redirect("default");
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