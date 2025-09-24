<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planesKiosco.aspx.cs" Inherits="WebPage.planesData" %>

<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager (script) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-ND126BW41D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-ND126BW41D');
    </script>
    <meta property="og:site_name" content="Fitness People" />
    <meta property="og:title" content="Fitness People" />
    <meta property="og:description" content="Vive la experiencia, transforma tu cuerpo y tu vida." />
    <meta property="og:image" content="https://fitnesspeoplecolombia.com/img/sedes/boulevard__.jpg" />
    <meta property="og:image:width" content="600" />
    <meta property="og:image:height" content="355" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://fitnesspeoplecolombia.com" />

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
    </header>
    <!-- End Header =============================================== -->

    <!-- End layerslider -->
    <!-- End SubHeader ============================================ -->
    <form runat="server" id="form2">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>

        <section class="margin_60_35" id="planes" style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container" id="scroll-to">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
                <p class="lead styled" style="font-weight: 500; color: #FFF;">
                    En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
                </p>
                <div class="row text-center plans">

                    <div class="col-md-4">
                        <div class="img_container">
                            <a href="register?idPlan=1">
                                <img src="img/planes/plan_easy01.jpg" class="img-responsive" />
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="img_container">
                            <a href="register?idPlan=7">
                                <img src="img/planes/mega_prima01.jpg" class="img-responsive" style="height: 450px;" />
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="img_container">
                            <a href="register?idPlan=2">
                                <img src="img/planes/mes_fast01.jpg" class="img-responsive" />
                            </a>
                        </div>
                    </div>

                </div>
                <!-- End row plans-->

            </div>
            <!--  End container-->
        </section>
        <!--  End section-->

        <section class="margin_60_35" id="bg_gray3">
            <div class="container">
                <h2 class="main_title" style="color: #e3ff00; font-weight: 900;"><em></em>NUESTROS ALIADOS</h2>
                <!--Team Carousel -->
                <div class="row">
                    <div class="owl-carousel team-carousel">
                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/clientes/coopfuturo.png" style="width: 150px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/clientes/fecolsa.png" style="width: 150px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/clientes/freskoop.png" style="width: 150px;" alt="" />
                            </div>
                        </div>
                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/clientes/cooprofesores.png" style="width: 150px;" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Team Carousel-->
            </div>
            <!--  End container-->
        </section>
        <!--  End section-->
    </form>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- Login modal -->
    <div class="modal fade" id="aviso" tabindex="-1" role="dialog" aria-labelledby="myAviso" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-popup">
                <a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
                <!--<a href="https://forms.gle/JTfGsH33Y22FjkKV7" target="_blank"> -->
                <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=15455" target="_blank">
                    <img src="img/10_meses_prebd03.jpg" class="img-responsive" />
                </a>
            </div>
        </div>
    </div>

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
            margin: 20,
            autoplay: true,
            smartSpeed: 300,
            responsiveClass: false,
            responsive: {
                320: {
                    items: 2,
                },
                768: {
                    items: 3,
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

        $(".team-carousel4").owlCarousel({
            items: 1,
            autoHeight: true,
            autoWidth: true,
            loop: true,
            nav: false,
            center: true,
            autoplayTimeout: 3000,
            margin: 100,
            autoplay: true,
            smartSpeed: 1000,
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

</body>
</html>

