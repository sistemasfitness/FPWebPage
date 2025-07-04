<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verificacion.aspx.cs" Inherits="WebPage.verificacion" %>

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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/3.1.6/footable.bootstrap.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />

    <!-- SPECIFIC CSS -->
    <link href="css/ion.rangeSlider.min.css" rel="stylesheet" />
</head>
<body>
    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <div id="preloader">
        <div data-loader="circle-side"></div>
    </div>
    <!-- End Preload -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/contact.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">VERIFICACION</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35">
        <div class="row">

            <div class="col-md-8">
                <h2 style="font-weight: 900; color: #fff">Verificación de Afiliado</h2>
                <p style="color: #fff">Confirma los siguientes datos y da clic al botón verificar:</p>
                <div>
                    <div id="message-contact"></div>
                    <form id="verificar" runat="server">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Nombres</label>
                                    <input type="hidden" id="idAfil" runat="server" />
                                    <input type="text" class="form-control styled" id="name_contact"
                                        name="name_contact" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Apellidos</label>
                                    <input type="text" class="form-control styled" id="lastname_contact"
                                        name="lastname_contact" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Correo eléctronico:</label>
                                    <input type="email" id="email_contact" name="email_contact"
                                        class="form-control styled" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Celular:</label>
                                    <input type="number" id="phone_contact" name="phone_contact"
                                        class="form-control styled" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">

                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="upParq" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <table class="table" style="background: #fff;">
                                                        <tr>
                                                            <th>Pregunta</th>
                                                            <th>Respuesta</th>
                                                        </tr>
                                                        <asp:Repeater ID="rpParq" runat="server" >
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="vertical-align: middle;"><%# Eval("PreguntaParq") %>
                                                                        <asp:HiddenField ID="hfIdParqAfiliado" runat="server" Value='<%# Eval("idParqAfiliado") %>' />
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <asp:CheckBox ID="chbRespuesta" runat="server" />
                                                                        <%--<input type="checkbox" class="js-switch" runat="server" />--%>
                                                                        <%--<asp:LinkButton ID="lb1" runat="server" OnClick="lb1_Click" ClientIDMode="AutoID"><%# Eval("Respuesta") %></asp:LinkButton></td>--%>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label style="color: #fff">Pregunta de validación: 3 + 1 =</label>
                                    <input type="text" id="verify_contact" class=" form-control styled"
                                        placeholder=" 3 + 1 =" runat="server" required />
                                </div>
                                <asp:Literal ID="ltMensaje" runat="server"></asp:Literal>
                                <asp:Button ID="btnVerificar" runat="server" CssClass="btn_slider"
                                    Text="VERIFICAR" OnClick="btnVerificar_Click" />
                                <%--<p><input type="submit" value="Verificar" class="btn_1" id="submit-contact" /></p>--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- End col lg 9 -->
            <aside class="col-md-4">
                <div class="box_style_2">
                    <h5 style="font-weight: 900;">Información de Contacto</h5>
                    <p>
                        Calle 45 No. 35 - 23 Piso 2<br>
                        (+57) 318 707 7584<br>
                        <a href="mailto:fp_info@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">fp_info@fitnesspeoplecmd.com</a>
                    </p>
                    <h5 style="font-weight: 900;">Cómo llegar?</h5>
                    <form action="http://maps.google.com/maps" method="get" target="_blank">
                        <div class="form-group">
                            <input type="text" name="saddr" placeholder="Ingresa tu ubicación" class="form-control styled">
                            <input type="hidden" name="daddr" value="Fitness People centro administrativo, Cl. 45 #35 23 piso 2, Cabecera del llano, Bucaramanga, Santander">
                            <!-- Write here your end point -->
                        </div>
                        <input type="submit" value="Obtener ruta" class="btn_1 add_bottom_15">
                    </form>
                    <hr class="styled">
                    <h5 style="font-weight: 900;">Departamentos</h5>
                    <ul class="contacts_info">
                        <li><strong>Contabilidad</strong><br>
                            <a href="https://wa.me/573187077584" style="color: #333333;">(+57) 318 707 7584</a>
                            <br>
                            <a href="mailto:contabilidad@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">contabilidad@fitnesspeoplecmd.com</a>
                            <br>
                            <small>Lunes a Viernes 9am - 6pm</small>
                        </li>
                        <li><strong>Área Comercial</strong><br>
                            <a href="https://wa.me/573138859790" style="color: #333333;">(+57) 313 885 9790</a>
                            <br>
                            <a href="mailto:comercial@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">comercial@fitnesspeoplecmd.com</a>
                            <br>
                            <small>Lunes a Sábado 8am - 7pm</small>
                        </li>
                    </ul>
                </div>
            </aside>
            <!--End aside -->
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d989.764486790383!2d-73.11025033039041!3d7.119283530320726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e683f7e428fb6e5%3A0x3a67714ea25f138b!2sFitness%20People%20centro%20administrativo!5e0!3m2!1sen!2sco!4v1733155568363!5m2!1sen!2sco" width="100%" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/3.1.6/footable.min.js"></script>

     <!-- SPECIFIC SCRIPTS -->
     <script src="js/ion.rangeSlider.min.js"></script>
     <script src="js/switchery.min.js"></script>
     <script>
         $("#range").ionRangeSlider({
             hide_min_max: true,
             keyboard: true,
             min: 10000,
             max: 200000,
             from: 19000,
             to: 99000,
             type: 'double',
             step: 1000,
             prefix: "$",
             grid: false
         });
         //var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
         var elems = Array.prototype.slice.call(document.querySelectorAll('input[type="checkbox"]'));
         elems.forEach(function (html) {
             var switchery = new Switchery(html, {
                 size: 'small'
             });
         });
     </script>
    <script>
        $('.footable').footable();
    </script>
</body>
</html>
