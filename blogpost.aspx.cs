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
    public partial class blogpost : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    MostrarArticulo(Request.QueryString["idArt"].ToString());
                    //ContarComentarios();
                }
                else
                {
                    Response.Redirect("blog");
                }
                ListarCategorias();
            }
        }

        private void MostrarArticulo(string idArt)
        {
            string strQuery = "";
            strQuery = "SELECT * FROM articulosblog ab " +
                "RIGHT JOIN categoriasblog cb ON ab.idCategoriaBlog = cb.idCategoriaBlog " +
                "RIGHT JOIN usuarios u ON ab.idUsuario = u.idUsuario " +
                "WHERE ab.idArticuloBlog = " + idArt;
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                ltImagenPost.Text = "<img src=\"img/blog/" + dt.Rows[0]["ImagenArticulo"].ToString() + "\" alt=\"\" class=\"img-responsive\">";
                ltFechaPost.Text = String.Format("{0:MMM dd, yyyy}", dt.Rows[0]["FechaArticulo"]);
                ltAutorPost.Text = dt.Rows[0]["NombreUsuario"].ToString();
                ltCategoria.Text = dt.Rows[0]["NombreCategoria"].ToString();
                ltTituloPost.Text = dt.Rows[0]["TituloArticulo"].ToString();
                ltPost.Text = dt.Rows[0]["Articulo"].ToString();
            }
        }

        private void ListarCategorias()
        {
            string strQuery = "SELECT * FROM categoriasblog ";
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                rpCategorias.DataSource = dt;
                rpCategorias.DataBind();
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