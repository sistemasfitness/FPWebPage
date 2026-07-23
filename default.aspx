<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebPage._default" %>

<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/servicios.ascx" TagPrefix="uc1" TagName="servicios" %>
<%@ Register Src="~/controls/aliados.ascx" TagPrefix="uc1" TagName="aliados" %>
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

    <!-- TikTok Pixel Code Start -->
    <script>
        !function (w, d, t) {
            w.TiktokAnalyticsObject = t; var ttq = w[t] = w[t] || []; ttq.methods = ["page", "track", "identify", "instances", "debug", "on", "off", "once", "ready", "alias", "group", "enableCookie", "disableCookie", "holdConsent", "revokeConsent", "grantConsent"], ttq.setAndDefer = function (t, e) { t[e] = function () { t.push([e].concat(Array.prototype.slice.call(arguments, 0))) } }; for (var i = 0; i < ttq.methods.length; i++)ttq.setAndDefer(ttq, ttq.methods[i]); ttq.instance = function (t) {
                for (
                    var e = ttq._i[t] || [], n = 0; n < ttq.methods.length; n++)ttq.setAndDefer(e, ttq.methods[n]); return e
            }, ttq.load = function (e, n) {
                var r = "https://analytics.tiktok.com/i18n/pixel/events.js", o = n && n.partner; ttq._i = ttq._i || {}, ttq._i[e] = [], ttq._i[e]._u = r, ttq._t = ttq._t || {}, ttq._t[e] = +new Date, ttq._o = ttq._o || {}, ttq._o[e] = n || {}; n = document.createElement("script")
                    ; n.type = "text/javascript", n.async = !0, n.src = r + "?sdkid=" + e + "&lib=" + t; e = document.getElementsByTagName("script")[0]; e.parentNode.insertBefore(n, e)
            };

            ttq.load('D7T28VJC77U471PH6MJ0');
            ttq.page();
            ttq.track('PageView');
        }(window, document, 'ttq');
    </script>
    <!-- TikTok Pixel Code End -->

    <meta property="og:site_name" content="Fitness People" />
    <meta property="og:title" content="Fitness People" />
    <meta property="og:description" content="Vive la experiencia, transforma tu cuerpo y tu vida." />
    <meta property="og:image" content="https://fitnesspeoplecolombia.com/img/sedes/boulevard__.jpg" />
    <meta property="og:image:width" content="600" />
    <meta property="og:image:height" content="355" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://fitnesspeoplecolombia.com" />

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
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
    <%--<section class="header-video-2 jarallax" data-jarallax-video="https://youtu.be/hcsegwkpT0Q" runat="server" visible="true" id="divVideo">
        <div id="hero_video">
            <div id="sub_content">
                <div class="mobile_fix">
                    <h1 style="font-weight: 900;">VIVE LA EXPERIENCIA</h1>
                    <p>Transforma tu cuerpo y tu vida</p>
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
    <!-- End Header video -->

    <!-- Slider -->
    <div id="full-slider-wrapper">
        <div id="layerslider">
            <!-- first slide -->
            <div class="ls-slide" data-ls="slidedelay: 3000; transition2d:85;">
                <img class="ls-bg img-slider" 
                     data-desktop="img/slides/slide-01_2026-04-27.jpeg"
                     data-mobile="img/slides/slide-01_2026-04-27_mobile.jpeg"
                     src="img/slides/slide-01_2026-04-27.jpeg" />
            </div>

            <!-- fourth slide -->
            <div class="ls-slide" data-ls="slidedelay: 3000; transition2d:85;">
                <img class="ls-bg img-slider" 
                     data-desktop="img/slides/slide-04_2026-04-29.jpeg"
                     data-mobile="img/slides/slide-04_2026-04-29_mobile.jpeg"
                     src="img/slides/slide-04_2026-04-29.jpeg" />
            </div>

            <!-- second slide -->
            <div class="ls-slide" data-ls="slidedelay: 3000; transition2d:85;">
                <img class="ls-bg img-slider" 
                     data-desktop="img/slides/slide-02_2026-04-27.jpeg"
                     data-mobile="img/slides/slide-02_2026-04-27_mobile.jpeg"
                     src="img/slides/slide-02_2026-04-27.jpeg" />
            </div>

            <!-- third slide -->
            <div class="ls-slide" data-ls="slidedelay: 3000; transition2d:85;">
                <img class="ls-bg img-slider" 
                     data-desktop="img/slides/slide-03_2026-04-27.jpeg"
                     data-mobile="img/slides/slide-03_2026-04-27_mobile.jpeg"
                     src="img/slides/slide-03_2026-04-27.jpeg" />
            </div>

            <div class="contenido-principal">
                <h2 class="main_title" style="font-weight: 900; color: #FFF; text-shadow: 2px 2px 6px rgba(0,0,0,0.7);">VIVE LA EXPERIENCIA<span>TRANSFORMA TU CUERPO Y TU VIDA</span></h2>
            </div>

            <%--<div id="count" class="hidden-xs">
                <ul>
                    <li><span class="number">2500</span>&nbsp;Clases</li>
                    <li><span class="number">10</span>&nbsp;Sedes</li>
                    <li><span class="number">4</span>&nbsp;Ciudades</li>
                </ul>
            </div>--%>
        </div>

        <div class="section-inferior">
            <div class="contenido-primer-dia bg_dark-gray">
                <h2 style="font-weight: 900; color: #FFF;">TU PRIMER DÍA EN FITNESS PEOPLE GRATIS</h2>
                <a href="https://api.whatsapp.com/send?phone=573185483713&text=%C2%A1Hola!%0AQuiero%20recibir%20mi%20clase%20de%20cortes%C3%ADa%20en%20Fitness%20People." 
                    class="btn-confirm-alert">
                    Haz clic aquí
                </a>
            </div>
        </div>
    </div>
    <!-- End layerslider -->
    <!-- End SubHeader ============================================ -->
    <form runat="server" id="form2">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>

        <%--<section class="margin_60_35" id="bg_black1" style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;">VIVE LA EXPERIENCIA<span>TRANSFORMA TU CUERPO Y TU VIDA</span></h2>
                <p class="lead styled" style="color: #FFF;">
                    <img src="img/icono_cmd_3.png" style="width: 100px;" /><br />
                    <br />
                    <b>Somos un Centro Médico Deportivo catalogado como una IPS.</b>
                </p>
            </div>
            <!--  End container-->
        </section>--%>

        <!-- Control Sedes -->
        <uc1:sedes runat="server" ID="sedes" />
        <!-- End Control Sedes -->

        <!-- Control Servicios -->
        <uc1:servicios runat="server" ID="controlservicios" />
        <!-- End Control Servicios -->

        <section class="margin_60_35" id="bg_gray2" style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container">
                <h2 class="main_title" style="color: #fff; font-weight: 900;"><em></em>NUESTRAS CLASES GRUPALES</h2>
                <!--Team Carousel -->
                <div class="row">
                    <div class="owl-carousel team-carousel4">

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/cardio_box.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/combat1.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/funcional.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/kick_boxing1.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/pilates.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/rumba.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/spinning1.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/xtreme.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/grupales/xtreme_2.jpg" style="width: 600px;" alt="" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <a href="#planes">
                            <img src="img/inscribete_aqui.png" class="img-responsive" style="width: 300px; display: inline;" />
                        </a>
                    </div>
                </div>
                <!--End Team Carousel-->
            </div>
            <!--  End container-->
        </section>

        <section class="margin_60_35" id="profesionales" style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container" id="scroll-to2">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Profesionales a tu disposición</h2>
                <div class="row text-center plans">

                    <div class="col-xl-4 col-lg-3 col-md-6">
                        <div class="img_container">
                            <img src="img/profesionales/deportologo.jpg" class="img-responsive" />
                            <p style="font-weight: 600; color: #FFF;">
                                <br />
                                Deportólogo</p>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-3 col-md-6">
                        <div class="img_container">
                            <img src="img/profesionales/fisioterapeuta.jpg" class="img-responsive" />
                            <p style="font-weight: 600; color: #FFF;">
                                <br />
                                Fisioterapeuta</p>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-3 col-md-6">
                        <div class="img_container">
                            <img src="img/profesionales/nutricionista.jpg" class="img-responsive" />
                            <p style="font-weight: 600; color: #FFF;">
                                <br />
                                Nutricionista</p>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-3 col-md-6">
                        <div class="img_container">
                            <img src="img/profesionales/Profesionales.jpg" class="img-responsive" />
                            <p style="font-weight: 600; color: #FFF;">
                                <br />
                                Profesionales del deporte</p>
                        </div>
                    </div>

                </div>
                <!-- End row plans-->

            </div>
            <!--  End container-->
        </section>

        <!-- Control Planes -->
        <uc1:planes runat="server" ID="controlplanes" />
        <!-- End Control Planes -->

        <%--<div id="newsletter_container" style="background-color: #000;">
            <div class="container margin_60" style="padding-top: 0px; padding-bottom: 30px;">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        //<h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
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

        <%--<section id="feat">
            <div class="container">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;">VIVE LA EXPERIENCIA<span>TRANSFORMA TU CUERPO Y TU VIDA</span></h2>
                <p class="lead styled" style="color: #FFF;">
                    <b>Somos un Centro Médico Deportivo catalogado como una IPS.</b>
                </p>
                <div class="row">
                    <div class="col-sm-4 fadeIn animated" data-wow-delay="0.2s">
                        <div class="box_feat">
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
                            <img src="img/svgtopng/Recurso-33.png" width="100px" />
                            <h3 style="font-weight: 900; color: #FFF;">Clases individuales y grupales</h3>
                            <p style="font-weight: 500; color: #FFF;">
                                Más de 500 clases grupales y personalizadas al mes.<br />
                                <a href="#" style="font-weight: 900; color: #FFF;">Más información</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>

        <div class="container_styled_1">
            <div class="container margin_60_35">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>PREGUNTAS FRECUENTES</h2>

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-group" id="works">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseOne_works">¿Puedo cancelar mi suscripción?<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                    </h4>
                                </div>
                                <div id="collapseOne_works" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <b>Sí, puedes cancelar tu suscripción en cualquier momento.</b> Solo debes acercarte a tu sede o comunicarte con nuestro equipo de servicio al cliente. Recuerda realizar la solicitud con al menos <b>5 días de anticipación</b> a tu próximo cobro.
                                        <br />
                                        Al recibir tu solicitud, verificaremos si ya cumpliste el <b>período de permanencia (fidelidad)</b> correspondiente a tu plan. Si aún no se ha cumplido, se aplicará la <b>penalización establecida por la terminación anticipada del contrato.</b>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseTwo_works">¿Cómo funcionan los pagos automáticos?<i class="indicator icon_plus_alt2 pull-right"></i></a>
                                    </h4>
                                </div>
                                <div id="collapseTwo_works" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Al activar tu plan, vincula una tarjeta para que el cobro mensual se realice de forma automática. Es cómodo, seguro y te evita preocupaciones. Te notificamos antes de cada cobro.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseThree_works">¿Qué sucede si cambio de sede?<i class="indicator icon_plus_alt2 pull-right"></i></a>
                                    </h4>
                                </div>
                                <div id="collapseThree_works" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        ¡No hay problema!¡Puedes entrenar en cualquiera de nuestras sedes sin problema! 
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseFour_works">¿Qué métodos de pago aceptan?<i class="indicator icon_plus_alt2 pull-right"></i></a>
                                    </h4>
                                </div>
                                <div id="collapseFour_works" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Recibimos tarjetas debito y crédito, excepto tarjetas virtuales como Nequi, Daviplata, NuBank. No disponible para pagos en efectivo, datafono o transferencia.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End panel-group -->
                    </div>
                    <!-- End col-md-9 -->
                </div>
                <!-- End row -->
            </div>
            <!-- End container -->
        </div>


        <!-- Control Aliados -->
        <uc1:aliados runat="server" ID="controlaliados" />
        <!-- End Control Aliados -->


        <div id="seleccion_sede">
            <div class="container margin_60">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <%--<h3 style="font-weight: 600;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>--%>
                        <div id="message-newsletter"></div>

                        <asp:UpdatePanel ID="upContacto" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <%--<label>Sedes:</label>--%>
                                            <asp:DropDownList ID="ddlNombresSedes" runat="server"
                                                AppendDataBoundItems="true" DataTextField="NombreSede"
                                                DataValueField="idSede" CssClass="form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlNombresSedes_SelectedIndexChanged"
                                                Style="background-color: #3c3c3c;">
                                                <%--<asp:ListItem Text="Selecciona una sede" Value=""></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <asp:HyperLink ID="hlContacto" runat="server" Target="_blank" CssClass="btn_slider">HABLA CON UN ASESOR</asp:HyperLink>
                                        <%--<a href="https://wa.me/573146887259?text=Hola,%20estoy%20interesad@%20en%20los%20planes%20de%20Fitness%20People" target="_blank" class=" btn_full">HABLA CON UN ASESOR</a>--%>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--<button id="submit-newsletter" class="btn_1">HABLA CON UN ASESOR</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- End newsletter_container -->
    </form>

    <uc1:mapasedeadministrativa runat="server" ID="mapasedeadministrativa" />

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
        //$('.jarallax').jarallax({
        //    videoLoop: true,
        //    videoPlayOnlyVisible: false,
        //    videoLazyLoading: false
        //});

        $(".team-carousel2").owlCarousel({
            items: 4,
            loop: true,
            nav: true,
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

        $(".team-carousel4").owlCarousel({
            items: 1,
            autoHeight: true,
            autoWidth: true,
            loop: true,
            nav: true,
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

        //$('#layerslider').layerSlider({
        //    autoStart: true,
        //    navButtons: false,
        //    navStartStop: false,
        //    showCircleTimer: false,
        //    responsive: true,
        //    responsiveUnder: 1400,
        //    layersContainer: 1170,
        //    skinsPath: 'layerslider/skins/'
        //    // Please make sure that you didn't forget to add a comma to the line endings
        //    // except the last line!
        //});

        $('#layerslider').layerSlider({
            autoStart: true,
            navButtons: true,
            navStartStop: false,
            showCircleTimer: false,
            responsive: true,
            responsiveUnder: 0,
            layersContainer: 1170,
            skin: 'default',
            skinsPath: 'layerslider/skins/'
        });

        //function setPanels() {
        //    var windowWidth = window.innerWidth;
        //    console.log(windowWidth);
        //    if (windowWidth < 500) {
        //        document.getElementById('img1').src = 'img/slides/slide_1_v.jpg';
        //    }
        //    else {
        //        document.getElementById('img1').src = 'img/slides/slide_1.jpg';
        //        //document.getElementById('layerslider').style = 'width:100%;height:667px;';
        //    }
        //}
    </script>
    <%--<script src="js/pop_up.min.js"></script>
    <script src="js/pop_up_func.js"></script>--%>
    <%--<script>
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
    </script>--%>


    <script>

        function cambiarImagenSlider() {
            var imagenes = document.querySelectorAll(".img-slider");
            var isTabletOrMobile = window.innerWidth <= 1024;

            imagenes.forEach(function (img) {
                var nueva = isTabletOrMobile ? img.dataset.mobile : img.dataset.desktop;

                if (img.src.indexOf(nueva) === -1) {
                    img.src = nueva;
                }
            });
        }

        window.addEventListener("load", cambiarImagenSlider);
        // Ejecutar al redimensionar (con pequeño debounce)
        let resizeTimeout;
        window.addEventListener("resize", function () {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(cambiarImagenSlider, 200);
        });

    </script>


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
