<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exclusivowebfw.aspx.cs" Inherits="WebPage.exclusivowebfw" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/preguntasfrecuentes.ascx" TagPrefix="uc1" TagName="preguntasfrecuentes" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

    <section class="margin_60 bg_gray section-principal-cards">
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
                        <p>CLASES GRUPALES CON PROFESORES</p>
                    </div>
                </div>

                <div class="price">
                    <p class="sub-title-up" runat="server" id="lblSubTituloUp"></p>

                    <h3 runat="server" id="lblTituloPrecio"></h3>

                    <p class="inscription" runat="server" id="lblSubTituloPrecio1"></p>

                    <p runat="server" id="lblSubTituloPrecio2"></p>

                    <p class="inscription" runat="server" id="lblFidelidad"></p>
                </div>

                <div class="plans-switch text-center" style="flex-direction: column; gap: 12px;">
                    <asp:HyperLink ID="lnkComprar1" runat="server" CssClass="switch-btn active"></asp:HyperLink>

                    <asp:HyperLink ID="lnkComprar2" runat="server" CssClass="switch-btn"></asp:HyperLink>
                </div>

                <span runat="server" id="lblTextoFinal"></span>
            </div>

            <div class="card-secundaria">
                <h3 class="title">BENEFICIOS <br /> PLAN SEMESTRAL</h3>

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
                        <p>5 cortesías mensuales para invitar a tus amigos.</p>
                    </li>
                </ul>

                <div class="sede" id="planesSelector">
                    <div class="row">
                        <div class="col-12 title">
                            <h3>¿DÓNDE QUIERES ENTRENAR?</h3>

                            <p>Selecciona tu sede y luego activa tu plan</p>
                        </div>

                        <div class="col-12">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Ciudad:</label>
                                    <select id="ddlCiudadPlanes" class="form-control" style="background: #1A1A1A;"></select>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Sede:</label>
                                    <select id="ddlSedePlanes" class="form-control" style="background: #1A1A1A;"></select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <p id="mensaje"
                            style="
                                display: none;
                                color: #E3FF00;
                                font-weight: 700;
                                text-align: center;
                                text-decoration: underline;
                            ">
                        </p>
                    </div>

                    <div class="plans-switch text-center" style="margin-top: 5px;">
                        <asp:HyperLink ID="lnkComprar3" runat="server" CssClass="switch-btn active"></asp:HyperLink>

                        <asp:HyperLink ID="lnkComprar4" runat="server" CssClass="switch-btn"></asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div id="paymentModal" class="payment-modal">
                <div id="paymentContainer" class="payment-container">

                    <div id="paymentHeader" class="payment-header">
                        <h2 style="font-weight: 900; color: #E3FF00;">Completa tus datos y realiza el pago de forma segura</h2>
                        <button type="button" onclick="closePayment()" class="btn-close">✕</button>
                    </div>

                    <iframe id="paymentFrame" src=""></iframe>

                </div>
            </div>
        </div>
    </section>


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



    <script>

        const sedes = {
            "Boulevard": "Bucaramanga",
            "Cabecera": "Bucaramanga",
            "El Prado": "Bucaramanga",
            "Provenza": "Bucaramanga",
            "Ciudadela": "Bucaramanga",
            "Cañaveral": "Floridablanca",
            "DeLaCuesta": "Piedecuesta",
            "Parque Central": "Piedecuesta",
            "Jardin Plaza": "Cúcuta",
            "Ceiba II": "Cúcuta"
        };

        const planesLinks = {
            "Plan Flexible Pro": {      // PLAN FLEXIBLE PRO DEBITO AUTOMATICO
                "Boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-2821",
                "Cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-2725",
                "El Prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-3381",
                "Provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-3461",
                "Ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-3061",
                "Cañaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-2901",
                "DeLaCuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-3141",
                "Parque Central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-3301",
                "Jardin Plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-3221",
                "Ceiba II": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-2981"
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            const ddlCiudad = document.getElementById("ddlCiudadPlanes");
            const ddlSede = document.getElementById("ddlSedePlanes");

            const ciudades = [...new Set(Object.values(sedes))];

            // Default
            ddlCiudad.innerHTML = '<option value="">Selecciona una opción</option>';
            ddlSede.innerHTML = '<option value="">Selecciona una opción</option>';

            // Llenar ciudades
            ciudades.forEach(ciudad => {
                const option = document.createElement("option");

                option.value = ciudad;
                option.textContent = ciudad;

                ddlCiudad.appendChild(option);
            });

            // Llenar sedes por ciudad
            Object.keys(sedes).forEach(sede => {
                const option = document.createElement("option");

                option.value = sede;
                option.textContent = sede;

                ddlSede.appendChild(option);
            });

            // Evento Cambio ciudad
            ddlCiudad.addEventListener("change", function () {

                limpiarMensaje();

                const ciudadSeleccionada = this.value;

                ddlSede.innerHTML = '<option value="">Selecciona una opción</option>';

                Object.keys(sedes).forEach(sede => {
                    const ciudad = sedes[sede];

                    if (!ciudadSeleccionada || ciudad === ciudadSeleccionada) {
                        const option = document.createElement("option");

                        option.value = sede;
                        option.textContent = sede;

                        ddlSede.appendChild(option);
                    }
                });
            });

            // Evento Cambio sede -> Seleccionar ciudad automáticamente
            ddlSede.addEventListener("change", function () {

                limpiarMensaje();

                const sedeSeleccionada = this.value;

                if (!sedeSeleccionada) return;

                ddlCiudad.value = sedes[sedeSeleccionada];
            });
        });

        function mostrarMensaje(textMensaje) {
            const mensaje = document.getElementById("mensaje");

            mensaje.style.display = "block";
            mensaje.textContent = textMensaje;

            document.getElementById("planesSelector")
                .scrollIntoView({
                    behavior: "smooth",
                    block: "center"
                });
        }

        function limpiarMensaje() {
            const mensaje = document.getElementById("mensaje");

            mensaje.style.display = "none";
        }

        function openPaymentInline(url) {

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

        function planAddToCart(contentId, contentName, value, directUrl = null) {
            let paymentUrl = "";

            if (!directUrl) {

                const sede = document.getElementById("ddlSedePlanes").value;
                const ciudad = document.getElementById("ddlCiudadPlanes").value;

                if (!sede || !ciudad) {
                    mostrarMensaje("Debes seleccionar una ciudad y sede antes de continuar.");

                    return;
                }

                limpiarMensaje();

                if (!planesLinks[contentName] || !planesLinks[contentName][sede]) {
                    mostrarMensaje("No existe enlace configurado para esta sede.");
                    return;
                }

                paymentUrl = planesLinks[contentName][sede];
            }

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

            openPaymentInline(paymentUrl);
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
        }

        .card-principal .price h3 {
            margin-top: 0px;
            font-size: 40px;
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

            .section-principal-cards {
                padding-top: 70px;
            }

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
