<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pqrs.aspx.cs" Inherits="WebPage.pqrs" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/preguntasfrecuentes.ascx" TagPrefix="uc1" TagName="preguntasfrecuentes" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <!-- ================= GESTIÓN DE PQRS ================= -->
<section class="fpp-radicacion margin-top-header" id="radicacion">
    <div class="fpp-radicacion__container">
        <!-- ================= ENCABEZADO ================= -->
        <div class="fpp-head">
            <p class="fpp-kicker">PQRS Fitness People</p>

            <div class="fpp-pqrs-header">
                <h2 class="fpp-pqrs-header-title">Radica <span>tu solicitud</span></h2>

                <div>
                    <button></button>
                </div>

                <p class="fpp-pqrs-header-text">
                    En Fitness People, tu opinión es importante para nosotros. Este espacio está creado para que puedas compartir tus <b>peticiones, quejas, reclamos o sugerencias</b>, y así ayudarnos a seguir mejorando tu experiencia.
                    <br />
                    Cuéntanos qué necesitas. Nuestro equipo está listo para escucharte, orientarte y brindarte una respuesta oportuna.
                </p>
            </div>

            <div class="fpp-pqrs-header">
                <h2 class="fpp-pqrs-header-title">Consulta el estado de <span>tu solicitud</span></h2>

                <p class="fpp-pqrs-header-text">
                    ¿Ya realizaste una solicitud? Consulta su estado y conoce en qué etapa se encuentra.
                </p>
            </div>

            <div class="fpp-pqrs-header">
                <h2 class="fpp-pqrs-header-title">Adjunta archivos a <span>tu solicitud</span></h2>

                <p class="fpp-pqrs-header-text">
                    Si necesitas complementar la información de tu solicitud, puedes adjuntar documentos o archivos que nos ayuden a entender mejor tu caso y brindarte una respuesta adecuada.
                </p>
            </div>
        </div>

        <!-- CARGA DE ARCHIVOS - RADICACIÓN -->
        <div class="fpp-radicacion__form-wrapper">
            <form class="fpp-radicacion__form">
                <div class="fpp-radicacion__form-header">
                    <h2>CARGAR ARCHIVOS A SOLICITUD</h2>
                    <p>Los campos marcados con <span>*</span> son obligatorios.</p>
                </div>

                <!-- Código de Radicado -->
                <div class="fpp-field fpp-field--full">
                    <label for="cod-segui">
                        INGRESA EL CÓDIGO DE RADICADO <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="cod-segui"
                        name="cod-segui"
                        placeholder="FP-PQRS-01234567-ABCD"
                        required=""
                    />
                </div>

                <!-- Archivos de soporte -->
                <div class="fpp-field fpp-field--full fpp-file-upload">
                    <label for="archivos">
                        Adjuntar Soportes o Evidencias
                        <span class="fpp-file-upload__optional">*</span>
                    </label>

                    <!-- Input real -->
                    <input
                        type="file"
                        id="archivos"
                        name="archivos"
                        class="fpp-file-upload__input"
                        multiple=""
                        accept=".pdf,.jpg,.jpeg,.png"
                    />

                    <!-- Zona de carga -->
                    <label
                        for="archivos"
                        class="fpp-file-upload__dropzone"
                        id="fppFileDropzone"
                    >

                        <!-- Icono -->
                        <div class="fpp-file-upload__icon">
                            <i class="fa-solid fa-cloud-arrow-up"></i>
                        </div>

                        <!-- Texto principal -->
                        <div class="fpp-file-upload__title">
                            Arrastra tus archivos aquí o
                            <span>examina</span>
                        </div>

                        <!-- Información -->
                        <div class="fpp-file-upload__info">
                            Formatos admitidos: PDF, JPG, PNG
                            (Hasta 3 archivos, máx 10 MB total)
                        </div>
                    </label>

                    <!-- Archivos seleccionados -->
                    <div
                        class="fpp-file-upload__files"
                        id="fppFileList"
                    ></div>
                </div>

                <!-- Autorización -->
                <div class="fpp-radicacion__privacy">
                    <label class="fpp-checkbox">
                        <input
                            type="checkbox"
                            id="autorizacion1"
                            name="autorizacion"
                            required=""
                        />

                        <span class="fpp-checkbox__box"></span>

                        <span class="fpp-checkbox__text">
                            Autorizo el tratamiento de mis datos personales
                            conforme a la
                            <a href="assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf" target="_blank">
                                Política de Tratamiento de Datos
                            </a>
                            de Fitness People, únicamente para gestionar y
                            responder esta solicitud (Ley 1581 de 2012). <span>*</span>
                        </span>
                    </label>
                </div>

                <!-- Botón -->
                <button type="submit" class="fpp-btn fpp-btn--solid fpp-field--full">
                    <span>BUSCAR</span>
                </button>
            </form>
        </div>

        <!-- CONSULTA - RADICACIÓN -->
        <%--<div class="fpp-radicacion__form-wrapper">
            <form class="fpp-radicacion__form">
                <div class="fpp-radicacion__form-header">
                    <h2>CONSULTA SOLICITUD</h2>
                    <p>Los campos marcados con <span>*</span> son obligatorios.</p>
                </div>

                <!-- Código de Radicado -->
                <div class="fpp-field fpp-field--full">
                    <label for="cod-segui">
                        INGRESA EL CÓDIGO DE RADICADO <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="cod-segui"
                        name="cod-segui"
                        placeholder="FP-PQRS-01234567-ABCD"
                        required=""
                    />
                </div>

                <!-- Autorización -->
                <div class="fpp-radicacion__privacy">
                    <label class="fpp-checkbox">
                        <input
                            type="checkbox"
                            id="autorizacion1"
                            name="autorizacion"
                            required=""
                        />

                        <span class="fpp-checkbox__box"></span>

                        <span class="fpp-checkbox__text">
                            Autorizo el tratamiento de mis datos personales
                            conforme a la
                            <a href="assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf" target="_blank">
                                Política de Tratamiento de Datos
                            </a>
                            de Fitness People, únicamente para gestionar y
                            responder esta solicitud (Ley 1581 de 2012). <span>*</span>
                        </span>
                    </label>
                </div>

                <!-- Botón -->
                <button type="submit" class="fpp-btn fpp-btn--solid fpp-field--full">
                    <span>BUSCAR</span>
                </button>
            </form>
        </div>--%>

        <!-- CREACIÓN - RADICACIÓN -->
        <%--<div class="fpp-radicacion__form-wrapper">
            <form class="fpp-radicacion__form">
                <div class="fpp-radicacion__form-header">
                    <h2>NUEVA SOLICITUD</h2>
                    <p>Los campos marcados con <span>*</span> son obligatorios.</p>
                </div>

                <!-- Nombres -->
                <div class="fpp-field">
                    <label for="nombre">
                        NOMBRE <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="nombre"
                        name="nombre"
                        placeholder="Nombres"
                        required=""
                    />
                </div>

                <!-- Apellidos -->
                <div class="fpp-field">
                    <label for="nombre">
                        APELLIDOS <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="apellidos"
                        name="apellidos"
                        placeholder="Apellidos"
                        required=""
                    />
                </div>

                <!-- Tipo de Documento -->
                <div class="fpp-field">
                    <label for="tipo-documento">
                        TIPO DE DOCUMENTO <span>*</span>
                    </label>

                    <div class="fpp-select-wrapper">
                        <select id="tipoDocumento" name="tipoDocumento" required="">
                            <option value="" selected="" disabled="">
                                Selecciona una opción
                            </option>

                            <option value="peticion">
                                Cédula de Ciudadanía
                            </option>

                            <option value="queja">
                                Cédula de Extranjería
                            </option>

                            <option value="reclamo">
                                Tarjeta de Identidad
                            </option>

                            <option value="sugerencia">
                                Pasaporte
                            </option>
                        </select>
                    </div>
                </div>

                <!-- Documento -->
                <div class="fpp-field">
                    <label for="documento">
                        DOCUMENTO <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="documento"
                        name="documento"
                        placeholder="Nro. de documento"
                        required=""
                    />
                </div>

                <!-- Correo -->
                <div class="fpp-field">
                    <label for="correo">
                        CORREO ELECTRÓNICO <span>*</span>
                    </label>

                    <input
                        type="email"
                        id="correo"
                        name="correo"
                        placeholder="tucorreo@correo.com"
                        required=""
                    />
                </div>

                <!-- Celular -->
                <div class="fpp-field">
                    <label for="celular">
                        CELULAR <span>*</span>
                    </label>

                    <input
                        type="tel"
                        id="celular"
                        name="celular"
                        placeholder="300 000 0000"
                        required=""
                    />
                </div>

                <!-- Tipo de solicitud -->
                <div class="fpp-field">
                    <label for="tipoSolicitud">
                        TIPO DE SOLICITUD <span>*</span>
                    </label>

                    <div class="fpp-select-wrapper">
                        <select id="tipoSolicitud" name="tipoSolicitud" required="">
                            <option value="" selected="" disabled="">
                                Selecciona una opción
                            </option>

                            <option value="peticion">
                                Petición
                            </option>

                            <option value="queja">
                                Queja
                            </option>

                            <option value="reclamo">
                                Reclamo
                            </option>

                            <option value="sugerencia">
                                Sugerencia
                            </option>
                        </select>
                    </div>
                </div>

                <!-- Sede -->
                <div class="fpp-field">
                    <label for="sede">
                        SEDE RELACIONADA <span>*</span>
                    </label>

                    <div class="fpp-select-wrapper">
                        <select id="sede" name="sede" required="">
                            <option value="">Elige la sede</option>
                            <option>Boulevard · Bucaramanga</option>
                            <option>Cabecera · Bucaramanga</option>
                            <option>El Prado · Bucaramanga</option>
                            <option>Provenza · Bucaramanga</option>
                            <option>Ciudadela · Bucaramanga</option>
                            <option>Cañaveral · Floridablanca</option>
                            <option>DeLaCuesta · Piedecuesta</option>
                            <option>Parque Central · Piedecuesta</option>
                            <option>Jardín Plaza · Cúcuta</option>
                            <option>Ceiba II · Cúcuta</option>
                            <option>No aplica / Corporativo</option>
                        </select>
                    </div>
                </div>

                <!-- Asunto -->
                <div class="fpp-field fpp-field--full">
                    <label for="asunto">
                        ASUNTO <span>*</span>
                    </label>

                    <input
                        type="text"
                        id="asunto"
                        name="asunto"
                        placeholder="Resume tu solicitud en una línea"
                        required=""
                    />
                </div>

                <!-- Descripción -->
                <div class="fpp-field fpp-field--full">
                    <div class="fpp-field__label-row">
                        <label for="descripcion">
                            DESCRIPCIÓN <span>*</span>
                        </label>

                        <span class="fpp-counter">
                            0 / 1200
                        </span>
                    </div>

                    <textarea
                        id="descripcion"
                        name="descripcion"
                        maxlength="1200"
                        placeholder="Cuéntanos qué pasó: fecha, hora, sede, personas involucradas y qué esperas de nosotros."
                        required=""
                    ></textarea>
                </div>

                <!-- Archivos de soporte -->
                <div class="fpp-field fpp-field--full fpp-file-upload">
                    <label for="archivos">
                        Adjuntar Soportes o Evidencias
                        <span class="fpp-file-upload__optional">(Opcional)</span>
                    </label>

                    <!-- Input real -->
                    <input
                        type="file"
                        id="archivos"
                        name="archivos"
                        class="fpp-file-upload__input"
                        multiple=""
                        accept=".pdf,.jpg,.jpeg,.png"
                    />

                    <!-- Zona de carga -->
                    <label
                        for="archivos"
                        class="fpp-file-upload__dropzone"
                        id="fppFileDropzone"
                    >

                        <!-- Icono -->
                        <div class="fpp-file-upload__icon">
                            <i class="fa-solid fa-cloud-arrow-up"></i>
                        </div>

                        <!-- Texto principal -->
                        <div class="fpp-file-upload__title">
                            Arrastra tus archivos aquí o
                            <span>examina</span>
                        </div>

                        <!-- Información -->
                        <div class="fpp-file-upload__info">
                            Formatos admitidos: PDF, JPG, PNG
                            (Hasta 3 archivos, máx 10 MB total)
                        </div>
                    </label>

                    <!-- Archivos seleccionados -->
                    <div
                        class="fpp-file-upload__files"
                        id="fppFileList"
                    ></div>
                </div>

                <!-- Autorización -->
                <div class="fpp-radicacion__privacy">
                    <label class="fpp-checkbox">
                        <input
                            type="checkbox"
                            id="autorizacion1"
                            name="autorizacion"
                            required=""
                        />

                        <span class="fpp-checkbox__box"></span>

                        <span class="fpp-checkbox__text">
                            Autorizo el tratamiento de mis datos personales
                            conforme a la
                            <a href="assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf" target="_blank">
                                Política de Tratamiento de Datos
                            </a>
                            de Fitness People, únicamente para gestionar y
                            responder esta solicitud (Ley 1581 de 2012). <span>*</span>
                        </span>
                    </label>
                </div>

                <!-- Botón -->
                <button type="submit" class="fpp-btn fpp-btn--solid fpp-field--full">
                    <span>RADICAR SOLICITUD</span>
                </button>
            </form>
        </div>--%>
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

    <!-- SLIDER -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>

    <style>

