using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class pqrs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTipoDocumento();
                CargarSedes();
            }
        }

        protected void btnRadicarSolicitud_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnConsultarSolicitud_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAdjuntarArchivos_Click(object sender, EventArgs e)
        {
            
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            dt.Dispose();
        }

        private void CargarSedes()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultaCargarSedes("Gimnasio");

            ddlSede.DataSource = dt;
            ddlSede.DataBind();

            dt.Dispose();
        }
    }
}