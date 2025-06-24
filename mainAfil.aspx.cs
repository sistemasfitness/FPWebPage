using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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

        private bool ConsultarAfiliado(string strEmail, string strClave)
        {
            clasesglobales cg = new clasesglobales();
            string strQuery = "SELECT * FROM Afiliados WHERE EmailAfiliado = '" + strEmail + "' AND ClaveAfiliado = '" + strClave + "' ";
            DataTable dt = cg.TraerDatos(strQuery);
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
            clasesglobales cg = new clasesglobales();
            string strQuery = "SELECT * FROM Afiliados WHERE idAfiliado = " + Session["idAfil"].ToString();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                ltNombreAfiliado.Text = dt.Rows[0]["NombreAfiliado"].ToString() + " " + dt.Rows[0]["ApellidoAfiliado"].ToString();
            }
        }
    }
}