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
    public partial class tienda : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["guid"] == null)
            {
                Guid g = Guid.NewGuid();
                Session["guid"] = g;
            }

            ltCarrito.Text = Session["guid"].ToString();

            if (!IsPostBack)
            {
                string strQuery = "SELECT p.*, c.NombreCat, " +
                    "IF(p.idColorProd IS NOT NULL,CONCAT('Color: ',color.ColorProd),'') AS Color, " +
                    "IF(p.idTallaProd IS NOT NULL,CONCAT('Talla: ',talla.TallaProd),'') AS Talla, " +
                    "IF(p.MostrarInventario=1,CONCAT('<i class=\"fa fa-tag\"></i> ',i.stock),'') AS inventario " +
                    "FROM productos p " +
                    "LEFT JOIN CategoriasTienda c ON p.idCategoria = c.idCategoria " +
                    "LEFT JOIN tallasproductostienda talla ON p.idTallaProd = talla.idTallaProd " +
                    "LEFT JOIN coloresproductostienda color ON p.idColorProd = color.idColorProd " +
                    "LEFT JOIN inventario i ON p.idProducto = i.idProducto ";
                DataTable dt1 = TraerDatos(strQuery);
                if (dt1.Rows.Count > 0)
                {
                    rpProductos.DataSource = dt1;
                    rpProductos.DataBind();
                }
                dt1.Dispose();

                strQuery = "SELECT SUM(cantidad) AS cuantos FROM DetallePedidos WHERE idPedido = '" + Session["guid"].ToString() + "' ";
                DataTable dt2 = TraerDatos(strQuery);
                ltCantidad.Text = dt2.Rows[0]["cuantos"].ToString();
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
    }
}