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

            // ======= DATOS DEL SOLICITANTE =======
            int idTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedValue);
            string documento = txtDocumento.Text.Trim();
            string nombres = txtNombres.Text.Trim().ToUpper();
            string apellidos = txtApellidos.Text.Trim().ToUpper();
            string correo = txtCorreo.Text.Trim().ToLower();
            string celular = txtCelular.Text.Trim();
            int idSede = Convert.ToInt32(ddlSede.SelectedValue);

            clasesglobales cg = new clasesglobales();

            // ======= GESTIÓN DE AFILIADO =======
            DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(documento);

            int idAfiliado;

            if (dtAfiliado.Rows.Count > 0)
            {
                idAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["idAfiliado"]);

                cg.ActualizarAfiliadoPQRS(
                    documento,
                    nombres,
                    apellidos,
                    correo,
                    celular,
                    idSede
                );
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

            dtAfiliado.Dispose();

            // ======= ADMINISTRADOR DE LA SEDE =======
            DataTable dtAdmin = cg.ConsultarAdministradorPQRS(idSede);

            if (dtAdmin.Rows.Count == 0)
            {
                dtAdmin.Dispose();

                MostrarAlerta(
                    "No se pudo radicar",
                    "La sede seleccionada no tiene un administrador configurado.",
                    "error"
                );

                return;
            }

            int idAdministrador = Convert.ToInt32(dtAdmin.Rows[0]["idUsuario"]);
            dtAdmin.Dispose();

            // ======= DATOS DEL PQRS =======
            int idTipoSolicitud = Convert.ToInt32(ddlTipoSolicitud.SelectedValue);

            string asunto = txtAsunto.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();

            string codigoRadicacion = GenerarCodigoRadicacion();

            // ======= CREAR PQRS =======
            int idPQRS = cg.InsertarPQRSDevolverId(
                idAfiliado,
                idAdministrador,
                idSede, 
                codigoRadicacion,
                idTipoSolicitud,
                asunto,
                descripcion,
                1 // Radicado
            );

            // ======= REGISTRAR ESTADO INICIAL EN EL HISTORIAL =======
            cg.InsertarPQRSEstadoHistorial(
                idPQRS,
                1, // Radicado
                idAfiliado,
                null,
                "La PQRS ha sido radicada por el afiliado."
            );

            // ======= REGISTRAR MOTIVOS =======
            foreach (ListItem item in chkMotivos.Items)
            {
                if (item.Selected)
                {
                    int idMotivo = Convert.ToInt32(item.Value);
                    cg.InsertarPQRSMotivoSeleccionado(idMotivo, idPQRS);
                }
            }

            // ======= REGISTRAR ARCHIVOS =======
            if (fuSoportesRadicar.HasFiles)
            {
                GuardarArchivosRadicacion(
                    cg,
                    idPQRS,
                    codigoRadicacion
                );
            }
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

        private string GenerarCodigoRadicacion()
        {
            string fecha = DateTime.Now.ToString("yyyyMMdd");
            string codigoUnico = Guid.NewGuid()
                .ToString("N")
                .Substring(0, 6)
                .ToUpper();

            return $"FP-PQRS-{fecha}-{codigoUnico}";
        }

        private void GuardarArchivosRadicacion(clasesglobales cg, int idPQRS, string codigoRadicacion)
        {
            string rutaCarpeta = Server.MapPath("~/ArchivosPQRS/");

            if (!Directory.Exists(rutaCarpeta))
            {
                Directory.CreateDirectory(rutaCarpeta);
            }

            int consecutivo = 1;

            foreach (HttpPostedFile archivo in fuSoportesRadicar.PostedFiles)
            {
                string extension = Path.GetExtension(
                    archivo.FileName
                ).ToLowerInvariant();

                string nombreArchivo = $"{codigoRadicacion}-{consecutivo:D2}{extension}";

                string rutaArchivo = $"~/ArchivosPQRS/{nombreArchivo}";
                string rutaFisica = Server.MapPath(rutaArchivo);

                archivo.SaveAs(rutaFisica);

                cg.InsertarPQRSArchivo(
                    idPQRS,
                    null,
                    nombreArchivo,
                    rutaArchivo
                );

                consecutivo++;
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