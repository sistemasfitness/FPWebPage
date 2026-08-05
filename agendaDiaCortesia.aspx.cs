using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class agendaDiaCortesia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTipoDocumento();
                CargarCiudadesYSedes();
            }
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            dt.Dispose();
        }

        private void CargarCiudadesYSedes()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtCiudad = cg.ConsultarCiudadesSedesWeb();
            ddlCiudad.DataSource = dtCiudad;
            ddlCiudad.DataTextField = "NombreCiudadSede";
            ddlCiudad.DataValueField = "idCiudadSede";
            ddlCiudad.DataBind();
            ddlCiudad.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dtCiudad.Dispose();

            DataTable dtSede = cg.ConsultarSedesWeb();
            ddlSede.DataSource = dtSede;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
            ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dtSede.Dispose();
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            clasesglobales cg = new clasesglobales();
            ddlSede.Items.Clear();

            // Si no seleccionó ciudad, mostrar todas las sedes
            if (string.IsNullOrEmpty(ddlCiudad.SelectedValue))
            {
                DataTable dtTodasSedes = cg.ConsultarSedesWeb();
                ddlSede.DataSource = dtTodasSedes;
                ddlSede.DataTextField = "NombreSede";
                ddlSede.DataValueField = "IdSede";
                ddlSede.DataBind();
                ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
                dtTodasSedes.Dispose();
                return;
            }

            // Si seleccionó una ciudad válida, filtrar las sedes
            DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(ddlCiudad.SelectedValue));
            ddlSede.DataSource = dt;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
            ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dt.Dispose();
        }

        protected void ddlSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlSede.SelectedValue)) return;

            clasesglobales cg = new clasesglobales();

            DataTable dtSede = cg.ConsultarSedePorId(Convert.ToInt32(ddlSede.SelectedValue));

            if (dtSede != null && dtSede.Rows.Count > 0)
            {
                DataRow sedeInfo = dtSede.Rows[0];
                string idCiudad = sedeInfo["idCiudadSede"].ToString();

                if (ddlCiudad.Items.FindByValue(idCiudad) != null)
                {
                    ddlCiudad.SelectedValue = idCiudad;
                }
            }

            // liberar si tu implementación lo requiere
            if (dtSede != null) dtSede.Dispose();
        }

        protected void btnRegistrarCortesia(object sender, EventArgs e)
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                int idTipoDocumento = 0;

                int.TryParse(
                    ddlTipoDocumento.SelectedValue,
                    out idTipoDocumento
                );

                string documento = txbDocumento.Text.Trim();
                string nombre = txbNombre.Text.Trim().ToUpper();
                string celular = txbCelular.Text.Trim();
                string fechaCortesia = txbFechaCort.Text.Trim();
                int idCiudad = Convert.ToInt32(ddlCiudad.SelectedItem.Value.ToString());
                int idSede = Convert.ToInt32(ddlSede.SelectedItem.Value.ToString());

                cg.InsertarCortesia(
                    idTipoDocumento, 
                    documento, 
                    nombre,
                    celular,
                    fechaCortesia,
                    idCiudad,
                    idSede
                );

            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{tipo}', 
                background: '#3C3C3C', 
                showCloseButton: false, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }
    }
}