using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random aleatorio = new Random();
            //int numero = aleatorio.Next(2, 3);
            int numero = aleatorio.Next(1, 2);
            switch (numero)
            {
                case 1:
                    divVideo.Visible = true;
                    break;
                case 2:
                    //divImage.Visible = true;
                    break;
                default:
                    break;
            }
        }
    }
}