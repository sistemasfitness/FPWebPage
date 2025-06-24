using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clasesglobales cg = new clasesglobales();

                //hlContacto.Enabled = false;
                string strQuery = "SELECT s.idSede, CONCAT(s.NombreSede, \" - \", cs.NombreCiudadSede) AS NombreSede " +
                "FROM sedes s " +
                "LEFT JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                "ORDER BY s.idCiudadSede, NombreSede";
                DataTable dt = cg.TraerDatos(strQuery);

                //ddlSedes.DataSource = dt;
                //ddlSedes.DataBind();

                dt.Dispose();
            }
        }

        protected void ddlSedes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //hlContacto.Enabled = true;
            hlContacto.NavigateUrl = "https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People.%20Sede%20" + ddlSedes.SelectedItem.Text.ToString();
        }
    }
}