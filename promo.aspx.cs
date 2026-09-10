using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using WebPage.controls;
using static NPOI.SS.Formula.PTG.ArrayPtg;
using static WebPage.Services.SiigoClient;

namespace WebPage
{
    public partial class promo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("default", true);

            string embajador = Request.QueryString["emb"];

            if (string.IsNullOrEmpty(embajador) || embajador != "felipe-acuña")
            {
                Response.Redirect("default.aspx");
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
        }
    }
}