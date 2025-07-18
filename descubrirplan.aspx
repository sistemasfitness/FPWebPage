<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="descubrirplan.aspx.cs" Inherits="WebPage.descubrirplan" %>

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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/descubrir-plan/banner-principal.png" data-natural-width="1400" data-natural-height="470">
        <%--<div id="sub_content_in">
            <h1 style="">DESCUBRE TU PLAN PERFECTO</h1>
        </div>--%>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <%--<section class="margin_60_35" id="testimonials" style="background: #000;">
        <div class="container">
            <div class="row">
                <div class="owl-carousel team-carousel">

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/7_dias_semana.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/10_sedes.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/breakee.png" style="width: 140px;" alt="" />
                        </div>
                    </div>
                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/clases_grupales.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/deportologo.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/fisioterapeuta.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/nutricionista.png" style="width: 140px;" alt="" />
                        </div>
                    </div>
                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/profesionales.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/salon_grupales.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/salon_pilates.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/salon_spinning.png" style="width: 140px;" alt="" />
                        </div>
                    </div>
                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/salon_xtreme.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/zona_cardiovascular.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/zona_hammer.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/zona_mancuernas.png" style="width: 140px;" alt="" />
                        </div>
                    </div>
                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/servicios/zona_poleas.png" style="width: 140px;" alt="" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>--%>

