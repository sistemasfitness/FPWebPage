using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebPage
{
    public partial class carrito2 : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ltTotal.Text = string.Format("{0:N0}", Session["total"]);
                if (!IsPostBack)
                {
                    string strQuery = "SELECT dp.idProducto, dp.Cantidad, p.NombreProd, p.PrecioPublicoProd, " +
                        "(p.PrecioPublicoProd * dp.Cantidad) AS Subtotal " +
                        "FROM DetallePedidos dp " +
                        "LEFT JOIN Productos p ON p.idProducto = dp.idProducto " +
                        "WHERE dp.idPedido = '" + Session["guid"].ToString() + "' ";
                    DataTable dt = TraerDatos(strQuery);

                    if (dt.Rows.Count > 0)
                    {
                        rpCarrito.DataSource = dt;
                        rpCarrito.DataBind();

                        int intTotal = 0;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            intTotal += Convert.ToInt32(dt.Rows[i]["Subtotal"].ToString());
                        }
                        ltTotal.Text = string.Format("{0:N0}", intTotal);
                        Session["total"] = intTotal;
                    }
                    else
                    {
                        Response.Redirect("tienda");
                    }
                }
            }
        }

        protected void lnkPagar_Click(object sender, EventArgs e)
        {
            string strQuery = "INSERT INTO Clientes " +
                "(Nombre, idTipoDocumento, NroDocumento, Celular, Direccion, Ciudad, Email) " +
                "VALUES ('" + fullname.Value.ToString() + "', " + ddlTipoDoc.SelectedItem.Value.ToString() + ", " +
                "'" + document.Value.ToString() + "', '" + phone.Value.ToString() + "', " +
                "'" + direccion.Value.ToString() + "', '" + ciudad.Value.ToString() + "', " +
                "'" + email.Value.ToString() + "') ";
            OdbcCommand command1 = new OdbcCommand(strQuery, myConnection);
            myConnection.Open();
            command1.ExecuteNonQuery();
            command1.Dispose();
            myConnection.Close();

            strQuery = "SELECT idCliente " +
                    "FROM Clientes " +
                    "ORDER by idCliente DESC LIMIT 1";
            
            DataTable dt1 = TraerDatos(strQuery);
            string strIdCliente = dt1.Rows[0]["idCliente"].ToString();

            strQuery = "INSERT INTO Pedidos " +
                "(idPedido, idCliente) " +
                "VALUES ('" + Session["guid"].ToString() + "', " + strIdCliente + ") ";
            OdbcCommand command2 = new OdbcCommand(strQuery, myConnection);
            myConnection.Open();
            command2.ExecuteNonQuery();
            command2.Dispose();
            myConnection.Close();

            dt1.Dispose();
                        
            string strTotal = Session["total"].ToString();

            string strDataWompi = Convert.ToBase64String(Encoding.Unicode.GetBytes(strIdCliente + "_" + strTotal + "_" + Session["guid"].ToString()));
            Response.Redirect("carrito3?code=" + strDataWompi);
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
    }
}