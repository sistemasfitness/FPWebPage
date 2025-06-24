<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="WebPage.blog" %>

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
    <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1"
    /></noscript>
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

    <!-- SPECFIC CSS -->
    <link href="css/blog.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/sub_header_general.jpg" data-natural-width="1400" data-natural-height="470">
    <div id="sub_content_in">
        <h1 style="font-weight: 900;">Blog</h1>
        <p style="font-weight: 700;">Fitness People</p>
    </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container_styled_1">
        <div class="container margin_60_35">
            <div class="row">

                <div class="col-md-9">
                    <asp:Repeater ID="rpBlog" runat="server">
                        <ItemTemplate>
                            <div class="post">
                                <a href="blog_post.html">
                                    <img src="img/blog/<%# Eval("ImagenArticulo") %>" alt="" style="width: 100%; height: 200px; object-fit: cover;" class="img-responsive" />
                                </a>
                                <div class="post_info clearfix">
                                    <div class="post-left">
                                        <ul>
                                            <li><i class="icon-calendar-empty"></i><%# Eval("FechaArticulo", "{0:MMM dd, yyyy}") %> <em>por <%# Eval("NombreUsuario") %></em>
                                            </li>
                                            <li><i class="icon-inbox-alt"></i><a href="#"><%# Eval("NombreCategoria") %></a>
                                            </li>
                                            <li><i class="icon-tags"></i><a href="#">Works</a>, <a href="#">Personal</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="post-right">
                                        <i class="icon-comment"></i><a href="#">25 </a>
                                    </div>
                                </div>
                                <h2 style="font-weight: 900; text-transform: uppercase;"><%# Eval("TituloArticulo") %></h2>
                                <p><%# Eval("Articulo") %></p>
                                <a href="blogpost?idArt=<%# Eval("idArticuloBlog") %>" class="btn_1">Leer más</a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- end post -->

                    <div class="text-center">
                        <ul class="pager">
                            <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Más antiguo</a>
                            </li>
                            <li class="next"><a href="#">Más reciente <span aria-hidden="true">&rarr;</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End col-md-9-->

                <aside class="col-md-3" id="sidebar">

                    <div class="widget">
                        <div id="custom-search-input-blog">
                            <div class="input-group col-md-12">
                                <input type="text" class="form-control input-lg" placeholder="Buscar">
                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-lg" type="button">
                                        <i class="icon-search-1"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- End Search -->
                    <hr>
                    <div class="widget">
                        <h4>Categorías</h4>
                        <ul id="cat_nav_blog">
                            <asp:Repeater ID="rpCategorias" runat="server">
                                <ItemTemplate>
                                    <li><a href="blog?idCat=<%# Eval("idCategoriaBlog") %>"><%# Eval("NombreCategoria") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- End widget -->

                    <%--<hr>

                    <div class="widget">
                        <h4>Publicaciones recientes</h4>
                        <ul class="recent_post">
                            <li>
                                <i class="icon-calendar-empty"></i>16th July, 2020
				
                                <div>
                                    <a href="#">It is a long established fact that a reader will be distracted </a>
                                </div>
                            </li>
                            <li>
                                <i class="icon-calendar-empty"></i>16th July, 2020
				
                                <div>
                                    <a href="#">It is a long established fact that a reader will be distracted </a>
                                </div>
                            </li>
                            <li>
                                <i class="icon-calendar-empty"></i>16th July, 2020
				
                                <div>
                                    <a href="#">It is a long established fact that a reader will be distracted </a>
                                </div>
                            </li>
                        </ul>
                    </div>--%>
                    <!-- End widget -->
                    <hr />
                    <div class="widget tags">
                        <h4>Etiquetas</h4>
                        <a href="#">Salud</a>
                        <a href="#">Bienestar</a>
                        <a href="#">Dolor</a>
                        <a href="#">Ejercicio</a>
                        <a href="#">Calorías</a>
                        <a href="#">Hogar</a>
                    </div>
                    <!-- End widget -->

                </aside>
                <!-- End aside -->

            </div>
            <!-- End row -->
        </div>
    </div>
    <!-- End container -->

    <div>
        <asp:Literal ID="ltMapa" runat="server"></asp:Literal>
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
    <script src="js/functions.js"></script>

</body>
</html>
