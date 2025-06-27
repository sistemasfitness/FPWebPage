<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebPage.register" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

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
<body style="color: #fff;">
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
            <h1>Registro y pago</h1>
            <p>Ingresa la siguiente informacion:</p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35">
        <div class="row">
            <form method="post" action="register" role="form" id="form" runat="server">
                <div class="col-md-8">
                    <div class="box_style_general">
                        <div class="form_title">
                            <h3><strong>1</strong>Información inicial</h3>
                            <p>Datos personales para registro en el sistema.</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Nombre(s): *</label>
                                        <asp:TextBox ID="txbNombre" CssClass="form-control" runat="server" required=""
                                            placeholder="Nombre(s)" TabIndex="4"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Apellido(s): *</label>
                                        <asp:TextBox ID="txbApellido" CssClass="form-control" runat="server" required=""
                                            placeholder="Apellido(s)" TabIndex="2"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Tipo de Documento: *</label>
                                        <asp:DropDownList ID="ddlTipoDocumento" runat="server" required=""
                                            AppendDataBoundItems="true" DataTextField="TipoDocumento" 
                                            DataValueField="idTipoDoc" CssClass="form-control">
                                            <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Nro. de Documento: *</label>
                                        <asp:TextBox ID="txbDocumento" CssClass="form-control" runat="server" placeholder="Documento" TabIndex="1" required=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Email: *</label>
                                        <asp:TextBox ID="txbEmail" CssClass="form-control" runat="server" placeholder="Email" required=""></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Celular: *</label>
                                        <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" placeholder="Teléfono" required=""></asp:TextBox>
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
                                            <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Fecha de Nacimiento: *</label>
                                        <asp:TextBox ID="txbFechaNac" CssClass="form-control" runat="server" name="txbFechaNac" TabIndex="7" required=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3><strong>2</strong>Información del plan</h3>
                            <p>Elige las opciones de tu plan.</p>
                        </div>
                        <div class="step">
                            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="upSedes" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Ciudad: *</label>
                                                <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control" required=""
                                                    OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged" AppendDataBoundItems="true" 
                                                    DataTextField="NombreCiudadSede" DataValueField="idCiudadSede" AutoPostBack="true">
                                                    <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Sede: *</label>
                                                <asp:DropDownList ID="ddlSedes" runat="server" CssClass="form-control" 
                                                    AppendDataBoundItems="true" required=""
                                                    DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="true">
                                                    <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                            <div class="form-group">
                                                <label>Valor del plan:</label>
                                                <asp:TextBox ID="txbValorPlan" CssClass="form-control" name="txbValorPlan" runat="server" disabled=""></asp:TextBox>
                                                <asp:HiddenField ID="hfValorPlan" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4">
                                            <div class="form-group">
                                                <label>Fecha de inicio: *</label>
                                                <asp:TextBox ID="txbFechaIni" CssClass="form-control" runat="server" name="txbFechaIni" required=""
                                                             AutoPostBack="true" OnTextChanged="CambiarFechaFin"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4">
                                            <div class="form-group">
                                                <label>Fecha de fin:</label>
                                                <asp:TextBox ID="txbFechaFin" CssClass="form-control" runat="server" name="txbFechaFin" disabled=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!--End step -->
                        <div class="form_title">
                            <h3><strong>3</strong>Información del pago</h3>
                            <p>Método de pago elegido.</p>
                        </div>
                        <div class="step">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Método:</label>
                                        <asp:TextBox ID="txbMetodoPago" CssClass="form-control" runat="server" disabled="" 
                                            TabIndex="4"></asp:TextBox>
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
                                TOTAL <span class="pull-right"><asp:Literal ID="ltValor" runat="server"></asp:Literal></span>
                            </div>
                            <div style="font-size: 13px">
                                <div class="checkbox">
                                    <input type="checkbox" value="accept1" id="check1" name="check1" onchange="habilitarBoton();" />
                                    <label for="check1">
                                        <span>Autorizo a <a style="color: #808080; text-decoration: revert;" href="#">Fitness People Centro Médico Deportivo S.A.S. </a> realizar el cobro recurrente.</span>
                                    </label>
                                </div>

                            </div>
                            <div id="message-subscribe"></div>
                            <hr />
                            <div>
                                <asp:Button ID="btnAgregar" runat="server" CssClass="btn_full" Text="Registrar y pagar" OnClick="btnRegistrar" />
                            </div>
                        </div>
                        <div class="box_style_4">
                            <i class="icon_lifesaver"></i>
                            <h4>Necesitas ayuda?</h4>
                            <a style="color: #808080; text-decoration: revert;" href="https://wa.me/573138859790" class="phone" target="_blank">3138859790</a>
                            <small>Todos los dias de 7:00am - 7:00pm</small>
                        </div>
                    </div>
                </aside>
            </form>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <uc1:footer runat="server" id="footer" />
    <!-- End footer -->
    <div id="copy">
        <div class="container">
            Copyright © 2021 – 2024 Fitness People Centro Médico Deportivo S.A.S. – Todos los derechos reservados.
        </div>
    </div>
    <!-- End copy -->

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
        //function popSedes() {
        //    const ddlCiudad = document.getElementById("ddlCiudad");
        //    const ddlSede = document.getElementById("ddlSede");

        //    ddlSede.innerHTML = "";
        //    const selectedCiudad = ddlCiudad.value;

        //    const sedes = {
        //        "Bucaramanga": ["Boulevard", "Cabecera", "El Prado", "Provenza", "Ciudadela"],
        //        "Cúcuta": ["Ceiba II", "Jardin Plaza"],
        //        "Floridablanca": ["Cañaveral"],
        //        "Piedecuesta": ["DeLaCuesta", "Parque Central"],
        //    };

        //    const opcionesSede = sedes[selectedCiudad];
        //    for (var i = 0; i < opcionesSede.length; i++) {
        //        const opcion = document.createElement("option");
        //        opcion.text = opcionesSede[i];
        //        ddlSede.add(opcion);
        //    }
        //}

        function habilitarBoton() {
            const check1 = document.getElementById('check1')

            if (check1.checked) {
                console.log('Boton de pago habilitado');
                document.getElementById('submitplan').disabled = false;
            }
        }
    </script>
</body>
</html>
