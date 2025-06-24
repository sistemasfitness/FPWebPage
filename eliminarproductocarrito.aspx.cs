using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class eliminarproductocarrito : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strQuery = "DELETE " +
                    "FROM DetallePedidos " +
                    "WHERE idPedido = '" + Session["guid"].ToString() + "' " +
                    "AND idProducto = " + Request.QueryString["idProd"].ToString();

                OdbcCommand command = new OdbcCommand(strQuery, myConnection);
                myConnection.Open();
                command.ExecuteNonQuery();
                command.Dispose();
                myConnection.Close();

                Response.Redirect("carrito1");
                
            }
        }
    }
}