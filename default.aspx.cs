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
                CargarCiudades();
            }
        }

        private void CargarCiudades()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.ConsultaCargarSedesPorId(null, "Todas");

            if (dt != null && dt.Rows.Count > 0)
            {
                ddlNombresSedes.DataSource = dt;
                ddlNombresSedes.DataTextField = "NombreSede";
                ddlNombresSedes.DataValueField = "idSede";
                ddlNombresSedes.DataBind();
                ddlNombresSedes.Items.Insert(0, new ListItem("Selecciona una sede", ""));
            }
        }

        protected void ddlNombresSedes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //hlContacto.Enabled = true;
            hlContacto.NavigateUrl = "https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People.%20Sede%20" + ddlNombresSedes.SelectedItem.Text.ToString();
        }
    }
}