<%--<section class="margin_60_35" id="testimonials2">
        <div class="container margin_60_35">
            <div class="row" style="display: flex; margin-bottom: 2rem;">
                <div class="col-md-6" style="display: flex; flex-direction: column; justify-content: space-around;">
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00;">
                        <asp:Literal ID="ltTitulo" runat="server"></asp:Literal></h2>
                    <p class="lead" style="color: #FFF; margin-top: 20px;">
                        <asp:Literal ID="ltDescripcion" runat="server"></asp:Literal></p>
                </div>

                <div class="col-md-6 col-md-offset-1 hidden-sm hidden-xs" style="cursor: pointer; align-content: center;">
                    <asp:Literal ID="ltImagenMarketing" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row" style="display: flex; justify-content: center;">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Literal ID="ltBotonPago" runat="server"></asp:Literal>
                </div>
            </div>
            <!-- End row -->
        </div>
    </section>--%>

    <section class="margin_60_35" id="sedes" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container" style="display: flex; flex-direction: column;">
            <div class="row text-center">
                <h1 style="font-weight: 900; color: white;">DESCUBRE TU PLAN PERFECTO</h1>
            </div>
        </div>
    </section>

    <section class="margin_60_35" id="create-plan-container" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container" style="display: flex; flex-direction: column;">
            <div class="row text-center" id="question-steps">
                <!-- Pregunta 1 -->
                <div class="question-block">
                    <h2 class="indent_title" style="font-weight: 900; color: #FFF;">¿Qué te motiva a empezar a entrenar?</h2>

                    <div class="card-row" data-step="0">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/01-01_pregunta.png"
                            data-img-selected="img/descubrir-plan/01-01_pregunta-seleccion.png"
                            onclick="selectCard(0, 1, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/01-01_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/01-02_pregunta.png"
                            data-img-selected="img/descubrir-plan/01-02_pregunta-seleccion.png"
                            onclick="selectCard(0, 2, this)" 
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/01-02_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/01-03_pregunta.png"
                            data-img-selected="img/descubrir-plan/01-03_pregunta-seleccion.png"
                            onclick="selectCard(0, 3, this)" 
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/01-03_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/01-04_pregunta.png"
                            data-img-selected="img/descubrir-plan/01-04_pregunta-seleccion.png"
                            onclick="selectCard(0, 4, this)" 
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/01-04_pregunta.png" class="img-responsive" />
                        </div>
                    </div>
                </div>
                
                <!-- Pregunta 2 -->
                <div class="question-block">
                    <h2 class="indent_title" style="font-weight: 900; color: #FFF;">¿Qué tan comprometido(a) te ves entrenando en el gimnasio?</h2>

                    <div class="card-row" data-step="1">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/02-01_pregunta.png"
                            data-img-selected="img/descubrir-plan/02-01_pregunta-seleccion.png"
                            onclick="selectCard(1, 1, this)" 
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/02-01_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/02-02_pregunta.png"
                            data-img-selected="img/descubrir-plan/02-02_pregunta-seleccion.png"
                            onclick="selectCard(1, 2, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/02-02_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/02-03_pregunta.png"
                            data-img-selected="img/descubrir-plan/02-03_pregunta-seleccion.png"
                            onclick="selectCard(1, 3, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/02-03_pregunta.png" class="img-responsive" />
                        </div>
                    </div>
                </div>

                <!-- Pregunta 3 -->
                <div class="question-block">
                    <h2 class="indent_title" style="font-weight: 900; color: #FFF;">¿Qué tipo de entrenamiento te haría sentir más cómodo y motivado para empezar?</h2>

                    <div class="card-row" data-step="2">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/03-01_pregunta.png"
                            data-img-selected="img/descubrir-plan/03-01_pregunta-seleccion.png"
                            onclick="selectCard(2, 1, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/03-01_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/03-02_pregunta.png"
                            data-img-selected="img/descubrir-plan/03-02_pregunta-seleccion.png"
                            onclick="selectCard(2, 2, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/03-02_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/03-03_pregunta.png"
                            data-img-selected="img/descubrir-plan/03-03_pregunta-seleccion.png"
                            onclick="selectCard(2, 3, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/03-03_pregunta.png" class="img-responsive" />
                        </div>
                    </div>
                </div>

                <!-- Pregunta 4 -->
                <div class="question-block">
                    <h2 class="indent_title" style="font-weight: 900; color: #FFF;">¿En cuál sede Fitness People te gustaría entrenar?</h2>

                    <div class="card-row" data-step="3">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            <%--data-img-default="img/descubrir-plan/04-01_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-01_pregunta-seleccion.png"--%>
                            onclick="selectCard(3, 1, this)"
                            <%--onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)"--%> >
                            <img src="img/descubrir-plan/btn_sede-bucaramanga.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            <%--data-img-default="img/descubrir-plan/04-02_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-02_pregunta-seleccion.png"--%>
                            onclick="selectCard(3, 2, this)"
                            <%--onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)"--%> >
                            <img src="img/descubrir-plan/btn_sede-cucuta.png" class="img-responsive" />
                        </div>
                    </div>
                </div>

                <!-- Pregunta 5 | Sedes -->
                <div class="question-block" id="sede-opciones-container">
                    <h2 class="indent_title" style="font-weight: 900; color: #FFF;">Sedes en Bucaramanga</h2>

                    <%--Opciones Bucaramanga--%>
                    <div class="card-row opciones-bucaramanga" data-step="4" style="display: none;">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-01_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-01_pregunta-seleccion.png"
                            onclick="selectCard(4, 1, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-01_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-02_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-02_pregunta-seleccion.png"
                            onclick="selectCard(4, 2, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-02_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-03_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-03_pregunta-seleccion.png"
                            onclick="selectCard(4, 3, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-03_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-04_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-04_pregunta-seleccion.png"
                            onclick="selectCard(4, 4, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-04_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-05_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-05_pregunta-seleccion.png"
                            onclick="selectCard(4, 5, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-05_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-06_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-06_pregunta-seleccion.png"
                            onclick="selectCard(4, 6, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-06_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-07_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-07_pregunta-seleccion.png"
                            onclick="selectCard(4, 7, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-07_pregunta.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-08_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-08_pregunta-seleccion.png"
                            onclick="selectCard(4, 8, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-08_pregunta.png" class="img-responsive" />
                        </div>
                    </div>

                    <%--Opciones Cucuta--%>
                    <div class="card-row opciones-cucuta" data-step="4" style="display: none;">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-09_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-09_pregunta-seleccion.png"
                            onclick="selectCard(4, 1, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-09_pregunta.png" class="img-responsive" />
                        </div>
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 card img_container" 
                            data-img-default="img/descubrir-plan/04-10_pregunta.png"
                            data-img-selected="img/descubrir-plan/04-10_pregunta-seleccion.png"
                            onclick="selectCard(4, 2, this)"
                            onmouseover="cambiarImagenHover(this)" 
                            onmouseout="restaurarImagenHover(this)" >
                            <img src="img/descubrir-plan/04-10_pregunta.png" class="img-responsive" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Barra de progreso -->
            <div class="progress-bar">
                <div id="progress-fill" class="progress-fill"></div>
            </div>

            <!-- Botones de navegación -->
            <div class="quiz-controls">
                <button type="button" id="btnPrev" class="toLeft" onclick="goToPrevious()" disabled=""><i class="fa-solid fa-chevron-left"></i></button>
                <button type="button" id="btnNext" onclick="goToNext()" style="display:none;">Siguiente</button>
            </div>
            <!-- End row plans-->
        </div>
        <!--  End container-->
    </section>

    <%--<section class="margin_60_35" id="planes" style="padding-top: 10px; padding-bottom: 15px;">
        <div class="container">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Nuestras Sedes</h2>

            <div class="row">
                <div class="owl-carousel team-carousel3" width="600px">

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
                                        AppendDataBoundItems="true"
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
        </div>
    </section>--%>

    <%--<section class="margin_60_35" id="testimonials" style="padding-top: 10px; padding-bottom: 15px;">
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
            <!--End Team Carousel-->
        </div>
        <!--  End container-->
    </section>--%>

    <section class="margin_60_35" id="planes" style="padding-top: 10px; padding-bottom: 15px;">
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
    </script>

    <script>

        const totalSteps = 5;
        let currentStep = 0;
        const answers = [];

        const allSteps = document.querySelectorAll('.question-block');
        const progressFill = document.getElementById("progress-fill");
        const btnPrev = document.getElementById("btnPrev");
        const btnNext = document.getElementById("btnNext");

        function selectCard(step, value, card) {
            const cards = document.querySelectorAll(`.card-row[data-step="${step}"] .card`);
            const wasSelected = card.classList.contains("selected");

            // Deselecciona todas
            cards.forEach(c => {
                c.classList.remove("selected");
                const img = c.querySelector("img");
                const defaultImg = c.getAttribute("data-img-default");
                if (img && defaultImg) img.src = defaultImg;
            });

            if (!wasSelected) {
                // Marca esta tarjeta como seleccionada
                card.classList.add("selected");
                answers[step] = value;

                const img = card.querySelector("img");
                const selectedImg = card.getAttribute("data-img-selected");
                if (img && selectedImg) img.src = selectedImg;

                // Lógica condicional si estamos en la pregunta de sede
                if (step === 3) mostrarOpcionesPorSede(value); // value 1 o 2

                if (step === 4) {
                    // Construimos query params con las respuestas
                    const queryParams = answers
                        .map((val, index) => `q${index + 1}=${encodeURIComponent(val)}`)
                        .join("&");

                    // Redirige a la página con las respuestas en la URL
                    window.location.href = `resultado.aspx?${queryParams}`;
                }

                goToNext();

            } else {
                // Se deseleccionó la tarjeta actual
                answers[step] = null;

                // Si deselecciona sede, ocultamos todo lo que sigue
                if (step === 3) ocultarOpcionesPorSede();
            }
        }

        function restoreSelection(step) {
            const selectedValue = answers[step];

            // Paso 4 es condicional, así que debemos buscar en el bloque visible
            if (step === 4) {
                const visibles = document.querySelectorAll(`.card-row[data-step="${step}"]`);
                visibles.forEach(row => {
                    if (getComputedStyle(row).display !== "none") {
                        const cards = row.querySelectorAll('.card');
                        cards.forEach((card, index) => {
                            card.classList.remove("selected");
                            if ((index + 1) === selectedValue) {
                                card.classList.add("selected");
                            }
                        });
                    }
                });
            } else {
                // Comportamiento normal para otros pasos
                const cards = document.querySelectorAll(`.card-row[data-step="${step}"] .card`);
                cards.forEach((card, index) => {
                    card.classList.remove("selected");
                    if ((index + 1) === selectedValue) {
                        card.classList.add("selected");
                    }
                });
            }

            btnNext.disabled = selectedValue == null;
        }

        function mostrarOpcionesPorSede(sedeSeleccionada) {
            const opcionesBga = document.querySelector('.opciones-bucaramanga');
            const opcionesCuc = document.querySelector('.opciones-cucuta');

            // Ocultamos ambas primero
            opcionesBga.style.display = "none";
            opcionesCuc.style.display = "none";

            if (sedeSeleccionada === 1) {
                opcionesBga.style.display = "flex";
            } else if (sedeSeleccionada === 2) {
                opcionesCuc.style.display = "flex";
            }
        }

        function ocultarOpcionesPorSede() {
            const opcionesBga = document.querySelector('.opciones-bucaramanga');
            const opcionesCuc = document.querySelector('.opciones-cucuta');

            opcionesBga.style.display = "none";
            opcionesCuc.style.display = "none";
        }

        function cambiarImagenHover(card) {
            const img = card.querySelector("img");
            const hoverImg = card.getAttribute("data-img-selected");
            if (img && hoverImg) img.src = hoverImg;
        }

        function restaurarImagenHover(card) {
            const img = card.querySelector("img");
            if (!img) return;

            if (card.classList.contains("selected")) {
                const selectedImg = card.getAttribute("data-img-selected");
                if (selectedImg) img.src = selectedImg;
            } else {
                const defaultImg = card.getAttribute("data-img-default");
                if (defaultImg) img.src = defaultImg;
            }
        }

        function goToNext() {
            if (answers[currentStep] == null) return;

            allSteps[currentStep].style.display = "none";
            currentStep++;

            if (currentStep < totalSteps) {
                allSteps[currentStep].style.display = "block";
                btnNext.disabled = answers[currentStep] == null;
            }

            // Restaura selección visual
            restoreSelection(currentStep);

            btnPrev.disabled = currentStep === 0;

            if (currentStep === totalSteps - 1) {
                btnNext.textContent = "Finalizar";
            }

            updateProgress();
        }

        function goToPrevious() {
            allSteps[currentStep].style.display = "none";
            currentStep--;

            allSteps[currentStep].style.display = "block";
            btnNext.disabled = answers[currentStep] == null;

            // Restaura selección visual
            restoreSelection(currentStep);

            btnPrev.disabled = currentStep === 0;
            btnNext.textContent = "Siguiente";

            updateProgress();
        }

        function updateProgress() {
            let percent = ((currentStep) / totalSteps) * 100;
            progressFill.style.width = percent + "%";
        }

        window.onload = function () {
            allSteps.forEach((block, index) => {
                block.style.display = index === 0 ? "block" : "none";
            });
            btnNext.disabled = true;
        };

    </script>

    <style>

        .card-row {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .card {
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s;
            border: 3px solid transparent;
        }

        .progress-bar {
            margin: 0;
            height: 25px;
            background: #1A1A1A;
            border-radius: 15px;
            margin: 20px 0;
            overflow: hidden;
            width: 100%;
        }

        .progress-fill {
            height: 100%;
            background: #E3FF00;
            border-radius: 15px;
            width: 0%;
            transition: width 0.3s;
        }

        /*TODO: Revisar aside son necesarios estos estilos*/

        .quiz-controls {
            display: flex;
            justify-content: space-evenly;
            margin: 10px 0 30px 0;
        }

        .quiz-controls button {
            padding: 10px 20px;
            border: none;
            background: #E3FF00;
            color: #000000;
            border-radius: 15px;
            cursor: pointer;
        }

        .quiz-controls button:disabled {
            background: #1A1A1A;
            color: #FFFFFF;
            cursor: not-allowed;
        }

        .question-block {
            margin-bottom: 40px;
            display: none;
        }

    </style>

</body>
</html>