/* =========================================================
   RADICACIÓN DE SOLICITUD
========================================================= */
.fpp-radicacion {
    --fpp-lime: #dfff00;
    --fpp-black: #000000;
	--fpp-white: #ffffff;
	--fpp-input: #151515;
	--fpp-border: #292929;
	--fpp-muted: #777777;

    width: 100%;
    background: var(--fpp-black);
    padding: 80px 0;
    box-sizing: border-box;
    font-family: inherit;
}

/* =========================================================
   CONTENEDOR
========================================================= */
.fpp-radicacion__container {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    justify-items: center;
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 24px;
    gap: 50px;
}

/* =========================================================
   HEADER PQRS
========================================================= */
.fpp-head {
    margin-bottom: 0;
}

.fpp-pqrs-header-title {
    margin-top: 20px;
    font-size: clamp(30px, 5vw, 40px) !important;
    text-transform: uppercase;
    font-weight: 900;
    color: var(--fpp-lime);
}

.fpp-pqrs-header-text {
    font-size: 15px;
    color: var(--fpp-white);
}

@media (max-width: 600px) {
    .fpp-pqrs-header-title {
        text-align: center;
    }
}
    

/* =========================================================
   TARJETA DEL FORMULARIO
========================================================= */
.fpp-radicacion__form-wrapper {
    width: 100%;
    padding: 30px 30px 27px;
    box-sizing: border-box;
    background: var(--fp-card);
    border: 1.5px solid var(--fp-lime);
    border-radius: 20px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, .10);
}

