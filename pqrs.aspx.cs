using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
                CargarTipo();
                CargarSedes();
                CargarMotivos();
            }
        }

        protected void btnRadicarSolicitud_Click(object sender, EventArgs e)
        {
            if (!ValidarFormularioRadicacion()) return;

            int idTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedValue);
            string documento = txtDocumento.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string celular = txtCelular.Text.Trim();
            int idSede = Convert.ToInt32(ddlSede.SelectedValue);

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            int idAfiliado;

            if (dt.Rows.Count > 0)
            {
                idAfiliado = Convert.ToInt32(dt.Rows[0]["idAfiliado"]);

                dt.Dispose();
            }
            else
            {
                idAfiliado = cg.InsertarAfiliadoPQRSDevolverId(
                    documento,
                    idTipoDocumento,
                    nombres,
                    apellidos,
                    correo,
                    celular,
                    idSede
                );
            }

            int idTipoSolicitud = Convert.ToInt32(ddlTipoSolicitud.SelectedValue);
            string asunto = txtAsunto.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();

            string codigoRadicacion = $"FP-PQRS-{DateTime.Now.ToString("yyyyMMddHHmmss")}-ABC";

            int idPQRS;

            idPQRS = cg.InsertarPQRSDevolverId(
                idAfiliado,
                2, // Usuario ejemplo, se debe reemplazar con el ID del usuario actual
                idSede, 
                codigoRadicacion, // Mejorar código de radicación para que sea único y más representativo
                idTipoSolicitud,
                asunto,
                descripcion,
                1 // Radicado, estado inicial de la solicitud
            );
        }

        protected void btnConsultarSolicitud_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAdjuntarArchivos_Click(object sender, EventArgs e)
        {
            
        }

        private bool ValidarFormularioRadicacion()
        {
            if (string.IsNullOrWhiteSpace(txtNombres.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa tus nombres.",
                    "warning"
                );

                txtNombres.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtApellidos.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa tus apellidos.",
                    "warning"
                );

                txtApellidos.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(ddlTipoDocumento.SelectedValue))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor selecciona tu tipo de documento.",
                    "warning"
                );

                ddlTipoDocumento.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtDocumento.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa tu número de documento.",
                    "warning"
                );

                txtDocumento.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtCorreo.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa tu correo electrónico.",
                    "warning"
                );

                txtCorreo.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtCelular.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa tu número de celular.",
                    "warning"
                );

                txtCelular.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(ddlTipoSolicitud.SelectedValue))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor selecciona el tipo de solicitud.",
                    "warning"
                );

                ddlTipoSolicitud.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(ddlSede.SelectedValue))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor selecciona la sede relacionada.",
                    "warning"
                );

                ddlSede.Focus();
                return false;
            }

            if (!ValidarMotivos()) return false;

            if (string.IsNullOrWhiteSpace(txtAsunto.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa el asunto de tu solicitud.",
                    "warning"
                );

                txtAsunto.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
            {
                MostrarAlerta(
                    "Campo obligatorio",
                    "Por favor ingresa una descripción de tu solicitud.",
                    "warning"
                );

                txtDescripcion.Focus();
                return false;
            }

            if (!chkAutorizacionRadicar.Checked)
            {
                MostrarAlerta(
                    "Autorización requerida",
                    "Debes autorizar el tratamiento de tus datos personales para poder radicar la solicitud.",
                    "warning"
                );

                return false;
            }

            if (!ValidarArchivosRadicacion()) return false;

            return true;
        }

        private bool ValidarMotivos()
        {
            bool hayMotivoSeleccionado = false;

            foreach (ListItem item in chkMotivos.Items)
            {
                if (item.Selected)
                {
                    hayMotivoSeleccionado = true;
                    break;
                }
            }

            if (!hayMotivoSeleccionado)
            {
                MostrarAlerta(
                    "Motivo requerido",
                    "Debes seleccionar al menos un motivo para tu solicitud.",
                    "warning"
                );

                return false;
            }

            return true;
        }

        private bool ValidarArchivosRadicacion()
        {
            if (!fuSoportesRadicar.HasFiles) return true;

            if (fuSoportesRadicar.PostedFiles.Count > 3)
            {
                MostrarAlerta(
                    "Demasiados archivos",
                    "Puedes adjuntar máximo 3 archivos.",
                    "warning"
                );

                return false;
            }

            string[] extensionesPermitidas = { ".pdf", ".jpg", ".jpeg", ".png" };

            long pesoTotal = 0;

            foreach (HttpPostedFile archivo in fuSoportesRadicar.PostedFiles)
            {
                string extension = Path.GetExtension(archivo.FileName).ToLowerInvariant();

                if (!extensionesPermitidas.Contains(extension))
                {
                    MostrarAlerta(
                        "Archivo no permitido",
                        $"El archivo \"{archivo.FileName}\" no tiene un formato permitido. Solo puedes adjuntar archivos PDF, JPG o PNG.",
                        "warning"
                    );

                    return false;
                }

                pesoTotal += archivo.ContentLength;
            }

            const long maximoBytes = 10 * 1024 * 1024;

            if (pesoTotal > maximoBytes)
            {
                MostrarAlerta(
                    "Archivos demasiado grandes",
                    "El tamaño total de los archivos no puede superar los 10 MB.",
                    "warning"
                );

                return false;
            }

            return true;
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            dt.Dispose();
        }

        private void CargarTipo()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarTiposPQRS();

            ddlTipoSolicitud.DataSource = dt;
            ddlTipoSolicitud.DataBind();

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

        private void CargarMotivos()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarMotivosPQRS();

            chkMotivos.DataSource = dt;
            chkMotivos.DataBind();

            dt.Dispose();
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