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
    public partial class mainAfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Form.Count > 0)
                {
                    if (ConsultarAfiliado(Request.Form["email"].ToString(), Request.Form["clave"].ToString()))
                    {
                        CargarDatosAfiliado();
                    }
                    else
                    {
                        Response.Redirect("default");
                    }
                }
                else
                {
                    if (Session["idAfil"] == null)
                    {
                        Response.Redirect("default");
                    }
                    else
                    {
                        CargarDatosAfiliado();
                    }
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

        private bool ConsultarAfiliado(string strEmail, string strClave)
        {
            string strQuery = "SELECT * FROM Afiliados WHERE EmailAfiliado = '" + strEmail + "' AND ClaveAfiliado = '" + strClave + "' ";
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                Session.Add("idAfil", dt.Rows[0]["idAfiliado"].ToString());
                return true;
            }
            else
            {
                return false;
            }
        }

        private void CargarDatosAfiliado()
        {
            string strQuery = "SELECT * FROM Afiliados WHERE idAfiliado = " + Session["idAfil"].ToString();
            DataTable dt = TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                ltNombreAfiliado.Text = dt.Rows[0]["NombreAfiliado"].ToString() + " " + dt.Rows[0]["ApellidoAfiliado"].ToString();
            }
        }
    }
}