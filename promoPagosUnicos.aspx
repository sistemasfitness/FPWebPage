<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="promoPagosUnicos.aspx.cs" Inherits="WebPage.promoPagosUnicos" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/servicios.ascx" TagPrefix="uc1" TagName="servicios" %>
<%@ Register Src="~/controls/sedes.ascx" TagPrefix="uc1" TagName="sedes" %>
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/promo-2026-03-26.jpeg" data-natural-width="1900" >
        <div id="sub_content_in">
            <%--<h1 style="font-weight: 900;">PLANES EASY MENSUALES</h1>--%>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <%--<section id="barraProgreso" runat="server" visible="false" style="text-align: center;">
        <div class="container">
            <asp:Literal ID="litScriptFechas" runat="server" EnableViewState="false"></asp:Literal>

            <h2 style="font-weight: 900; color: #e3ff00;">¡Date prisa!</h2>

            <div class="progress-bar">
                <div id="progress-fill" class="progress-fill"></div>
            </div>

            <h4 style="font-weight: 500; color: #e3ff00;">Esta promo termina en: </h4>

            <p style="font-size: 3rem; font-weight: 900; color: #FFF;" id="time-remaining"></p>
        </div>
    </section>--%>

    <section class="margin_60_35">
	    <div class="container">

            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>No te quedes sin la tuya</h2>

		    <div class="row plans">

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <%--<span class="ribbon-2"></span>--%>
                        <%--<p class="ribbon-3">Más beneficios</p>--%>

                        <img src="img/planes-cards/promo_plan-12-meses_renovacion.jpeg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Activo</h2>
                            <%--<h4 class="plan-title" style="font-size: 12px;">Plan 6 Meses</h4>--%>

                            <p>Si eres un usuario activo en Fitness People, este plan es para ti.</p>

                            <p class="plan-price" style="margin-bottom: 0;">$ 687.500</p>
                            <%--<p>DESPUÉS $99.000</p>--%>

                            <p class="plan-title" style="margin-bottom: 10px;">&nbsp;</p>

                            <p class="plan-title">+ Camiseta de la selección</p>

                            <div class="text-center">
                                <a href="#" 
                                   class="btn-confirm-alert"
                                   onclick="planAddToCart(
                                       ['40'],
                                       'Plan Activo',
                                       687500,
                                       'https://dash.fitmewise.com/admin/register/app/6977e8685a1b2-4164'
                                   ); return false;">
                                   Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
        
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall-2">
                        <p class="ribbon-3">Más beneficios</p>

                        <img src="img/planes-cards/promo_plan-12-meses_nuevos.jpeg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Usuarios Nuevos</h2>
                            <%--<h4 class="plan-title" style="font-size: 12px;">Plan 12 Meses</h4>--%>

                            <p>Si eres un usuario nuevo en Fitness People, este plan es para ti.</p>

                            <p class="plan-price" style="margin-bottom: 0;">$ 783.750</p>
                            <%--<p>DESPUÉS $99.000</p>--%>

                            <p class="plan-title" style="margin-bottom: 10px;">+ 1 mes gratis</p>

                            <p class="plan-title">+ Camiseta de la selección</p>

                            <div class="text-center">
                                <a href="#" 
                                   class="btn_full"
                                   onclick="planAddToCart(
                                       ['41'],
                                       'Plan Usuarios Nuevos',
                                       783750,
                                       'https://dash.fitmewise.com/admin/register/app/6977e8685a1b2-4165'
                                   ); return false;">
                                   Comprar ya
                                </a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>

		    </div>
		    <!-- End row plans-->

	    </div>
	    <!--  End container-->
    </section>
    <!--  End section-->

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

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

                <!-- Capa clickeable -->
                <a href="register?idPlan=21&idVendedor=156"
                    style="position: absolute; inset: 0; z-index: 10;"></a>
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
                content_ids: contentId,
                content_name: contentName,
                value: value,
                currency: 'COP',
                content_type: 'product'
            });

            setTimeout(function () {
                window.location.href = paymentUrl;
            }, 150);
        }

    </script>

    <style>

        .plan-toggle {
            font-weight: 600;
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
