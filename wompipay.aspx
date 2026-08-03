<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wompipay.aspx.cs" Inherits="WebPage.wompipay" Async="true" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/preguntasfrecuentes.ascx" TagPrefix="uc1" TagName="preguntasfrecuentes" %>
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/planeasy.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900">Pago a través de Wompi</h1>
            <p style="font-weight: 900;">¡Rápido, seguro y sin complicaciones!</p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35">
        <div class="row">
            <%--<form>
                <script src="https://checkout.wompi.co/widget.js"
                    data-render="button"
                    data-public-key="<%=PublicKey%>"
                    data-currency="COP"
                    data-amount-in-cents="8900000"
                    data-reference="<%=Reference%>"
                    data-signature:integrity="<%=Hash256%>"
                    data-redirect-url="https://fp.valora.com.co">
                </script>
            </form>--%>
            <form id="form" runat="server" class="form-web" style="color: #fff;">
                <div class="col-md-8">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong>1</strong>Información del plan</h3>
                            <p style="color: #fff;">Elige donde quieres entrenar</p>
                        </div>

                        <div class="step">
                            <div class="row">
                                <%--<div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbCorreoTarjeta">Correo electrónico:</label>
                                        <asp:TextBox ID="txbCorreoTarjeta" CssClass="form-control" runat="server" required="" placeholder="correo@ejemplo.com" 
                                            name="txbCorreoTarjeta"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbTelefonoTarjeta">Celular o Número telefónico:</label>
                                        <asp:TextBox ID="txbTelefonoTarjeta" CssClass="form-control" runat="server" required="" placeholder="3001234567" 
                                            name="txbTelefonoTarjeta"></asp:TextBox>
                                    </div>
                                </div>--%>
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
                        </div>
                        <!--End step -->

                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong>2</strong>Pago con tarjeta</h3>
                            <p style="color: #fff;">Ingresa los datos de tu tarjeta para finalizar la compra.</p>
                        </div>

                        <div class="step">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbCreditCard">Número de la tarjeta:</label>
                                        <asp:TextBox ID="txbCreditCard" CssClass="form-control" runat="server" 
                                            MaxLength="19" placeholder="#### #### #### ####" oninput="formatCreditCard(this)" 
                                            required="" name="txbCreditCard"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="ddlMes">Mes de expiración:</label>
                                        <asp:DropDownList ID="ddlMes" runat="server" required="" AppendDataBoundItems="true"
                                            DataTextField="Mes" DataValueField="ddlMes" CssClass="form-control" >
                                            <asp:ListItem Text="Selecciona el mes" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Enero" Value="01"></asp:ListItem>
                                            <asp:ListItem Text="Febrero" Value="02"></asp:ListItem>
                                            <asp:ListItem Text="Marzo" Value="03"></asp:ListItem>
                                            <asp:ListItem Text="Abril" Value="04"></asp:ListItem>
                                            <asp:ListItem Text="Mayo" Value="05"></asp:ListItem>
                                            <asp:ListItem Text="Junio" Value="06"></asp:ListItem>
                                            <asp:ListItem Text="Julio" Value="07"></asp:ListItem>
                                            <asp:ListItem Text="Agosto" Value="08"></asp:ListItem>
                                            <asp:ListItem Text="Septiembre" Value="09"></asp:ListItem>
                                            <asp:ListItem Text="Octubre" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="Noviembre" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="Diciembre" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="ddlAnho">Año de expiración:</label>
                                        <asp:DropDownList ID="ddlAnho" runat="server" required="" AppendDataBoundItems="true"
                                            DataTextField="Anho" DataValueField="ddlAnho" CssClass="form-control" >
                                            <asp:ListItem Text="Selecciona el año" Value=""></asp:ListItem>
                                            <asp:ListItem Text="2026" Value="26"></asp:ListItem>
                                            <asp:ListItem Text="2027" Value="27"></asp:ListItem>
                                            <asp:ListItem Text="2028" Value="28"></asp:ListItem>
                                            <asp:ListItem Text="2029" Value="29"></asp:ListItem>
                                            <asp:ListItem Text="2030" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="2031" Value="31"></asp:ListItem>
                                            <asp:ListItem Text="2032" Value="32"></asp:ListItem>
                                            <asp:ListItem Text="2033" Value="33"></asp:ListItem>
                                            <asp:ListItem Text="2034" Value="34"></asp:ListItem>
                                            <asp:ListItem Text="2035" Value="35"></asp:ListItem>
                                            <asp:ListItem Text="2036" Value="36"></asp:ListItem>
                                            <asp:ListItem Text="2037" Value="37"></asp:ListItem>
                                            <asp:ListItem Text="2038" Value="38"></asp:ListItem>
                                            <asp:ListItem Text="2039" Value="39"></asp:ListItem>
                                            <asp:ListItem Text="2040" Value="40"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbCVC">Código de seguridad (CVC):</label>
                                        <asp:TextBox ID="txbCVC" CssClass="form-control" runat="server" 
                                            MaxLength="4" placeholder="123" oninput="formatCVC(this)" 
                                            required="" name="txbCVC"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbNombreTarjeta">Nombre impreso en la tarjeta:</label>
                                        <asp:TextBox ID="txbNombreTarjeta" CssClass="form-control" runat="server" required="" placeholder="Nombre del titular" 
                                            name="txbNombreTarjeta"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbCorreoTarjeta">Correo electrónico de comprador:</label>
                                        <asp:TextBox ID="txbCorreoTarjeta" CssClass="form-control" runat="server" required="" placeholder="correo@ejemplo.com" 
                                            name="txbCorreoTarjeta"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="txbTelefonoTarjeta">Teléfono del comprador:</label>
                                        <asp:TextBox ID="txbTelefonoTarjeta" CssClass="form-control" runat="server" required="" placeholder="3001234567" 
                                            name="txbTelefonoTarjeta"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="section-prin-logos-met-pagos">
                                        <p>Tarjetas</p>

                                        <div class="section-prin-logos">
                                            <div class="section-logos-met-pagos">
                                                <p>Crédito</p>

                                                <div class="logos-met-pagos cred">
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg" alt="Master Card" />
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/f/fe/Visa_Inc._logo_%281992%E2%80%931999%29.svg" alt="Visa" />
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/American_Express_logo_%282018%29.svg" alt="American Express" />
                                                </div>
                                            </div>

                                            <div class="section-logos-met-pagos">
                                                <p>Débito</p>

                                                <div class="logos-met-pagos deb">
                                                    <img src="https://static.wikia.nocookie.net/logopedia/images/d/db/Banco_Caja_Social_2011.png/revision/latest/scale-to-width-down/1000?cb=20210427194508&path-prefix=es" alt="Banco Caja Social" />

                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/8/8a/Banco_de_Occidente_logo.svg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original" alt="Banco de Occidente" />

                                                    <img src="https://static.wikia.nocookie.net/logopedia/images/6/68/AVVillas2004.svg/revision/latest/scale-to-width-down/1000?cb=20240520173353" alt="Banco AV Villas" />

                                                    <img src="https://www.misole.co/wp-content/uploads/2019/12/logo-bancolombia.png" alt="Bancolombia" />

                                                    <img src="https://imagenes.portafolio.co/files/image_1200_600/uploads/2025/05/22/682f89397f3d1.png" alt="Banco Popular" />

                                                    <img src="https://cdn.worldvectorlogo.com/logos/logo-banco-de-bogota.svg" alt="Banco de Bogotá" />

                                                    <img src="https://logos-world.net/wp-content/uploads/2023/02/Davivienda-Logo.png" alt="Davivienda" />

                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/1/1d/Citibank.svg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original" alt="Citibank" />

                                                    <img src="https://images.seeklogo.com/logo-png/16/1/colpatria-logo-png_seeklogo-168795.png" alt="Colpatria" />

                                                    <img src="https://images.seeklogo.com/logo-png/9/1/multibank-panama-logo-png_seeklogo-95907.png" alt="Multibank" />

                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Logo_CorpBanca.png?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original" alt="CorpBanca" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End step -->
                    </div>
                </div>
                <aside class="col-md-4" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="box_style_2" style="color: black;">
                            <asp:Literal ID="ltPlanEasy" runat="server"></asp:Literal>

                            <%--<div id="total_cart" class="divHidden">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </div>--%>

                            <asp:Panel ID="pnlTotalCart" runat="server" CssClass="total_cart">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </asp:Panel>

                            <div>
                                <p style="font-weight: 600;"><asp:Literal ID="ltInfoPlan" runat="server"></asp:Literal></p>
                            </div>
                            <div style="font-size: 13px">
                                <%--<div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo1" />

                                    <label for="cbAutorizo1">
                                        <span>
                                            Acepto haber leido <b><a style="color: #000000; text-decoration: revert;" href="https://wompi.com/assets/downloadble/reglamento-Usuarios-Colombia.pdf" target="_blank">los reglamentos y la politica de privacidad</a></b> para hacer este pago.
                                        </span>
                                    </label>
                                </div>
                                <div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo2" />

                                    <label for="cbAutorizo2">
                                        <span>Acepto la <b><a style="color: #000000; text-decoration: revert;" href="https://wompi.com/assets/downloadble/autorizacion-tratamiento-datos-personales.pdf" target="_blank">autorización para la administración de datos personales.</a></b></span>
                                    </label>
                                </div>
                                <div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo3" />

                                    <label for="cbAutorizo3">
                                        <span>Autorizo a <b>Fitness People Centro Médico Deportivo S.A.S.</b> realizar el cobro recurrente.</span>
                                    </label>
                                </div>--%>

                                <div class="checkbox checkbox-dark">
                                    <input type="checkbox" id="cbAutorizo" />

                                    <label for="cbAutorizo" style="text-align: justify; line-height: 17px;">
                                        <span>
                                            Autorizo a 
                                            <b>Fitness People Centro Médico Deportivo S.A.S.</b> 
                                            a realizar cobros recurrentes automáticos a la tarjeta registrada, de acuerdo con el plan seleccionado.
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div id="message-subscribe"></div>
                            <hr />
                            <asp:Button ID="btnPagar" runat="server"
                                CssClass="btn_full"
                                Text="Pagar"
                                OnClientClick="return validarYEjecutarPago();" 
                                OnClick="btnPagar_Click" />
                        </div>
                        <%--<div class="box_style_4">
                            <i class="icon_lifesaver"></i>
                            <h4 style="color: #fff">Necesitas ayuda?</h4>
                            <a style="color: #808080; text-decoration: revert;" href="https://wa.me/573107842151" class="phone" target="_blank">310 7842151</a>
                            <small style="color: #fff">Todos los dias de 7:00am - 7:00pm</small>
                        </div>--%>
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

    <uc1:footer runat="server" ID="footer" />
    <!-- End footer -->

    <div id="toTop"></div>
    <!-- Back to top button -->

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

        function formatCreditCard(input) {
            // Elimina todo lo que no sea número
            let value = input.value.replace(/\D/g, '');

            // Limita a 16 dígitos (puedes ajustar si aceptas 19)
            value = value.substring(0, 16);

            // Agrupa de a 4 dígitos
            let formattedValue = value.replace(/(.{4})/g, '$1 ').trim();

            // Asigna el valor formateado al input
            input.value = formattedValue;
        }

        function formatCVC(input) {
            // Elimina cualquier cosa que no sea número
            let value = input.value.replace(/\D/g, '');

            // Limita a 4 dígitos (algunas tarjetas como Amex lo requieren)
            value = value.substring(0, 4);

            input.value = value;
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

        function validarCamposFormulario() {

            const campos = [
                { id: "<%= txbCreditCard.ClientID %>", msg: "Por favor, ingresa el número de la tarjeta." },
                { id: "<%= ddlMes.ClientID %>", msg: "Por favor, selecciona el mes de expiración." },
                { id: "<%= ddlAnho.ClientID %>", msg: "Por favor, selecciona el año de expiración." },
                { id: "<%= txbCVC.ClientID %>", msg: "Por favor, ingresa el CVC de la tarjeta." },
                { id: "<%= txbNombreTarjeta.ClientID %>", msg: "Por favor, ingresa el nombre del titular de la tarjeta." },
                { id: "<%= txbCorreoTarjeta.ClientID %>", msg: "Por favor, ingresa el correo electrónico del titular de la tarjeta.", tipo: "email" },
                { id: "<%= txbTelefonoTarjeta.ClientID %>", msg: "Por favor, ingresa el número de celular del titular de la tarjeta." },
                { id: "<%= ddlCiudad.ClientID %>", msg: "Por favor, selecciona la ciudad donde deseas entrenar." },
                { id: "<%= ddlSede.ClientID %>", msg: "Por favor, selecciona la sede donde deseas entrenar." }
            ];

            for (const campo of campos) {
                const el = document.getElementById(campo.id);
                const valor = el?.value.trim();

                if (!valor) {
                    return mostrarAlerta(
                        'Campo requerido',
                        campo.msg,
                        'warning'
                    ).then(() => el.focus());
                }

                if (campo.tipo === "email" && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(valor)) {
                    return mostrarAlerta(
                        'Correo inválido',
                        'El formato del correo electrónico no es válido.<br><b>Ej: usuario@dominio.com</b>',
                        'warning',
                        {},
                        true
                    ).then(() => el.focus());
                }
            }

            return true;
        }

        function validarYEjecutarPago() {
            //const cb1 = document.getElementById("cbAutorizo1");
            //const cb2 = document.getElementById("cbAutorizo2");
            //const cb3 = document.getElementById("cbAutorizo3");

            //const autorizacionesOK = cb1.checked && cb2.checked && cb3.checked;
            
            //if (!autorizacionesOK) {
            //    mostrarAlerta('Confirmación requerida', 'Debes aceptar todas las autorizaciones para continuar.', 'warning');
            //    return false;
            //}

            const cb = document.getElementById("cbAutorizo");
            
            if (!cb.checked) {
                mostrarAlerta('Confirmación requerida', 'Debes aceptar la autorización para continuar.', 'warning');
                return false;
            }

            const formularioOK = validarCamposFormulario();
            if (formularioOK == true) {
                return ejecutarPago();
            }

            return false;
        }

        function ejecutarPago() {
            mostrarAlerta(
                'Procesando pago',
                'Tu pago se está realizando.<br><br><b>Por favor, no cierres ni recargues la página</b> mientras completamos la transacción. Esto puede tardar unos segundos...',
                'info',
                {
                    showCloseButton: false,
                    allowOutsideClick: false,
                    showConfirmButton: false,
                    didOpen: () => Swal.showLoading()
                },
                true
            );

            return true;
        }

    </script>

    <style>

        .section-prin-logos-met-pagos {
             margin-top: 0;
             background-color: white;
             padding: 10px;
             color: black;
        }

        .section-prin-logos-met-pagos p {
             margin-bottom: 5px;
        }

        .section-prin-logos {
            gap: 10px;
        }

    </style>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
