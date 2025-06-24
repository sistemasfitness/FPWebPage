<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="terminoslegales.aspx.cs" Inherits="WebPage.terminoslegales" %>

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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet" />

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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/office.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">TÉRMINOS LEGALES</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00;"">Documentación</h2>
                    <p></p>
                    <p class="lead" style="color: #FFF;">
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/DERECHOS-Y-DEBERES-USUARIOS-FITNESS-PEOPLE.pdf" target="_blank">Derechos y deberes usuarios Fitness People</a><br />
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/2.-PT-TDP-02-POLITICA-DE-PROTECCION-EN-VIDEOVIGILANCIA.pdf" target="_blank">Política de protección de datos</a><br />
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/1.-MN-TDP-03-MANUAL-DE-PROTECCION-DE-DATOS-PERSONALES.pdf" target="_blank">Manual de protección de datos</a><br />
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/3.-AUTORIZACION-DEL-TITULAR-PARA-EL-TRATAMIENTO-BD.pdf" target="_blank">Autorización de uso de datos</a><br />
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/4.-AVISO-DE-PRIVACIDAD-VERSION-II.pdf" target="_blank">Aviso de privacidad</a><br />
                        <i class="fa fa-file-pdf" style="margin-right: 20px;"></i><a style="color: #fff;" href="assets/docs/EEFF-2020-comprimido.pdf" target="_blank">Estados financieros</a><br />
                    </p>
                </div>
                <div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs">
                    <img src="img/devices_2.png" alt="" class="img-responsive">
                </div>
            </div>
            <!-- End row -->
        </div>
    </div>
    

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
