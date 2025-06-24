<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wompidata.aspx.cs" Inherits="WebPage.wompidata" Async="true" %>

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

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/office.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">VERIFICACION</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35">
        <div class="row">

            <div class="col-md-8">
                <h2 style="font-weight: 900;">Pago realizado</h2>
                <p>Gracias por confiar en nosotros.</p>
                <asp:Literal ID="ltMensaje" runat="server"></asp:Literal>
                <div>
                    
                </div>
            </div>
            <!-- End col lg 9 -->
            <aside class="col-md-4">
                <div class="box_style_2">
                    <h5 style="font-weight: 900;">Información de Contacto</h5>
                    <p>Calle 45 No. 35 - 23 Piso 2<br>
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
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d989.764486790383!2d-73.11025033039041!3d7.119283530320726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e683f7e428fb6e5%3A0x3a67714ea25f138b!2sFitness%20People%20centro%20administrativo!5e0!3m2!1sen!2sco!4v1733155568363!5m2!1sen!2sco" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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

</body>
</html>
