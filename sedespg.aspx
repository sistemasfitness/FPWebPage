<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sedespg.aspx.cs" Inherits="WebPage.sedespg" %>

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

            <form runat="server" id="form1">
                <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="upSedes" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #FFF;">Ciudad:</label>
                                    <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control"
                                        OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged" AppendDataBoundItems="true"
                                        DataTextField="NombreCiudadSede" DataValueField="idCiudadSede" AutoPostBack="true"
                                        Style="background-color: #3c3c3c;">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #FFF;">Sede:</label>
                                    <asp:DropDownList ID="ddlSedes" runat="server" CssClass="form-control"
                                        OnSelectedIndexChanged="ddlSedes_SelectedIndexChanged" AppendDataBoundItems="true"
                                        DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="true"
                                        Style="background-color: #3c3c3c;">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>

            <div class="row">

                <div class="owl-carousel team-carousel3">
                    <asp:Repeater ID="rpSedes" runat="server">
                        <ItemTemplate>
                            <div class="team-item">
                                <div class="team-item-img">
                                    <img src="img/sedes/galeria/<%# Eval("ImagenPrincipal") %>" class="img-responsive" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner">
                                            <h4 style="font-weight: 900;"><%# Eval("NombreSede") %></h4>
                                            <p>
                                                <%# Eval("DireccionSede") %><br />
                                                <%# Eval("NombreCiudadSede") %><br />
                                                <%# Eval("TelefonoSede") %>
                                            </p>
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

    <section class="margin_60_35" id="planes" style="padding-bottom: 0px;">
        <div class="container" id="scroll-to">

            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
            <p class="lead styled" style="font-weight: 500; color: #FFF;">
                En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
            </p>

            <div class="row text-center plans">

                <div class="col-md-4">
                    <div class="img_container">
                        <%--<a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23365" target="_blank">--%>
                        <a href="planes?id=1">
                            <img src="img/planes/plan_easy.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <%--<a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=15455" target="_blank">--%>
                        <a href="planes?id=7">
                            <img src="img/planes/mega_prima.jpg" class="img-responsive" style="height: 450px;" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="img_container">
                        <%--<a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23124" target="_blank">--%>
                        <a href="planes?id=2">
                            <img src="img/planes/mes_fast.jpg" class="img-responsive" />
                        </a>
                    </div>
                </div>

            </div>

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

    </script>
</body>
</html>
