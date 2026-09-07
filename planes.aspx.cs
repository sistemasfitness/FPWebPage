using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class planes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"].ToString() != "")
                {
                    clasesglobales cg = new clasesglobales();

                    DataTable dt = cg.ConsultarPlanWebPorId(Convert.ToInt32(Request.QueryString["id"].ToString()));

                    if (dt.Rows.Count > 0)
                    {
                        int idPlan = Convert.ToInt32(dt.Rows[0]["idPlan"]);
                        string nombrePlan = dt.Rows[0]["NombrePlan"].ToString();
                        int valorPlan = Convert.ToInt32(dt.Rows[0]["precioTotal"]);
                        string enlacePago = dt.Rows[0]["EnlacePago"].ToString();

                        string bannerWeb = dt.Rows[0]["BannerWeb"].ToString();
                        string tituloPlan = dt.Rows[0]["TituloPlan"].ToString();
                        string descripcionPlanWeb = dt.Rows[0]["DescripcionPlanWeb"].ToString();
                        string imagenMarketing = dt.Rows[0]["ImagenMarketing"].ToString();

                        ltBannerFull.Text = GenerarBannerPago(idPlan, nombrePlan, valorPlan, enlacePago, bannerWeb);

                        ltTitulo.Text = tituloPlan;
                        ltDescripcion.Text = descripcionPlanWeb;

                        ltImagenMarketing.Text = GenerarImagenPago(idPlan, nombrePlan, valorPlan, enlacePago, imagenMarketing);

                        string htmlBoton = GenerarBotonPago(idPlan, nombrePlan, valorPlan, enlacePago);

                        ltBotonPago.Text = htmlBoton;
                        ltBotonPago2.Text = htmlBoton;
                        ltBotonPago3.Text = htmlBoton;
                    }
                    else
                    {
                        Response.Redirect("default");
                    }

                    dt.Dispose();

                    //GenerarBarraProgreso();

                    string strQuery = "SELECT * FROM CiudadesSedes " +
                        "WHERE idCiudadSede <> 5 ";
                    DataTable dt1 = cg.TraerDatos(strQuery);

                    ddlCiudad.DataSource = dt1;
                    ddlCiudad.DataBind();

                    dt1.Dispose();
                    ddlSedes.Enabled = false;
                }
            }
        }

        private string GenerarBannerPago(int idPlan, string nombrePlan, int valorPlan, string enlacePago, string bannerWeb)
        {
            string jsName = HttpUtility.JavaScriptStringEncode(nombrePlan ?? "");
            string jsUrl = HttpUtility.JavaScriptStringEncode(enlacePago ?? "");

            return
                $"<a href=\"#\" onclick=\"planAddToCart(['{idPlan}'], '{jsName}', {valorPlan}, '{jsUrl}'); return false;\">" +
                    $"<section class=\"parallax_window_in\" " +
                        $"data-parallax=\"scroll\" data-image-src=\"img/banners/{bannerWeb}\" " +
                        "data-natural-width=\"1400\" data-natural-height=\"470\" " +
                        "style=\"cursor:pointer;\">" +
                    "</section>" +
                "</a>";
        }

        private string GenerarImagenPago(int idPlan, string nombrePlan, int valorPlan, string enlacePago, string imagenMarketing)
        {
            string jsName = HttpUtility.JavaScriptStringEncode(nombrePlan ?? "");
            string jsUrl = HttpUtility.JavaScriptStringEncode(enlacePago ?? "");

            return
                $"<a href=\"#\" onclick=\"planAddToCart(['{idPlan}'], '{jsName}', {valorPlan}, '{jsUrl}'); return false;\">" +
                    $"<img src=\"img/planes/{imagenMarketing}\" alt=\"\" class=\"img-responsive\" style=\"border-radius: 15px;\" />" +
                "</a>";
        }

        private string GenerarBotonPago(int idPlan, string nombrePlan, int valorPlan, string enlace)
        {
            string jsName = HttpUtility.JavaScriptStringEncode(nombrePlan ?? "");
            string jsUrl = HttpUtility.JavaScriptStringEncode(enlace ?? "");

            string jsContentId = $"['{idPlan}']";

            return 
                $"<a href=\"#\" onclick=\"planAddToCart({jsContentId}, '{jsName}', {valorPlan}, '{jsUrl}'); return false;\">" +
                    "<img src=\"img/comprar_ahora.png\" style=\"width: 300px;\" alt=\"Comprar ahora\" />" +
                "</a>";
        }

        private void GenerarBarraProgreso()
        {
            int idPlan = int.Parse(Request.QueryString["id"].ToString());

            if (idPlan == 15)
            {
                clasesglobales cg = new clasesglobales();

                DataTable dt = cg.ConsultarPlanPorId(15);

                if (dt.Rows.Count > 0)
                {
                    // Mostrar barra de retroceso
                    barraProgreso.Visible = true;

                    // Fechas de ejemplo (puedes cargarlas de base de datos o lógica de negocio)
                    DateTime fechaInicio = new DateTime(2025, 8, 11, 0, 0, 0);
                    DateTime fechaFin = new DateTime(2025, 8, 20, 23, 59, 59); // AAAA,MM,DD,HH,MM,SS

                    string script = $@"
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {{
                            iniciarTemporizador('{fechaInicio:yyyy-MM-ddTHH:mm:ss}', '{fechaFin:yyyy-MM-ddTHH:mm:ss}');
                        }});
                    </script>";

                    litScriptFechas.Text = script;
                }
            }
            else
            {
                // Ocultar el section si no se cumple la condición
                barraProgreso.Visible = false;
            }
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSedes.Enabled = true;
            clasesglobales cg = new clasesglobales();

            string strQuery = "SELECT * " +
            "FROM Sedes " +
            "WHERE idCiudadSede = " + ddlCiudad.SelectedItem.Value.ToString() + " " +
            "AND idSede <> 11 ";
            DataTable dt = cg.TraerDatos(strQuery);

            ListItem li = new ListItem("Seleccione", "");
            ddlSedes.Items.Clear();
            ddlSedes.Items.Add(li);
            ddlSedes.DataSource = dt;
            ddlSedes.DataBind();

            dt.Dispose();
        }

        protected void ddlSedes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("sedes?id=" + ddlSedes.SelectedItem.Value.ToString());
        }

        //protected void btnRedireccionarRegresarRegister_Click(object sender, EventArgs e)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dtToken = cg.ConsultarTokenPorIdPlanYIdVendedor(21, 156);

        //    string token = dtToken.Rows.Count > 0 ? dtToken.Rows[0]["token"].ToString() : "";

        //    Response.Redirect($"register.aspx?token={token}", false);
        //    Context.ApplicationInstance.CompleteRequest();
        //}
    }
}