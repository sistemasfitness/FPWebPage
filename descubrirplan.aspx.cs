using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
	public partial class descubrirplan : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                //CargarCiudades();
            }
        }

        //private void CargarCiudades()
        //{
        //    clasesglobales cg = new clasesglobales();

        //    DataTable dt = cg.ConsultarCiudadesSedesWeb();

        //    ddlCiudad.DataSource = dt;
        //    ddlCiudad.DataBind();

        //    dt.Dispose();

        //    ddlSedes.Enabled = false;
        //}

        //protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlSedes.Items.Clear();
        //    ddlSedes.Items.Add(new ListItem("Seleccione", ""));
        //    ddlSedes.Enabled = false;

        //    if (string.IsNullOrEmpty(ddlCiudad.SelectedValue)) return;

        //    ddlSedes.Enabled = true;

        //    clasesglobales cg = new clasesglobales();

        //    DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(int.Parse(ddlCiudad.SelectedItem.Value.ToString()));

        //    ddlSedes.DataSource = dt;
        //    ddlSedes.DataBind();

        //    dt.Dispose();
        //}
    }
}