/* =========================================================
   HEADER DEL FORMULARIO
========================================================= */
.fpp-radicacion__form-header {
    margin-bottom: 18px;
}

.fpp-radicacion__form-header h2 {
    margin: 0 0 10px;
    color: var(--fpp-white);
    font-size: 28px;
    font-weight: 900;
    line-height: 1;
    text-transform: uppercase;
}

.fpp-radicacion__form-header p {
    margin: 0;
    color: #c6c6c6;
    font-size: 12px;
    line-height: 1.4;
}

.fpp-radicacion__form-header p span {
    color: var(--fpp-lime);
}

/* =========================================================
   FORMULARIO
========================================================= */
.fpp-radicacion__form {
    width: 100%;
}

.fpp-field {
    min-width: 0;
    margin-bottom: 20px;
}

.fpp-field--full {
    grid-column: 1 / -1;
}

/* =========================================================
   LABELS
========================================================= */
.fpp-field label {
    display: block;
    justify-items: center;
    margin-bottom: 6px;
    color: #bcbcbc;
    font-size: 11px;
    font-weight: 900;
    letter-spacing: 2px;
    line-height: 1.2;
    text-transform: uppercase;
}

.fpp-field label span {
    color: var(--fpp-lime);
}

/* =========================================================
   INPUTS / SELECT / TEXTAREA
========================================================= */
.fpp-field input,
.fpp-field select,
.fpp-field textarea, 
.fpp-field file {
    width: 100%;
    box-sizing: border-box;
    border: 1px solid var(--fpp-border);
    border-radius: 10px;
    outline: none;
    background: var(--fpp-input);
    color: var(--fpp-white);
    font-family: inherit;
    font-weight: 500;
    transition:
        border-color .2s ease,
        box-shadow .2s ease;
}

