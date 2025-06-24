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
    public partial class producto : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txbCantidad.Attributes.Add("type", "number");
                txbCantidad.Attributes.Add("min", "1");

                if (Request.QueryString["id"].ToString() != "")
                {
                    string strQuery = "SELECT p.*, c.NombreCat, " +
                    "IF(p.idColorProd IS NOT NULL,CONCAT('Color: ',color.ColorProd),'') AS Color, " +
                    "IF(p.idTallaProd IS NOT NULL,CONCAT('Talla: ',talla.TallaProd),'') AS Talla, " +
                    "IF(p.MostrarInventario=1,CONCAT('<i class=\"icon-tags\"></i> ',i.stock, ' disponibles'),'') AS inventario " +
                    "FROM productos p " +
                    "LEFT JOIN CategoriasTienda c ON p.idCategoria = c.idCategoria " +
                    "LEFT JOIN tallasproductostienda talla ON p.idTallaProd = talla.idTallaProd " +
                    "LEFT JOIN coloresproductostienda color ON p.idColorProd = color.idColorProd " +
                    "LEFT JOIN inventario i ON p.idProducto = i.idProducto " +
                    "WHERE p.idProducto = " + Request.QueryString["id"].ToString();
                    DataTable dt = TraerDatos(strQuery);
                    if (dt.Rows.Count > 0)
                    {
                        ltNombreProd.Text = dt.Rows[0]["NombreProd"].ToString();
                        ltPrecioPublico.Text = "$" + string.Format("{0:N0}", dt.Rows[0]["PrecioPublicoProd"]);
                        ltCategoria.Text = dt.Rows[0]["NombreCat"].ToString();
                        ltDetalle.Text = dt.Rows[0]["DetalleProd"].ToString();
                        ltDescripcion.Text = dt.Rows[0]["DescripcionProd"].ToString();
                        ltCaracteristicas.Text = dt.Rows[0]["CaracteristicasProd"].ToString();
                        ltBeneficios.Text = dt.Rows[0]["BeneficiosProd"].ToString();
                        ltInventario.Text = dt.Rows[0]["inventario"].ToString();

                        if (dt.Rows[0]["Imagen2Prod"].ToString() == "")
                        {
                            ltImagenesProductos.Text = "<img src=\"img/productos/" + dt.Rows[0]["Imagen1Prod"].ToString() + "\" class=\"img-responsive\" />";
                        }
                        else
                        {
                            if (dt.Rows[0]["Imagen2Prod"].ToString() != "")
                            {
                                ltImagenesProductos.Text = "<div class=\"owl-carousel team-carousel2\">";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen1Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen2Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "</div>";
                            }
                            if (dt.Rows[0]["Imagen3Prod"].ToString() != "")
                            {
                                ltImagenesProductos.Text = "<div class=\"owl-carousel team-carousel2\">";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen1Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen2Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen3Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "</div>";
                            }
                            if (dt.Rows[0]["Imagen4Prod"].ToString() != "")
                            {
                                ltImagenesProductos.Text = "<div class=\"owl-carousel team-carousel2\">";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen1Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen2Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen3Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen4Prod"].ToString() + "\" /></div></div>";
                                ltImagenesProductos.Text += "</div>";
                            }
                        }

                        //ltImagenesProductos.Text = "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen1Prod"].ToString() + "\" /></div></div>";
                        //ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen2Prod"].ToString() + "\" /></div></div>";
                        //ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen3Prod"].ToString() + "\" /></div></div>";
                        //ltImagenesProductos.Text += "<div class=\"team-item\"><div class=\"team-item-img\"><img src=\"img/productos/" + dt.Rows[0]["Imagen4Prod"].ToString() + "\" /></div></div>";
                    }
                    else
                    {
                        Response.Redirect("default");
                    }
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

        //protected void btnAgregar_Click(object sender, EventArgs e)
        //{
            
        //}

        //protected void btnContinuar_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("tienda");
        //}

        protected void lkbAgregar_Click(object sender, EventArgs e)
        {
            string strQuery = "INSERT INTO DetallePedidos " +
                "(idPedido, idProducto, Cantidad) " +
                "VALUES ('" + Session["guid"].ToString() + "', " + Request.QueryString["id"].ToString() + ", " + txbCantidad.Text.ToString() + ") ";
            OdbcCommand command = new OdbcCommand(strQuery, myConnection);
            myConnection.Open();
            command.ExecuteNonQuery();
            command.Dispose();
            myConnection.Close();

            Response.Redirect("tienda");
        }
    }
}