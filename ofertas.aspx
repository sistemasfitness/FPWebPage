<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ofertas.aspx.cs" Inherits="WebPage.ofertas" %>

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
    <%--<asp:Literal ID="ltBannerFull" runat="server"></asp:Literal>--%>
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/plan_6-mas-2_2025-08-21.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <%--<h1 style="font-weight: 900;">PLANES EASY MENSUALES</h1>--%>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section id="planes" class="margin_60_35">
	    <div class="container">

            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Elige tu plan</h2>

            <div class="plans-switch text-center">
                <button class="switch-btn active" data-target="mas-vendidos">
                    Más Vendidos
                </button>
                <button class="switch-btn" data-target="recurrentes">
                    Pagos Recurrentes
                </button>
                <button class="switch-btn" data-target="unicos">
                    Pagos Únicos
                </button>
            </div>

            <div class="row plans plans-mas-vend">
                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <p class="ribbon-3">Más recomendado</p>

                        <img src="img/planes-cards/plan-flexible-pro_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Flexible Pro</h2>
                            <h4 class="plan-title" style="font-size: 12px;">Plan Débito Automático</h4>

                            <p style="margin-bottom: 0;">Más beneficios desde el primer mes.</p>

                            <p class="plan-price">$ 19.900 1er Mes</p>
                            <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>
                            <p>DESPUÉS $99.500/mes</p>

                            <p class="plan-title">&nbsp;</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn-confirm-alert"
                                    onclick="planAddToCart(
                                        ['36'],
                                        'Plan Flexible Pro',
                                        29800,
                                        'https://www.dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3701'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
    
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">2 meses de cortesía.</span></li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-12-meses_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Año Imparable</h2>
                            <h4 class="plan-title" style="font-size: 12px;">Plan 12 Meses</h4>

                            <p style="margin-bottom: 0;">Entrena sin pausas durante todo un año.</p>

                            <p class="plan-price">$ 990.000</p>

                            <p class="plan-title" style="font-size: 15px;">&nbsp;</p>

                            <p>&nbsp;</p>

                            <p class="plan-title">+ 2 meses gratis</p>

                            <p>Sin fidelidad</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full"
                                    onclick="planAddToCart(
                                        ['7'],
                                        'Plan Año Imparable (Plan 12 Meses)',
                                        990000,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3703'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>2 meses de cortesía.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago mensual automático.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->
            </div>
            <!-- End row plans recu -->

		    <div class="row plans plans-recu">
                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall-2">
                        <%--<p class="ribbon-3" style="width: 250px;">Entrena en una sola sede</p>--%>

                        <img src="img/planes-cards/plan-basico-mensual_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Básico Mensual</h2>

                            <%--<p style="margin-bottom: 0;">Ideal si entrenas siempre en una sola sede.</p>--%>
                            <p style="margin-bottom: 10px;">Entrena en una sola sede.</p>

                            <%--<p class="plan-price">$ 19.900 1er Mes</p>--%>
                            <p class="plan-price">$ 39.800 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">+ $ 19.900 de Inscripción</p>

                            <p>DESPUÉS $79.600/mes</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full" 
                                    onclick="planAddToCart(
                                        ['35'],
                                        'Plan Básico Mensual',
                                        39800,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3700'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a ÚNICA sede.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">FP App (Nutrición).</span></li>
                                <li><i class="fa fa-circle-check"></i>1 cortesía mensual para un amigo.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
			    <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <p class="ribbon-3">Más recomendado</p>

                        <img src="img/planes-cards/plan-flexible-pro_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Flexible Pro</h2>

                            <%--<p style="margin-bottom: 0;">Entrena en todas nuestras sedes.</p>--%>
                            <p style="margin-bottom: 10px;">Entrena en todas nuestra sedes.</p>

                            <p class="plan-price">$ 19.900 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                            <p>DESPUÉS $99.500/mes</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn-confirm-alert"
                                    onclick="planAddToCart(
                                        ['36'],
                                        'Plan Flexible Pro',
                                        29800,
                                        'https://www.dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3701'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
        
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a TODAS las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
			    <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall-2">
                        <%--<p class="ribbon-3">Paga mes a mes</p>--%>

                        <img src="img/planes-cards/plan-mes-a-mes.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Mes a Mes</h2>

                            <%--<p style="margin-bottom: 0;">Empieza y termina cuando quieras.</p>--%>
                            <p style="margin-bottom: 10px;">Entrena en todas nuestra sedes.</p>

                            <p class="plan-price">$ 165.000 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                            <p>RENOVACIÓN MES A MES</p>

                            <p>Sin fidelidad</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full"
                                    onclick="planAddToCart(
                                        ['31'],
                                        'Plan Mes a Mes',
                                        92400,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3702'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a TODAS las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->
		    </div>
		    <!-- End row plans recu -->

            <div class="row plans plans-unic">
                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-3-meses_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Trimestral</h2>
                            <h4 class="plan-title" style="font-size: 12px;">Plan 3 Meses</h4>

                            <p style="margin-bottom: 0;">Compromiso corto, resultados reales.</p>

                            <p class="plan-price">$ 350.000</p>
                            <%--<p>DESPUÉS $99.000</p>--%>

                            <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">&nbsp;</p>

                            <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 116.666/mes</p>

                            <p>Sin fidelidad</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full"
                                    onclick="planAddToCart(
                                        ['4'],
                                        'Plan Trimestral (Plan 3 Meses)',
                                        350000,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3705'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">2 meses de cortesía.</span></li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <p class="ribbon-3" >Más recomendado</p>

                        <img src="img/planes-cards/plan-12-meses_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Año Imparable</h2>
                            <h4 class="plan-title" style="font-size: 12px;">Plan 12 Meses</h4>

                            <p style="margin-bottom: 0;">Entrena sin pausas durante todo un año.</p>

                            <p class="plan-price">$ 990.000</p>
                            <%--<p>DESPUÉS $99.000</p>--%>

                            <%--<p class="plan-title" style="margin-bottom: 7px;">+ 2 meses gratis</p>--%>
                            <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">+ 2 meses gratis</p>

                            <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 70.714/mes</p>

                            <p>Sin fidelidad</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn-confirm-alert"
                                    onclick="planAddToCart(
                                        ['7'],
                                        'Plan Año Imparable (Plan 12 Meses)',
                                        990000,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3703'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>2 meses de cortesía.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <%--<span class="ribbon-2"></span>--%>
                        <%--<p class="ribbon-3">Más beneficios</p>--%>

                        <img src="img/planes-cards/plan-6-meses_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Pro</h2>
                            <h4 class="plan-title" style="font-size: 12px;">Plan 6 Meses</h4>

                            <p style="margin-bottom: 0;">Invierte en ti y entrena sin excusas.</p>

                            <p class="plan-price">$ 590.000</p>

                            <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">&nbsp;</p>

                            <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 98.333/mes</p>

                            <p>Sin fidelidad</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full"
                                    onclick="planAddToCart(
                                        ['5'],
                                        'Plan Pro (Plan 6 Meses)',
                                        590000,
                                        'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3704'
                                    ); return false;">
                                    Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
        
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">2 meses de cortesía.</span></li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->
            </div>
            <!-- End row plans unic -->
	    </div>

        <div class="container">
            <div id="paymentModal" class="payment-modal">
                <div id="paymentContainer" class="payment-container">

                    <div id="paymentHeader" class="payment-header">
                        <h2 style="font-weight: 900; color: #E3FF00;">Paso 1: Crea tu perfil y empieza hoy en Fitness People</h2>
                        <button type="button" onclick="closePayment()" class="btn-close">✕</button>
                    </div>

                    <iframe id="paymentFrame" src=""></iframe>

                </div>
            </div>
        </div>
	    <!--  End container-->
    </section>
    <!--  End section-->



    <%--<a href="register?token=Zh7zCk8gZEArPIrmCG7Z">
        <section class="banner-promo">
            <div id="sub_content_in2">
            </div>
        </section>
    </a>--%>



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


    <script>

        function isMobile() {
            return /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
        }

        function openPaymentInline(url) {

            if (isMobile()) {
                // 🔥 abrir fuera del iframe (100% confiable)
                window.location.href = url;
                return;
            }

            const container = document.getElementById("paymentContainer");
            const iframe = document.getElementById("paymentFrame");
            const header = document.getElementById("paymentHeader");

            // Mostrar el contenedor
            container.style.display = "block";

            // Mostrar botón cerrar
            header.style.display = "flex";

            // Cargar URL en el iframe
            iframe.src = url;

            // Bajar suavemente hasta el iframe
            setTimeout(() => {
                container.scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });
            }, 100);
        }


        function closePayment() {

            const container = document.getElementById("paymentContainer");
            const iframe = document.getElementById("paymentFrame");
            const planes = document.getElementById("planes");
            const header = document.getElementById("paymentHeader");

            // Limpiar iframe (detiene el proceso)
            iframe.src = "";

            // Ocultar contenedor
            container.style.display = "none";

            // Ocultar botón cerrar otra vez
            header.style.display = "none";

            // Subir suavemente a los planes
            setTimeout(() => {
                planes.scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });
            }, 100);
        }

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
                openPaymentInline(paymentUrl);
            }, 150);
        }

    </script>

    <style>

        .payment-container {
            display: none;
            width: 100%;
            margin-top: 30px;
        }

        .payment-header {
            display: none;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .btn-close {
            background: #000;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 50%;
            width: 40px;
            height: 40px;
        }

        #paymentFrame {
            width: 100%;
            height: 85vh;
            border: none;
            border-radius: 10px;
        }

        /* 📱 Mobile */
        @media (max-width: 768px) {
            #paymentFrame {
                height: 100vh;
                border-radius: 0;
            }

            .payment-header {
                position: sticky;
                top: 35px;
                padding: 10px;
                z-index: 10;
                background-color: #000000;
            }
        }



        .plans-switch {
            display: flex;
            justify-content: center;
        }

        .switch-btn {
            background: transparent;
            border: 2px solid #d6ff00;
            color: #d6ff00;
            padding: 10px 25px;
            margin: 0 10px;
            font-weight: 600;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .switch-btn:hover {
            background: #d6ff00;
            color: #000;
        }

        .switch-btn.active {
            background: #d6ff00;
            color: #000;
        }



        .plan-features {
            overflow: hidden;
            max-height: 0;
            opacity: 0;
            transition: max-height 0.35s ease, opacity 0.25s ease;
        }

        .plan-features.open {
            opacity: 1;
        }

        .plan-toggle {
            cursor: pointer;
            font-weight: 600;
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .plan-toggle .toggle-icon {
            transition: transform 0.3s ease;
        }

        .plan-toggle.active .toggle-icon {
            transform: rotate(180deg);
        }



        .plans-wrapper {
            margin: 60px auto 0px 0;
            /*gap: 16px;*/
        }

        .plans-carousel {
            width: auto;
        }

        @media (max-width: 992px) {

            .plans-wrapper {
                margin-top: 25px;
            }
        }

        @media (max-width: 600px) {
            /*.plans-wrapper {
                padding: 25px;
            }*/
        }



        .banner-promo {
            background-image: url('img/banners/plan-12-meses-duo_2026-02-25.jpg');
            background-size: cover;
            background-position: center;
            height: 470px;
        }

        @media (max-width: 1000px) {
            .plans {
                margin: 0 auto 0 0;
            }

            .banner-promo {
                background-image: url('img/banners/plan-12-meses-duo_mobile_2026-02-25.jpg');
            }
        }

    </style>


    <script>
        document.addEventListener("DOMContentLoaded", function () {

            const buttons = document.querySelectorAll(".switch-btn");
            const recurrentes = document.querySelector(".plans-recu");
            const unicos = document.querySelector(".plans-unic");
            const masVendidos = document.querySelector(".plans-mas-vend");

            unicos.style.display = "none";
            recurrentes.style.display = "none";

            const toggles = document.querySelectorAll(".plan-toggle");
            const features = document.querySelectorAll(".plan-features");

            let isOpen = false;

            buttons.forEach(btn => {
                btn.addEventListener("click", function () {

                    // Quitar activo a todos
                    buttons.forEach(b => b.classList.remove("active"));

                    // Activar el actual
                    this.classList.add("active");

                    const target = this.getAttribute("data-target");

                    if (target === "recurrentes") {
                        recurrentes.style.display = "flex";
                        unicos.style.display = "none";
                        masVendidos.style.display = "none";
                    } else if (target === "unicos") {
                        recurrentes.style.display = "none";
                        unicos.style.display = "flex";
                        masVendidos.style.display = "none";
                    } else {
                        recurrentes.style.display = "none";
                        unicos.style.display = "none";
                        masVendidos.style.display = "flex";
                    }

                    // Cerrar todos
                    features.forEach(f => {
                        f.classList.remove("open");
                        f.style.maxHeight = null;
                    });

                    toggles.forEach(t => t.classList.remove("active"));

                    isOpen = false;
                });
            });

            toggles.forEach(toggle => {
                toggle.addEventListener("click", function () {

                    if (!isOpen) {
                        // Abrir todos
                        features.forEach(f => {
                            f.classList.add("open");
                            f.style.maxHeight = f.scrollHeight + "px";
                        });

                        toggles.forEach(t => t.classList.add("active"));

                        isOpen = true;
                    } else {
                        // Cerrar todos
                        features.forEach(f => {
                            f.classList.remove("open");
                            f.style.maxHeight = null;
                        });

                        toggles.forEach(t => t.classList.remove("active"));

                        isOpen = false;
                    }

                });
            });

        });
    </script>

    <%--<script>
        $(document).ready(function () {

            $(".plans-carousel").owlCarousel({
                items: 1,
                loop: true,
                nav: true,
                center: true,
                margin: 16,
                responsiveClass: false,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });

        });
    </script>--%>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
