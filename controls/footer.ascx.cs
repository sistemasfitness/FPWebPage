﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage.controls
{
    public partial class footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int anhoActual = DateTime.Now.Year;
            ltAnho.Text = anhoActual.ToString();
        }
    }
}