using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class sede_pg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strQuery = "SELECT * FROM Sedes s " +
                    "INNER JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                    "WHERE idSede <> 11 " +
                    "ORDER BY NombreCiudadSede ";
                clasesglobales cg = new clasesglobales();
                DataTable dt = cg.TraerDatos(strQuery);
                if (dt.Rows.Count > 0)
                {
                    rpSedes.DataSource = dt;
                    rpSedes.DataBind();
                }
                else
                {
                    Response.Redirect("default");
                }
            }
        }
    }
}