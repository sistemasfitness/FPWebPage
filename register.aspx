<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebPage.register" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/preguntasfrecuentes.ascx" TagPrefix="uc1" TagName="preguntasfrecuentes" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    <!-- SubHeader =============================================== -->
    <section class="banner-sub-header parallax_window_in margin-top-header" data-parallax="scroll" data-image-src="img/banners/planeasy.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">¡Compra tu plan ahora!</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35 section-pasarela" style="color: #fff;">
        <div class="row">
            <form id="form" runat="server" class="form-web">
                <div class="col-md-8">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong><i class="fa-solid fa-shield-halved"></i></strong>Datos del afiliado</h3>
                            <p style="color: #fff; font-size: 13px;">Registra a la persona que utilizará el plan de Fitness People.</p>
                        </div>
                        <div class="step">
                            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="upAfiliados" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-12 div-information">
                                            <p><b>Importante:</b> Si estás comprando el plan para otra persona, ingresa los datos de esa persona, no los datos de quien está realizando el pago.</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Nro. de Documento: *</label>
                                                <asp:TextBox ID="txbDocumento" CssClass="form-control" runat="server" MaxLength="10" AutoPostBack="true" OnTextChanged="GestionarDatosUsuario" onkeypress="permitirSoloNumeros(event)"></asp:TextBox>
                                                <p style="color: #fff; font-size: 12px; color: #e3ff00; margin-top: 5px; text-align: justify; line-height: 15px;"><i class="fa-solid fa-circle-info" style="font-weight: 900; margin-right: 5px;"></i>Al ingresar tu número de documento, algunos datos podrán completarse automáticamente mediante procesos de validación con fuentes autorizadas, con el fin de agilizar tu registro.</p>
                                            </div>
                                        </div>
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
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Nombre(s): *</label>
                                                <asp:TextBox ID="txbNombre" CssClass="form-control" runat="server" onkeypress="permitirSoloLetras(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Apellido(s): *</label>
                                                <asp:TextBox ID="txbApellido" CssClass="form-control" runat="server" onkeypress="permitirSoloLetras(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Email: *</label>
                                                <asp:TextBox ID="txbEmail" CssClass="form-control" runat="server" TextMode="Email" placeholder="ejemplo@correo.com" autocomplete="email"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Celular: *</label>
                                                <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" MaxLength="10" onkeypress="permitirSoloNumeros(event)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:TextBox ID="txbFechaIni" runat="server" name="txbFechaIni" Visible="false" OnTextChanged="CambiarFechaFin"></asp:TextBox>
                                        <asp:TextBox ID="txbFechaFin" runat="server" name="txbFechaFin" Visible="false"></asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento: *</label>
                                                <asp:TextBox ID="txbFechaNac"
                                                    CssClass="form-control"
                                                    runat="server"
                                                    TextMode="Date">
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Género: *</label>
                                                <asp:DropDownList ID="ddlGenero" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="Genero" DataValueField="idGenero" required="" 
                                                    CssClass="form-control" TabIndex="6">
                                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento: *</label>
                                                <asp:TextBox ID="txbFechaNac" CssClass="form-control" 
                                                    runat="server" name="txbFechaNac" required=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>--%>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <aside class="col-md-4" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="box_style_2" style="color: black;">
                            <asp:Literal ID="ltPlanEasy" runat="server"></asp:Literal>

                            <%--<div id="total_cart" class="ocultar">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </div>--%>

                            <asp:Panel ID="pnlTotalCart" runat="server" CssClass="total_cart">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </asp:Panel>

                            <div>
                                <p style="font-weight: 600;"><asp:Literal ID="ltInfoPlan" runat="server"></asp:Literal></p>
                            </div>
                            <div style="font-size: 13px">
                                <div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo1" />

                                    <label for="cbAutorizo1" style="text-align: justify; line-height: 17px;">
                                        <span>Autorizo el 
                                            <b>
                                                <a style="color: #000000; text-decoration: revert;" href="https://fitnesspeoplecolombia.com/assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf" target="_blank">
                                                    tratamiento de mis datos personales conforme a la Política de Tratamiento de Datos Personales de Fitness People Centro Médico Deportivo S.A.S.
                                                </a>
                                            </b> y la normativa vigente en Colombia.
                                        </span>
                                    </label>
                                </div>

                                <div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo2" />

                                    <label for="cbAutorizo2" style="text-align: justify; line-height: 17px;">
                                        <span>Acepto los
                                            <b>
                                                <a style="color: #000000; text-decoration: revert;" href="https://fitnesspeoplecolombia.com/terminoslegales" target="_blank">
                                                    reglamentos, términos y condiciones y la política de privacidad de Fitness People Centro Médico Deportivo S.A.S.
                                                </a>
                                            </b>
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div id="message-subscribe"></div>
                            <hr />
                            <div>
                                <asp:Button ID="btnRegistrarAfiliado" runat="server" 
                                    CssClass="btn_full" 
                                    Text="Registrarme" 
                                    OnClientClick="afiliadoFormSubmit(); return iniciarProcesoPago();"
                                    OnClick="btnRegistrar_Click" />
                            </div>
                        </div>

                        <div class="box_style_2" style="display: none; color: black;">
                            <div>
                                <asp:HyperLink ID="btnElegirPlanLink" runat="server" CssClass="btn_full" Text="Seleccionar otro plan" />
                            </div>
                        </div>
                    </div>
                </aside>
            </form>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <!-- Control Preguntas Frecuentes -->
    <uc1:preguntasfrecuentes runat="server" ID="preguntasfrecuentes" />
    <!-- End Control Preguntas Frecuentes -->

    <!-- End footer -->
    <uc1:footer runat="server" id="footer" />
    <!-- End copy -->

    <div id="toTop"></div>
    <!-- Back to top button -->

    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>



    <script>

        document.addEventListener("DOMContentLoaded", function () {
            configurarFechaNacimiento();
        });

        let procesandoPago = false;

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

            if (especiales.includes(tecla)){
                return true;
            }

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

        function configurarFechaNacimiento() {

            const campo = document.getElementById("<%= txbFechaNac.ClientID %>");

            if (!campo) return;

            const hoy = new Date();

            // La persona debe tener al menos 14 años,
            const fechaLimite = new Date(
                hoy.getFullYear() - 14,
                hoy.getMonth(),
                hoy.getDate()
            );

            const anio = fechaLimite.getFullYear();
            const mes = String(fechaLimite.getMonth() + 1).padStart(2, "0");
            const dia = String(fechaLimite.getDate()).padStart(2, "0");

            campo.max = `${anio}-${mes}-${dia}`;
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

        function validarDocumento(valor) {
            if (!/^\d{5,10}$/.test(valor)) return "El número de documento debe contener entre 5 y 10 dígitos."

            if (/^0+$/.test(valor)) return "El número de documento no es válido.";

            return null;
        }

        function validarNombre(valor, campo) {
            const regex = /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$/;

            if (!regex.test(valor)) return `El campo ${campo} solo debe contener letras y espacios.`;

            if (valor.length < 2) return `El campo ${campo} debe tener al menos 2 caracteres.`;

            return null;
        }

        function validarEmail(valor) {
            valor = valor.toLowerCase();

            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!regex.test(valor)) return "El formato del correo electrónico no es válido. Ej: usuario@dominio.com.";

            return null;
        }

        function validarCelular(valor) {
            if (!/^3\d{9}$/.test(valor)) return "El número de celular debe iniciar en 3 y tener 10 dígitos."

            return null;
        }

        function validarFechaNacimiento(valor) {

            // Validar formato YYYY-MM-DD
            if (!/^\d{4}-\d{2}-\d{2}$/.test(valor)) {
                return "La fecha de nacimiento no es válida.";
            }

            const [anio, mes, dia] = valor.split("-").map(Number);

            // Crear fecha
            const fechaNacimiento = new Date(anio, mes - 1, dia);

            // Validar que la fecha realmente exista
            if (
                fechaNacimiento.getFullYear() !== anio ||
                fechaNacimiento.getMonth() !== mes - 1 ||
                fechaNacimiento.getDate() !== dia
            ) {
                return "La fecha de nacimiento no es válida.";
            }

            // Fecha actual
            const hoy = new Date();
            hoy.setHours(0, 0, 0, 0);

            // No permitir fechas futuras
            if (fechaNacimiento > hoy) {
                return "La fecha de nacimiento no puede ser una fecha futura.";
            }

            // Calcular edad
            let edad = hoy.getFullYear() - fechaNacimiento.getFullYear();

            const aunNoCumpleAnos =
                hoy.getMonth() < fechaNacimiento.getMonth() ||
                (
                    hoy.getMonth() === fechaNacimiento.getMonth() &&
                    hoy.getDate() < fechaNacimiento.getDate()
                );

            if (aunNoCumpleAnos) {
                edad--;
            }

            // Regla de negocio: debe ser mayor de 14 años
            if (edad < 14) {
                return "Debes tener al menos 14 años para registrarte.";
            }

            return null;
        }

        function validarCamposFormulario() {
            const campos = [
                {
                    id: "<%= txbDocumento.ClientID %>",
                    msg: "Por favor, ingresa tu número de documento.",
                    validar: validarDocumento
                },
                {
                    id: "<%= ddlTipoDocumento.ClientID %>",
                    msg: "Por favor, selecciona el tipo de documento."
                },
                {
                    id: "<%= txbNombre.ClientID %>",
                    msg: "Por favor, ingresa tu nombre.",
                    validar: (v) => validarNombre(v, "Nombre")
                },
                {
                    id: "<%= txbApellido.ClientID %>",
                    msg: "Por favor, ingresa tus apellidos.",
                    validar: (v) => validarNombre(v, "Apellido")
                },
                {
                    id: "<%= txbEmail.ClientID %>",
                    msg: "Por favor, ingresa tu correo electrónico.",
                    validar: validarEmail
                },
                {
                    id: "<%= txbCelular.ClientID %>",
                    msg: "Por favor, ingresa tu número de celular.",
                    validar: validarCelular
                },
                {
                    id: "<%= txbFechaNac.ClientID %>",
                    msg: "Por favor, ingresa tu fecha de nacimiento.",
                    validar: validarFechaNacimiento
                }
            ];

            for (const campo of campos) {

                const el = document.getElementById(campo.id);

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

        function validarAutorizaciones() {
            const cb1 = document.getElementById("cbAutorizo1");
            const cb2 = document.getElementById("cbAutorizo2");

            const autorizacionesOk = cb1.checked && cb2.checked;

            if (!autorizacionesOk) {
                mostrarAlerta(
                    'Confirmación requerida',
                    'Debes aceptar las autorizaciones para continuar.',
                    'warning'
                );

                return false;
            }

            return true;
        }

        function bloquearBotonPago() {
            const btn = document.getElementById("<%= btnRegistrarAfiliado.ClientID %>");

            btn.disabled = true;

            btn.style.opacity = "0.7";

            btn.value = "Procesando...";
        }

        function iniciarProcesoPago() {
            if (procesandoPago) return false;

            const formularioOK = validarCamposFormulario();

            if (!formularioOK) return false;

            const autorizacionesOK = validarAutorizaciones();

            if (!autorizacionesOK) return false;

            procesandoPago = true;

            setTimeout(() => {

                bloquearBotonPago();

                mostrarAlerta(
                    'Procesando registro',
                    'Estamos guardando tu información.<br><br><b>No cierres ni recargues la página</b><br>mientras te redirigimos a la pasarela de pago.',
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
            e.target.classList.remove("input-error");
        });

    </script>

    <script>

        function afiliadoFormSubmit() {

            var nombre = document.getElementById('<%= txbNombre.ClientID %>').value;
            var apellido = document.getElementById('<%= txbApellido.ClientID %>').value;
            var correo = document.getElementById('<%= txbEmail.ClientID %>').value;
            var telefono = document.getElementById('<%= txbCelular.ClientID %>').value;

            window.dataLayer.push({
                event: 'custom_form_submit',
                formData: {
                    name: nombre + ' ' + apellido,
                    email: correo,
                    phone: telefono
                }
            });
        }

    </script>

    <style>

        .input-error {
            border: 2px solid #ff4d4f !important;
        }

        .div-information {
            padding: 10px 20px; 
            border: 1px solid var(--fp-lime);
            border-radius: 10px;
            margin-bottom: 25px;
        }
        
        .div-information p {
            margin-bottom: 0;
            color: var(--fp-lime);
        }

        @media(max-width: 991px){
            .div-information {
                margin-right: 20px;
            }
        }

    </style>


    <style>

        @media (max-width: 991px) {
	        .parallax-mirror {
		        display: none !important;
	        }
        }

        body.modal-open {
            padding-right: 0 !important;
            overflow-y: auto !important;
        }

        .modal-dialog {
            max-width: 100%;
            margin: 0 auto;
        }

        .modal-content.modal-popup {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
        }

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

    </style>



    <noscript>
        <img height="1" width="1" style="display: none;" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
