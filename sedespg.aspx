<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sedespg.aspx.cs" Inherits="WebPage.sedespg" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/sedes.ascx" TagPrefix="uc1" TagName="sedes" %>
<%@ Register Src="~/controls/planes.ascx" TagPrefix="uc1" TagName="planes" %>
<%@ Register Src="~/controls/mapasedeadministrativa.ascx" TagPrefix="uc1" TagName="mapasedeadministrativa" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');
    </script>
    <!-- End Google Tag Manager -->

    <!-- Microsoft Clarity -->
    <script type="text/javascript">
        (function (c, l, a, r, i, t, y) {
            c[a] = c[a] || function () { (c[a].q = c[a].q || []).push(arguments) };
            t = l.createElement(r); t.async = 1; t.src = "https://www.clarity.ms/tag/" + i;
            y = l.getElementsByTagName(r)[0]; y.parentNode.insertBefore(t, y);
        })(window, document, "clarity", "script", "tqldhc207r");
    </script>
    <!-- End Microsoft Clarity -->

    <meta property="og:site_name" content="Fitness People" />
    <meta property="og:title" content="Fitness People" />
    <meta property="og:description" content="Vive la experiencia, transforma tu cuerpo y tu vida." />
    <meta property="og:image" itemprop="image" content="https://fitnesspeoplecolombia.com/img/para_banner.png" />
    <meta property="og:type" content="website" />
    <meta property="og:updated_time" content="1440432930" />

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
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <a href="https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People" class="whatsapp" target="_blank"><i class="fab fa-whatsapp whatsapp-icon"></i></a>

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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/terminos_legales.webp" data-natural-width="1900">
        <div id="sub_content_in">
            <h1 style="font-weight: 900; text-shadow: 3px 3px 4px black;">SEDES</h1>
        </div>
    </section>
    <!-- End Header video -->
    <!-- End SubHeader ============================================ -->

    <!-- Control Sedes -->
    <form runat="server" id="form1" class="form-web" style="color: #fff;">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>

        <uc1:sedes runat="server" ID="sedes" />
    </form>
    <!-- End Control Sedes -->

    <uc1:planes runat="server" ID="controlplanes" />

    <%--<div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60" style="padding-top: 0px; padding-bottom: 30px;">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    ///<h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                <div id="message-newsletter"></div>
                <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                    <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control">
                    <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                </form>//
                    <a href="gympass">
                        <img src="img/gympass01.jpg" class="img-responsive" style="width: 470px; display: inline;" />
                    </a>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- End newsletter_container -->

    <uc1:mapasedeadministrativa runat="server" ID="mapasedeadministrativa" />

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

    </script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
