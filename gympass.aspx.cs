using MySql.Data.MySqlClient;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class gympass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listaSedes();
                date_contact.Attributes.Add("type", "date");
            }

            date_contact.Attributes.Add("min", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
        }

        public DataTable TraerDatos(string strQuery)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        private void listaSedes()
        {
            string strQuery = "SELECT s.idSede, CONCAT(s.NombreSede, ' - ', cs.NombreCiudadSede) AS NombreSede " +
                "FROM Sedes s " +
                "LEFT JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                "WHERE s.idSede <> 11 " +
                "ORDER BY cs.NombreCiudadSede, s.NombreSede";
            DataTable dt = TraerDatos(strQuery);
            ddlSede.DataSource = dt;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                string strNombre = name_contact.Value.ToString();
                string strApellido = lastname_contact.Value.ToString();
                string strCorreo = email_contact.Value.ToString();
                string strCelular = phone_contact.Value.ToString();
                string strDocumento = id_contact.Value.ToString();
                string strSedeValor = ddlSede.SelectedItem.Value;
                string strSedeTexto = ddlSede.SelectedItem.Text;
                string strFechaAsistencia = date_contact.Value.ToString();

                // Validación de sede seleccionada
                if (string.IsNullOrWhiteSpace(strSedeValor))
                {
                    MostrarAlerta("Campo requerido", "Por favor, selecciona una sede para poder continuar.", "warning");
                    return;
                }

                clasesglobales cg = new clasesglobales();

                // Consulta de existencia de documento en la BD
                DataTable dtConcursoGymPass = cg.ConsultarGymPassPorDocumento(strDocumento);

                if (dtConcursoGymPass.Rows.Count > 0)
                {
                    MostrarAlerta("Ya estás registrado", "Este número de cédula ya se encuentra registrada en el sistema.", "info");
                    return;
                }

                cg.InsertarGymPass(strNombre, strApellido, strDocumento, strCorreo, strCelular, int.Parse(strSedeValor), strFechaAsistencia);

                dtConcursoGymPass.Dispose();

                // Función de limpieza de campos
                LimpiarFormulario();

                MostrarAlerta("Registro exitoso", "Felicitaciones, has ganado un día de cortesía en Fitness People.", "success");

            } catch (Exception ex)
            {
                MostrarAlerta("Error", "Ocurrió un error inesperado al procesar tu registro.", "error");
                System.Diagnostics.Debug.WriteLine("Error en btnEnviar_Click: " + ex.ToString());
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
            // TextBox o Input tipo texto
            name_contact.Value = string.Empty;
            lastname_contact.Value = string.Empty;
            id_contact.Value = string.Empty;
            email_contact.Value = string.Empty;
            phone_contact.Value = string.Empty;
            date_contact.Value = string.Empty;

            // DropDownList
            ddlSede.ClearSelection();
        }
    }
}