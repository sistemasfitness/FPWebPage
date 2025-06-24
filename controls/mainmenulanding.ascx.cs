using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage.controls
{
    public partial class mainmenulanding : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idAfil"] != null)
            {
                ltMenu1.Text = "<li><a href=\"logout\" class=\"hidden-xs\">SALIR</a></li>";
                ltMenu2.Text = "<li><a href=\"logout\" style=\"font-weight: 900;\" class=\"visible-xs\">SALIR</a></li>";
                ltMenuAfil.Text = "<li><a href=\"mainAfil\" style=\"font-weight: 900;\">MI CUENTA</a></li>";
            }
            else
            {
                //ltMenu1.Text = "<li><a href=\"#\" data-toggle=\"modal\" data-target=\"#login\" class=\"hidden-xs\">INICIO SESIÓN</a></li>";
                //ltMenu2.Text = "<li><a href=\"#\" style=\"font-weight: 900;\" data-toggle=\"modal\" data-target=\"#login\" class=\"visible-xs\">INICIO SESIÓN</a></li>";
                ltMenuAfil.Text = "";
            }
        }
    }
}