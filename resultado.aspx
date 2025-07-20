<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resultado.aspx.cs" Inherits="WebPage.resultado" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

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
    <asp:Literal ID="ltBannerFull" runat="server"></asp:Literal>
    <%--<section class="parallax_window_in" data-parallax="scroll" data-image-src="img/descubrir-plan/banner-principal.png" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="">DESCUBRE TU PLAN PERFECTO</h1>
        </div>
    </section>--%>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section class="margin_60_35" id="testimonials">
        <div class="container margin_60_35">
            <div class="row info-planes" style="display: flex; margin-bottom: 2rem;">
                <div runat="server" class="col-md-6" style="cursor: pointer; align-content: center;">
                    <asp:Literal ID="ltImagenInfoFoto" runat="server"></asp:Literal>
                </div>

                <div runat="server" class="col-md-6" style="display: flex; flex-direction: column; justify-content: space-around; align-items:center;">
                    <asp:Literal ID="ltImagenInfoPlan" runat="server"></asp:Literal>
                    <img src="img/descubrir-plan/resultado_icono-clases.png" alt="" style="width: 300px; margin-bottom: 10px;" />
                    <asp:Literal ID="ltImagenInfoClases" runat="server"></asp:Literal>
                </div>
            </div>

            <div class="row" style="display: flex; justify-content: center;">
                <div  style="text-align: center;">
                    <asp:Literal ID="ltBotonPago" runat="server"></asp:Literal>
                </div>
            </div>
            <!-- End row -->
        </div>
    </section>

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
                        <img src="img/gympass01.jpg" class="img-responsive" style="width: 470px; display: inline;" />
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End newsletter_container -->

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <!-- Modal -->
    <div class="modal fade" id="aviso" tabindex="-1" role="dialog" aria-labelledby="myAviso" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-popup">
                <a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
                <!--<a href="https://forms.gle/JTfGsH33Y22FjkKV7" target="_blank"> -->
                <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=20732" target="_blank">
                    <img src="img/planes/01_plan_easy.jpg" class="img-responsive" />
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

    <script>

        // Esperar 5 segundos y luego mostrar el modal
        setTimeout(function () {
            $('#aviso').modal('show');
        }, 5000);

    </script>

    <style>

    body.modal-open {
	    padding-right: 0 !important;
	    overflow-y: auto !important;
    }

    .banner-principal {
        background-image: url(img/descubrir-plan/banner-principal.png);
        background-size: cover;
        background-position: center;
    }

    /* Para pantallas de 480px o menos */
    @media (max-width: 480px) {
        /*.banner-principal {
            background-image: url('img/descubrir-plan/banner-principal_movil.jpg');
        }*/

        .info-planes {
            display: flex;
            flex-direction: column;
        }
    }

    </style>
</body>
</html>

