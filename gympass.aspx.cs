using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
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

        private bool Existe(string strDocumento)
        {
            string strQuery = "SELECT NroDocumento FROM GymPass WHERE NroDocumento = " + strDocumento;
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string strNombre = name_contact.Value.ToString();
            string strApellido = lastname_contact.Value.ToString();
            string strEmail = email_contact.Value.ToString();
            string strCelular = phone_contact.Value.ToString();
            string strDocumento = id_contact.Value.ToString();
            string strSede = ddlSede.SelectedItem.Value.ToString();
            string strFechaAsistencia = date_contact.Value.ToString();

            //Buscamos el documento en la tabla GymPass. Si no existe, creamos el afiliado. Si existe, actualizamos Correo, Celular, Ciudad, Sede y Plan
            if (Existe(strDocumento))
            {
                //Mensaje de ya existe
                Response.Redirect("gracias?msg=4");
            }
            else
            {
                //Si no existe el documento del afiliado, lo creamos como nuevo.
                string strQuery = "INSERT INTO GymPass " +
                    "(Nombres, Apellidos, Email, Celular, NroDocumento, " +
                    "idSede, FechaAsistencia, FechaInscripcion) " +
                    "VALUES ('" + strNombre + "', '" + strApellido + "', " +
                    "'" + strEmail + "', '" + strCelular + "', " +
                    "'" + strDocumento + "', " + strSede + ", '" + strFechaAsistencia + "', NOW()) ";

                try
                {
                    string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                    using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                    {
                        mysqlConexion.Open();
                        using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }
                        mysqlConexion.Close();
                    }
                }
                catch (Exception ex)
                {
                    string respuesta = "ERROR: " + ex.Message;
                }

                Response.Redirect("gracias?msg=5");
            }
        }
    }
}