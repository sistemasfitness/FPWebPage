<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sedes.aspx.cs" Inherits="WebPage.sedes" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Google Tag Manager -->
    <%--<script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');
    </script>--%>
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- SPECIFIC CSS -->
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    <link href="css/pop_up.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <%--<noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>--%>
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KVFTTJ9G" height="0" width="0" style="display:none; visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <!-- Control Main Menu -->
    <uc1:mainmenu runat="server" ID="mainmenu" />
    <!-- Control Main Menu -->

    <section class="bg_black margin-top-header">
        <div class="container container-sedes">
            <!-- Encabezado de la sección -->
            <div class="fpp-head">
                <div>
                    <p class="fpp-kicker">Sedes Fitness People</p>
                    <h2 class="fpp-title-sedes">Conoce nuestras <span>sedes</span></h2>
                </div>
            </div>

            <!-- =============== BUCARAMANGA =============== -->
            <div class="sede-ciudad">
                <div class="sede-ciudad-header">
                    <div class="sede-ciudad-line"></div>
                    <h3>Bucaramanga</h3>
                    <span>5 sedes</span>
                </div>

                <div class="sedes-container">
                    <!-- Cabecera -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=2">
                            <img src="img/descubrir-plan/04-01_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Cabecera" />

                            <img src="img/descubrir-plan/04-01_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Cabecera" />
                        </a>
                    </div>

                    <!-- El Prado -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=8">
                            <img src="img/descubrir-plan/04-02_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede El Prado" />

                            <img src="img/descubrir-plan/04-02_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede El Prado" />
                        </a>
                    </div>

                    <!-- Boulevard -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=1">
                            <img src="img/descubrir-plan/04-03_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Boulevard" />

                            <img src="img/descubrir-plan/04-03_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Boulevard" />
                        </a>
                    </div>

                    <!-- Ciudadela -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=10">
                            <img src="img/descubrir-plan/04-05_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Ciudadela" />

                            <img src="img/descubrir-plan/04-05_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Ciudadela" />
                        </a>
                    </div>

                    <!-- Provenza -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=9">
                            <img src="img/descubrir-plan/04-08_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Provenza" />

                            <img src="img/descubrir-plan/04-08_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Provenza" />
                        </a>
                    </div>
                </div>
            </div>

            <!-- =============== FLORIDABLANCA =============== -->
            <div class="sede-ciudad">
                <div class="sede-ciudad-header">
                    <div class="sede-ciudad-line"></div>
                    <h3>Floridablanca</h3>
                    <span>1 sede</span>
                </div>

                <div class="sedes-container">
                    <!-- Cañaveral -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=3">
                            <img src="img/descubrir-plan/04-04_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Cañaveral" />

                            <img src="img/descubrir-plan/04-04_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Cañaveral" />
                        </a>
                    </div>
                </div>
            </div>

            <!-- =============== PIEDECUESTA =============== -->
            <div class="sede-ciudad">
                <div class="sede-ciudad-header">
                    <div class="sede-ciudad-line"></div>
                    <h3>Piedecuesta</h3>
                    <span>2 sedes</span>
                </div>

                <div class="sedes-container">
                    <!-- De La Cuesta -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=5">
                            <img src="img/descubrir-plan/04-06_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede De La Cuesta" />

                            <img src="img/descubrir-plan/04-06_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede De La Cuesta" />
                        </a>
                    </div>

                    <!-- Parque Central -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=7">
                            <img src="img/descubrir-plan/04-07_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Parque Central" />

                            <img src="img/descubrir-plan/04-07_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Parque Central" />
                        </a>
                    </div>
                </div>
            </div>

            <!-- =============== CÚCUTA =============== -->
            <div class="sede-ciudad">
                <div class="sede-ciudad-header">
                    <div class="sede-ciudad-line"></div>
                    <h3>Cúcuta</h3>
                    <span>2 sedes</span>
                </div>

                <div class="sedes-container">
                    <!-- Ceiba II -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=6">
                            <img src="img/descubrir-plan/04-09_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Ceiba II" />

                            <img src="img/descubrir-plan/04-09_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Ceiba II" />
                        </a>
                    </div>

                    <!-- Jardín Plaza -->
                    <div>
                        <a class="sede-card" 
                           href="sede?id=4">
                            <img src="img/descubrir-plan/04-10_pregunta.png"
                                 class="imagen-normal"
                                 alt="Sede Jardín Plaza" />

                            <img src="img/descubrir-plan/04-10_pregunta-seleccion.png"
                                 class="imagen-hover"
                                 alt="Sede Jardín Plaza" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->


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


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
