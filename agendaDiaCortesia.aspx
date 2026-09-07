<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="agendaDiaCortesia.aspx.cs" Inherits="WebPage.agendaDiaCortesia" %>

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

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
    </header>

    
    <section class="margin_60 bg_black" style="height: 100vh; display: flex; align-items: center;">
        <div class="container section-cortesia">
            <h2 class="main_title title">Agenda tu Free Pass</h2>

            <p class="lead styled text">Completa el formulario, selecciona la sede que prefieras y disfruta una clase de cortesía para conocer nuestras instalaciones, entrenar con acompañamiento profesional y vivir la experiencia Fitness People.</p>

            <div class="row">
                <div class="plans-switch text-center">
                    <button class="switch-btn active" type="button" id="btnAbrirModal">
                        Reservar mi Free Pass
                    </button>
                </div>
            </div>
        </div>
    </section>

    <div id="modalReserva" class="modal">
        <div class="modal-content">
            <span class="cerrar">&times;</span>

            <div class="row" style="text-align: center;">
                <h2 style="color: #d6ff00; font-weight: 900;">Reserva tu Free Pass</h2>

                <p class="descripcion" style="font-weight: 500;">
                    Completa tus datos y asegura tu cupo.
                    Todos campos son obligatorios.
                </p>
            </div>

            <div class="row">
                <form id="form" runat="server" class="form-web">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label>Nombre Completo *</label>
                                <asp:TextBox ID="txbNombre" CssClass="form-control" runat="server" placeholder="Pepito" onkeypress="permitirSoloLetras(event)"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label>Celular: *</label>
                                <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" placeholder="3001234567" MaxLength="10" onkeypress="permitirSoloNumeros(event)"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Tipo de Documento: *</label>
                                <asp:DropDownList ID="ddlTipoDocumento" runat="server"
                                    AppendDataBoundItems="true" DataTextField="TipoDocumento" 
                                    DataValueField="idTipoDoc" CssClass="form-control">
                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Nro. de Documento: *</label>
                                <asp:TextBox ID="txbDocumento" CssClass="form-control" runat="server" placeholder="1234567890" MaxLength="10" onkeypress="permitirSoloNumeros(event)"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label>Fecha de Cortesía: *</label>
                                <asp:TextBox ID="txbFechaCort" CssClass="form-control" runat="server" name="txbFechaCort" required=""></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="upAfiliados" runat="server">
                            <ContentTemplate>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Ciudad: *</label>
                                        <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control" required=""
                                            OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged" 
                                            DataTextField="NombreCiudadSede" DataValueField="idCiudadSede" AutoPostBack="true" />
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Sede: *</label>
                                        <asp:DropDownList ID="ddlSede" runat="server" CssClass="form-control" required=""
                                            DataTextField="NombreSede" DataValueField="IdSede" 
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSede_SelectedIndexChanged" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="row" style="display: flex; justify-content: center;">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:Button ID="btnRegistrar" runat="server" 
                                CssClass="btn_full" 
                                Text="AGENDAR FREE PASS" 
                                OnClientClick="return iniciarProcesoRegistro();"
                                OnClick="btnRegistrarCortesia" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


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

            const modal = document.getElementById("modalReserva");
            const btnAbrir = document.getElementById("btnAbrirModal");
            const btnCerrar = document.querySelector("#modalReserva .cerrar");

            // Abrir modal
            btnAbrir.addEventListener("click", function (e) {
                e.preventDefault();
                modal.style.display = "block";
                document.body.style.overflow = "hidden";
            });

            // Cerrar con la X
            btnCerrar.addEventListener("click", function () {
                cerrarModal();
            });

            // Cerrar haciendo clic fuera del contenido
            window.addEventListener("click", function (e) {
                if (e.target === modal) {
                    cerrarModal();
                }
            });

            // Cerrar con ESC
            document.addEventListener("keydown", function (e) {
                if (e.key === "Escape" && modal.style.display === "block") {
                    cerrarModal();
                }
            });

            function cerrarModal() {
                modal.style.display = "none";
                document.body.style.overflow = "auto";
            }

        });

    </script>

    <script>

        let procesandoRegistro = false;

        function limpiarTexto(texto) {
            return texto.trim().replace(/\s+/g, ' ');
        }

        function permitirSoloNumeros(e) {

            const tecla = e.key;

            // Permitir teclas especiales
            const especiales = [
                "Backspace",
                "Delete",
                "ArrowLeft",
                "ArrowRight",
                "Tab"
            ];

            if (especiales.includes(tecla))
                return true;

            // Solo números
            if (!/^\d$/.test(tecla)) {
                e.preventDefault();
                return false;
            }

            return true;
        }

        function permitirSoloLetras(e) {

            const tecla = e.key;

            const especiales = [
                "Backspace",
                "Delete",
                "ArrowLeft",
                "ArrowRight",
                "Tab",
                " "
            ];

            if (especiales.includes(tecla))
                return true;

            // Letras con tildes y ñ
            if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ]$/.test(tecla)) {
                e.preventDefault();
                return false;
            }

            return true;
        }

        function marcarError(el) {
            el.classList.add("input-error");
        }

        function limpiarError(el) {
            el.classList.remove("input-error");
        }

        function mostrarAlerta(titulo, mensaje, tipo, opcionesExtras = {}, esHtml = false) {
            const config = {
                title: titulo,
                icon: tipo,
                background: '#3C3C3C',
                showCloseButton: true,
                confirmButtonText: 'Aceptar',
                customClass: {
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                },
                ...opcionesExtras
            };

            esHtml ? config.html = mensaje : config.text = mensaje;
            return Swal.fire(config); // Retorna la promesa
        }

        function validarNombre(valor) {
            const regex = /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$/;

            if (!regex.test(valor)) return `El nombre solo debe contener letras y espacios.`;

            if (valor.length < 2) return `El nombre debe tener al menos 2 caracteres.`;

            return null;
        }

        function validarCelular(valor) {
            if (!/^3\d{9}$/.test(valor)) return "El número de celular debe iniciar en 3 y tener 10 dígitos."

            return null;
        }

        function validarDocumento(valor) {
            if (!/^\d{5,10}$/.test(valor)) return "El número de documento debe contener entre 5 y 10 dígitos."

            if (/^0+$/.test(valor)) return "El número de documento no es válido.";

            return null;
        }

        function validarFecha(valor) {
            if (valor.trim() === "")
                return "Debes seleccionar la fecha de la cortesía.";

            return null;
        }

        function validarCamposFormulario() {
            const campos = [
                {
                    id: "<%= txbNombre.ClientID %>",
                    msg: "Por favor, ingresa tu nombre completo.",
                    validar: validarNombre
                },
                {
                    id: "<%= txbCelular.ClientID %>",
                    msg: "Por favor, ingresa tu número de celular.",
                    validar: validarCelular
                },
                {
                    id: "<%= ddlTipoDocumento.ClientID %>",
                    msg: "Por favor, selecciona el tipo de documento."
                },
                {
                    id: "<%= txbDocumento.ClientID %>",
                    msg: "Por favor, ingresa tu número de documento.",
                    validar: validarDocumento
                },
                {
                    id: "<%= txbFechaCort.ClientID %>",
                    msg: "Por favor, selecciona la fecha que quieres agendar como cortesía."
                },
                {
                    id: "<%= ddlCiudad.ClientID %>",
                    msg: "Por favor, selecciona una ciudad."
                },
                {
                    id: "<%= ddlSede.ClientID %>",
                    msg: "Por favor, selecciona una sede."
                }
            ];

            for (const campo of campos) {

                const el = document.getElementById(campo.id);

                if (!el)
                    continue;

                limpiarError(el);

                let valor = "";

                // Dropdown
                if (el.tagName === "SELECT") {
                    valor = el.value;
                }
                else {
                    valor = limpiarTexto(el.value);
                    el.value = valor;
                }

                // Campo vacío
                if (!valor) {

                    marcarError(el);

                    mostrarAlerta(
                        'Campo requerido',
                        campo.msg,
                        'warning'
                    );

                    el.focus();

                    return false;
                }

                // Validaciones especiales
                if (campo.validar) {

                    const error = campo.validar(valor);

                    if (error) {

                        marcarError(el);

                        mostrarAlerta(
                            'Validación incorrecta',
                            error,
                            'warning'
                        );

                        el.focus();

                        return false;
                    }
                }
            }

            return true;
        }

        function bloquearBotonRegistro() {
            const btn = document.getElementById("<%= btnRegistrar.ClientID %>");

            btn.disabled = true;

            btn.style.opacity = "0.7";

            btn.value = "Registrando...";
        }

        function iniciarProcesoRegistro() {
            if (procesandoRegistro) return false;

            const formularioOK = validarCamposFormulario();

            if (!formularioOK) return false;

            procesandoRegistro = true;

            setTimeout(() => {

                bloquearBotonRegistro();

                mostrarAlerta(
                    'Registrando',
                    'Estamos registrando tu día de cortesía.<br><br><b>No cierres ni recargues la página.</b>',
                    'info',
                    {
                        showCloseButton: false,
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        showConfirmButton: false,
                        didOpen: () => Swal.showLoading()
                    },
                    true
                );

            }, 100);

            // PERMITIR POSTBACK
            return true;
        }

        document.addEventListener("input", function (e) {
            if (e.target.classList.contains("input-error"))
                e.target.classList.remove("input-error");
        });

        document.addEventListener("change", function (e) {
            if (e.target.classList.contains("input-error"))
                e.target.classList.remove("input-error");
        });

    </script>

    <style>

        .section-cortesia {

        }

        .section-cortesia .title {
            font-size: 60px; 
            font-weight: 900;
            color: #d6ff00;
        }

        .section-cortesia .text {
            font-size: 20px; 
            font-weight: 500; 
            color: #FFF;
        }


        .swal2-container {
            z-index: 999999 !important;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 99999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow-y: auto;
            background: rgba(0,0,0,.6);
        }

        .modal-content {
            background: #1A1A1A;
            width: 90%;
            max-width: 550px;
            margin: 5% auto;
            padding: 30px;
            border: 1px solid #d6ff00;
            border-radius: 10px;
            position: relative;
            animation: aparecer .25s ease;
            color: white;
        }

        .cerrar {
            position: absolute;
            right: 20px;
            top: 10px;
            font-size: 30px;
            cursor: pointer;
            color: #d6ff00;
        }

        .cerrar:hover {
            color: #000;
        }

        @keyframes aparecer {
            from{
                opacity:0;
                transform: translateY(-20px);
            }
            to{
                opacity:1;
                transform: translateY(0);
            }
        }

        @media (max-width: 992px) {
            .modal {
                padding: 0 !important;
            }

            .section-cortesia .title {
                font-size: 40px; 
            }

        }

    </style>


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
