<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planflexiblepro.aspx.cs" Inherits="WebPage.planflexiblepro" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/PlanCard.ascx" TagPrefix="uc" TagName="PlanCard" %>
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
    <meta property="og:description" content="Entrena en un centro médico deportivo." />
    <meta property="og:image" content="https://fitnesspeoplecolombia.com/img/sedes/boulevard__.jpg" />
    <meta property="og:image:width" content="600" />
    <meta property="og:image:height" content="355" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://fitnesspeoplecolombia.com" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Entrena en un centro médico deportivo." />
    <meta name="author" content="Fitness People" />
    <title>Plan Flexible Pro | Fitness People</title>

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

    <!-- ================= BANNER INICIO ================= -->
    <section class="fpp-hero fpp-hero-plan">
        <div class="container">
            <div class="fpp-hero-section">
                <div>
                    <p class="fpp-kicker">Centro Médico Deportivo · Santander</p>

                    <h1 class="fpp-general-title">Entrena en un centro <span>médico</span> deportivo</h1>
                    <p class="fpp-hero-sub">
                        Deportólogo, fisioterapeuta y nutricionista de tu lado. Aunque nunca hayas ido a un gimnasio.
                    </p>

                    <div class="fpp-oferta">
                        <div class="fpp-oferta-row">
                            <span class="fpp-oferta-precio">$9.900</span>
                            <span class="fpp-oferta-txt">el primer mes · sin inscripción</span>
                        </div>
                        <p class="fpp-oferta-cond">Luego <span>$99.000</span>/mes · permanencia 12 meses · promo hasta el <span>31 de octubre</span></p>
                    </div>

                    <div class="fpp-hero-ctas">
                        <a class="fpp-btn fpp-btn--solid" href="register?token=TKIlFPP8XYRC9l1rfGjR">
                            Empieza por $9.900
                        </a>
                        <a class="fpp-btn fpp-btn--outline" href="agendaDiaCortesia">
                            Prueba un día gratis
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= FRANJA ================= -->
    <section class="fpp-franja" aria-label="Equipo médico en sede">
        <div class="container wrap">
            <div class="fpp-dif">
                <i class="fa-solid fa-stethoscope"></i>
                <b>Deportólogo<span>en sede</span></b>
            </div>
            <div class="fpp-dif">
                <i class="fa-solid fa-apple-whole"></i>
                <b>Nutricionista</b>
            </div>
            <div class="fpp-dif">
                <i class="fa-solid fa-universal-access"></i>
                <b>Fisioterapeuta<span>en sede</span></b>
            </div>
        </div>
    </section>

    <!-- ================= PARA TI ================= -->
    <section class="fpp-sec">
        <div class="container wrap">
            <p class="fpp-kicker">¿Te identificas?</p>
            <h2 class="fpp-title">Esto es para ti si…</h2>

            <div class="fpp-parati">
                <div class="fpp-pt"><b>Te duele la espalda o la rodilla</b><p>Empiezas con valoración y un plan que cuida tu lesión.</p></div>
                <div class="fpp-pt"><b>Nunca has ido a un gimnasio</b><p>Te acompañamos desde el primer día. Nadie te deja solo.</p></div>
                <div class="fpp-pt"><b>Quieres seguir siendo independiente</b><p>Fuerza y movilidad para jugar con tus nietos y moverte sin ayuda.</p></div>
            </div>
        </div>
    </section>

    <!-- ================= ASÍ EMPIEZAS ================= -->
    <section class="fpp-sec bg_dark-gray">
        <div class="container">
            <div class="fpp-pasos-grid">
                <div>
                    <p class="fpp-kicker">Así empiezas</p>
                    <h2 class="fpp-title">3 pasos. Sin adivinar</h2>

                    <ol class="fpp-pasos">
                    <li><span class="n">1</span><div><b>Valoración física inicial</b><p>Incluida en tu plan: revisamos tu condición antes de que levantes un peso.</p></div></li>
                    <li><span class="n">2</span><div><b>Deportólogo y fisioterapeuta</b><p>Si tienes dolor o una lesión, hay especialistas en la sede.</p></div></li>
                    <li><span class="n">3</span><div><b>Tu plan en la app y acompañamiento</b><p>Rutina y tips de nutrición en la FP App, profesionales del deporte en sala.</p></div></li>
                    </ol>
                </div>

                <div class="fpp-equipo">
                    <figure><img src="https://fitnesspeoplecolombia.com/img/profesionales/fisioterapeuta.jpg" alt="Fisioterapeuta de Fitness People atendiendo a una socia" loading="lazy" decoding="async"/><figcaption>Fisioterapia</figcaption></figure>
                    <figure><img src="https://fitnesspeoplecolombia.com/img/profesionales/nutricionista.jpg" alt="Nutricionista de Fitness People en consultorio" loading="lazy" decoding="async"/><figcaption>Nutrición</figcaption></figure>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= TESTIMONIOS ================= -->
    <section class="fpp-sec">
        <div class="container wrap">
            <p class="fpp-kicker">Lo dicen nuestros socios</p>
            <h2 class="fpp-title">Gente como tú, entrenando con respaldo</h2>

            <div class="fpp-socios">
                <article class="fpp-testi">
                    <div class="fpp-testi-cab"><span class="fpp-avatar" aria-hidden="true"></span><div><b>Testimonio real · primera vez en un gym</b><small>Sede y ciudad</small></div></div>
                    <p>Qué temía antes de entrar y cómo fue su primer mes.</p>
                </article>
                <article class="fpp-testi">
                    <div class="fpp-testi-cab"><span class="fpp-avatar" aria-hidden="true"></span><div><b>Testimonio real · socio 45+</b><small>Sede y ciudad</small></div></div>
                    <p>Cómo llegó (dolor, sin experiencia) y qué cambió en su vida, en sus palabras.</p>
                </article>
                <article class="fpp-testi">
                    <div class="fpp-testi-cab"><span class="fpp-avatar" aria-hidden="true"></span><div><b>Testimonio real · primera vez en un gym</b><small>Sede y ciudad</small></div></div>
                    <p>Qué temía antes de entrar y cómo fue su primer mes.</p>
                </article>
            </div>
        </div>
    </section>

    <!-- ================= PLAN ================= -->
    <section class="fpp-sec fpp-plan-sec" id="plan">
        <div class="container wrap">
            <div class="fpp-sec-center">
                <p class="fpp-kicker">Elige cómo empezar</p>
                <h2 class="fpp-title">Tu plan</h2>
            </div>

            <div class="fpp-plan-sec-fp">
                <div class="fpp-plan-fp">
                    <!-- ============ PLAN FLEXIBLE PRO (DESTACADO) ============ -->
                    <uc:PlanCard
                        ID="PlanFlexiblePro"
                        runat="server"
                        PlanId="FLEXIBLE_PRO" />
                </div>
            </div>
        </div>
    </section>

    <!-- ================= FAQ ================= -->
    <section class="fpp-faq" id="faq">
        <div class="container">
            <div class="fpp-faq-grid">
                <div class="fpp-section-head">
                    <div class="fpp-kicker">Antes de empezar</div>
                    <h2 class="fpp-general-title">Tus <span>dudas</span></h2>
                    <p>Lo que más nos preguntan quienes empiezan por primera vez.</p>
                </div>

                <div class="fpp-fap-section">
                    <details open="open">
                        <summary>Nunca he ido a un gimnasio, ¿es para mí?</summary>
                        <p>Sí. Empiezas con valoración y un profesional te guía en la sala. No tienes que saber nada antes de llegar.</p>
                    </details>
                    <details>
                        <summary>Tengo una lesión o una condición médica</summary>
                        <p>Justamente para eso está el equipo médico. Antes de entrenar te hacemos una valoración y, si tienes dolor o una lesión, el deportólogo y el fisioterapeuta de la sede ajustan tu plan a tu condición.</p>
                    </details>
                    <details>
                        <summary>¿Cómo funciona el débito y la permanencia?</summary>
                        <p>Pagas $9.900 el primer mes. Desde el segundo mes se cobran $99.000 cada mes por débito automático a tu tarjeta o cuenta. La permanencia mínima es de 12 meses: si te retiras antes, aplica el cobro por retiro anticipado del contrato.</p>
                    </details>
                    <details>
                        <summary>¿Puedo usar todas las sedes?</summary>
                        <p>Sí. El Flexible Pro te da acceso a las 10 sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta, y a todas las clases grupales, sin costo adicional.</p>
                    </details>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= PRUEBA GRATIS ================= -->
    <section class="fpp-sec bg_dark-gray">
        <div class="container wrap fpp-sec-center">
            <p class="fpp-kicker">¿Aún no te decides?</p>
            <h2 class="fpp-title">Prueba un día gratis</h2>
            <p class="fpp-sub-title">Completa el formulario con tus datos y quedarás registrado para disfrutar de tu día gratis en Fitness People. ¡Anímate a vivir la experiencia!</p>

            <div class="fpp-hero-ctas">
                <a class="fpp-btn fpp-btn--solid fpp-btn-full" href="agendaDiaCortesia">
                    Quiero mi día gratis
                </a>
            </div>
        </div>
    </section>

    <!-- ================= FINAL ================= -->
    <section class="fpp-sec">
        <div class="container wrap fpp-sec-center">
            <h2 class="fpp-title">Tu primer mes cuesta menos que un domicilio</h2>

            <div class="fpp-hero-ctas">
                <a class="fpp-btn fpp-btn--solid fpp-btn-full" href="register?token=TKIlFPP8XYRC9l1rfGjR">
                    Empieza por $9.900
                </a>
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

    <script>

        document.addEventListener("DOMContentLoaded", function () {
            /* ============= URL FLEXIBLE PRO | $9.900 ============= */
            const urlFlexiblePro = "register?token=TKIlFPP8XYRC9l1rfGjR";

            /* ============= COMPRAR PLAN ============= */
            document.addEventListener("click", function (e) {
                const boton = e.target.closest(".btn-comprar-plan");

                if (!boton) return;

                e.preventDefault();

                planSeleccionado = boton.getAttribute("data-plan-id");
                nombrePlanSeleccionado = boton.getAttribute("data-plan-name");
                precioPlanSeleccionado = boton.getAttribute("data-plan-price");

                if (!planSeleccionado) return;

                // ==========================================
                // FLEXIBLE PRO
                // ==========================================

                if (planSeleccionado === "FLEXIBLE_PRO") {

                    // GOOGLE TAG MANAGER
                    window.dataLayer = window.dataLayer || [];

                    window.dataLayer.push({
                        event: "AddToCart",
                        ecommerce: {
                            items: [{
                                item_id: planSeleccionado,
                                item_name: nombrePlanSeleccionado,
                                price: precioPlanSeleccionado,
                                currency: "COP",
                                quantity: 1
                            }]
                        }
                    });

                    // Redirección directa
                    window.location.href = urlFlexiblePro;

                    return;
                }
            });
        });

    </script>


    <noscript>
        <img height="1" width="1" style="display: none;" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
