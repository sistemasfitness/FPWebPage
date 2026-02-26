<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ofertas.aspx.cs" Inherits="WebPage.ofertas" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/servicios.ascx" TagPrefix="uc1" TagName="servicios" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>window.dataLayer = window.dataLayer || [];</script>
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

    <script src="js/fitnesspeople.js"></script>

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
    <%--<asp:Literal ID="ltBannerFull" runat="server"></asp:Literal>--%>
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/plan_6-mas-2_2025-08-21.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <%--<h1 style="font-weight: 900;">PLANES EASY MENSUALES</h1>--%>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section class="margin_60_35">
	    <div class="container">

            <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Escoge tu plan a la medida</h2>

            <div class="plans-switch text-center">
                <button class="switch-btn active" data-target="recurrentes">
                    Pagos Recurrentes
                </button>
                <button class="switch-btn" data-target="unicos">
                    Pagos Únicos
                </button>
            </div>

		    <div class="row plans plans-recu">
                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-basico-mensual.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Básico Mensual</h2>

                            <p style="margin-bottom: 0;">Empezar fácil y sin costos extra.</p>

                            <p class="plan-price">$ 19.900 1er Mes</p>
                            <p>DESPUÉS $79.000/mes</p>

                            <p>Permanencia mínima: 6 meses</p>

                            <div class="text-center">
                                <a href="register?token=l1KUGxZPIEegdYnaJLP7" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a única sede.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>1 cortesía mensual para un amigo.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=l1KUGxZPIEegdYnaJLP7" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
			    <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <%--<span class="ribbon-2"></span>--%>
                        <p class="ribbon-3">Más beneficios</p>

                        <img src="img/planes-cards/plan-pro-flexible.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Pro Flexible</h2>

                            <p style="margin-bottom: 0;">Más beneficios desde el primer mes.</p>

                            <p class="plan-price">$ 19.900 1er Mes</p>
                            <p>DESPUÉS $99.000/mes</p>

                            <p>Permanencia mínima: 6 meses</p>

                            <div class="text-center">
                                <a href="register?token=4MexIhysX3mcTNlQnfaN" class="btn-confirm-alert">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
        
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a TODAS las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-check"></i>Cita inicial con nutricionista.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=4MexIhysX3mcTNlQnfaN" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
			    <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-mes-a-mes.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan Mes a Mes</h2>

                            <p style="margin-bottom: 0;">Un solo mes, sin débito automático.</p>

                            <p class="plan-price">$ 165.000</p>
                            <p>&nbsp;</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=QTXXAbI22Wv9gJcNALSH" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago mensual automático.</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan recurrente.</span></li>
                                <li><i class="fa fa-circle-check"></i>Plan por un solo mes.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Membresía incluida.</span></li>
                                <li><i class="fa fa-circle-check"></i>Pago adicional de membresía ($190.000).</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=QTXXAbI22Wv9gJcNALSH" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
			    <!-- End col-md-4 -->
		    </div>
		    <!-- End row plans recu -->

            <div class="row plans plans-unic">
                <%--<div class="owl-carousel plans-carousel">
                    <div class="plan plan-oferta">
                        <img src="img/planes/plan-easy-fast_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY FAST</h2>

                            <p style="margin-bottom: 0;">Empezar fácil y sin costos extra.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 109.900/mes</p>

                            <p>Permanencia mínima: 12 meses</p>

                            <div class="text-center">
                                <a href="register?token=DrgZnojOsKdggSIcXL0x" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <p class="ribbon-3">Más beneficios</p>

                        <img src="img/planes/plan-easy-pro_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY PRO</h2>

                            <p style="margin-bottom: 0;">Más beneficios desde el primer mes.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 129.900/mes</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=EvdXpvlvF6zFWrKFwZfu" class="btn-confirm-alert">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
    
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-check"></i>Cita inicial con nutricionista.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="plan plan-oferta">
                        <img src="img/planes/plan-easy-flex_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY FLEX</h2>

                            <p style="margin-bottom: 0;">Un solo mes, sin débito automático.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 165.900</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=QTXXAbI22Wv9gJcNALSH" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago mensual automático.</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan recurrente.</span></li>
                                <li><i class="fa fa-circle-check"></i>Plan por un solo mes.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Membresía incluida.</span></li>
                                <li><i class="fa fa-circle-check"></i>Pago adicional de membresía ($190.000).</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="plan plan-oferta">
                        <img src="img/planes/plan-easy-fast_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY FAST</h2>

                            <p style="margin-bottom: 0;">Empezar fácil y sin costos extra.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 109.900/mes</p>

                            <p>Permanencia mínima: 12 meses</p>

                            <div class="text-center">
                                <a href="register?token=DrgZnojOsKdggSIcXL0x" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <p class="ribbon-3">Más beneficios</p>

                        <img src="img/planes/plan-easy-pro_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY PRO</h2>

                            <p style="margin-bottom: 0;">Más beneficios desde el primer mes.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 129.900/mes</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=EvdXpvlvF6zFWrKFwZfu" class="btn-confirm-alert">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
    
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                                <li><i class="fa fa-circle-check"></i>Plan recurrente.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Plan por un solo mes.</span></li>
                                <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Pago adicional de membresía ($190.000).</span></li>
                                <li><i class="fa fa-circle-check"></i>Cita inicial con nutricionista.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="plan plan-oferta">
                        <img src="img/planes/plan-easy-flex_2026-01-05.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">EASY FLEX</h2>

                            <p style="margin-bottom: 0;">Un solo mes, sin débito automático.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 165.900</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=QTXXAbI22Wv9gJcNALSH" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago mensual automático.</span></li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Plan recurrente.</span></li>
                                <li><i class="fa fa-circle-check"></i>Plan por un solo mes.</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Membresía incluida.</span></li>
                                <li><i class="fa fa-circle-check"></i>Pago adicional de membresía ($190.000).</li>
                                <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Cita inicial con nutricionista.</span></li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                            </ul>
                        </div>
                    </div>
                </div>--%>

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-3-meses.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan 3 Meses</h2>

                            <p style="margin-bottom: 0;">Compromiso corto, resultados reales.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 350.000</p>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=SuNLgEJA8mDDRgPB4EhN" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos nuevos.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>Acompañamiento profesional.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso al programa Extreme.</li>
                                <li><i class="fa fa-circle-check"></i>Precio especial en nutrición y medicina deportiva.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                                <li><i class="fa fa-circle-check"></i>Descuentos en marcas aliadas.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=SuNLgEJA8mDDRgPB4EhN" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta plan-tall plan-tall-oferta">
                        <%--<span class="ribbon-2"></span>--%>
                        <%--<p class="ribbon-3">Más beneficios</p>--%>

                        <img src="img/planes-cards/plan-6-meses.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan 6 Meses</h2>

                            <p style="margin-bottom: 0;">Invierte en ti y entrena sin excusas.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 590.000</p>
                            <%--<p>DESPUÉS $89.000/mes</p>--%>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=W70qV5GRiVWaIBk6ysD0" class="btn-confirm-alert">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
        
                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos nuevos.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>Acompañamiento profesional.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso al programa Extreme.</li>
                                <li><i class="fa fa-circle-check"></i>Precio especial en nutrición y medicina deportiva.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                                <li><i class="fa fa-circle-check"></i>Descuentos en marcas aliadas.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=W70qV5GRiVWaIBk6ysD0" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
                <!-- End col-md-4 -->

                <div class="col-md-4" style="padding: 0;">
                    <div class="plan plan-oferta">
                        <img src="img/planes-cards/plan-12-meses.jpg" alt="img" />

                        <div class="plan-info">
                            <h2 class="plan-title">Plan 12 Meses</h2>

                            <p style="margin-bottom: 0;">Entrena sin pausas durante todo un año.</p>

                            <p class="plan-price" style="margin-bottom: 20px;">$ 990.000</p>
                            <%--<p>DESPUÉS $99.000</p>--%>

                            <p>Sin permanencia</p>

                            <div class="text-center">
                                <a href="register?token=x6Is0joow5GVB8WVW9Rd" class="btn_full">Comprar ya</a>
                            </div>

                            <div class="plan-toggle">
                                <span>¿Qué incluye?</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>

                            <ul class="plan-features">
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                                <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                                <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos nuevos.</li>
                                <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                                <li><i class="fa fa-circle-check"></i>Acompañamiento profesional.</li>
                                <li><i class="fa fa-circle-check"></i>Acceso al programa Extreme.</li>
                                <li><i class="fa fa-circle-check"></i>Precio especial en nutrición y medicina deportiva.</li>
                                <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                                <li><i class="fa fa-circle-check"></i>Descuentos en marcas aliadas.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="text-center" style="margin-top:15px;">
                        <a href="register?token=x6Is0joow5GVB8WVW9Rd" class="btn_full_2">
                            ¡Comprar ahora!
                        </a>
                    </div>
                </div>
                <!-- End col-md-4 -->
            </div>
            <!-- End row plans unic -->
	    </div>
	    <!--  End container-->
    </section>
    <!--  End section-->



    <a href="register?token=Zh7zCk8gZEArPIrmCG7Z">
        <section class="banner-promo">
            <div id="sub_content_in2">
                <%--<h1 style="font-weight: 900;">PLANES EASY MENSUALES</h1>--%>
            </div>
        </section>
    </a>



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

        function planAddToCart(contentId, contentName, value, paymentUrl) {

            window.dataLayer.push({
                event: 'add_to_cart',
                ecommerce: {
                    items: [{
                        item_id: contentId,
                        item_name: contentName,
                        price: value,
                        currency: 'COP',
                        quantity: 1
                    }]
                }
            });

            setTimeout(function () {
                window.location.href = paymentUrl;
            }, 150);
        }

    </script>

    <style>

        .plans-switch {
            display: flex;
            justify-content: center;
        }

        .switch-btn {
            background: transparent;
            border: 2px solid #d6ff00;
            color: #d6ff00;
            padding: 10px 25px;
            margin: 0 10px;
            font-weight: 600;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .switch-btn:hover {
            background: #d6ff00;
            color: #000;
        }

        .switch-btn.active {
            background: #d6ff00;
            color: #000;
        }



        .plan-features {
            overflow: hidden;
            max-height: 0;
            opacity: 0;
            transition: max-height 0.35s ease, opacity 0.25s ease;
        }

        .plan-features.open {
            opacity: 1;
        }

        .plan-toggle {
            cursor: pointer;
            font-weight: 600;
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .plan-toggle .toggle-icon {
            transition: transform 0.3s ease;
        }

        .plan-toggle.active .toggle-icon {
            transform: rotate(180deg);
        }



        .plans-wrapper {
            margin: 60px auto 0px 0;
            /*gap: 16px;*/
        }

        .plans-carousel {
            width: auto;
        }

        @media (max-width: 992px) {
            .plans .col-md-4 {
                margin-top: 60px;
                /*gap: 60px;*/
            }

            .plans-wrapper {
                margin-top: 25px;
            }
        }

        @media (max-width: 600px) {
            /*.plans-wrapper {
                padding: 25px;
            }*/
        }



        .banner-promo {
            background-image: url('img/banners/plan-12-meses-duo_2026-02-25.jpg');
            background-size: cover;
            background-position: center;
            height: 470px;
        }

        @media (max-width: 1000px) {
            .plans {
                margin: 0 auto 0 0;
            }

            .banner-promo {
                background-image: url('img/banners/plan-12-meses-duo_mobile_2026-02-25.jpg');
            }
        }

    </style>


    <script>
        document.addEventListener("DOMContentLoaded", function () {

            const buttons = document.querySelectorAll(".switch-btn");
            const recurrentes = document.querySelector(".plans-recu");
            const unicos = document.querySelector(".plans-unic");

            unicos.style.display = "none";

            const toggles = document.querySelectorAll(".plan-toggle");
            const features = document.querySelectorAll(".plan-features");

            let isOpen = false;

            buttons.forEach(btn => {
                btn.addEventListener("click", function () {

                    // Quitar activo a todos
                    buttons.forEach(b => b.classList.remove("active"));

                    // Activar el actual
                    this.classList.add("active");

                    const target = this.getAttribute("data-target");

                    if (target === "recurrentes") {
                        recurrentes.style.display = "flex";
                        unicos.style.display = "none";
                    } else {
                        recurrentes.style.display = "none";
                        unicos.style.display = "flex";

                        // Refrescar carrusel por si estaba oculto
                        //$('.plans-carousel').trigger('refresh.owl.carousel');
                    }

                    // Cerrar todos
                    features.forEach(f => {
                        f.classList.remove("open");
                        f.style.maxHeight = null;
                    });

                    toggles.forEach(t => t.classList.remove("active"));

                    isOpen = false;
                });
            });

            toggles.forEach(toggle => {
                toggle.addEventListener("click", function () {

                    if (!isOpen) {
                        // Abrir todos
                        features.forEach(f => {
                            f.classList.add("open");
                            f.style.maxHeight = f.scrollHeight + "px";
                        });

                        toggles.forEach(t => t.classList.add("active"));

                        isOpen = true;
                    } else {
                        // Cerrar todos
                        features.forEach(f => {
                            f.classList.remove("open");
                            f.style.maxHeight = null;
                        });

                        toggles.forEach(t => t.classList.remove("active"));

                        isOpen = false;
                    }

                });
            });

        });
    </script>

    <%--<script>
        $(document).ready(function () {

            $(".plans-carousel").owlCarousel({
                items: 1,
                loop: true,
                nav: true,
                center: true,
                margin: 16,
                responsiveClass: false,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });

        });
    </script>--%>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