/* Input */
.fpp-field input {
    height: 42px;
    padding: 0 15px;
}

/* Select */
.fpp-select-wrapper {
    position: relative;
}

.fpp-field select {
    height: 42px;
    padding: 0 40px 0 15px;
    appearance: none;
    -webkit-appearance: none;
    cursor: pointer;
}

.fpp-select-wrapper::after {
    content: "";
    position: absolute;
    top: 50%;
    right: 14px;
    width: 0;
    height: 0;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 5px solid var(--fpp-lime);
    transform: translateY(-25%);
    pointer-events: none;
}

/* Textarea */
.fpp-field textarea {
    min-height: 105px;
    padding: 14px 15px;
    resize: vertical;
    line-height: 1.4;
}

/* Placeholder */
.fpp-field input::placeholder,
.fpp-field textarea::placeholder {
    color: #626262;
    opacity: 1;
}

/* Focus */
.fpp-field input:focus,
.fpp-field select:focus,
.fpp-field textarea:focus {
    border-color: var(--fpp-lime);
    box-shadow: 0 0 0 1px var(--fpp-lime);
}

/* =========================================================
   CAMPOS EN DOS COLUMNAS
========================================================= */
.fpp-radicacion__form {
    display: grid;
    grid-template-columns: 1fr 1fr;
    column-gap: 11px;
}

