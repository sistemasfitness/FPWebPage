using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Odbc;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Antlr.Runtime.Misc;
using System.Net.Mail;

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

        private DataTable TraerDatos(string strQuery)
        {
            OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
            myConnection.Open();
            DataTable dt = new DataTable();

            OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
            OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
            sqlDA.Fill(dt);
            myConnection.Close();

            return dt;
        }

        private void CargarDatosAfiliado()
        {
            string strQuery = "SELECT * FROM Afiliados WHERE idAfiliado = " + Request.QueryString["id"].ToString();
            DataTable dt = TraerDatos(strQuery);
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
                OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
                try
                {
                    string strQuery = "UPDATE afiliados " +
                        "SET NombreAfiliado = '" + Request.Form["name_contact"].ToString() + "', " +
                        "ApellidoAfiliado = '" + Request.Form["lastname_contact"].ToString() + "', " +
                        "CelularAfiliado = '" + Request.Form["phone_contact"].ToString() + "', " +
                        "EstadoAfiliado = 'Activo' " +
                        "WHERE idAfiliado = " + Request.Form["idAfil"].ToString();
                    OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                    myConnection.Open();
                    command.ExecuteNonQuery();
                    command.Dispose();
                    myConnection.Close();

                    EnviarConfirmacion();

                    //Response.Redirect("default");
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
            string strAsunto = "Verificación realizada";
            string strRemitente = "contabilidad@fitnesspeoplecolombia.com";
            string strDestinatario = ViewState["EmailAfiliado"].ToString();
            string strMensaje = "Haz realizado la verificación correctamente.\r\n\r\n" +
                "Ahora puedes ingresar al Área de Afiliados a través de la página web: fitnesspeoplecolombia.com\r\n" +
                "Clave: " + ViewState["ClaveAfiliado"].ToString() + " \r\n\r\n";
            MailMessage objeto_mail = new MailMessage();
            objeto_mail.From = new MailAddress(strRemitente);
            MailAddress maTo = new MailAddress(strDestinatario);
            objeto_mail.To.Add(maTo);
            objeto_mail.Subject = strAsunto;
            objeto_mail.Body = strMensaje;

            SmtpClient client = new SmtpClient();
            client.Host = "localhost";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential("contabilidad@fitnesspeoplecolombia.com", "K)961558128719os");

            try
            {
                client.Send(objeto_mail);
                objeto_mail.Dispose();
            }
            catch (Exception ex)
            {
                ltMensaje.Text = "<table class=\"table table-striped nomargin\"><tbody><tr>" +
                    "<td class=\"total_confirm\">" + ex.Message + "</td></tr></tbody></table>";
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            VerificarAfiliado();
        }
    }
}