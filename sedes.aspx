<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sedes.aspx.cs" Inherits="WebPage.sedes" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager (script) -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-ND126BW41D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-ND126BW41D');
    </script>
    <script src="js/fitnesspeople.js"></script>

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

    <!-- SPECIFIC CSS -->
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    <link href="css/pop_up.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
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
    <section>
        <asp:Literal ID="ltImagenBG" runat="server"></asp:Literal>

        <div id="sub_content_in">
            <h1 style="font-weight: 900;">
                <asp:Literal ID="ltNombreSede" runat="server" Visible="true"></asp:Literal></h1>
            <p style="font-weight: 700;">
                <asp:Literal ID="ltCiudadSede" runat="server" Visible="true"></asp:Literal>
            </p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">
                <div class="col-md-6" style="margin-bottom: 3rem;">

                    <h2 class="nomargin_top" style="font-weight: 900; color: #FFF;"><em>Galería</em></h2>

                    <div class="owl-carousel team-carousel3">

                    <%--<div class="row magnific-gallery">--%>

                        <asp:Repeater ID="rpGaleria" runat="server">
                            <ItemTemplate>
                                <%--<div class="col-sm-4">
                                    <div class="img_wrapper">
                                        <div class="img_container">
                                            <a href="img/sedes/galeria/<%# Eval("NombreImagen") %>" title="<%# Eval("NombreSede") %>">
                                                <img src="img/sedes/galeria/<%# Eval("NombreImagen") %>" width="800" height="533" class="img-responsive" alt="" />
                                            </a>
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="team-item">
                                    <div class="team-item-img carousel-images-sedes">
                                        <div class="img_container" style="height: 100%;">
                                            <img src="img/sedes/galeria/<%# Eval("NombreImagen") %>" class="img-responsive" alt="" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    <%--</div>--%>
                    </div>

                </div>
                <div class="col-md-5 col-md-offset-1">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #FFF;"><em>
                        <asp:Literal ID="ltNombreSede2" runat="server"></asp:Literal></em></h2>
                    <hr />
                    <%--<p class="lead"><i class="fa fa-city"></i> En la ciudad de <asp:Literal ID="ltCiudadSede2" runat="server"></asp:Literal></p><br />
