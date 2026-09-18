<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exclusivoweb.aspx.cs" Inherits="WebPage.exclusivoweb" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/preguntasfrecuentes.ascx" TagPrefix="uc1" TagName="preguntasfrecuentes" %>
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

    <section class="margin_60 bg_dark-gray section-principal-cards margin-top-header">
        <div class="container section-cards">
            <div class="card-principal bg_black">
                <div>
                    <h3 class="title" runat="server" id="lblTitulo"></h3>

                    <p class="sub-title" runat="server" id="lblSubTitulo"></p>
                </div>

                <div class="benefits">
                    <div class="benefits-details">
                        <i class="fa-solid fa-building-user"></i>
                        <p>ACCESO A TODAS LAS SEDES</p>
                    </div>

                    <div class="benefits-details">
                        <i class="fa-solid fa-user-group"></i>
                        <p>ACCESO A LAS MEJORES CLASES GRUPALES DE BUCARAMANGA</p>
                    </div>
                </div>

                <div class="price">
                    <h3 runat="server" class="title-meses" id="lblTituloMeses"></h3>

                    <p class="sub-title-up" runat="server" id="lblSubTituloUp"></p>

                    <h3 runat="server" class="title" id="lblTituloPrecio"></h3>

                    <p class="inscription" runat="server" id="lblSubTituloPrecio1"></p>

                    <p runat="server" id="lblSubTituloPrecio2"></p>

                    <p class="fidelidad" runat="server" id="lblFidelidad"></p>

                    <p class="nota-fidelidad" runat="server" id="lblNotaFidelidad"></p>
                </div>

                <!-- Pack de bienvenida -->
                <div id="divPackBienvenida" runat="server" class="fpp-welcome-pack" style="margin-top: 0;">
                    <div class="fpp-welcome-title" style="justify-content: center;">
                        <span class="fpp-welcome-icon"><i class="fa-solid fa-gift"></i></span>
                        <span>Pack de bienvenida</span>
                    </div>

                    <div class="fpp-welcome-content">
                        <strong>1 toalla edición Fitness People</strong>
                        <strong>+ 1 semana de cortesía para una persona</strong>
                    </div>
                </div>

                <div class="plans-switch text-center" style="flex-direction: column; gap: 12px;">
                    <asp:HyperLink ID="lnkComprar1" runat="server" CssClass="switch-btn active"></asp:HyperLink>

                    <asp:HyperLink ID="lnkComprar2" runat="server" CssClass="switch-btn"></asp:HyperLink>
                </div>

                <span runat="server" id="lblTextoFinal"></span>
            </div>

            <div class="card-secundaria">
                <h3 class="title">BENEFICIOS</h3>

                <ul class="benefits">
                    <li class="benefits-details">
                        <i class="fa-solid fa-mobile-screen-button"></i>
                        <p>Plan de entrenamiento disponible en FP App.</p>
                    </li>

                    <li class="benefits-details">
                        <i class="fa-solid fa-heart-pulse"></i>
                        <p>Valoración física inicial incluida.</p>
                    </li>

                    <li class="benefits-details">
                        <i class="fa-solid fa-users"></i>
                        <p>5 cortesías mensuales para invitar a amigos nuevos.</p>
                    </li>
                </ul>

                <div class="sede" id="planesSelector">
                    <div class="row">
                        <div class="col-12 title">
                            <h3>¿QUÉ ESTÁS ESPERANDO?</h3>

                            <p>¡Entrena con la Familia Fitness People Ya!</p>
                        </div>
                    </div>

                    <div class="plans-switch text-center" style="margin-top: 5px;">
                        <asp:HyperLink ID="lnkComprar3" runat="server" CssClass="switch-btn active"></asp:HyperLink>

                        <asp:HyperLink ID="lnkComprar4" runat="server" CssClass="switch-btn"></asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <!-- ================= IFRAME DE INSCRIPCIÓN ================= -->
            <div id="contenedorIframePlan" class="fp-iframe-container">
                <div class="fp-iframe-header">
                    <div>
                        <p class="fpp-kicker">Inscripción</p>
                        <h3>Completa tu <span>registro</span></h3>
                    </div>

                    <button
                        type="button"
                        id="btnCerrarIframe"
                        class="fp-iframe-close">
                        &times;
                    </button>
                </div>

                <iframe
                    id="iframePlan"
                    src=""
                    title="Inscripción Fitness People"
                    loading="lazy">
                </iframe>
            </div>
        </div>
    </section>

    <!-- ================= PANEL LATERAL DE CIUDAD / SEDE ================= -->
    <div id="panelSede" class="fp-panel-sede">
        <!-- Fondo oscuro -->
        <div
            id="panelSedeOverlay"
            class="fp-panel-overlay">
        </div>

        <!-- Panel -->
        <aside class="fp-panel-content">
            <!-- Cerrar -->
            <button
                type="button"
                id="btnCerrarSede"
                class="fp-panel-close"
                aria-label="Cerrar">
                &times;
            </button>

            <!-- Encabezado -->
            <div class="fp-panel-title">
                <p class="fpp-kicker">
                    Comprar tu plan
                </p>

                <h3>
                    Elige tu <span>sede</span>
                </h3>

                <p class="fp-panel-description">
                    Selecciona la ciudad y la sede donde deseas realizar tu inscripción.
                </p>
            </div>

            <!-- Ciudad -->
            <div class="fp-sede-section">
                <label for="ddlCiudad">
                    Ciudad
                </label>

                <select id="ddlCiudad">
                    <option value="">
                        Selecciona una ciudad
                    </option>

                    <option value="bucaramanga">
                        Bucaramanga
                    </option>

                    <option value="floridablanca">
                        Floridablanca
                    </option>

                    <option value="piedecuesta">
                        Piedecuesta
                    </option>

                    <option value="cucuta">
                        Cúcuta
                    </option>
                </select>
            </div>

            <!-- Sede -->
            <div class="fp-sede-section">
                <label for="ddlSede">
                    Sede
                </label>

                <select
                    id="ddlSede"
                    disabled>

                    <option value="">
                        Primero selecciona una ciudad
                    </option>
                </select>
            </div>
        </aside>
    </div>


    <!-- Control Preguntas Frecuentes -->
    <uc1:preguntasfrecuentes runat="server" ID="preguntasfrecuentes" />
    <!-- End Control Preguntas Frecuentes -->


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



    <%--<script>

        function openPaymentInline(url) {
            if (url.includes("register?token=")) {
                window.location.href = url;
                return;
            }
        }

        function planAddToCart(contentId, contentName, value, directUrl = null) {
            var eventId = 'atc-' + Date.now() + '-' + Math.floor(Math.random() * 10000);

            let paymentUrl = "";

            if (directUrl) {
                paymentUrl = directUrl;
            }

            // Enviar información a Google Tag Manager
            window.dataLayer = window.dataLayer || [];

            window.dataLayer.push({
                event: 'AddToCart',
                event_id: eventId,
                ecommerce: {
                    items: [{
                        item_id: contentId,
                        item_name: contentName,
                        price: value,
                        currency: 'COP',
                        quantity: 1
                    }]
                },
                meta: {
                    content_ids: [contentId],
                    content_type: 'product',
                    content_name: contentName,
                    contents: [{
                        id: contentId,
                        quantity: 1,
                        item_price: value
                    }],
                    currency: 'COP',
                    value: value
                }
            });

            // Dar tiempo al Pixel antes de redireccionar
            if (paymentUrl.includes("register?token=")) {

                setTimeout(() => {
                    window.location.href = paymentUrl;
                }, 300);

                return;
            }
        }

    </script>--%>

    <script>

        document.addEventListener("DOMContentLoaded", function () {
            /* ============= VARIABLES ============= */
            let planSeleccionado = null;
            let nombrePlanSeleccionado = null;
            let precioPlanSeleccionado = null;
            let tokenPlanSeleccionado = null;
            let planUrlKeySeleccionado = null;

            const panelSede = document.getElementById("panelSede");
            const panelOverlay = document.getElementById("panelSedeOverlay");

            const btnCerrarSede = document.getElementById("btnCerrarSede");

            const ddlCiudad = document.getElementById("ddlCiudad");
            const ddlSede = document.getElementById("ddlSede");

            const contenedorIframe = document.getElementById("contenedorIframePlan");
            const iframePlan = document.getElementById("iframePlan");

            const btnCerrarIframe = document.getElementById("btnCerrarIframe");

            /* =====================================================
               PLANES QUE REQUIEREN CIUDAD + SEDE
            ===================================================== */

            const planesConSede = [
                "SORPRENDETE_EN_DICIEMBRE"
            ];

            /* ============= SEDES POR CIUDAD ============= */
            const sedesPorCiudad = {
                bucaramanga: [
                    {
                        nombre: "Boulevard",
                        valor: "bucaramanga-boulevard"
                    },
                    {
                        nombre: "Cabecera",
                        valor: "bucaramanga-cabecera"
                    },
                    {
                        nombre: "El Prado",
                        valor: "bucaramanga-el-prado"
                    },
                    {
                        nombre: "Provenza",
                        valor: "bucaramanga-provenza"
                    },
                    {
                        nombre: "Ciudadela",
                        valor: "bucaramanga-ciudadela"
                    }
                ],

                floridablanca: [
                    {
                        nombre: "Cañaveral",
                        valor: "floridablanca-canaveral"
                    }
                ],

                piedecuesta: [
                    {
                        nombre: "DeLaCuesta",
                        valor: "piedecuesta-delacuesta"
                    },
                    {
                        nombre: "Parque Central",
                        valor: "piedecuesta-parque-central"
                    }
                ],

                cucuta: [
                    {
                        nombre: "Jardín Plaza",
                        valor: "cucuta-jardin-plaza"
                    },
                    {
                        nombre: "Ceiba II",
                        valor: "cucuta-ceiba-ii"
                    }
                ]

            };

            /* ============= URLS POR PLAN + SEDE ============= */
            const urlsPlanes = {
                SORPRENDETE_EN_DICIEMBRE: {
                    "bucaramanga-boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-4986",
                    "bucaramanga-cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-4978",
                    "bucaramanga-el-prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-4980",
                    "bucaramanga-provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-4979",
                    "bucaramanga-ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-4984",
                    "floridablanca-canaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-4985",
                    "piedecuesta-delacuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-4983",
                    "piedecuesta-parque-central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-4981",
                    "cucuta-jardin-plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-4982",
                    "cucuta-ceiba-ii": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-4976"
                }
            };

            /* ============= COMPRAR PLAN ============= */
            document.addEventListener("click", function (e) {
                const boton = e.target.closest(".btn-comprar-plan");

                if (!boton) return;

                e.preventDefault();

                planSeleccionado = boton.getAttribute("data-plan-id");
                nombrePlanSeleccionado = boton.getAttribute("data-plan-name");
                precioPlanSeleccionado = boton.getAttribute("data-plan-price");

                tokenPlanSeleccionado = boton.getAttribute("data-plan-token");
                planUrlKeySeleccionado = boton.getAttribute("data-plan-url-key");

                if (!planSeleccionado) return;

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

                const planUrls = urlsPlanes[planUrlKeySeleccionado];

                /* PLANES QUE TIENEN SELECTOR DE SEDE */
                if (planUrls) {
                    abrirPanelSede();
                    return;
                }

                /* PLANES SIN SELECTOR DE SEDE */
                if (tokenPlanSeleccionado) {
                    window.location.href = tokenPlanSeleccionado;
                    return;
                }
            });

            /* ============= ABRIR PANEL ============= */
            function abrirPanelSede() {
                panelSede.classList.add("active");

                document.body.style.overflow = "hidden";
            }

            /* ============= CERRAR PANEL ============= */
            function cerrarPanelSede() {
                panelSede.classList.remove("active");

                document.body.style.overflow = "";
            }

            /* ============= BOTONES CERRAR ============= */
            btnCerrarSede.addEventListener("click", cerrarPanelSede);

            panelOverlay.addEventListener("click", cerrarPanelSede);

            /* ============= CAMBIO DE CIUDAD ============= */
            ddlCiudad.addEventListener("change", function () {
                const ciudad = this.value;

                // Limpiar sedes
                ddlSede.innerHTML = "";

                // No hay ciudad
                if (!ciudad || !sedesPorCiudad[ciudad]) {
                    ddlSede.disabled = true;

                    const option = document.createElement("option");

                    option.value = "";
                    option.textContent = "Primero selecciona una ciudad";

                    ddlSede.appendChild(option);

                    return;
                }

                // Opción inicial
                const optionInicial = document.createElement("option");

                optionInicial.value = "";

                optionInicial.textContent = "Selecciona una sede";

                ddlSede.appendChild(optionInicial);

                // Cargar sedes
                sedesPorCiudad[ciudad].forEach(function (sede) {
                    const option = document.createElement("option");

                    option.value = sede.valor;

                    option.textContent = sede.nombre;

                    ddlSede.appendChild(option);
                });

                ddlSede.disabled = false;
            });

            /* ============= CAMBIO DE SEDE ============= */
            ddlSede.addEventListener("change", function () {
                const sede = this.value;

                if (!sede) return;

                // Buscar URL correspondiente
                const planUrls = urlsPlanes[planUrlKeySeleccionado];

                if (!planUrls) return;

                const url = planUrls[sede];

                if (!url) return;

                // Cerrar panel
                cerrarPanelSede();

                // Mostrar iframe
                mostrarIframe(url);
            });

            /* ============= MOSTRAR IFRAME ============= */
            function mostrarIframe(url) {
                iframePlan.src = url;

                contenedorIframe.classList.add("active");

                // Scroll hasta el iframe
                setTimeout(function () {
                    contenedorIframe.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });

                }, 350);
            }

            /* ============= CERRAR IFRAME ============= */
            function cerrarIframe() {
                iframePlan.src = "";

                contenedorIframe.classList.remove("active");

                // Limpiar selección
                planSeleccionado = null;

                tokenPlanSeleccionado = null;
                planUrlKeySeleccionado = null;

                ddlCiudad.value = "";

                ddlSede.innerHTML = "";

                const option = document.createElement("option");

                option.value = "";

                option.textContent = "Primero selecciona una ciudad";

                ddlSede.appendChild(option);

                ddlSede.disabled = true;

                const seccionPrincipal = document.querySelector(".section-principal-cards");

                // Regresar a planes
                if (seccionPrincipal) {
                    seccionPrincipal.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });
                }
            }

            btnCerrarIframe.addEventListener("click", function () {
                cerrarIframe();
            });

            /* ============= CERRAR IFRAME CON ESC ============= */
            document.addEventListener("keydown", function (e) {
                    if (e.key !== "Escape") return;

                    if (panelSede.classList.contains("active")) cerrarPanelSede();
                }
            );
        });

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
        }

        .btn-close {
            background: #000;
            color: #fff;
            border: none;
            padding: 5px 10px;
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
                padding: 10px 0 0 10px;
                z-index: 10;
                background-color: #000000;
            }

            .payment-header h2 {
                font-size: 17px;
            }
        }



        .section-cards {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .card-principal {
            display: flex;
            flex-direction: column;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            max-width: 400px;
            gap: 10px;
        }

        .card-principal .title {
            margin-top: 0;
            font-size: 45px;
            font-weight: bold;
            line-height: 1;
        }

        .card-principal .sub-title {
            color: #d6ff00;
            font-weight: bold;
            line-height: 1;
        }

        .card-principal .benefits {
            display: flex;
            gap: 10px;
        }

        .card-principal .benefits .benefits-details {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 10px;
            border: 1px solid #d6ff00;
            border-radius: 10px;
            flex: 1;
            margin-bottom: 15px;
        }

        .card-principal .benefits .benefits-details i {
            font-size: 35px;
        }

        .card-principal .benefits .benefits-details p {
            text-transform: uppercase;
            margin-bottom: 0;
            font-size: 12px;
            font-weight: 500;
        }

        .card-principal .plans-switch {
            margin: 0;
        }

        .card-principal .switch-btn {
            padding: 5px 13px;
            width: 100%;
        }

        .card-principal .price .title {
            margin-top: 0px;
            font-size: 40px;
            font-weight: bold;
            color: #d6ff00;
            line-height: 1;
        }

        .card-principal .price .title-meses {
            margin-top: 0px;
            font-size: 30px;
            font-weight: bold;
            color: #d6ff00;
            line-height: 1;
        }

        .card-principal .price .sub-title-up {
            font-weight: bold;
            font-size: 25px;
            text-decoration: line-through;
        }

        .card-principal .price p {
            margin-bottom: 0;
            font-size: 12px;
        }

        .card-principal .price .inscription {
            color: #d6ff00;
        }

        .card-principal .price .fidelidad {
            color: #d6ff00;
            font-size: 10px;
        }

        .card-principal .price .nota-fidelidad {
            color: white;
            font-size: 7px;
        }

        .card-principal .plans-switch .switch-btn {
            font-weight: bold;
        }

        .card-principal span {
            font-size: 10px;
            font-weight: 500;
        }

        /**/

        .card-secundaria {
            display: flex;
            flex-direction: column;
            padding: 20px;
            gap: 20px;
        }

        .card-secundaria .title {
            font-size: 35px;
            font-weight: 500;
        }

        .card-secundaria .benefits {
            list-style: none;
            padding-left: 0;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .card-secundaria .benefits .benefits-details {
            display: flex;
            align-items: center;
            gap: 20px;
            
        }

        .card-secundaria .benefits .benefits-details i {
            font-size: 30px;
            padding: 10px;
            border: 1px solid #d6ff00;
            border-radius: 10px;
        }

        .card-secundaria .benefits .benefits-details p {
            text-transform: uppercase;
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 0;
        }

        .card-secundaria .plans-switch {
            margin: 0;
        }

        .card-secundaria .switch-btn {
            padding: 7px 15px;
        }

        .card-secundaria .sede .title {
            padding: 0 20px;
        }

        .card-secundaria .sede .title h3 {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 0;
            color: #d6ff00;
        }

        .card-secundaria .sede .title p {
            font-size: 15px;
            font-weight: bold;
            text-transform: uppercase;
        }

        @media (max-width: 768px) {
            .section-cards {
                flex-direction: column;
            }

            /**/

            .card-secundaria {
                padding: 0 10px;
            }

            .card-secundaria .title {
                font-size: 25px;
            }

            .card-secundaria .sede .title {
                padding: 0 10px;
            }

            .card-secundaria .sede .title h3 {
                font-size: 18px;
            }

            .card-secundaria .sede .title p {
                font-size: 12px;
            }
        }

        @media(max-width: 992px){
            .card-secundaria .plans-switch {
                flex-direction: column;
                gap: 12px;
            }
        }

    </style>


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
