using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class gracias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    if (Request.QueryString["msg"].ToString() == "4")
                    {
                        //confirm2.Visible = true;
                    }
                    if (Request.QueryString["msg"].ToString() == "5")
                    {
                        //confirm3.Visible = true;
                    }
                }
                else
                {
                    //confirm1.Visible = true;
                }

                clasesglobales cg = new clasesglobales();

                string strQuery = "SELECT * FROM Sedes s " +
                    "INNER JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                    "WHERE idSede <> 11 " +
                    "ORDER BY NombreCiudadSede ";

                DataTable dt2 = cg.TraerDatos(strQuery);
                if (dt2.Rows.Count > 0)
                {
                    rpSedes.DataSource = dt2;
                    rpSedes.DataBind();
                    dt2.Dispose();
                }
            }
        }
    }
}