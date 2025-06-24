using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Odbc;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace WebPage
{
    public partial class carrito4 : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            string strReferencia = Request.QueryString["id"].ToString();
            string strEnv = Request.QueryString["env"].ToString();
            string strGuid = Request.QueryString["guid"].ToString();

            string strQuery = "SELECT dp.idProducto, dp.Cantidad, p.NombreProd, p.PrecioPublicoProd, " +
                "(p.PrecioPublicoProd * dp.Cantidad) AS Subtotal " +
                "FROM DetallePedidos dp " +
                "LEFT JOIN Productos p ON p.idProducto = dp.idProducto " +
                "LEFT JOIN pedidos ped ON ped.idPedido = dp.idPedido " +
                "LEFT JOIN clientes cli ON cli.idCliente = ped.idCliente " +
                "WHERE dp.idPedido = '" + Session["guid"].ToString() + "' ";
            DataTable dt = TraerDatos(strQuery);

            if (dt.Rows.Count > 0)
            {
                rpCarrito.DataSource = dt;
                rpCarrito.DataBind();

                ViewState["emailcliente"] = dt.Rows[0]["email"].ToString();
            }

            try
            {
                strQuery = "UPDATE pedidos " +
                    "SET FechaPago = NOW(), " +
                    "idRefpago = '" + strReferencia + "', " +
                    "pagado = 1 " +
                    "WHERE idPedido = '" + strGuid + "' ";
                OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                myConnection.Open();
                command.ExecuteNonQuery();
                command.Dispose();
                myConnection.Close();


                EnviarCorreo(ViewState["emailcliente"].ToString());
            }
            catch (Exception ex)
            {
                string strMensaje = ex.Message;
            }
        }

        private DataTable TraerDatos(string strQuery)
        {
            myConnection.Open();
            DataTable dt = new DataTable();

            OdbcCommand sqlCmd = new OdbcCommand(strQuery, myConnection);
            OdbcDataAdapter sqlDA = new OdbcDataAdapter(sqlCmd);
            sqlDA.Fill(dt);
            myConnection.Close();

            return dt;
        }

        private void EnviarCorreo(string email)
        {
            MailMessage objeto_mail = new MailMessage();
            objeto_mail.From = new MailAddress("sistemas@fitnesspeoplecmd.com");
            MailAddress maTo = new MailAddress(email);
            objeto_mail.To.Add(maTo);
            objeto_mail.Subject = "Mensaje de People Wear";
            objeto_mail.Body = "Mensaje enviado desde la pagina web de Fitness People, tienda virtual People Wear.\r\n\r\n";
            
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