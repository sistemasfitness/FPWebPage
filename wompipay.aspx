<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wompipay.aspx.cs" Inherits="WebPage.wompipay" Async="true" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<body style="background-color: #fff;">
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/sub_header_general.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1>Pago a través de Wompi</h1>
            <p>Paga de manera segura a través de Wompi.</p>
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
            <form method="post" action="wompipay" role="form" id="form" runat="server">
                <div class="col-md-8">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3><strong><i class="icon-shield"></i></strong>Opciones de pago</h3>
                            <p>Selecciona la forma de pago:</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel-group" id="accordion">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                        <img src="img/wompi/mastercard.svg" /> Tarjeta de Crédito / Débito
                                                    <i class="indicator icon_minus_alt2 pull-right"></i></a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <label>Número de la tarjeta:</label>
                                                                <%--<input type="number" id="creditcard" name="creditcard" class="form-control" required="" />--%>
                                                                <asp:TextBox ID="txbCreditCard" CssClass="form-control" runat="server" required="" name="txbCreditCard"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3">
                                                            <div class="form-group">
                                                                <label>Mes expira:</label>
                                                                <asp:DropDownList ID="ddlMes" runat="server" required="" AppendDataBoundItems="true"
                                                                    DataTextField="Mes" DataValueField="ddlMes" CssClass="form-control">
                                                                    <asp:ListItem Text="Mes" Value=""></asp:ListItem>
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
                                                                <%--<select id="ddlMes" class="form-control" name="ddlMes" required="">
                                                                    <option value="">Mes</option>
                                                                    <option value="01">Enero</option>
                                                                    <option value="02">Febrero</option>
                                                                    <option value="03">Marzo</option>
                                                                    <option value="04">Abril</option>
                                                                    <option value="05">Mayo</option>
                                                                    <option value="06">Junio</option>
                                                                    <option value="07">Julio</option>
                                                                    <option value="08">Agosto</option>
                                                                    <option value="09">Septiembre</option>
                                                                    <option value="10">Octubre</option>
                                                                    <option value="11">Noviembre</option>
                                                                    <option value="12">Diciembre</option>
                                                                </select>--%>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3">
                                                            <div class="form-group">
                                                                <label>Año expira:</label>
                                                                <asp:DropDownList ID="ddlAnho" runat="server" required="" AppendDataBoundItems="true"
                                                                    DataTextField="Anho" DataValueField="ddlAnho" CssClass="form-control">
                                                                    <asp:ListItem Text="Año" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="2024" Value="24"></asp:ListItem>
                                                                    <asp:ListItem Text="2025" Value="25"></asp:ListItem>
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
                                                                </asp:DropDownList>
                                                                <%--<select id="ddlAnho" class="form-control" name="ddlAnho" required="">
                                                                    <option value="">Año</option>
                                                                    <option value="24">2024</option>
                                                                    <option value="25">2025</option>
                                                                    <option value="26">2026</option>
                                                                    <option value="27">2027</option>
                                                                    <option value="28">2028</option>
                                                                    <option value="29">2029</option>
                                                                    <option value="30">2030</option>
                                                                    <option value="31">2031</option>
                                                                    <option value="32">2032</option>
                                                                    <option value="33">2033</option>
                                                                    <option value="34">2034</option>
                                                                    <option value="35">2035</option>
                                                                    <option value="36">2036</option>
                                                                    <option value="37">2037</option>
                                                                    <option value="38">2038</option>
                                                                </select>--%>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <label>CVC (Código de seguridad):</label>
                                                                <%--<input type="number" id="cvc" name="cvc" class="form-control" required="" />--%>
                                                                <asp:TextBox ID="txbCVC" CssClass="form-control" runat="server" required="" name="txbCVC"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <label>Nombre en la tarjeta:</label>
                                                                <%--<input type="text" id="nombretarjeta" name="nombretarjeta" class="form-control" required="" />--%>
                                                                <asp:TextBox ID="txbNombreTarjeta" CssClass="form-control" runat="server" required="" name="txbNombreTarjeta"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                        <img src="img/wompi/nequi.png" /> Nequi
                                                    <i class="indicator icon_plus_alt2 pull-right"></i></a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <label>Confirma el número de teléfono asociado a Nequi:</label>
                                                                <input type="number" id="nronequi" name="nronequi" class="form-control" required="" />
                                                                <p>(Recibirás una notificación push en tu celular.)</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End step -->
                    </div>
                </div>
                <aside class="col-md-4" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div class="box_style_2">
                            <div id="total_cart">
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </div>
                            <div style="font-size: 13px">
                                <div class="checkbox">
                                    <input type="checkbox" value="accept1" id="check1" name="check1" onchange="habilitarBoton();" />
                                    <label for="check1">
                                        <span>Acepto haber leido <a style="color: #808080; text-decoration: revert;" href="https://wompi.com/assets/downloadble/reglamento-Usuarios-Colombia.pdf" target="_blank">los reglamentos y la politica de privacidad</a> para hacer este pago.</span>
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" value="accept2" id="check2" name="check2" onchange="habilitarBoton();" />
                                    <label for="check2">
                                        <span>Acepto la <a style="color: #808080; text-decoration: revert;" href="https://wompi.com/assets/downloadble/autorizacion-administracion-datos-personales.pdf" target="_blank">autorización para la administración de datos personales.</a></span>
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" value="accept3" id="check3" name="check3" onchange="habilitarBoton();" />
                                    <label for="check3">
                                        <span>Autorizo a <a style="color: #808080; text-decoration: revert;" href="#">Fitness People Centro Médico Deportivo S.A.S. </a> realizar el cobro recurrente.</span>
                                    </label>
                                </div>

                            </div>
                            <div id="message-subscribe"></div>
                            <asp:Literal ID="ltMensaje" runat="server"></asp:Literal>
                            <hr />
                            <%--<input type="submit" id="submitplan" class="btn_full" disabled="" value="Pagar a través de Wompi" />--%>
                            <asp:Button ID="btnPagar" runat="server" CssClass="btn_full" Text="Pagar a través de Wompi" OnClick="btnPagar_Click" />
                            <%--<a href="explore-1.html" class="btn_outline"><i class="icon-right"></i>Continue shopping</a>--%>
                        </div>
                        <div class="box_style_4">
                            <i class="icon_lifesaver"></i>
                            <h4>Necesitas ayuda?</h4>
                            <a style="color: #808080; text-decoration: revert;" href="https://wa.me/573016164444" class="phone" target="_blank">301 616 4444</a>
                            <small>Todos los dias de 7:00am - 7:00pm</small>
                        </div>
                    </div>
                </aside>
            </form>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <uc1:footer runat="server" ID="footer" />
    <!-- End footer -->
    <div id="copy">
        <div class="container">
            Copyright © 2021 – 2024 Fitness People Centro Médico Deportivo S.A.S. – Todos los derechos reservados.
        </div>
    </div>
    <!-- End copy -->

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
        function habilitarBoton() {
            const check1 = document.getElementById('check1')
            const check2 = document.getElementById('check2')
            const check3 = document.getElementById('check3')

            if (check1.checked && check2.checked && check3.checked) {
                console.log('Boton de pago habilitado');
                document.getElementById('submitplan').disabled = false;
            }
        }
    </script>
</body>
</html>
