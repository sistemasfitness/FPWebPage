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
	public partial class estudiafit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                txtCedula.Attributes.Add("type", "number");

                clasesglobales cg = new clasesglobales();

                DataTable dtPlan = cg.ConsultarPlanPorId(9);

                if (dtPlan.Rows.Count > 0)
                {
                    ltBannerFull.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/banners/" + dtPlan.Rows[0]["BannerWeb"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                    ltBannerFull.Text += "<div id=\"sub_content_in\" style='align-content: end;' >";
                    ltBannerFull.Text += "<h1 style=\"font-weight: 900;\">" + dtPlan.Rows[0]["NombrePlan"].ToString().ToUpper() + "</h1>";
                    ltBannerFull.Text += "<p style=\"font-weight: 900; color: #e3ff00;\">¡Estudiar y Entrenar nunca fue tan fácil!</p>";
                    ltBannerFull.Text += "</div>";
                    ltBannerFull.Text += "</section>";

                    ltTitulo.Text = dtPlan.Rows[0]["TituloPlan"].ToString();
                    ltDescripcion.Text = dtPlan.Rows[0]["DescripcionPlanWeb"].ToString();

                    ltImagenMarketing.Text = "<img src=\"img/planes/" + dtPlan.Rows[0]["ImagenMarketing"].ToString() + "\" alt=\"\" class=\"img-responsive\" style=\"cursor: pointer; border-radius: 15px;\" />";
                }
                else
                {
                    Response.Redirect("default");
                }

                string strQuery = "SELECT * FROM CiudadesSedes " +
                    "WHERE idCiudadSede <> 5 ";
                DataTable dt1 = cg.TraerDatos(strQuery);

                ddlCiudad.DataSource = dt1;
                ddlCiudad.DataBind();

                dt1.Dispose();
                ddlSedes.Enabled = false;
            }
        }

        protected void btnRegistrarEstudiante_Click(object sender, EventArgs e)
        {
            try
            {
                string documento = txtCedula.Text.Trim();
                string codigoUniversidad = txtCodigoUniversidad.Text.Trim();

                if (documento == "" || codigoUniversidad == "")
                {
                    MostrarAlerta("Campos requeridos", "Por favor, llena todos los campos para poder continuar.", "warning");
                    return;
                }

                clasesglobales cg = new clasesglobales();

                // Consulta de existencia de documento en la BD
                DataTable dtEstudiafit = cg.ConsultarEstudiafitPorDocumento(documento);

                if (dtEstudiafit.Rows.Count > 0)
                {
                    MostrarAlerta("Ya estás registrado", "Este número de cédula ya se encuentra registrada en el sistema.", "info");
                    return;
                }

                DataTable dtCodUni = cg.ConsultarEstudiafitUniPorCodigo(codigoUniversidad);

                if (dtCodUni.Rows.Count <= 0)
                {
                    MostrarAlerta("Código inválido", "El código de universidad que ingresaste no es válido. Verifica y vuelve a intentarlo.", "error");
                    return;
                }

                HttpPostedFile postedFile = Request.Files["fileCarnet"];
                string nombreArchivo = "";

                if (postedFile == null || postedFile.ContentLength <= 0)
                {
                    MostrarAlerta("Archivo requerido", "Por favor, sube tu carnet estudiantil vigente en formato PDF o imagen.", "warning");
                    return;
                }

                string extension = Path.GetExtension(postedFile.FileName).ToLower();

                if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".pdf")
                {
                    MostrarAlerta("Archivo no válido", "Solo se permiten archivos en formato PDF o imágenes (JPG, PNG).", "error");
                    return;
                }

                nombreArchivo = DateTime.Now.ToString("yyyyMMdd-HHmmss_") + Path.GetFileName(postedFile.FileName.Replace(" ", "-"));
                string rutaGuardado = Server.MapPath("img//estudiafit//carnets-uni//") + nombreArchivo;
                postedFile.SaveAs(rutaGuardado);

                int codUni = int.Parse(dtCodUni.Rows[0]["idUni"].ToString());

                cg.InsertarEstudiafit(documento, codUni, nombreArchivo);

                dtEstudiafit.Dispose();
                dtCodUni.Dispose();

                // Función de limpieza de campos
                LimpiarFormulario();

                // TODO: Redireccionar al link de CLEZ para realizar el pago
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ocurrió un error inesperado al procesar tu registro.", "error");
                System.Diagnostics.Debug.WriteLine("Error en btnRegistrarEstudiante_Click: " + ex.ToString());
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

            ListItem li = new ListItem("Seleccione", "");
            ddlSedes.Items.Clear();
            ddlSedes.Items.Add(li);
            ddlSedes.DataSource = dt;
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected void ddlSedes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("sedes?id=" + ddlSedes.SelectedItem.Value.ToString());
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
                showCloseButton: true, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }

        protected void LimpiarFormulario()
        {
            // Limpiar los TextBox
            txtCedula.Text = "";
            txtCodigoUniversidad.Text = "";

            string script = @"
            <script>
                document.getElementById('fileCarnet').value = '';
                document.getElementById('archivoSeleccionado').style.display = 'none';
                document.getElementById('textoArchivoSeleccionado').textContent = '';
                document.getElementById('archivoInicial').style.display = 'inline-block';
            </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "limpiarFile", script);
        }
    }
}