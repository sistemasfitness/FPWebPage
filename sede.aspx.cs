using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.controls;

namespace WebPage
{
    public partial class sede : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"].ToString() != "")
                {
                    CargarSede();
                    CargarGaleria();
                    ConfigurarFAQ();
                }
            }
        }

        private void CargarSede()
        {
            string strQuery = "SELECT * FROM Sedes s " +
                        "INNER JOIN CiudadesSedes cs ON s.idCiudadSede = cs.idCiudadSede " +
                        "WHERE s.idSede = " + Request.QueryString["id"].ToString();
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                ltNombreSede.Text = dt.Rows[0]["NombreSede"].ToString();
                ltCiudadSede.Text = dt.Rows[0]["NombreCiudadSede"].ToString();
                ltNombreSede2.Text = dt.Rows[0]["NombreSede"].ToString();
                ltCiudadSede2.Text = dt.Rows[0]["NombreCiudadSede"].ToString();
                ltDireccionSede.Text = dt.Rows[0]["DireccionSede"].ToString();
                ltTelefonoSede.Text = "<a href='https://wa.me/57" + dt.Rows[0]["TelefonoSede"].ToString() + "' target='_blank'>" + dt.Rows[0]["TelefonoSede"].ToString() + "</a>";
                ltHorarioSede.Text = dt.Rows[0]["HorarioSede"].ToString();
                ltMapa.Text = dt.Rows[0]["GoogleMaps"].ToString();

                //ltImagenBG.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"https://fpadmin.fitnesspeoplecolombia.com/img/sedes/banners/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                ltImagenBG.Text = "<section class=\"parallax_window_in\" data-parallax=\"scroll\" data-image-src=\"img/sedes/banners/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" data-natural-width=\"1400\" data-natural-height=\"470\">";
                //ltImagenRecuadro.Text = "<img src=\"img/sedes/" + dt.Rows[0]["ImagenBanner"].ToString() + "\" alt=\"\" class=\"img-responsive\" />";
            }
            else
            {
                Response.Redirect("default");
            }
        }

        private void CargarGaleria()
        {
            string strQuery = "SELECT NombreImagen, NombreSede FROM GaleriaSedes gs " +
                        "INNER JOIN Sedes s ON gs.idSede = s.idSede " +
                        "WHERE s.idSede = " + Request.QueryString["id"].ToString();
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.TraerDatos(strQuery);
            if (dt.Rows.Count > 0)
            {
                rpGaleria.DataSource = dt;
                rpGaleria.DataBind();
            }
        }

        private void ConfigurarFAQ()
        {
            // Encabezado
            faq.SectionId = "faq";

            faq.Kicker = "Preguntas frecuentes";

            faq.Title = "¿Tienes";
            faq.Highlight = "dudas?";

            faq.Description = "Resolvemos lo que más nos preguntan. Si necesitas algo más, escríbenos por WhatsApp y un asesor te responderá.";

            // Botón
            faq.WhatsAppUrl = "https://wa.me/573107842151";

            faq.WhatsAppText = "Hablar con un asesor";

            // Preguntas y respuestas
            faq.Items = new List<FaqItem>
            {
                new FaqItem
                {
                    Question = "¿Puedo cancelar mi suscripción?",
                    Answer = @"
                        <p>
                            Para solicitar el retiro de tu plan, debes comunicarte con nuestro equipo de 
                            <b>Servicio al Cliente – Débito Automático al 
                            <a href=""https://api.whatsapp.com/send/?phone=573147041010"" target=""_blank"" 
                            style=""text-decoration: underline;"">314 704 1010</a>.</b>
                            <br />
                            Nuestro equipo validará el <b>período de fidelidad 
                            establecido para tu plan</b> y te indicará el proceso 
                            correspondiente.
                            <br />
                            Si <b>ya cumpliste el período de fidelidad,</b> 
                            podrás solicitar el retiro de acuerdo con las condiciones 
                            de tu plan, <b>antes de la fecha de corte establecida.</b> Si <b>
                            aún no has cumplido el período de fidelidad,</b> se realizará el 
                            <b>cobro correspondiente por retiro anticipado,</b> de acuerdo con 
                            las condiciones establecidas en tu contrato.
                        </p>
                    ",
                    Open = true
                },

                new FaqItem
                {
                    Question = "¿Cómo funcionan los pagos automáticos?",
                    Answer = @"
                        <p>
                            Al activar tu plan, vincula una tarjeta para que el cobro mensual 
                            se realice de forma automática. Es cómodo, seguro y te evita 
                            preocupaciones. Te notificamos antes de cada cobro.
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "¿Qué sucede si cambio de sede?",
                    Answer = @"
                        <p>
                            ¡No hay problema! ¡Puedes entrenar en cualquiera de nuestras sedes sin problema!
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "¿Qué métodos de pago aceptan?",
                    Answer = @"
                        <p>
                            Recibimos tarjetas debito y crédito, excepto tarjetas virtuales 
                            como Nequi, Daviplata, NuBank. No disponible para pagos 
                            en efectivo, datafono o transferencia.
                        </p>
                        <div class=""section-prin-logos-met-pagos"">
                            <b class='met-pagos-title'>Tarjetas</b>

                            <div class=""section-prin-logos"">
                                <div class=""section-logos-met-pagos"">
                                    <b class='met-pagos-title'>Crédito</b>

                                    <div class=""logos-met-pagos cred"">
                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg"" alt=""Master Card"" />
                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/f/fe/Visa_Inc._logo_%281992%E2%80%931999%29.svg"" alt=""Visa"" />
                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/f/fa/American_Express_logo_%282018%29.svg"" alt=""American Express"" />
                                    </div>
                                </div>

                                <div class=""section-logos-met-pagos"">
                                    <b class='met-pagos-title'>Débito</b>

                                    <div class=""logos-met-pagos deb"">
                                        <img src=""https://static.wikia.nocookie.net/logopedia/images/d/db/Banco_Caja_Social_2011.png/revision/latest/scale-to-width-down/1000?cb=20210427194508&path-prefix=es"" alt=""Banco Caja Social"" />

                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/8/8a/Banco_de_Occidente_logo.svg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original"" alt=""Banco de Occidente"" />

                                        <img src=""https://static.wikia.nocookie.net/logopedia/images/6/68/AVVillas2004.svg/revision/latest/scale-to-width-down/1000?cb=20240520173353"" alt=""Banco AV Villas"" />

                                        <img src=""https://www.misole.co/wp-content/uploads/2019/12/logo-bancolombia.png"" alt=""Bancolombia"" />

                                        <img src=""https://www.bancopopular.com.co/wps/wcm/connect/bancopopular/18296b56-f4f1-4a18-95d4-c48bb9670ed1/og-banco-popular.png?MOD=AJPERES"" alt=""Banco Popular"" />

                                        <img src=""https://cdn.worldvectorlogo.com/logos/logo-banco-de-bogota.svg"" alt=""Banco de Bogotá"" />

                                        <img src=""https://logos-world.net/wp-content/uploads/2023/02/Davivienda-Logo.png"" alt=""Davivienda"" />

                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/1/1d/Citibank.svg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original"" alt=""Citibank"" />

                                        <img src=""https://static.wikia.nocookie.net/logopedia/images/6/65/Colpatriavertical.png/revision/latest?cb=20210428022124&path-prefix=es"" alt=""Colpatria"" />

                                        <img src=""https://static.wikia.nocookie.net/logopedia/images/b/b2/Multibank.svg/revision/latest?cb=20260313195156&path-prefix=es"" alt=""Multibank"" />

                                        <img src=""https://upload.wikimedia.org/wikipedia/commons/4/41/Logo_CorpBanca.png?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original"" alt=""CorpBanca"" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    "
                }
            };
        }
    }
}