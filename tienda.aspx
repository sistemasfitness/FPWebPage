<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tienda.aspx.cs" Inherits="WebPage.tienda" %>

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

    <!-- SPECIFIC CSS -->
    <link href="css/ion.rangeSlider.min.css" rel="stylesheet" />
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

    <div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">

                <aside class="col-md-3 col-md-push-9" id="sidebar">
                    <div class="theiaStickySidebar">
                        <div id="filters_col">
                            <a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">Filtrar por </a>
                            <div class="collapse" id="collapseFilters">
                                <div class="filter_type">
                                    <h6>Categorías</h6>
                                    <ul>
                                        <li>
                                            <label>Todas (6)</label>
                                            <input type="checkbox" class="js-switch" checked />
                                        </li>
                                        <li>
                                            <label>Ropa (2)</label>
                                            <input type="checkbox" class="js-switch" />
                                        </li>
                                        <li>
                                            <label>Accesorio (2)</label>
                                            <input type="checkbox" class="js-switch" />
                                        </li>
                                    </ul>
                                </div>
                                <div class="filter_type">
                                    <h6>Productos en el carrito: <asp:Literal ID="ltCantidad" runat="server"></asp:Literal></h6>
                                    <a href="carrito1" class="btn_full">Ver carrito</a>
                                    <span style="font-size: 8px;">Carrito No.: <asp:Literal ID="ltCarrito" runat="server"></asp:Literal></span>
                                </div>
                            </div>
                            <!--End collapse -->
                        </div>
                        <!--End filters col-->
                    </div>
                    <!--End Sticky -->
                </aside>
                <!--End aside -->

                <div class="col-md-9 col-md-pull-3">
                    <div class="row">
                        <asp:Repeater ID="rpProductos" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 wow fadeIn" data-wow-delay="0.1s">
                                    <div class="course_container">
                                        <div class="ribbon"><span>Nuevo</span></div>
                                        <figure>
                                            <a href="producto?id=<%# Eval("idProducto") %>">
                                                <img src="img/productos/<%# Eval("Imagen1Prod") %>" width="800" height="533" class="img-responsive" alt="Image">
                                                <div class="short_info"><i class="icon-clock-1"></i>Promoción</div>
                                            </a>
                                        </figure>
                                        <div class="course_title">
                                            <div class="type"><span><%# Eval("NombreCat") %></span></div>
                                            <h3><a href="producto?id=<%# Eval("idProducto") %>" style="color: #0094ff"><%# Eval("Nombreprod") %> <%# Eval("Talla") %> <%# Eval("Color") %></a></h3>
                                            <div class="info_2 clearfix">
                                                <span class="price">$<%# Eval("PrecioPublicoProd", "{0:N0}") %></span>
                                                <span class="users"><%# Eval("inventario") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- End col -->
                </div>
                <!-- End Row -->
            </div>
        </div>
        <!-- End container -->
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
</body>
</html>
