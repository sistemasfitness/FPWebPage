<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="producto.aspx.cs" Inherits="WebPage.producto" %>

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
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    >
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
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60">
        <div class="row">
            <div class="col-md-8 ">
                <%--<div class="owl-carousel team-carousel2">--%>

                <asp:Literal ID="ltImagenesProductos" runat="server"></asp:Literal>

                <%--<div class="team-item">
                        <div class="team-item-img">
                            <img src="img/productos/course_3.jpg"/>
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/productos/course_2.jpg" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/productos/course_1.jpg" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/productos/course_5.jpg"/>
                        </div>
                    </div>--%>

                <%--</div>--%>

                <ul id="course_info">
                    <li><i class="icon-inbox-alt"></i>
                        <asp:Literal ID="ltCategoria" runat="server"></asp:Literal></li>
                    <%--<li><i class=" icon-chart-bar-5"></i>Mediul level</li>--%>
                    <li>
                        <asp:Literal ID="ltInventario" runat="server"></asp:Literal></li>
                </ul>
                <h2 style="font-weight: 900; color: #fff;">Detalle</h2>
                <p>
                    <asp:Literal ID="ltDetalle" runat="server"></asp:Literal></p>

                <h2 style="font-weight: 900; color: #fff;">Descripción</h2>
                <p>
                    <asp:Literal ID="ltDescripcion" runat="server"></asp:Literal></p>

                <h2 style="font-weight: 900; color: #fff;">Características</h2>
                <p>
                    <asp:Literal ID="ltCaracteristicas" runat="server"></asp:Literal></p>

                <h2 style="font-weight: 900; color: #fff;">Beneficios</h2>
                <p>
                    <asp:Literal ID="ltBeneficios" runat="server"></asp:Literal></p>

                <!-- End row -->
                <hr class="add_bottom_30">

                <div class="workoutlist">
                    <div class="row">
                        <div class="col-sm-5">
                            <figure>
                                <a href="https://www.youtube.com/watch?v=oX6I6vs1EFs" class="video"><i class="arrow_triangle-right_alt2"></i>
                                    <img src="img/workout_1.jpg" width="780" height="420" alt="Image" class="img-responsive"></a><span>0:35</span><em></em>
                            </figure>
                        </div>
                        <div class="col-sm-7">
                            <h4><a href="https://www.youtube.com/watch?v=oX6I6vs1EFs" class="video">Yoga Fundamentals (Youtube modal)</a></h4>
                            <p>Vel ex velit nemore, his no phaedrum interesset, in malis bonorum dissentiunt quo.</p>
                        </div>
                    </div>
                </div>
                <!-- End workoutlist -->

            </div>
            <!-- End col -->
            <div class="col-md-4" id="sidebar">
                <div class="theiaStickySidebar">
                    <form runat="server" id="form1">
                        <div class="box_style_2">
                            <div id="price_in">
                                <asp:Literal ID="ltPrecioPublico" runat="server"></asp:Literal></div>
                            <div id="features">
                                <h2 style="font-weight: 900; color: #000;">
                                    <asp:Literal ID="ltNombreProd" runat="server"></asp:Literal></h2>
                                <p>
                                </p>
                                <%--<h4>Qué obtienes?</h4>
                            <ul>
                                <li><a href="#0" class="tooltip-1" data-placement="right" title="" data-original-title="Default tooltip"><i class="icon_film"></i>12 Workout videos</a>
                                </li>
                                <li><a href="#0" class="tooltip-1" data-placement="right" title="" data-original-title="Default tooltip">Tool<i class="icon_tablet"></i>Tablets &amp; mobiles access</a>
                                </li>
                                <li><a href="#0" class="tooltip-1" data-placement="right" title="" data-original-title="Default tooltip"><i class="icon_lock-open_alt"></i>Lifetime access</a>
                                </li>
                                <li><a href="#0" class="tooltip-1" data-placement="right" title="" data-original-title="Default tooltip"><i class="icon_chat_alt"></i>Discuss with coach</a>
                                </li>
                            </ul>--%>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <%--<label>Cantidad</label>--%>
                                        <asp:TextBox ID="txbCantidad" runat="server" CssClass="form-control" BorderStyle="Solid" BorderWidth="1" placeholder="Cantidad"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ErrorMessage="* Requerido" ControlToValidate="txbCantidad"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <asp:LinkButton ID="lkbAgregar" runat="server" CssClass="btn_full" OnClick="lkbAgregar_Click"><i class="fa fa-cart-plus"></i> Agregar</asp:LinkButton>
                                </div>
                            </div>
                            <br />
                            <a href="tienda" class="btn_full"><i class="fa fa-store"></i> Seguir comprando</a>
                            <a href="carrito1" class="btn_full"><i class="fa fa-list"></i> Ver carrito</a>
                            <a class="btn_outline" href="#"><i class=" icon-heart"></i> Agregar a favoritos</a>
                        </div>
                    </form>
                    <!-- End box_style -->
                </div>
                <!-- End theiaStickySidebar -->
            </div>
            <!-- End col -->
        </div>
        <!-- End row -->
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
    <script src="js/functions.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="js/bootstrap-portfilter.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script>
        $(".team-carousel2").owlCarousel({
            items: 1,
            center: true,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            autoHeight: true,
            loop: true,
            margin: 10,
            nav: false,
            responsiveClass: true,
        });


    </script>
</body>
</html>
