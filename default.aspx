<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebPage._default" %>

<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <!-- SubHeader =============================================== -->
    <%--<section class="header-video-2 jarallax" data-jarallax-video="mp4:./video/intro2.mp4" runat="server" visible="false" id="divVideo">
        <div id="hero_video">
            <div id="sub_content">
                <div class="mobile_fix">
                    <h1 style="font-weight: 700;">FITNESS PEOPLE</h1>
                    <p><i class="fa fa-cake"></i> CELEBRA SUS PRIMEROS 14 AÑOS <i class="fa fa-cake"></i></p>
                </div>
            </div>
            <!-- End sub_content -->
        </div>
        <div id="count" class="hidden-xs">
            <ul>
                <li><span class="number">22302</span>&nbsp;&nbsp;Clientes</li>
                <li><span class="number">10</span> Sedes</li>
                <li><span class="number">4</span> Ciudades</li>
            </ul>
        </div>
    </section>--%>

    <%--<section class="header-video-2 jarallax" data-jarallax-video="https://youtu.be/YamfAFw8XbQ" runat="server" visible="true" id="divVideo">
        <a href="#planes">
            <div id="hero_video">
                <div id="sub_content">
                    <div class="mobile_fix">
                        <h1 style="font-weight: 900;">FITNESS PEOPLE</h1>
                        <p>Vive la experiencia, transforma tu cuerpo y tu vida</p>
                        <p><a href="#planes" class="btn_1">ENTRENA CON NOSOTROS</a></p>
                    </div>
                </div>
                <!-- End sub_content -->
            </div>
        </a>
        <div id="count" class="hidden-xs">
            <ul>
                <li><span class="number">2500</span>&nbsp;Clases</li>
                <li><span class="number">10</span>&nbsp;Sedes</li>
                <li><span class="number">4</span>&nbsp;Ciudades</li>
            </ul>
        </div>
    </section>--%>
    <!-- End Header video -->

    <!-- Slider -->
    <div id="full-slider-wrapper">
        <div id="layerslider" style="width: 100%;">
            <!-- first slide -->
            <div class="ls-slide" data-ls="slidedelay: 5000; transition2d:5;" style="cursor: pointer;" onclick="window.open('planeasy.aspx','_blank')">
                <img id="slide1-img" src="img/slides/banner_4.jpg" class="ls-bg" width="1600" height="100%" />
            </div>
            <!-- second slide -->
            <div class="ls-slide" data-ls="slidedelay: 5000; transition2d:85;" style="cursor: pointer;" onclick="window.open('plan3plus3.aspx','_blank')">
                <img id="slide2-img" src="img/slides/banner_5.jpg" class="ls-bg" width="1600" height="100%" />
            </div>

            <div id="count" class="hidden-xs">
                <ul>
                    <li><span class="number">2500</span>&nbsp;Clases</li>
                    <li><span class="number">10</span>&nbsp;Sedes</li>
                    <li><span class="number">4</span>&nbsp;Ciudades</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End layerslider -->
    <!-- End SubHeader ============================================ -->

    <section class="margin_60_35" id="planes">
        <div class="container" id="scroll-to">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
            <%--<p class="lead styled" style="font-weight: 500; color: #FFF;">
                En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
            </p>--%>
            <div class="row text-center plans">

                <div class="col-md-4">
                    <div class="img_container">
                        <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23365" target="_blank">
                            <img id="image1-img" src="img/planes/99easy01.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23124" target="_blank">
                            <img src="img/planes/190fast01.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=15455" target="_blank">
                            <img src="img/planes/12meses01.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

            </div>
            <!-- End row plans-->

        </div>
        <!--  End container-->
    </section>
    <!--  End section-->

    <section id="feat">
        <div class="container">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;">VIVE LA EXPERIENCIA<span>TRANSFORMA TU CUERPO Y TU VIDA</span></h2>
            <p class="lead styled" style="color: #FFF;">
                <b>Somos un Centro Médico Deportivo catalogado como una IPS.</b>
            </p>
            <div class="row">
                <div class="col-sm-4 fadeIn animated" data-wow-delay="0.2s">
                    <div class="box_feat">
                        <%--<i class="fa fa-building fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                        <img src="img/svgtopng/Recurso-40.png" width="100px" />
                        <h3 style="font-weight: 900; color: #FFF;">10 Sedes</h3>
                        <p style="font-weight: 500; color: #FFF;">
                            Tenemos 8 sedes en Bucaramanga y toda su área metropolitana y 2 sedes más en Cúcuta.<br />
                            <a href="#" style="font-weight: 900; color: #FFF;">Más información</a>
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 fadeIn animated" data-wow-delay="0.5s">
                    <div class="box_feat">
                        <%--<i class="fa fa-user-doctor fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                        <img src="img/svgtopng/Recurso-39.png" width="100px" />
                        <h3 style="font-weight: 900; color: #FFF;">Profesionales de la Salud</h3>
                        <p style="font-weight: 500; color: #FFF;">
                            Contamos con los mejores profesionales de la salud: Fisioterapeutas, médicos deportologos y nutricionistas.<br />
                            <a href="#" style="font-weight: 900; color: #FFF;">Más información</a>
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 fadeIn animated" data-wow-delay="1s">
                    <div class="box_feat">
                        <%--<i class="fa fa-person-biking fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                        <img src="img/svgtopng/Recurso-33.png" width="100px" />
                        <h3 style="font-weight: 900; color: #FFF;">Clases individuales y grupales</h3>
                        <p style="font-weight: 500; color: #FFF;">
                            Más de 500 clases grupales y personalizadas al mes.<br />
                            <a href="#" style="font-weight: 900; color: #FFF;">Más información</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container -->
    </section>
    <!-- End section -->

    <div id="newsletter_container">
        <div class="container margin_60">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <%--<h3 style="font-weight: 600;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>--%>
                    <div id="message-newsletter"></div>
                    <form method="post" class="form-inline" runat="server" id="form1">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="upContacto" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Sedes:</label>
                                            <asp:DropDownList ID="ddlSedes" runat="server"
                                                AppendDataBoundItems="true" DataTextField="NombreSede"
                                                DataValueField="idSede" CssClass="form-control styled"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSedes_SelectedIndexChanged">
                                                <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <asp:HyperLink ID="hlContacto" runat="server" Target="_blank" CssClass="btn_full">Habla con un asesor</asp:HyperLink>
                                        <%--<a href="https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People" target="_blank" class=" btn_full">HABLA CON UN ASESOR</a>--%>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--<button id="submit-newsletter" class="btn_1">HABLA CON UN ASESOR</button>--%>
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

        $(document).ready(function () {
            //$('#aviso').modal('show');
        });
    </script>
    <%--<script src="js/pop_up.min.js"></script>
    <script src="js/pop_up_func.js"></script>--%>
    <script>
        function actualizarImagenSlider() {
            const slide1 = document.getElementById('slide1-img');
            const slide2 = document.getElementById('slide2-img');
            const screenWidth = window.innerWidth;

            if (screenWidth <= 480) {
                slide1.src = 'img/slides/slide_1_v.jpg'; // Imagen vertical o móvil
                slide2.src = 'img/slides/slide_2_v.jpg';
            } else {
                slide1.src = 'img/slides/banner_4.jpg'; // Imagen de escritorio
                slide2.src = 'img/slides/banner_5.jpg';
            }
        }

        window.addEventListener('load', actualizarImagenSlider);
        window.addEventListener('resize', actualizarImagenSlider);
    </script>
</body>
</html>
