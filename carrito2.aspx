<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito2.aspx.cs" Inherits="WebPage.carrito2" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager -->
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');</script>
    <!-- End Google Tag Manager -->

    <!-- Meta Pixel Code -->
    <script>
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return; n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
            n.queue = []; t = b.createElement(e); t.async = !0;
            t.src = v; s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '1224942061553441');
        fbq('track', 'PageView');
    </script>
    <noscript>
        <img height="1" width="1" style="display: none"
            src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
    <!-- End Meta Pixel Code -->

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
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/sedes/2.png" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">NUESTRA TIENDA</h1>
            <p style="font-weight: 700;">
                <asp:Literal ID="ltCiudadSede" runat="server"></asp:Literal>
            </p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60">
        <div class="row">
            <form id="form1" runat="server">
                <div class="col-md-8 add_bottom_15">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3 style="color: #ffffff"><strong style="background-color: #ffffff; color: #000">1</strong>Información inicial</h3>
                            <p style="color: #FFF;">Datos personales para registro en el sistema.</p>
                        </div>
                        <div class="step">
                            <div class="row" style="color: #FFF;">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Nombre completo *:</label>
                                        <input type="text" class="form-control styled" style="background: #FFF; color: #000;"
                                            id="fullname" name="fullname" placeholder="Nombre y apellido" required runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="* Requerido" ControlToValidate="fullname"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <%--<div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Apellido(s) *:</label>
                                        <input type="text" class="form-control styled" style="background: #FFF; color: #000;" 
                                            id="lastname" name="lastname" placeholder="Apellido" required runat="server" />
                                    </div>
                                </div>--%>
                            </div>
                            <div class="row" style="color: #FFF;">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Tipo de Documento *: </label>
                                        <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control"
                                            Style="background: #FFF; color: #000;" AppendDataBoundItems="true">
                                            <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                            <asp:ListItem Text="CC - Cédula de ciudadania" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="CE - Cédula de Extranjería" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="TI - Tarjeta de Identidad" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="PP - Pasaporte" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="PEP - Permiso Especial de Permanencia" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="NIT - Número de Identificación Tibutaria" Value="6"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvTipoDoc" runat="server" ErrorMessage="* Requerido"
                                            ControlToValidate="ddlTipoDoc" InitialValue=""></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Nro. de Documento:</label>
                                        <input type="number" class="form-control styled" style="background: #FFF; color: #000;"
                                            id="document" name="document" placeholder="Documento" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ErrorMessage="* Requerido" ControlToValidate="document"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="color: #FFF;">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Email *:</label>
                                        <input type="email" id="email" name="email" class="form-control styled"
                                            style="background: #FFF; color: #000;" placeholder="Email" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="* Requerido" ControlToValidate="email"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Celular *:</label>
                                        <input type="number" id="phone" name="phone" class="form-control styled"
                                            style="background: #FFF; color: #000;" placeholder="Celular" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCelular" runat="server" ErrorMessage="* Requerido" ControlToValidate="phone"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="color: #FFF;">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Dirección:</label>
                                        <input type="text" id="direccion" name="direccion" class="form-control styled"
                                            style="background: #FFF; color: #000;" placeholder="Dirección" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ErrorMessage="* Requerido" ControlToValidate="direccion"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Ciudad:</label>
                                        <input type="text" id="ciudad" name="ciudad" class="form-control styled"
                                            style="background: #FFF; color: #000;" placeholder="Ciudad" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ErrorMessage="* Requerido" ControlToValidate="ciudad"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3 style="color: #ffffff"><strong style="background-color: #ffffff; color: #000">2</strong>Resumen del pedido</h3>
                            <p style="color: #FFF;">Esto es lo que vas a recibir.</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <table class="table cart-list add_bottom_15" style="background-color: #fff;">
                                    <thead>
                                        <tr>
                                            <th>Item</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpCarrito" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <div class="thumb_cart">
                                                            <img src="img/thumb_cart_1.jpg" alt="Image">
                                                        </div>
                                                        <span class="item_cart"><%# Eval("NombreProd") %></span>
                                                    </td>
                                                    <td>
                                                        <strong>$ <%# Eval("PrecioPublicoProd", "{0:N0}") %></strong>
                                                    </td>
                                                    <td>
                                                        <strong><%# Eval("Cantidad") %></strong>
                                                    </td>
                                                    <td>
                                                        <strong>$ <%# Eval("Subtotal", "{0:N0}") %></strong>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3 style="color: #ffffff"><strong style="background-color: #ffffff; color: #000">3</strong>Acepta los términos y condiciones</h3>
                            <p style="color: #FFF;">Debes aceptar los términos y condiciones de nuestra tienda.</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <div class="checkbox-holder text-left">
                                            <div class="checkbox">
                                                <asp:CheckBox ID="cbAcepto" runat="server" />
                                                <%--<input type="checkbox" value="accept" id="check_1" name="check_1" runat="server" />--%>
                                                <label for="cbAcepto"><span>He leído y acepto.</span></label>
                                            </div>
                                            <asp:CustomValidator ID="cvAcepto" runat="server" ErrorMessage="* Requerido"
                                                ClientValidationFunction="testCheckBox"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <aside class="col-md-4" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="box_style_2">
                            <div id="total_cart">
                                TOTAL <span class="pull-right">$
                                    <asp:Literal ID="ltTotal" runat="server"></asp:Literal></span>
                            </div>
                            <div style="font-size: 13px">Lorem ipsum dolor sit amet, sed vide <strong>moderatius</strong> ad. Ex eius soleat sanctus pro, enim conceptam in quo, <a href="#0">brute convenire</a> appellantur an mei.</div>
                            <hr>
                            <%--<a href="carrito3" class="btn_full">Finalizar y pagar</a>--%>
                            <asp:LinkButton ID="lnkPagar" runat="server" CssClass="btn_full" OnClick="lnkPagar_Click"><i class="fa fa-hand-holding-dollar"></i> Pagar</asp:LinkButton>
                        </div>
                        <div class="box_style_4">
                            <i class="icon_lifesaver"></i>
                            <h4 style="color: #fff">Necesitas ayuda?</h4>
                            <a style="color: #808080; text-decoration: revert;" href="https://wa.me/573138859790" class="phone" target="_blank">3138859790</a>
                            <small style="color: #fff">Todos los dias de 7:00am - 7:00pm</small>
                        </div>
                    </div>
                </aside>
            </form>
        </div>
        <!--End row -->
    </div>
    <!-- End container -->

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

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
        <%--function testCheckBox(sender, element) {
            element.IsValid = $("#<%= cbAcepto.ClientID %>").prop('checked');
        }--%>

        function testCheckBox(sender, element) {
            var isValid = false;
            if ($("#<%= cbAcepto.ClientID %>").prop('checked') == true) {
                isValid = true;
            }
            element.IsValid = isValid;
        }
    </script>
</body>
</html>
