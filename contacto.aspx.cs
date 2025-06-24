using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Form.Count > 0)
                {
                    EnviarCorreo();
                }
            }
        }

        private void EnviarCorreo()
        {
            MailMessage objeto_mail = new MailMessage();
            objeto_mail.From = new MailAddress(Request.Form["email_contact"].ToString());
            MailAddress maTo = new MailAddress("sistemas@fitnesspeoplecmd.com");
            objeto_mail.To.Add(maTo);
            //if (ViewState["language"].ToString() == "es")
            //{
            objeto_mail.Subject = "Mensaje de Contacto Pagina Web";
            objeto_mail.Body = "Mensaje enviado desde la pagina web de Fitness People, sección Contacto.\r\n\r\n";
            objeto_mail.Body = objeto_mail.Body + "Nombres: " + Request.Form["name_contact"].ToString() + "\r\n\r\n";
            objeto_mail.Body = objeto_mail.Body + "Apellidos: " + Request.Form["lastname_contact"].ToString() + "\r\n\r\n";
            objeto_mail.Body = objeto_mail.Body + "Email: " + Request.Form["email_contact"].ToString() + "\r\n\r\n";
            objeto_mail.Body = objeto_mail.Body + "Celular: " + Request.Form["phone_contact"].ToString() + "\r\n\r\n";
            objeto_mail.Body = objeto_mail.Body + "Mensaje: " + Request.Form["message_contact"].ToString() + "\r\n\r\n";

            SmtpClient client = new SmtpClient();
            client.Host = "localhost";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential("sistemas@fitnesspeoplecmd.com", "Chrismo1976*");

            try
            {
                client.Send(objeto_mail);
                objeto_mail.Dispose();
                Response.Redirect("default");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                Response.Redirect("default");
            }

        }
    }
}