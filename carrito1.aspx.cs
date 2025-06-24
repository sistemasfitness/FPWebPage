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
    public partial class carrito1 : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void lkbContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("tienda");
        }
    }
}