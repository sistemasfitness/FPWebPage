using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class blog : System.Web.UI.Page
    {
        OdbcConnection myConnection = new OdbcConnection(ConfigurationManager.AppSettings["sConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    ListarArticulos(Request.QueryString["idCat"].ToString());
                }
                else
                {
                    ListarArticulos("todos");
                }
                ListarCategorias();
            }
        }

        private void ListarArticulos(string idCat)
        {
            string strQuery = "";
            if (idCat == "todos")
            {
                strQuery = "SELECT * FROM articulosblog ab " +
                "RIGHT JOIN categoriasblog cb ON ab.idCategoriaBlog = cb.idCategoriaBlog " +
                "RIGHT JOIN usuarios u ON ab.idUsuario = u.idUsuario " +
                "ORDER BY FechaArticulo DESC " +
                "LIMIT 3";
            }
            else
            {
                strQuery = "SELECT * FROM articulosblog ab " +
                "RIGHT JOIN categoriasblog cb ON ab.idCategoriaBlog = cb.idCategoriaBlog " +
                "RIGHT JOIN usuarios u ON ab.idUsuario = u.idUsuario " +
                "WHERE ab.idCategoriaBlog = " + idCat + " " +
                "ORDER BY FechaArticulo DESC " +
                "LIMIT 3";
            }
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                rpBlog.DataSource = dt;
                rpBlog.DataBind();
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