/* El header ocupa todo */
.fpp-radicacion__form-header {
    grid-column: 1 / -1;
}

/* =========================================================
   CONTADOR
========================================================= */
.fpp-field__label-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 6px;
}

.fpp-field__label-row label {
    margin-bottom: 0;
}

.fpp-counter {
    color: #777;
    font-size: 9px;
    font-weight: 700;
    letter-spacing: 1px;
}

/* =========================================================
   CHECKBOX / PRIVACIDAD
========================================================= */
.fpp-radicacion__privacy {
    grid-column: 1 / -1;
    margin-top: 1px;
    margin-bottom: 13px;
}

.fpp-checkbox {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
}

/* Ocultar checkbox nativo */
.fpp-checkbox input {
    position: absolute;
    width: 1px;
    height: 1px;
    opacity: 0;
}

/* Checkbox visual */
.fpp-checkbox__box {
    flex: 0 0 19px;
    width: 19px;
    height: 19px;
    margin-top: 1px;
    border: 1px solid var(--fpp-lime);
    border-radius: 5px;
    box-sizing: border-box;
    position: relative;
}

/* Check */
.fpp-checkbox input:checked + .fpp-checkbox__box {
    background: var(--fpp-lime);
}

.fpp-checkbox input:checked + .fpp-checkbox__box::after {
    content: "";
    position: absolute;
    width: 5px;
    height: 9px;
    top: 3px;
    left: 6px;
    border-right: 2px solid var(--fpp-black);
    border-bottom: 2px solid var(--fpp-black);
    transform: rotate(45deg);
}

/* Texto */
.fpp-checkbox__text {
    color: #dedede;
    font-size: 10px;
    line-height: 1.4;
}

.fpp-checkbox__text a {
    color: var(--fpp-lime);
    font-weight: 800;
    text-decoration: underline;
}


/* =========================================================
   ARCHIVOS DE SOPORTE
========================================================= */

.fpp-file-upload {
    width: 100%;
    min-width: 0;
}


/* Label */

.fpp-file-upload > label:first-child {
    display: block;

    margin-bottom: 6px;

    color: #bcbcbc;

    font-size: 11px;
    font-weight: 900;
    letter-spacing: 2px;
    line-height: 1.2;

    text-transform: uppercase;
}

.fpp-file-upload__optional {
    color: #777;
    font-weight: 700;
    letter-spacing: 1px;
}


/* =========================================================
   INPUT REAL
========================================================= */

.fpp-field .fpp-file-upload__input {
    display: none;
}


/* =========================================================
   DROPZONE
========================================================= */

.fpp-file-upload__dropzone {
    width: 100%;
    min-height: 155px;

    box-sizing: border-box;

    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;

    padding: 20px;

    background: #181818;

    border: 1px dashed #292929;
    border-radius: 12px;

    cursor: pointer;

    transition:
        border-color .2s ease,
        background-color .2s ease,
        transform .2s ease;
}


/* Hover */

.fpp-file-upload__dropzone:hover {
    background: #1c1c1c;
    border-color: #dfff00;
}


/* Cuando se arrastran archivos */

.fpp-file-upload__dropzone.is-dragover {
    background: #1d1d1d;
    border-color: #dfff00;

    transform: scale(1.01);
}


/* =========================================================
   ICONO
========================================================= */

.fpp-file-upload__icon {
    width: 48px;
    height: 48px;

    margin-bottom: 12px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    background: #202020;

    color: #dfff00;

    font-size: 20px;
}


/* =========================================================
   TEXTO PRINCIPAL
========================================================= */

.fpp-file-upload__title {
    color: #ffffff;

    font-size: 16px;
    font-weight: 700;

    line-height: 1.3;

    text-align: center;
}

.fpp-file-upload__title span {
    color: #dfff00;
}