<h4><i class="fa fa-map-location-dot"></i> <asp:Literal ID="ltDireccionSede" runat="server"></asp:Literal></h4>
<h4><i class="fab fa-whatsapp"></i> <asp:Literal ID="ltTelefonoSede" runat="server"></asp:Literal></h4><br />
<h4><i class="fa fa-clock"></i> Horario: </h4>
<p><asp:Literal ID="ltHorarioSede" runat="server"></asp:Literal></p>--%>
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3><strong><i class="fa fa-city"></i></strong></h3>
                            <h4 style="padding-top: 10px; color: #FFF;">
                                <asp:Literal ID="ltCiudadSede2" runat="server"></asp:Literal></h4>
                        </div>
                        <div class="step" style="padding: 0 0 20px 31px;"></div>
                        <!--End step -->
                        <div class="form_title">
                            <h3><strong><i class="fa fa-map-location-dot"></i></strong></h3>
                            <h4 style="padding-top: 10px; color: #FFF;">
                                <asp:Literal ID="ltDireccionSede" runat="server"></asp:Literal></h4>
                        </div>
                        <div class="step" style="padding: 0 0 20px 31px;"></div>
                        <!--End step -->
                        <div class="form_title">
                            <h3><strong><i class="fab fa-whatsapp"></i></strong></h3>
                            <h4 style="padding-top: 10px; color: #FFF;">
                                <asp:Literal ID="ltTelefonoSede" runat="server"></asp:Literal></h4>
                        </div>
                        <div class="step" style="padding: 0 0 20px 31px;"></div>
                        <!--End step -->
                        <div class="form_title">
                            <h3 style="color: #FFF;"><strong><i class="fa fa-clock"></i></strong>Horario</h3>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group" style="color: #FFF;">
                                        <p>
                                            <asp:Literal ID="ltHorarioSede" runat="server"></asp:Literal></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End step -->
                    </div>
                </div>
            </div>
            <!-- End row -->
        </div>
    </div>

    <section id="planes" class="margin_60_35" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container" id="scroll-to">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
            <p class="lead styled" style="font-weight: 500; color: #FFF;">
                En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
            </p>
            <div class="row text-center plans">
                <div class="col-md-4">
                    <div class="img_container">
                        <a href="planes?id=18">
                            <img src="img/planes/plan_easy.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <a href="planes?id=10">
                            <img src="img/planes/03_plan-6-mas-2_2025-09-08.jpg" class="img-responsive" style="height: 450px;" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <a href="planes?id=16">
                            <img src="img/planes/02_plan-3-mas-1_2025-09-08.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>
            </div>
            <%--<div class="row text-center plans">
                <div class="col-md-0" style="display: none;">
                    <div class="img_container">
                        <a href="planes?id=1">
                            <img src="img/planes/01_plan-easy_2025-09-08.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="img_container">
                        <a href="planes?id=10" style="display: flex; justify-content: center;">
                            <img src="img/planes/03_plan-6-mas-2_2025-09-08.jpg" class="img-responsive" style="height: 450px;" />
                        </a>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="img_container">
                        <a href="planes?id=16" style="display: flex; justify-content: center;">
                            <img src="img/planes/02_plan-3-mas-1_2025-09-08.jpg" class="img-responsive" style="height: 450px;" />
                        </a>
                    </div>
                </div>
            </div>--%>
            <!-- End row plans-->

            <div class="banner-tarifas img_container"></div>

            <section style="padding-top: 10px; padding-bottom: 15px;">
                <div class="container" style="display: flex; flex-direction: column;">
                    <div class="row">
                        <div class="card-row-tarifas">
                            <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 add_bottom_15" >
                                <img src="img/tarifas/01_plan-referencia-1-mes.png" class="img-responsive" />
                            </div>

                            <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 add_bottom_15" >
                                <img src="img/tarifas/02_plan-referencia-3-meses.png" class="img-responsive" />
                            </div>

                            <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3" >
                                <img src="img/tarifas/03_plan-referencia-6-meses.png" class="img-responsive" />
                            </div>

                            <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3" >
                                <img src="img/tarifas/04_plan-referencia-10-meses.png" class="img-responsive" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--  End container-->
    </section>
    <!--  End section-->

    <div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60" style="padding-top: 0px; padding-bottom: 30px;">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <%--<h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                <div id="message-newsletter"></div>
                <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                    <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control">
                    <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                </form>--%>
                    <a href="gympass">
                        <img src="img/concurso-gympass-2.jpg" class="img-responsive" style="width: 470px; display: inline;" />
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%--<div id="newsletter_container" style="background-color: #000;">
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
    </div>--%>
    <!-- End newsletter_container -->

    <!-- End container -->

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

    <!-- SPECIFIC SCRIPTS -->
    <script src="js/bootstrap-portfilter.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script src="layerslider/js/greensock.js"></script>
    <script src="layerslider/js/layerslider.transitions.js"></script>
    <script src="layerslider/js/layerslider.kreaturamedia.jquery.js"></script>

    <style>

        .banner-tarifas {
            width: 100%;
            height: 470px;
            background-image: url('img/banners/tarifas-2025.jpg');
            background-size: cover;
            background-position: center;
        }

    </style>

    <script>

        'use strict';
        $(".team-carousel3").owlCarousel({
            items: 1,
            loop: true,
            autoHeight: true,
            autoWidth: false,
            center: false,
            nav: true,
            autoplayTimeout: 3000,
            margin: 10,
            autoplay: true,
            smartSpeed: 1000,
            responsiveClass: true,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1,
                },
                768: {
                    items: 1,
                },
                1000: {
                    items: 1,
                }
            }
        });

    </script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>