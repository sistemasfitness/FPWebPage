<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebPage.register" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

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
            <h1 style="font-weight: 900;">REGISTRO</h1>
            <%--<p style="font-weight: 900; color: black;">Completa la siguiente informacion</p>--%>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35" style="color: #fff;">
        <div class="row">
            <form id="form" runat="server" class="form-web">
                <div class="col-md-8">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong>1</strong>Información inicial</h3>
                            <p style="color: #fff;">Datos personales para registro en el sistema.</p>
                        </div>
                        <div class="step">
                            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="upAfiliados" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Nro. de Documento: *</label>
                                                <asp:TextBox ID="txbDocumento" CssClass="form-control" runat="server" 
                                                    placeholder="1234567890" TabIndex="1" required="" oninput="numberFormat(this)"
                                                    MaxLength="10" AutoPostBack="true" OnTextChanged="GestionarDatosUsuario"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Tipo de Documento: *</label>
                                                <asp:DropDownList ID="ddlTipoDocumento" runat="server" required=""
                                                    AppendDataBoundItems="true" DataTextField="TipoDocumento" 
                                                    DataValueField="idTipoDoc" CssClass="form-control">
                                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Nombre(s): *</label>
                                                <asp:TextBox ID="txbNombre" CssClass="form-control" runat="server" required=""
                                                    placeholder="Pepito" TabIndex="4"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Apellido(s): *</label>
                                                <asp:TextBox ID="txbApellido" CssClass="form-control" runat="server" required=""
                                                    placeholder="Pérez" TabIndex="2"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Email: *</label>
                                                <asp:TextBox ID="txbEmail" CssClass="form-control" runat="server" placeholder="ejemplo@correo.com" 
                                                    required=""></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Celular: *</label>
                                                <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" placeholder="3001234567" 
                                                    MaxLength="10" oninput="numberFormat(this)" required=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Género: *</label>
                                                <asp:DropDownList ID="ddlGenero" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="Genero" DataValueField="idGenero" required="" 
                                                    CssClass="form-control" TabIndex="6">
                                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento: *</label>
                                                <asp:TextBox ID="txbFechaNac" CssClass="form-control" 
                                                    runat="server" name="txbFechaNac" required=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong>2</strong>Información del plan</h3>
                            <p style="color: #fff;">Elige las opciones de tu plan.</p>
                        </div>

                        <div class="step">
                            <asp:UpdatePanel ID="upSedes" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Ciudad: *</label>
                                                <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control" required=""
                                                    OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged" AppendDataBoundItems="true" 
                                                    DataTextField="NombreCiudadSede" DataValueField="idCiudadSede" AutoPostBack="true">
                                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Sede: *</label>
                                                <asp:DropDownList ID="ddlSedes" runat="server" CssClass="form-control" required=""
                                                    AppendDataBoundItems="true" DataTextField="NombreSede" DataValueField="IdSede" 
                                                    AutoPostBack="true">
                                                    <asp:ListItem Text="Selecciona una opción" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                            <div class="form-group">
                                                <label>Valor del plan:</label>
                                                <asp:TextBox ID="txbValorPlan" CssClass="form-control" name="txbValorPlan" runat="server" Enabled="false"></asp:TextBox>
                                                <asp:HiddenField ID="hfValorPlan" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4" style="color: #fff;">
                                            <div class="form-group">
                                                <label>Fecha de inicio:</label>
                                                <asp:TextBox ID="txbFechaIni" CssClass="form-control" runat="server" name="txbFechaIni" required=""
                                                    AutoPostBack="true" OnTextChanged="CambiarFechaFin"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4">
                                            <div class="form-group">
                                                <label>Fecha de fin:</label>
                                                <asp:TextBox ID="txbFechaFin" CssClass="form-control" runat="server" name="txbFechaFin" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3 style="font-weight: 900; color: #e3ff00;"><strong>3</strong>Información del pago</h3>
                            <p style="color: #fff;">Método de pago elegido.</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Método:</label>
                                        <asp:TextBox ID="txbMetodoPago" CssClass="form-control" runat="server" Enabled="false" 
                                            TabIndex="4"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <aside class="col-md-4" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="box_style_2" style="color: black;">
                            <asp:Literal ID="ltPlanEasy" runat="server"></asp:Literal>
                            <div id="total_cart" class="ocultar">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </div>
                            <div>
                                <p style="font-weight: 600;"><asp:Literal ID="ltInfoPlan" runat="server"></asp:Literal></p>
                            </div>
                            <div style="font-size: 13px">
                                <div class="checkbox checkbox-dark">
                                    <asp:CheckBox ID="cbAutorizo" runat="server" />

                                    <label for="cbAutorizo">
                                        <span>Autorizo a <b>Fitness People Centro Médico Deportivo S.A.S.</b> realizar el cobro recurrente.</span>
                                    </label>
                                </div>
                            </div>
                            <div id="message-subscribe"></div>
                            <hr />
                            <div>
                                <asp:Button ID="btnRegistrarAfiliado" runat="server" CssClass="btn_full" Text="Registrar y pagar" OnClick="btnRegistrar_Click" Enabled="false"/>
                            </div>
                        </div>

                        <div class="box_style_2" style="display: none; color: black;">
                            <div>
                                <asp:HyperLink ID="btnElegirPlanLink" runat="server" CssClass="btn_full" Text="Seleccionar otro plan" />
                            </div>
                        </div>

                        <div class="box_style_4">
                            <i class="icon_lifesaver"></i>
                            <h4 style="color: #fff">Necesitas ayuda?</h4>
                            <a style="color: #808080; text-decoration: revert;" href="https://wa.me/573107842151" class="phone" target="_blank">310 7842151</a>
                            <small style="color: #fff">Todos los dias de 7:00am - 7:00pm</small>
                        </div>
                    </div>
                </aside>
            </form>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <!-- End footer -->
    <uc1:footer runat="server" id="footer" />
    <!-- End copy -->

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- Modal - Plan Easy -->
    <div class="modal fade" id="plan-easy" tabindex="-1" role="dialog" aria-labelledby="myAviso">
        <div class="modal-dialog" style="display: flex; justify-content: center;">
            <div class="modal-content modal-popup" style="background: transparent;">
                <a href="#" class="close-link" data-dismiss="modal"><i class="icon_close_alt2"></i></a>
                <a href="register?idPlan=19" target="_blank">
                    <img src="img/modals/modal_plan-easy-1.png" style="width: 100%;" />
                </a>
            </div>
        </div>
    </div>

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

        $(document).ready(function () {
            const params = new URLSearchParams(window.location.search);
            if (params.get("idPlan") === "18") {
                // Obtenemos el ID real del control ASP.NET
                var documentoInput = $("#<%= txbDocumento.ClientID %>");

                // 1. Cuando el usuario cambia de foco (blur)
                documentoInput.on("blur", function () {
                    if ($(this).val().trim() !== "") {
                        $("#plan-easy").modal("show");
                    }
                });

                // 2. Cuando presiona Enter
                documentoInput.on("keypress", function (e) {
                    if (e.which === 13 && $(this).val().trim() !== "") {
                        e.preventDefault(); // evitar que dispare un submit
                        $("#plan-easy").modal("show");
                    }
                });
            }

            if (params.get("idPlan") === "19"){
                document.querySelector('.ocultar').style.display = 'none';
            }
        });

    </script>

    <script>

        function numberFormat(input) {
            // Elimina cualquier cosa que no sea número
            let value = input.value.replace(/\D/g, '');

            // Limita a 4 dígitos (algunas tarjetas como Amex lo requieren)
            value = value.substring(0, 10);

            input.value = value;
        }

        window.onload = function () {
            const cbAutorizo = document.getElementById('<%= cbAutorizo.ClientID %>');
            const btnRegistrar = document.getElementById('<%= btnRegistrarAfiliado.ClientID %>');

            function toggleButton() {
                btnRegistrar.disabled = !cbAutorizo.checked;
            }

            cbAutorizo.addEventListener('change', toggleButton);

            // Inicializar el estado al cargar la página
            toggleButton();
        }

    </script>

    <style>

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

    </style>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