/* =========================================================
   INFORMACIÓN
========================================================= */

.fpp-file-upload__info {
    margin-top: 8px;

    color: #bcbcbc;

    font-size: 11px;
    font-weight: 500;

    letter-spacing: .3px;

    line-height: 1.4;

    text-align: center;
}


/* =========================================================
   LISTA DE ARCHIVOS
========================================================= */

.fpp-file-upload__files {
    width: 100%;

    margin-top: 8px;

    display: flex;
    flex-direction: column;
    gap: 6px;
}


/* Archivo */

.fpp-file-upload__file {
    width: 100%;

    box-sizing: border-box;

    display: flex;
    align-items: center;
    justify-content: space-between;

    gap: 10px;

    padding: 8px 10px;

    background: #181818;

    border: 1px solid #292929;
    border-radius: 8px;
}


/* Información del archivo */

.fpp-file-upload__file-info {
    min-width: 0;

    display: flex;
    align-items: center;

    gap: 8px;
}


/* Icono archivo */

.fpp-file-upload__file-icon {
    flex: 0 0 auto;

    color: #dfff00;

    font-size: 13px;
}


/* Nombre */

.fpp-file-upload__file-name {
    min-width: 0;

    overflow: hidden;

    color: #d0d0d0;

    font-size: 10px;

    white-space: nowrap;
    text-overflow: ellipsis;
}


/* Tamaño */

.fpp-file-upload__file-size {
    flex: 0 0 auto;

    color: #777;

    font-size: 9px;
}


/* =========================================================
   MENSAJE DE ERROR
========================================================= */

.fpp-file-upload__error {
    margin-top: 7px;

    color: #ff6b6b;

    font-size: 10px;
    line-height: 1.4;
}

.fpp-file-upload,
.fpp-file-upload__dropzone,
.fpp-file-upload__files,
.fpp-file-upload__file {
    max-width: 100%;
    box-sizing: border-box;
}


/* =========================================================
   MÓVIL
========================================================= */

@media (max-width: 600px) {
    .fpp-file-upload {
        width: 100%;
        max-width: 100%;
        min-width: 0;
        overflow: hidden;
    }

    .fpp-file-upload__dropzone {
        width: 100%;
        max-width: 100%;
        min-width: 0;
        box-sizing: border-box;
    }

    .fpp-file-upload__dropzone {
        min-height: 145px;

        padding: 18px 12px;
    }

    .fpp-file-upload__icon {
        width: 44px;
        height: 44px;

        margin-bottom: 10px;

        font-size: 18px;
    }

    .fpp-file-upload__title {
        font-size: 14px;
    }

    .fpp-file-upload__info {
        max-width: 280px;

        font-size: 9px;
    }

}

/* =========================================================
   TABLET
========================================================= */
@media (max-width: 1000px) {
    .fpp-radicacion {
        padding: 35px 25px;
    }

    .fpp-radicacion__container {
        grid-template-columns: 1fr;
        gap: 45px;
    }

    .fpp-radicacion__info {
        max-width: 700px;
    }

    .fpp-radicacion__form-wrapper {
        max-width: 650px;
        margin: 0 auto;
    }
}

