<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sede_pg.aspx.cs" Inherits="WebPage.sede_pg" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta property="og:site_name" content="Fitness People" />
    <meta property="og:title" content="Fitness People" />
    <meta property="og:description" content="Vive la experiencia, transforma tu cuerpo y tu vida." />
    <meta property="og:image" itemprop="image" content="https://fitnesspeoplecolombia.com/img/para_banner.png" />
    <meta property="og:type" content="website" />
    <meta property="og:updated_time" content="1440432930" />
    
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

    <!-- SPECIFIC CSS -->
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    <link href="css/pop_up.css" rel="stylesheet" />
</head>
<body>
    <a href="https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People" class="whatsapp" target="_blank"><i class="fab fa-whatsapp whatsapp-icon"></i></a>
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
    <%--<section class="header-video-2 jarallax" data-jarallax-video="https://youtu.be/5UtZBZP_eCA" runat="server" visible="true" id="divVideo">
        <div id="hero_video">
            <div id="sub_content">
                <div class="mobile_fix">
                    <h1 style="font-weight: 900;">FITNESS PEOPLE</h1>
                    <p>Vive la experiencia, transforma tu cuerpo y tu vida</p>
                </div>
            </div>
            <!-- End sub_content -->
        </div>
        <div id="count" class="hidden-xs">
            <ul>
                <li><span class="number">2500</span>&nbsp;Clases</li>
                <li><span class="number">10</span>&nbsp;Sedes</li>
                <li><span class="number">4</span>&nbsp;Ciudades</li>
            </ul>
        </div>
    </section>--%>
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/sedes/banners/prado.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">SEDES</h1>
        </div>
    </section>
    <!-- End Header video -->
    <!-- End SubHeader ============================================ -->

    <section class="margin_60_35" id="sedes" style="padding-top: 0px;">
    <div class="container margin_60">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Nuestras Sedes</h2>

        <div class="row">
            <%--<div class="owl-carousel team-carousel3" width="600px">

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=1">
                                    <img src="img/sedes/boulevard.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=2">
                                    <img src="img/sedes/cabecera.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=3">
                                    <img src="img/sedes/canaveral.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=4">
                                    <img src="img/sedes/jardin.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=5">
                                    <img src="img/sedes/delacuesta.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=6">
                                    <img src="img/sedes/ceiba.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=7">
                                    <img src="img/sedes/parquecentral.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=8">
                                    <img src="img/sedes/prado.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=9">
                                    <img src="img/sedes/provenza.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <div class="img_wrapper">
                            <div class="img_container">
                                <a href="sedes?id=10">
                                    <img src="img/sedes/ciudadela.jpg" class="img-responsive" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>--%>

                <div class="owl-carousel team-carousel3">
                <asp:Repeater ID="rpSedes" runat="server">
                    <ItemTemplate>
                        <div class="team-item">
				            <div class="team-item-img">
					            <img src="img/sedes/galeria/<%# Eval("ImagenPrincipal") %>" class="img-responsive" alt="" />
					            <div class="team-item-detail">
						            <div class="team-item-detail-inner">
							            <h4 style="font-weight: 900;"><%# Eval("NombreSede") %></h4>
                                        <p><%# Eval("DireccionSede") %><br />
							            <%# Eval("NombreCiudadSede") %><br />
                                        <%# Eval("TelefonoSede") %></p>
							            <%--<ul class="social">
								            <li><a href="#0"><i class="icon-facebook"></i></a>
								            </li>
								            <li><a href="#0"><i class="icon-twitter"></i></a>
								            </li>
								            <li><a href="#0"><i class="icon-google"></i></a>
								            </li>
								            <li><a href="#0"><i class="icon-linkedin"></i></a>
								            </li>
							            </ul>--%>
							            <a href="sedes?id=<%# Eval("idSede") %>" class="btn_1 add_bottom_15">VER SEDE</a>
						            </div>
					            </div>
				            </div>
				            <div class="team-item-info">
					            <h4 style="font-weight: 900; color: #fff;"><%# Eval("NombreSede") %></h4>
					            <p style="color: #fff;"><%# Eval("NombreCiudadSede") %></p>
				            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
			

        </div>
    </div>
    </section>

    <div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                    <div id="message-newsletter"></div>
                    <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                        <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control" />
                        <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End newsletter_container -->

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
    <script>
        $('.jarallax').jarallax({
            videoLoop: true,
            videoPlayOnlyVisible: false,
            videoLazyLoading: false
        });

        'use strict';
        $(".team-carousel").owlCarousel({
            items: 1,
            autoHeight: true,
            autoWidth: true,
            loop: true,
            nav: false,
            center: true,
            autoplayTimeout: 1000,
            margin: 100,
            autoplay: true,
            smartSpeed: 300,
            responsiveClass: false,
            responsive: {
                320: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                1000: {
                    items: 4,
                }
            }
        });

        $(".team-carousel2").owlCarousel({
            items: 4,
            loop: true,
            nav: false,
            center: true,
            autoplayTimeout: 3000,
            margin: 10,
            autoplay: true,
            smartSpeed: 1000,
            responsiveClass: false,
            autoplayHoverPause: true,
            responsive: {
                320: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                1000: {
                    items: 4,
                }
            }
        });

        $(".team-carousel3").owlCarousel({
            items: 1,
            loop: true,
            autoHeight: true,
            autoWidth: false,
            nav: false,
            center: true,
            autoplayTimeout: 3000,
            margin: 10,
            autoplay: true,
            smartSpeed: 1000,
            responsiveClass: false,
            autoplayHoverPause: true,
            responsive: {
                320: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                1000: {
                    items: 2,
                }
            }
        });

        $('#layerslider').layerSlider({
            autoStart: true,
            navButtons: false,
            navStartStop: false,
            showCircleTimer: false,
            responsive: true,
            responsiveUnder: 1400,
            layersContainer: 1170,
            skinsPath: 'layerslider/skins/'
            // Please make sure that you didn't forget to add a comma to the line endings
            // except the last line!
        });

        function setPanels() {
            var windowWidth = window.innerWidth;
            console.log(windowWidth);
            if (windowWidth < 500) {
                document.getElementById('img1').src = 'img/slides/slide_1_v.jpg';
            }
            else {
                document.getElementById('img1').src = 'img/slides/slide_1.jpg';
                //document.getElementById('layerslider').style = 'width:100%;height:667px;';
            }
        }
    </script>
    <%--<script src="js/pop_up.min.js"></script>
    <script src="js/pop_up_func.js"></script>--%>
</body>
</html>
