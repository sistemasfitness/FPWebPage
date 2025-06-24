<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="plan3plus3.aspx.cs" Inherits="WebPage.plan3plus3" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/fitnesspeople.js"></script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Elige el plan que mejor se adapte a ti y entrena en Fitness People en nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta." />
    <meta name="author" content="Fitness People" />
    <title>Fitness People</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon_.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png" />

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700|Kalam:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />

    <!-- BASE CSS -->
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/menu.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="css/icon_fonts/css/all_icons.min.css" rel="stylesheet" />
    <link href="css/magnific-popup.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/3plus3_1400x470.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">PLAN 3+3</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <%--<div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00; ">¡Activa tu energía y entrena el doble por el mismo precio! 💥</h2>
                    <p class="lead" style="color: #FFF; margin-top: 20px;">En Fitness People queremos que empieces con toda, por eso traemos una promoción exclusiva para quienes compren a través de nuestra página web.</p>
                    <h2 class="lead" style="color: #FFF;">
                        <strong>👉 Paga tu plan de 3 meses por solo $417.900 y te regalamos 3 meses más completamente gratis.</strong>
                        <br/>
                        Sí, así como lo lees: <strong>entrena durante 6 meses al precio de 3. ¡No hay excusas para no empezar hoy!</strong>
                    </h2>
                    <p style="color: #FFF;">
                        🎯 Esta oferta es válida hasta el <strong>8 de junio</strong> de 2025 y no es acumulable con otros descuentos.
                        <br/>
                        💻 Solo disponible por compra online en nuestra página web.
                    </p>
                    <p class="lead" style="color: #FFF;">Haz clic en el botón, activa tu plan y empieza a construir la mejor versión de ti.</p>
                    <h3 class="lead" style="color: #FFF;"><strong>¡Es ahora o nunca!</strong></h3>
                </div>
                <div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs">
                    <h2 class="nomargin_top" style="font-weight: 900;">&nbsp;</h2>
                    <img src="img/corporativo.jpg" alt="" class="img-responsive">
                </div>
            </div>
            <!-- End row -->
        </div>
    </div>--%>

    <section class="margin_60_35" id="testimonials">
        <div class="container margin_60_35">
            <div class="row" style="display: flex;">
                <div class="col-md-6" style="display: flex; flex-direction: column; justify-content: space-around;">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00; ">¡Activa tu energía y entrena el doble por el mismo precio! 💥</h2>
                    <p class="lead" style="color: #FFF; margin-top: 20px;">
                        En Fitness People queremos que empieces con toda, por eso traemos una promoción exclusiva para quienes compren a través de nuestra página web.
                    </p>
                    <h2 class="lead" style="color: #FFF; margin-top: 0;">
                        <strong>👉 Paga tu plan de 3 meses por solo $417.900 y te regalamos 3 meses más completamente gratis.</strong>
                        <br/>
                        Sí, así como lo lees: <strong>entrena durante 6 meses al precio de 3. ¡No hay excusas para no empezar hoy!</strong>
                    </h2>
                    <p class="lead" style="color: #FFF;">
                        🎯 Esta oferta es válida hasta el <strong>8 de junio</strong> de 2025 y no es acumulable con otros descuentos.
                        <br/>
                        💻 Solo disponible por compra online en nuestra página web.
                    </p>
                    <p class="lead" style="color: #FFF;"><strong>Haz clic en el botón, activa tu plan y empieza a construir la mejor versión de ti.</strong></p>
                    <h2 class="nomargin_top" style="color: #FFF; margin-bottom: 0; font-weight: 900;">¡Es ahora o nunca!</h2>
                    <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=20386" target="_blank" style="margin: 1rem 3rem;">
                        <button class="btn_1 add_bottom_15" style="width: 100%; background-color: black; font-size: x-large; margin-bottom: 0;">
                            ¡COMPRAR AQUI!
                        </button>
                    </a>
                </div>
                <div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs" style="cursor: pointer;" onclick="window.open('https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=20386', '_blank')">
                    <%--<h2 class="nomargin_top" style="font-weight: 900;">&nbsp;</h2>--%>
                    <img src="img/slides/slide_2_v.jpg" alt="Image" class="img-responsive">
                </div>
            </div>
            <!-- End row -->
        </div>
    </section>
    
    <%--<section class="margin_60_35" id="testimonials">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2 style="color: #e3ff00; font-weight: 900;">Somos IPS</h2>
                    <p>En nuestra IPS de primer nivel, tendrás la tranquilidad de recibir una atención integral de profesionales especializados con un objetivo social enmarcado en promover la salud y prevenir las enfermedades a través del deporte y la recreación, con un equipo altamente capacitado para valoración en Fisioterapia, Nutrición y medicina del deporte.<br /><br />Ayudamos a mitigar trastornos osteomusculares, aumentar el flujo de oxígeno al cerebro, por lo que la capacidad de aprendizaje, concentración y memoria se potencializan, mejorando la calidad de sueño y previniendo la enfermedad como Apnea del sueño.</p>
                    <p style="font-weight: 600;"><em>Tu bienestar es nuestra prioridad.</em></p>

                    <h2 style="color: #e3ff00; font-weight: 900;">Visión</h2>
                    <p>FITNESS PEOPLE CENTRO MÉDICO DEPORTIVO S.A.S., proyecta en el 2030, ser la empresa consolidada y reconocida a nivel nacional, que promociona la salud a más de 40.000 pacientes y usuarios, mediante procesos con acreditación certificada, en estándares de calidad y mejora continua y cuidados en el impacto ambiental, apoyado en una infraestructura sólida con equipos de última tecnología, que satisfagan las necesidades de toda nuestra comunidad.</p>
                </div>
                <div class="col-md-6">
                    <h2 style="color: #e3ff00; font-weight: 900;">&nbsp;</h2>
                    <img src="img/ips_3.jpg" width="600" height="355" alt="" class="img-responsive">
                </div>
            </div>
            <!--  End row -->
        </div>
        <!--  End container-->
    </section>--%>
    <!--  End section-->
    <!-- End container -->

    <div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                    <div id="message-newsletter"></div>
                    <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                        <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control">
                        <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End newsletter_container -->

    <div>
        <asp:Literal ID="ltMapa" runat="server"></asp:Literal>
    </div>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- Search Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"><i class="icon_close"></i></span>
        <form role="search" id="searchform" method="get">
            <input value="" name="q" type="search" placeholder="Buscar..." />
            <button type="submit">
                <i class="icon-search-6"></i>
            </button>
        </form>
    </div>
    <!-- End Search Menu -->
    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>

</body>
</html>