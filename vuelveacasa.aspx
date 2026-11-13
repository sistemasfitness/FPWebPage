<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vuelveacasa.aspx.cs" Inherits="WebPage.vuelveacasa" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
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
        })(window, document, 'script', 'dataLayer', 'GTM-KVFTTJ9G');
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

    <!-- SLIDER -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />

    <!-- SPECIFIC CSS -->
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    <link href="css/pop_up.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KVFTTJ9G" height="0" width="0" style="display: none; visibility: hidden;"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <!-- Control Main Menu -->
    <uc1:mainmenu runat="server" ID="mainmenu" />
    <!-- Control Main Menu -->


    <section class="hero-banner" aria-labelledby="hero-title">
        <a href="#compra">
            <picture class="hero-banner__picture">
                <!-- Imagen para dispositivos móviles -->
                <source
                    media="(max-width: 767px)"
                    srcset="img/banners/banner_2026-11-11_mobile.webp"
                    width="750"
                    height="1000" />

                <!-- Imagen para escritorio -->
                <img
                    class="hero-banner__image"
                    src="img/banners/banner_2026-11-11.webp"
                    width="1920"
                    height="760"
                    alt="Personas entrenando en Fitness People"
                    fetchpriority="high"
                    loading="eager"
                    decoding="async" />
            </picture>
        </a>
    </section>

    <section class="cd bg_black" id="contador" data-estado="antes" aria-labelledby="cdTitulo">
        <div class="cd-wrap">
            <div class="cd-card">
                <div class="cd-top">
                    <span class="cd-titulo" id="cdTitulo">La promoción arranca hoy a las 12:00 m.</span>
                    <span class="cd-fin" id="cdFin">Termina el <b>domingo 15 de noviembre, 12:00 m.</b></span>
                </div>

                <!-- Contador. El lector de pantalla no lo anuncia cada segundo (aria-live="off"). -->
                <div class="cd-reloj" role="timer" aria-live="off" aria-label="Tiempo restante de la promoción">
                    <div class="cd-u"><b id="cdD">00</b><small>Días</small></div>
                    <div class="cd-u"><b id="cdH">00</b><small>Horas</small></div>
                    <div class="cd-u"><b id="cdM">00</b><small>Min</small></div>
                    <div class="cd-u"><b id="cdS">00</b><small>Seg</small></div>
                </div>

                <div>
                    <div class="cd-barra-info">
                        <span id="cdPct">0 %</span>
                    </div>

                    <div class="cd-barra" role="progressbar" id="cdBarra" aria-label="Avance de las 72 horas de la promoción" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                        <div class="cd-relleno" id="cdRelleno"></div>
                    </div>

                    <div class="cd-marcas"><span>Inicio</span><span>24 h</span><span>48 h</span><span>72 h</span></div>
                    <a href="#compra" class="fpp-btn fpp-btn--solid" id="cdCta" data-cta="comprar" data-ubicacion="contador">¡Comprar Ya!</a>
                </div>
            </div>
        </div>
    </section>

    <section class="fp-planes" id="compra">
        <div class="fpp-container">
            <!-- ================= ENCABEZADO ================= -->
            <div class="fpp-head fpp-head-active">
                <div>
                    <p class="fpp-kicker">Compra en línea</p>
                    <h2>Completa tu compra</h2>
                </div>
            </div>

            <!-- ================= IFRAME DE INSCRIPCIÓN ================= -->
            <div id="contenedorIframePlan" class="fp-iframe-container fp-iframe-active">
                <iframe
                    id="iframePlan"
                    src="https://dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-5144"
                    title="Inscripción Fitness People"
                    loading="lazy">
                </iframe>
            </div>
        </div>
    </section>


    <uc1:footer runat="server" ID="footer" />

    <!-- ================= Whatsapp Flotante ================= -->
    <%--<a href="https://api.whatsapp.com/send/?phone=573107842151&text=Acabo%20de%20ver%20su%20p%C3%A1gina%20y%20quiero%20info%20para%20empezar%20a%20entrenar.&type=phone_number&app_absent=0" class="wa-float" target="_blank" aria-label="Escríbenos por WhatsApp">
        <i class="fa-brands fa-whatsapp"></i>
    </a>--%>

    <div id="toTop"></div>

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

    <!-- SLIDER -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>


    <style>

        .hero-banner {
            width: 100%;
            min-height: clamp(360px, 46vw, 560px);
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #111;
        }

        /* Contenedor de la imagen */
        .hero-banner__picture {
            display: block;
            width: 100%;
        }

        /* Imagen adaptable */
        .hero-banner__image {
            display: block;
            width: 100%;
            height: auto;
        }

        /* Título accesible, visualmente oculto */
        .visually-hidden {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        .fpp-head h2 {
            font-size: clamp(25px, 5vw, 56px);
        }

        .fp-planes {
            padding: 60px 20px 80px;
        }

        @media (max-width: 991px) {
            .fp-planes {
                padding: 30px 20px;
            }

            .fp-planes .fpp-head {
                margin-bottom: 0;
            }
        }

        @media (max-width: 400px) {
	        .fpp-head h2 {
		        font-size: 20px;
	        }
        }

    </style>

    <script>

        (function () {
            'use strict';
            /* ------------------------------------------------------------
               CONFIGURACIÓN
               Inicio con la zona horaria de Colombia (-05:00). Duración en horas.
               ------------------------------------------------------------ */
            var CD_INICIO = new Date('2026-11-12T12:00:00-05:00');
            var CD_HORAS = 72;
            var CD_FIN = new Date(CD_INICIO.getTime() + CD_HORAS * 3600000);   // dom 15 nov 2026, 12:00 m.
            var ULTIMAS_HORAS = 6;   // desde aquí los números se ponen en lima

            var sec = document.getElementById('contador');
            if (!sec) return;
            var el = {
                titulo: document.getElementById('cdTitulo'), fin: document.getElementById('cdFin'),
                d: document.getElementById('cdD'), h: document.getElementById('cdH'),
                m: document.getElementById('cdM'), s: document.getElementById('cdS'),
                pct: document.getElementById('cdPct'), 
                barra: document.getElementById('cdBarra'), relleno: document.getElementById('cdRelleno')
            };
            function dos(n) { return n < 10 ? '0' + n : String(n); }
            function pintarReloj(ms) {
                var t = Math.max(0, Math.floor(ms / 1000));
                el.d.textContent = dos(Math.floor(t / 86400));
                el.h.textContent = dos(Math.floor(t % 86400 / 3600));
                el.m.textContent = dos(Math.floor(t % 3600 / 60));
                el.s.textContent = dos(t % 60);
            }
            function pintarBarra(p) {
                var v = Math.round(p * 1000) / 10;                 // un decimal
                el.relleno.style.width = v + '%';
                el.pct.textContent = String(v).replace('.', ',') + ' %';
                el.barra.setAttribute('aria-valuenow', Math.round(v));
            }
            function medir(evento) {
                window.dataLayer = window.dataLayer || [];
                window.dataLayer.push({ event: evento, plan: 'vuelve-a-casa-navidad' });
            }

            var estadoPrevio = null, timer = null;
            function tick() {
                var ahora = Date.now(), estado;

                if (ahora < CD_INICIO) {
                    estado = 'antes';
                    el.titulo.textContent = 'La promoción arranca hoy a las 12:00 m.';
                    pintarReloj(CD_INICIO - ahora);
                    pintarBarra(0);
                } else if (ahora < CD_FIN) {
                    var resta = CD_FIN - ahora;
                    estado = resta <= ULTIMAS_HORAS * 3600000 ? 'ultimas' : 'activa';
                    el.titulo.textContent = estado === 'ultimas' ? '¡Últimas horas de la promoción!' : 'La promoción termina en';
                    pintarReloj(resta);
                    pintarBarra((ahora - CD_INICIO) / (CD_FIN - CD_INICIO));
                } else {
                    estado = 'final';
                    el.titulo.textContent = 'La promoción terminó';
                    el.fin.innerHTML = 'Terminó el <b>domingo 15 de noviembre, 12:00 m.</b>';
                    pintarReloj(0);
                    pintarBarra(1);
                    clearInterval(timer);
                }

                if (estado !== estadoPrevio) {
                    sec.setAttribute('data-estado', estado);
                    if (estadoPrevio !== null) medir('contador_' + estado);   // inicio, últimas horas y cierre, sin repetir
                    estadoPrevio = estado;
                }
            }

            tick();
            timer = setInterval(tick, 1000);
            // Al volver a la pestaña, el reloj se corrige de inmediato (los navegadores frenan los intervalos en segundo plano).
            document.addEventListener('visibilitychange', function () { if (!document.hidden) tick(); });
        })();

    </script>


    <noscript>
        <img height="1" width="1" style="display: none;" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
