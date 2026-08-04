<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="corporativo.aspx.cs" Inherits="WebPage.corporativo" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/mapasedeadministrativa.ascx" TagPrefix="uc1" TagName="mapasedeadministrativa" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/corporative.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;"></h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section class="container margin_60_35 bg_black">
        <div class="container-title">
            <h2 class="main_title" style="font-weight: 900; color: #FFF;">Empresas que ya elevaron su nivel con <p class="highlight">Fitness People</p></h2>
            <p class="lead styled" style="color: #FFF;">
                <b>+50 empresas confían en nosotros para el <span class="highlight">bienestar</span> de su equipo.</b>
            </p>
        </div>

        <div class="container">
            <div class="row container-principal">
                <div class="col-md-6">
                    <div class="bg_gray aliados">
                        <div class="owl-carousel aliados-carousel">
                            <!-- SLIDE 1 -->
                            <div class="grupo-logos">
                                <div class="logo-item">
                                    <a href="https://www.essa.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_essa.png"  alt="ESSA Grupo Epm" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.vanguardia.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_vanguardia.png"  alt="Vanguardia Liberal" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.eforsalud.edu.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_eforsalud.png"  alt="Eforsalud" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.financieracomultrasan.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_financiera-comultrasan.png"  alt="Financiera Comultrasan" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.camaradirecta.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_camara-comercio.png"  alt="Cámara de Comercio" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://deportivoscarvajal.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_deportivos-carvajal.png"  alt="Deportivos Carvajal" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.comfenalcosantander.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_comfenalco.png"  alt="Comfenalco" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://marval.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_marval.png"  alt="Marval SAS" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.fecolsa.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_fecolsa.png"  alt="FECOLSA" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.coopetel.coop" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_coopetel.png"  alt="COOPETEL" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://feuis.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_feuis.png"  alt="FEUIS" />
                                    </a>  
                                </div>

                                <div class="logo-item">
                                    <a href="https://medplus.com.co/" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_medplus.png"  alt="MedPlus" />
                                    </a>  
                                </div>
                            </div>

                            <!-- SLIDE 2 -->
                            <div class="grupo-logos">
                                <div class="logo-item">
                                    <a href="https://portales.fundaciondelamujer.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_fundacion-de-la-mujer.png"  alt="Fundación Delamujer" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.foscal.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_clinica-foscal.png"  alt="Clínica FOSCAL" />  
                                    </a>                  
                                </div>

                                <div class="logo-item">
                                    <a href="https://cajasan.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_cajasan.png"  alt="Cajasan" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://megaredil.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_megaredil.png"  alt="Megaredil" />
                                    </a>  
                                </div>

                                <div class="logo-item" rel="noopener noreferrer">
                                    <a href="https://femac.coop" target="_blank">
                                        <img src="img/aliados/logo_femac.png"  alt="Femac" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.fondekikes.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_fondekikes.png"  alt="FondeKikes" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://medicinaprepagada.coomeva.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_coomeva.png"  alt="Coomeva" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://fondefos.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_fondefos.png"  alt="FONDEFOS" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://cardiocoop.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_cardiocoop.png"  alt="Cardiocoop" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.higueraescalante.com" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_higuera-escalante.png"  alt="Higuera Escalante" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://www.empas.gov.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_empas.png"  alt="EMPAS" />
                                    </a>
                                </div>

                                <div class="logo-item">
                                    <a href="https://mxm.com.co" target="_blank" rel="noopener noreferrer">
                                        <img src="img/aliados/logo_mas-por-menos.png"  alt="Mas X Menos" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="bg_gray-2 asesores">
                        <h3 class="main_title" style="font-weight: 900; color: #e3ff00; margin-bottom: 30px;">Tu convenio empieza aquí</h3>
                        <p class="lead styled" style="color: #FFF; margin-bottom: 15px;">
                            <b>Sin formularios. Sin esperas.</b>
                        </p>

                        <div class="asesores-cards">
                            <div class="card">
                                <a href="https://api.whatsapp.com/send?phone=573118253056&text=Hola%2C%20quiero%20informaci%C3%B3n%20sobre%20convenios%20corporativos%20para%20mi%20empresa." target="_blank">
                                    <img src="img/aliados/asesor-1.png" />
                                    <span class="btn_full_2" style="margin-top: 10px;">Hablar con Michell</span>
                                </a>
                            </div>
                            <div class="card">
                                <a href="https://api.whatsapp.com/send?phone=573006859461&text=Hola%2C%20quiero%20informaci%C3%B3n%20sobre%20convenios%20corporativos%20para%20mi%20empresa." target="_blank">
                                    <img src="img/aliados/asesor-3.png" />
                                    <span class="btn_full_2" style="margin-top: 10px;">Hablar con Liliana</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End row -->
    </section>

    <section class="margin_60_35 bg_dark-gray">
        <div class="container">
            <div class="container-title">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;">Cuando tu equipo mejora, todo mejora</h2>
                <p class="lead styled" style="color: #FFF; margin-bottom: 20px;">
                    <b>Así <span class="highlight">impacta</span> en tu equipo y en tu empresa.</b>
                </p>
            </div>

            <div class="container-beneficios-description">
                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-1.webp" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Reducción del estrés laboral</b>
                    </p>
                    <p class="description-text">Disminuye la carga mental de tu equipo y mejora su bienestar en el día a día.</p>
                </div>

                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-2.webp" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Aumento de la productividad</b>
                    </p>
                    <p class="description-text">Un equipo activo rinde mejor, se enfoca más y responde con mayor energía.</p>
                </div>

                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-3.webp" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Mejora en la salud general</b>
                    </p>
                    <p class="description-text">Promueve hábitos saludables y reduce riesgos asociados al sedentarismo.</p>
                </div>

                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-4.png" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Mayor sentido de pertenencia</b>
                    </p>
                    <p class="description-text">Fortalece la conexión con la empresa y el compromiso del equipo.</p>
                </div>

                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-5.png" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Disminución del ausentismo</b>
                    </p>
                    <p class="description-text">Menos incapacidades, más constancia y continuidad en la operación.</p>
                </div>

                <div class="container-description-card bg_gray">
                    <img src="img/aliados/beneficio-6.webp" />
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; color: #e3ff00;">
                        <b>Mejora del clima organizacional</b>
                    </p>
                    <p class="description-text">Fomenta relaciones más positivas, mejora la comunicación interna y fortalece la cultura empresarial.</p>
                </div>
            </div>
        </div>
    </section>
    
    <section class="margin_60_35 bg_gray">
        <div class="container">
            <div class="container-title">
                <h2 class="main_title" style="font-weight: 900; color: #e3ff00;">Implementarlo es más fácil de lo que crees</h2>
            </div>

            <div class="container-description">
                <div class="container-description-card">
                    <i class="fa-solid fa-comment-dots"></i>
                    <p class="lead styled" style="color: #FFF; margin: 10px 0;">
                        <b style="color: #e3ff00;">1. </b><b>Nos contactas</b>
                    </p>
                    <p class="description-text">Cuéntanos sobre tu empresa y la cantidad de colaboradores. Uno de nuestros asesores te guiará de forma rápida y personalizada.</p>
                </div>

                <div class="container-description-card">
                    <i class="fa-solid fa-clipboard-list"></i>
                    <p class="lead styled" style="color: #FFF; margin: 10px 0;">
                        <b style="color: #e3ff00;">2. </b><b>Diseñamos el convenio</b>
                    </p>
                    <p class="description-text">Creamos una propuesta ajustada a tu equipo, con beneficios reales y acceso a todas nuestras sedes.</p>
                </div>

                <div class="container-description-card">
                    <i class="fa-solid fa-dumbbell"></i>
                    <p class="lead styled" style="color: #FFF; margin: 10px 0; padding: 0 10px;">
                        <b style="color: #e3ff00;">3. </b><b>Tu equipo empieza a entrenar</b>
                    </p>
                    <p class="description-text">Activamos el convenio y tus colaboradores comienzan a disfrutar del entrenamiento, mejorando su bienestar y rendimiento.</p>
                </div>
            </div>
            <!--  End row -->
        </div>
        <!--  End container-->
    </section>


    <section class="margin_60_35 bg_dark-gray" style="margin-bottom: 0;">
        <div class="container">
            <div class="container-title">
                <h2 class="main_title" style="font-weight: 900; color: #FFF;">Estamos más cerca de lo que crees</h2>
                <p class="lead styled" style="color: #FFF; margin-bottom: 20px;">
                    <b>Visítanos en nuestra sede administrativa o agenda una <span class="highlight">asesoría personalizada</span> para tu empresa.</b>
                </p>
            </div>
        </div>
    </section>

    <uc1:mapasedeadministrativa runat="server" ID="mapasedeadministrativa1" />

    <%--<div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                    <div id="message-newsletter"></div>
                    <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                        <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control">
                        <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- End newsletter_container -->

    

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

    <style>

        .highlight {
            color: #e3ff00;
        }

        .aliados {
            padding: 20px 20px;
            border-radius: 10px;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .asesores {
            padding: 30px 10px 10px 10px;
            border-radius: 10px;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .grupo-logos {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .asesores-cards {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            flex-wrap: nowrap;
        }

        .asesores-cards .card {
            max-width: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .logo-item img, 
        .asesores-cards .card img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }

        .asesores-cards .card img {
            border-radius: 10px;
        }

        .logo-item {
            width: 100%;
            max-width: none;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-item img {
            filter: brightness(0) invert(1);
            opacity: 0.8;
        }

        .logo-item img:hover {
            cursor: pointer;
            opacity: 1;
            transform: scale(1.1);
            transition: 0.3s;
        }

        .container-description {
            padding-top: 20px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .container-description-card {
            display: flex; 
            flex-direction: column;
            text-align: center;
        }

        .container-description-card i {
            font-size: 100px; 
            color: #e3ff00; 
            text-align: center;
        }

        .container-description-card .description-text {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 400;
        }

        /*  */

        .container-beneficios-description {
            padding-top: 20px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            justify-items: center;
            gap: 30px;
        }

        .container-beneficios-description .container-description-card {
            border-radius: 10px;
            max-width: 300px;
            align-items: center;
        }

        .container-beneficios-description .container-description-card p {
            font-size: 15px;
        }

        .container-beneficios-description .container-description-card img {
            padding: 30px 30px 0 30px;
            max-width: 200px;
            width: 100%;
        }

        @media (max-width: 991px) {
            .grupo-logos {
                grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            }

	        .container-title p.lead.styled {
		        margin-bottom: 0;
	        }

            .container-description {
                padding-top: 0;
                gap: 20px;
            }

            .container-description {
                grid-template-columns: repeat(1, 1fr);
            }

            .container-description-card i {
                font-size: 70px;
            }

            .container-description-card .description-text {
                font-size: 14px;
            }

            /**/

            .container-beneficios-description {
                padding-top: 20px;
                grid-template-columns: repeat(2, 1fr);
                gap: 10px;
            }

            .container-beneficios-description .container-description-card .description-text {
                font-size: 14px;
            }

            .asesores-cards {
                flex-direction: column;
            }
        }

    </style>

    <script>
        $('.aliados-carousel').owlCarousel({
            items: 1,           // 🔥 CLAVE: un grupo por slide
            loop: true,
            margin: 10,
            nav: false,
            dots: true,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true
        });
    </script>


    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>