using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class verificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    CargarDatosAfiliado();
                }
                else
                {
                    Response.Redirect("default");
                }
            }
        }

        //private DataTable TraerDatos(string strQuery)
        //{
        //    OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        //    myConnection.Open();
        //    DataTable dt = new DataTable();

        //    OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
        //    OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
        //    sqlDA.Fill(dt);
        //    myConnection.Close();

        //    return dt;
        //}

        private void CargarDatosAfiliado()
        {
            clasesglobales cg = new clasesglobales();
            string strQuery = "SELECT * FROM Afiliados WHERE idAfiliado = " + Request.QueryString["id"].ToString();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                idAfil.Value = dt.Rows[0]["idAfiliado"].ToString();
                name_contact.Value = dt.Rows[0]["NombreAfiliado"].ToString();
                lastname_contact.Value = dt.Rows[0]["ApellidoAfiliado"].ToString();
                email_contact.Value = dt.Rows[0]["EmailAfiliado"].ToString();
                phone_contact.Value = dt.Rows[0]["CelularAfiliado"].ToString();
                ViewState["EmailAfiliado"] = dt.Rows[0]["EmailAfiliado"].ToString();
                ViewState["ClaveAfiliado"] = dt.Rows[0]["ClaveAfiliado"].ToString();
            }
        }

        private void VerificarAfiliado()
        {
            if (verify_contact.Value.ToString() == "4")
            {
                try
                {
                    string strQuery = "UPDATE afiliados " +
                        "SET NombreAfiliado = '" + Request.Form["name_contact"].ToString() + "', " +
                        "ApellidoAfiliado = '" + Request.Form["lastname_contact"].ToString() + "', " +
                        "CelularAfiliado = '" + Request.Form["phone_contact"].ToString() + "', " +
                        "EstadoAfiliado = 'Activo' " +
                        "WHERE idAfiliado = " + Request.Form["idAfil"].ToString();

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

                    EnviarConfirmacion();

                }
                catch (Exception ex)
                {
                    ltMensaje.Text = "<table class=\"table table-striped nomargin\"><tbody><tr>" +
                        "<td class=\"total_confirm\">" + ex.Message + "</td></tr></tbody></table>";
                }
            }
            else
            {
                ltMensaje.Text = "<table class=\"table table-striped nomargin\"><tbody><tr>" +
                    "<td class=\"total_confirm\">Respuesta a la pregunta de validación incorrecta. Vuelve a intentar." +
                    "</td></tr></tbody></table>";
            }
        }

        private void EnviarConfirmacion()
        {
            clasesglobales cg = new clasesglobales();

            string strAsunto = "Verificación realizada";
            string strRemitente = "sistemas@fitnesspeoplecmd.com";
            //string strDestinatario = ViewState["EmailAfiliado"].ToString();
            string strDestinatario = "chrislemoce@gmail.com";
            string strMensaje = "Haz realizado la verificación correctamente.\r\n\r\n" +
                "Ahora puedes ingresar al Área de Afiliados a través de la página web: fitnesspeoplecolombia.com\r\n" +
                "Clave: " + ViewState["ClaveAfiliado"].ToString() + " \r\n\r\n";

            cg.EnviarCorreo(strRemitente, strDestinatario, strAsunto, strMensaje);
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            VerificarAfiliado();
        }
    }
}