/* =========================================================
   MÓVIL
========================================================= */
@media (max-width: 600px) {
    .fpp-radicacion {
        width: 100%;
        box-sizing: border-box;
        padding: 35px 16px;
    }

    .fpp-radicacion__container {
        padding: 0;
        width: 100%;
    }

    /* -----------------------------------------
       Información
    ------------------------------------------ */
    .fpp-radicacion__eyebrow {
        font-size: 9px;
        letter-spacing: 1.8px;
    }

    .fpp-radicacion__eyebrow span {
        width: 30px;
    }

    .fpp-radicacion__title {
        letter-spacing: -1px;
    }

    .fpp-radicacion__description {
        margin-top: 22px;

        font-size: 14px;
    }

    /* -----------------------------------------
       Pasos
    ------------------------------------------ */
    .fpp-radicacion__step-number {
        flex-basis: 28px;
        width: 28px;
        height: 28px;
        font-size: 12px;
    }

    .fpp-radicacion__step-content h3 {
        font-size: 11px;
    }

    .fpp-radicacion__step-content p {
        font-size: 12px;
    }

    /* -----------------------------------------
       Formulario
    ------------------------------------------ */
    .fpp-radicacion__form-wrapper {
        padding: 25px 18px 22px;
        border-radius: 17px;
    }

    .fpp-radicacion__form {
        grid-template-columns: 1fr;
    }

    .fpp-field,
    .fpp-field--full,
    .fpp-radicacion__privacy,
    .fpp-radicacion__submit,
    .fpp-radicacion__notice,
    .fpp-radicacion__form-header {
        grid-column: 1;
    }

    .fpp-radicacion__form-header h2 {
        font-size: 24px;
    }

    .fpp-field input,
    .fpp-field select {
        height: 44px;
    }

    .fpp-field textarea {
        min-height: 120px;
    }

    .fpp-checkbox__text {
        font-size: 9px;
    }
}

    </style>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        const input = document.getElementById("archivos");
        const dropzone = document.getElementById("fppFileDropzone");
        const fileList = document.getElementById("fppFileList");

        const MAX_FILES = 3;
        const MAX_TOTAL_SIZE = 10 * 1024 * 1024; // 10 MB

        const ALLOWED_TYPES = [
            "application/pdf",
            "image/jpeg",
            "image/png"
        ];


        /* =====================================================
           SELECCIÓN DE ARCHIVOS
        ===================================================== */

        input.addEventListener("change", function () {

            processFiles(Array.from(input.files));

        });


        /* =====================================================
           DRAG & DROP
        ===================================================== */

        dropzone.addEventListener("dragover", function (event) {

            event.preventDefault();

            dropzone.classList.add("is-dragover");

        });


        dropzone.addEventListener("dragleave", function () {

            dropzone.classList.remove("is-dragover");

        });


        dropzone.addEventListener("drop", function (event) {

            event.preventDefault();

            dropzone.classList.remove("is-dragover");

            const files = Array.from(event.dataTransfer.files);

            processFiles(files);

        });


        /* =====================================================
           PROCESAR ARCHIVOS
        ===================================================== */

        function processFiles(files) {

            clearMessages();

            if (!files.length) {
                return;
            }


            /* Máximo 3 archivos */

            if (files.length > MAX_FILES) {

                showError(
                    "Solo puedes adjuntar un máximo de 3 archivos."
                );

                input.value = "";

                return;
            }


            /* Validar tipos */

            const invalidType = files.find(function (file) {

                return !ALLOWED_TYPES.includes(file.type);

            });

            if (invalidType) {

                showError(
                    "Solo se permiten archivos PDF, JPG y PNG."
                );

                input.value = "";

                return;
            }


            /* Tamaño total */

            const totalSize = files.reduce(function (total, file) {

                return total + file.size;

            }, 0);


            if (totalSize > MAX_TOTAL_SIZE) {

                showError(
                    "El tamaño total de los archivos no puede superar los 10 MB."
                );

                input.value = "";

                return;
            }


            /* Mostrar archivos */

            renderFiles(files);

        }


        /* =====================================================
           MOSTRAR ARCHIVOS
        ===================================================== */

        function renderFiles(files) {

            fileList.innerHTML = "";

            files.forEach(function (file) {

                const item = document.createElement("div");

                item.className = "fpp-file-upload__file";

                item.innerHTML = `
                    <div class="fpp-file-upload__file-info">

                        <i class="fa-regular fa-file fpp-file-upload__file-icon"></i>

                        <span class="fpp-file-upload__file-name">
                            ${escapeHtml(file.name)}
                        </span>

                    </div>

                    <span class="fpp-file-upload__file-size">
                        ${formatFileSize(file.size)}
                    </span>
                `;

                fileList.appendChild(item);

            });

        }


        /* =====================================================
           MENSAJES
        ===================================================== */

        function showError(message) {

            clearMessages();

            const error = document.createElement("div");

            error.className = "fpp-file-upload__error";

            error.textContent = message;

            fileList.appendChild(error);

        }


        function clearMessages() {

            fileList.innerHTML = "";

        }


        /* =====================================================
           FORMATO TAMAÑO
        ===================================================== */

        function formatFileSize(bytes) {

            if (bytes < 1024 * 1024) {

                return Math.round(bytes / 1024) + " KB";

            }

            return (bytes / (1024 * 1024)).toFixed(1) + " MB";

        }


        /* =====================================================
           SEGURIDAD PARA MOSTRAR NOMBRE
        ===================================================== */

        function escapeHtml(text) {

            const div = document.createElement("div");

            div.textContent = text;

            return div.innerHTML;

        }

    });
</script>


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
