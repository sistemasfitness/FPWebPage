<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planes.aspx.cs" Inherits="WebPage.planes" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/servicios.ascx" TagPrefix="uc1" TagName="servicios" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>window.dataLayer = window.dataLayer || [];</script>
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
    <%--<section class="parallax_window_in" data-parallax="scroll" data-image-src="img/planeasy_1400x470.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">PLAN EASY</h1>
        </div>
    </section>--%>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section id="barraProgreso" runat="server" visible="false" style="text-align: center;">
        <div class="container">
            <asp:Literal ID="litScriptFechas" runat="server" EnableViewState="false"></asp:Literal>

            <h2 style="font-weight: 900; color: #e3ff00;">¡Date prisa!</h2>

            <div class="progress-bar">
                <div id="progress-fill" class="progress-fill"></div>
            </div>

            <h4 style="font-weight: 500; color: #e3ff00;">Esta promo termina en: </h4>

            <p style="font-size: 3rem; font-weight: 900; color: #FFF;" id="time-remaining"></p>
        </div>
    </section>

    <section class="margin_60_35" id="plan">
        <div class="container">
            <div class="row info-planes" style="display: flex;">
                <div class="col-md-6" style="display: flex; flex-direction: column; justify-content: space-around;">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00; margin-bottom: 30px;">
                        <asp:Literal ID="ltTitulo" runat="server"></asp:Literal>
                    </h2>
                    <asp:Literal ID="ltDescripcion" runat="server"></asp:Literal>
                </div>

                <div class="col-md-6 col-md-offset-1" style="cursor: pointer; align-content: center;">
                    <asp:Literal ID="ltImagenMarketing" runat="server"></asp:Literal>
                </div>
            </div>

            <div class="row boton-comprar" style="display: flex; justify-content: center;">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Literal ID="ltBotonPago" runat="server"></asp:Literal>
                </div>
            </div>
            <!-- End row -->
        </div>
    </section>

    <!-- Control Servicios -->
    <uc1:servicios runat="server" ID="controlservicios" />
    <!-- End Control Servicios -->

    <section class="margin_60_35" id="planes2" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Nuestras Sedes</h2>

            <div class="row">
                <div class="owl-carousel team-carousel2" width="600px">
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
                </div>
            </div>
            <form runat="server" id="form2">
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

                <!-- Modal - Plan Easy -->
                <%--<div class="modal fade" id="plan-easy" tabindex="-1" role="dialog" aria-labelledby="myAviso">
                    <div class="modal-dialog" style="display: flex; justify-content: center;">
                        <div class="modal-content modal-popup" style="background: transparent; position: relative;">
                            <!-- Contenedor relativo -->
                            <div style="position: relative; width: 100%;">
                                <!-- Contador -->
                                <div id="barraProgresoEasy"
                                    style="position: absolute; inset: 0; display: flex; flex-direction: column;
                                    align-items: center; justify-content: flex-start; padding-top: 40%;">
                                    <p style="font-size: 5.5rem; font-weight: 800; color: #e3ff00; margin-bottom: 0;"
                                    id="time-remaining-easy"></p>
                                </div>

                                <!-- Imagen -->
                                <img src="img/modals/ventana-emergente_2025-11-12.png" style="width: 100%; display: block;" />

                                <!-- Capa clickeable                                             | ¡¡¡COMENTAR ANCLA SI SE VUELVEN A UTILIZAR LOS MODALES!!! -->
                                <a href="register?idPlan=21&idVendedor=156"                     
                                    style="position: absolute; inset: 0; z-index: 10;"></a>

                                <asp:LinkButton 
                                    ID="lnkRegister"
                                    runat="server"
                                    Style="position:absolute; inset:0; z-index:10; display:block; background:transparent;"
                                    OnClick="btnRedireccionarRegresarRegister_Click">
                                </asp:LinkButton>
                            </div>

                            <!-- Botón de cierre -->
                            <a href="#" class="close-link" data-dismiss="modal"
                                style="position: absolute; top: 10px; right: 10px; z-index: 20;">
                                <i class="icon_close_alt2"></i>
                            </a>

                            <!-- Barra de progreso -->
                            <div class="progress-bar" style="width: 100%;">
                                <div id="progress-fill-easy" class="progress-fill"></div>
                            </div>
                        </div>
                    </div>
                </div>--%>

            </form>
        </div>
    </section>

    <section class="margin_60_35" id="testimonials3" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container">
            <h2 class="main_title" style="color: #fff; font-weight: 900;"><em></em>NUESTRAS CLASES GRUPALES</h2>
            <!--Team Carousel -->
            <div class="row">
                <div class="owl-carousel team-carousel3">
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

            <div class="row" style="display: flex; justify-content: center;">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Literal ID="ltBotonPago2" runat="server"></asp:Literal>
                </div>
            </div>
            <!--End Team Carousel-->
        </div>
        <!--  End container-->
    </section>

    <section class="margin_60_35" id="profesionales" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container" id="scroll-to">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Profesionales a tu disposición</h2>
            <div class="row text-center plans">

                <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3">
                    <div class="img_container">
                        <img src="img/profesionales/deportologo.jpg" class="img-responsive" />
                        <p style="font-weight: 600; color: #FFF;">
                            <br />
                            Deportólogo</p>
                    </div>
                </div>

                <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3">
                    <div class="img_container">
                        <img src="img/profesionales/fisioterapeuta.jpg" class="img-responsive" />
                        <p style="font-weight: 600; color: #FFF;">
                            <br />
                            Fisioterapeuta</p>
                    </div>
                </div>

                <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3">
                    <div class="img_container">
                        <img src="img/profesionales/nutricionista.jpg" class="img-responsive" />
                        <p style="font-weight: 600; color: #FFF;">
                            <br />
                            Nutricionista</p>
                    </div>
                </div>

                <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3">
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

    <div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">
                <div class="col-md-12">

                    <h3 class="nomargin_top" style="color: #fff; font-weight: 900;">Preguntas frecuentes</h3>
                    <div class="panel-group" id="works">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseOne_works">¿Puedo cancelar mi suscripción?<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                </h4>
                            </div>
                            <div id="collapseOne_works" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    Sí, puedes cancelarla en cualquier momento. Solo debes acercarte a tu sede o comunicarte con nuestro equipo de servicio al cliente. Recuerda hacerlo con al menos 5 días de anticipación a tu próximo cobro.
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
                                    Recibimos tarjetas débito, crédito, pagos en efectivo, transferencias y pagos en línea. Pregunta en tu sede por las opciones disponibles o revisa nuestra plataforma digital.
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End panel-group -->



                </div>
                <!-- End col-md-9 -->
            </div>
            <!-- End row -->

            <div class="row" style="display: flex; justify-content: center;">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Literal ID="ltBotonPago3" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <!-- End container -->
    </div>

    <section class="promo_full">
        <div class="promo_full_wp">
            <div>
                <h3 style="font-weight: 900;">Lo que dicen nuestros usuarios</h3>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="carousel_testimonials">
                                <div>
                                    <div class="box_overlay">
                                        <div class="pic">
                                            <figure style="width: 100%; height: auto;">
                                                <img src="img/testimonios/comment1.png" alt="" />
                                            </figure>
                                        </div>
                                        <div class="lead" style="font-weight: 600">
                                            "Entrenar aquí es una locura, los espacios son amplios y siempre limpios. Se nota el compromiso."
                                        </div>
                                    </div>
                                    <!-- End box_overlay -->
                                </div>

                                <div>
                                    <div class="box_overlay">
                                        <div class="pic">
                                            <figure style="width: 100%; height: auto;">
                                                <img src="img/testimonios/comment2.png" alt="" />
                                            </figure>
                                        </div>
                                        <div class="lead" style="font-weight: 600">
                                            "Lo que más valoro es la atención del personal. Desde que entras te hacen sentir en casa."
                                        </div>
                                    </div>
                                    <!-- End box_overlay -->
                                </div>

                                <div>
                                    <div class="box_overlay">
                                        <div class="pic">
                                            <figure style="width: 100%; height: auto;">
                                                <img src="img/testimonios/comment3.png" alt="" />
                                            </figure>
                                        </div>
                                        <div class="lead" style="font-weight: 600">
				                            "Me encanta entrenar en este gym. Tiene un ambiente motivador, buena música, variedad de clases y el equipo humano es increíble."
                                        </div>
                                    </div>
                                    <!-- End box_overlay -->
                                </div>

                            </div>
                            <!-- End carousel_testimonials -->
                        </div>
                        <!-- End col-md-8 -->
                    </div>
                    <!-- End row -->
                </div>
                <!-- End container -->
            </div>
            <!-- End promo_full_wp -->
        </div>
        <!-- End promo_full -->
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

    <div>
        <asp:Literal ID="ltMapa" runat="server"></asp:Literal>
    </div>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- Modal - Plan Easy -->
    <%--<div class="modal fade" id="plan-easy" tabindex="-1" role="dialog" aria-labelledby="myAviso">
        <div class="modal-dialog" style="display: flex; justify-content: center;">
            <div class="modal-content modal-popup" style="background: transparent;">
                <a href="#" class="close-link" data-dismiss="modal"><i class="icon_close_alt2"></i></a>
                <a href="register?idPlan=19">
                    <img src="img/modals/modal_plan-easy-1.png" style="width: 100%;" />
                </a>
                <!-- Contador dentro del modal -->
                <div id="barraProgresoEasy" style="text-align: center; margin-top: 10px;">
                    <h4 style="font-weight: 700; color: #FFF; margin: 0;">⏳ ¡Tu promo expira pronto!</h4>

                    <p style="font-size: 4rem; font-weight: 800; color: #e3ff00; margin-bottom: 0; width: 100%;" id="time-remaining-easy"></p>

                    <div class="progress-bar" style="width: 100%;">
                        <div id="progress-fill-easy" class="progress-fill"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

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

    <%--<script>

        // Modal - Plan Easy

        // Inicia el temporizador de 2 minutos
        function iniciarTemporizadorEasy(duracionSegundos) {
            const fechaInicio = new Date().getTime();
            const fechaFin = fechaInicio + duracionSegundos * 1000;
            const totalTiempo = duracionSegundos * 1000;

            function actualizarBarra() {
                const ahora = new Date().getTime();
                const tiempoRestante = fechaFin - ahora;

                if (tiempoRestante <= 0) {
                    document.getElementById("progress-fill-easy").style.width = "0%";
                    clearInterval(intervalo);

                    // ✅ Cerrar el modal 2 segundos después de que se acaba el tiempo
                    setTimeout(function () {
                        $("#plan-easy").modal("hide");
                    }, 1000);

                    return;
                }

                const porcentaje = (tiempoRestante / totalTiempo) * 100;
                document.getElementById("progress-fill-easy").style.width = porcentaje + "%";

                const segundos = Math.floor((tiempoRestante / 1000) % 60);
                const minutos = Math.floor((tiempoRestante / (1000 * 60)) % 60);

                document.getElementById("time-remaining-easy").textContent =
                    `${minutos.toString().padStart(2, "0")}:${segundos.toString().padStart(2, "0")}`;
            }

            const intervalo = setInterval(actualizarBarra, 1000);
            actualizarBarra();
        };

        $(document).ready(function () {
            const params = new URLSearchParams(window.location.search);
            if (params.get("id") !== "20") return;

            const triggerPoint = $("#planes2").offset().top;

            $(window).on("scroll", function () {
                if ($(window).scrollTop() >= triggerPoint - 300) {
                    $("#plan-easy").modal("show");
                    iniciarTemporizadorEasy(120);
                    $(window).off("scroll"); // evitar que se repita
                }
            });
        });

    </script>--%>



    <%--<script>
        $(document).ready(function () {
            const params = new URLSearchParams(window.location.search);
            if (params.get("id") === "18") {
                let modalShown = false;
                let allowLeave = false;

                // 1. Interceptar atrás desde el inicio
                history.pushState({ modalBlock: true }, "", window.location.href);

                window.addEventListener("popstate", function (e) {
                    if (!allowLeave) {
                        $("#plan-easy").modal("show");
                        modalShown = true;

                        // reponer el estado para que el usuario siga "en la misma página"
                        history.pushState({ modalBlock: true }, "", window.location.href);
                    } else {
                        // si ya cerró el modal, ahora sí puede salir
                        history.back();
                    }
                });

                // 2. Interceptar cierre de pestaña
                window.addEventListener("beforeunload", function (e) {
                    if (!allowLeave) {
                        $("#plan-easy").modal("show");
                        modalShown = true;
                        e.preventDefault();
                        e.returnValue = ""; // obligatorio en Chrome
                    }
                });

                // 3. Cuando cierre el modal manualmente -> permitir salida
                $("#plan-easy").on("hidden.bs.modal", function () {
                    allowLeave = true;
                });
            }
        });
    </script>--%>

    <%--<script>

        // Inicia el temporizador de 2 minutos
        function iniciarTemporizadorEasy(duracionSegundos) {
            const fechaInicio = new Date().getTime();
            const fechaFin = fechaInicio + duracionSegundos * 1000;
            const totalTiempo = duracionSegundos * 1000;

            function actualizarBarra() {
                const ahora = new Date().getTime();
                const tiempoRestante = fechaFin - ahora;

                if (tiempoRestante <= 0) {
                    document.getElementById("progress-fill-easy").style.width = "0%";
                    document.getElementById("time-remaining-easy").textContent = "Tiempo terminado";
                    document.getElementById("time-remaining-easy").style.fontSize = "3.7rem";
                    clearInterval(intervalo);

                    // ✅ Cerrar el modal 2 segundos después de que se acaba el tiempo
                    setTimeout(function () {
                        $("#plan-easy").modal("hide");
                    }, 1000);

                    return;
                }

                const porcentaje = (tiempoRestante / totalTiempo) * 100;
                document.getElementById("progress-fill-easy").style.width = porcentaje + "%";

                const segundos = Math.floor((tiempoRestante / 1000) % 60);
                const minutos = Math.floor((tiempoRestante / (1000 * 60)) % 60);

                document.getElementById("time-remaining-easy").textContent =
                    `${minutos.toString().padStart(2, "0")}:${segundos.toString().padStart(2, "0")}`;
            }

            const intervalo = setInterval(actualizarBarra, 1000);
            actualizarBarra();
        }

        $(document).ready(function () {
            const params = new URLSearchParams(window.location.search);
            if (params.get("id") === "18") {

                function abrirModalEasy() {
                    $("#plan-easy").modal("show");
                    iniciarTemporizadorEasy(10); // 2 minutos = 120 segundos
                }

                setTimeout(function () {
                    abrirModalEasy();
                }, 5000);
            }
        });

    </script>--%>

    <script>

        'use strict';
        $(".team-carousel2").owlCarousel({
            items: 1,
            loop: true,
            autoHeight: true,
            autoWidth: false,
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
                    items: 2,
                }
            }
        });

        $(".team-carousel3").owlCarousel({
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
    </script>

    <script>

        function planAddToCart(contentId, contentName, value, paymentUrl) {

            window.dataLayer.push({
                event: 'add_to_cart',
                ecommerce: {
                    items: [{
                        item_id: contentId,
                        item_name: contentName,
                        price: value,
                        currency: 'COP',
                        quantity: 1
                    }]
                }
            });

            setTimeout(function () {
                window.location.href = paymentUrl;
            }, 150);
        }

    </script>

    <style>

        body.modal-open {
            padding-right: 0 !important;
            overflow-y: auto !important;
        }

        .modal-dialog {
            max-width: 100%;
            margin: 0 auto;
        }

        .modal-content.modal-popup {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
        }

        .progress-bar {
            width: 100%;
            height: 20px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            overflow: hidden;
            margin: 10px auto;
            box-shadow: 0 0 8px rgba(0,0,0,0.25);
        }

        .progress-fill {
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #E3FF00, #FFA500, #FF0000);
            background-size: 200% 100%;
            transition: width 1s linear;
        }

    </style>

    <%--<style>
        .progress-bar {
            width: 100%;
            height: 30px;
            background-color: #ddd;
            border-radius: 50px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }

        .progress-fill {
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #E3FF00, #FFA500, #FF0000);
            background-size: 200% 100%;
            transition: width 0.5s linear;
        }
    </style>--%>

    <%--<style>

        .progress-bar {
            width: 100%;
            height: 20px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            overflow: hidden;
            margin: 10px auto;
            box-shadow: 0 0 8px rgba(0,0,0,0.25);
        }

        .progress-fill {
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #E3FF00, #FFA500, #FF0000);
            background-size: 200% 100%;
            transition: width 1s linear;
        }

    </style>--%>

    <%--<script>
        function iniciarTemporizador(fechaInicioStr, fechaFinStr) {
            const fechaInicio = new Date(fechaInicioStr);
            const fechaFin = new Date(fechaFinStr);
            const totalTiempo = fechaFin - fechaInicio;

            function actualizarBarra() {
                const ahora = new Date();
                const tiempoRestante = fechaFin - ahora;

                if (tiempoRestante <= 0) {
                    document.getElementById("progress-fill").style.width = "0%";
                    document.getElementById("time-remaining").textContent = "Tiempo terminado";
                    clearInterval(intervalo);
                    return;
                }

                const porcentaje = (tiempoRestante / totalTiempo) * 100;
                document.getElementById("progress-fill").style.width = porcentaje + "%";

                const segundos = Math.floor((tiempoRestante / 1000) % 60);
                const minutos = Math.floor((tiempoRestante / (1000 * 60)) % 60);
                const horas = Math.floor((tiempoRestante / (1000 * 60 * 60)) % 24);
                const dias = Math.floor(tiempoRestante / (1000 * 60 * 60 * 24));

                document.getElementById("time-remaining").textContent =
                    `${dias}d ${horas}h ${minutos}m ${segundos}s`;
            }

            const intervalo = setInterval(actualizarBarra, 1000);
            actualizarBarra();
        }
    </script>--%>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
