<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wompiexito.aspx.cs" Inherits="WebPage.wompiexito" %>

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
<body>
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
            <h1 style="font-weight: 900">¡Pago Exitoso!</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35" style="color: #fff">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="box_style_2" style="background-color: #1A1A1A">
                    <div id="confirm">
                        <%--<i class="icon_check_alt2"></i>--%>
                        <h3 style="font-weight: 900; color: #e3ff00;">Pago confirmado!</h3>
                        <p style="color: #fff;">Su orden ha sido confirmada.</p>
                    </div>
                    <h4 style="font-weight: 900; color: #e3ff00;">Resumen</h4>
                    <table class="table table-striped nomargin">
                        <tbody>
                            <tr style="background-color: #1A1A1A">
                                <td>Débito automático</td>
                                <td><strong class="pull-right"><span class="pull-right"><asp:Literal ID="ltValor1" runat="server"></asp:Literal></span></strong></td>
                            </tr>
                            <tr style="font-weight: 900; background-color: #e3ff00; color: black;">
                                <td class="">TOTAL</td>
                                <td class=""><span class="pull-right"><asp:Literal ID="ltValor2" runat="server"></asp:Literal></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <uc1:footer runat="server" ID="footer" />

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
</body>
</html>
