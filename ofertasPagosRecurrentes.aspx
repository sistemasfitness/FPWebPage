<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ofertasPagosRecurrentes.aspx.cs" Inherits="WebPage.ofertasRecurrentes" %>

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
            ttq.track('PageView');
            ttq.page();
        }(window, document, 'ttq');
    </script>
    <!-- TikTok Pixel Code End -->

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

    <section id="planes" class="add_top_60 add_bottom_75">
	    <div class="container">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Elige tu plan</h2>

		    <div class="row plans plans-recu">
                <%--<div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall-2">
                        <img src="img/planes-cards/plan-basico-mensual_2026-02-27.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Básico Mensual</h2>

                            <p style="margin-bottom: 10px;">Entrena en una sola sede.</p>

                            <p class="plan-price">$ 39.800 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">+ $ 19.900 de Inscripción</p>

                            <p>DESPUÉS $79.600/mes</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full" 
                                    onclick="planAddToCart(
                                        ['41'],
                                        'Plan Básico Mensual',
                                        59700,
                                        'register?token=4wCAVQZWA8KMirx9Q8hs'
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
                </div>--%>
			    <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall-2">
                        <img src="img/planes-cards/plan-transformate.jpeg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Transformate</h2>

                            <p style="margin-bottom: 10px;">Entrena para lograr tu mejor versión.</p>

                            <p class="plan-price">$ 29.900 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                            <p>DESPUÉS $130.000/mes</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn_full" 
                                    onclick="planAddToCart(
                                        ['43'],
                                        'Plan Transformate',
                                        29900,
                                        'register?token=XK6ZYbmaYkihB41O73I8'
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
                                <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para un amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Comunidad VIP.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física trimestral (4 en un año).</li>
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

                            <p class="plan-price">$ 9.900 1er Mes</p>

                            <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                            <p>DESPUÉS $99.000/mes</p>

                            <p>Fidelidad de 6 meses</p>

                            <div class="text-center">
                                <a href="#" 
                                    class="btn-confirm-alert"
                                    onclick="planAddToCart(
                                        ['40'],
                                        'Plan Flexible Pro',
                                        9900,
                                        'register?token=aKsoXcm34Ca4sMKeHraR'
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
                                <li><i class="fa fa-circle-check"></i>FP App (Plna de entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Comunidad VIP.</span></li>
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
                                        ['42'],
                                        'Plan Mes a Mes',
                                        165000,
                                        'register?token=nji06llzEYJSdjPNh2Dg'
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
                                <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Comunidad VIP.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
			    <!-- End col-md-4 -->
		    </div>
		    <!-- End row plans recu -->
	    </div>
	    <!--  End container-->

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
    </section>
    <!--  End section-->

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

            if (isMobile() || url.includes("register?token=")) {
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



        @media (max-width: 1000px) {
            .plans {
                margin: 0 auto 0 0;
            }

            .plans-recu > div:nth-child(1) {
                order: 2;
            }

            .plans-recu > div:nth-child(2) {
                order: 1; /* Este se va primero */
            }

            .plans-recu > div:nth-child(3) {
                order: 3;
            }
        }

    </style>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toggles = document.querySelectorAll(".plan-toggle");
            const features = document.querySelectorAll(".plan-features");

            let isOpen = false;

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

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
