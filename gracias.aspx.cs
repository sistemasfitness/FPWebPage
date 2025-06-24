using System;
using System.Collections.Generic;
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
                        confirm2.Visible = true;
                    }
                    if (Request.QueryString["msg"].ToString() == "5")
                    {
                        confirm3.Visible = true;
                    }
                }
                else
                {
                    confirm1.Visible = true;
                }
            }
        }
    }
}