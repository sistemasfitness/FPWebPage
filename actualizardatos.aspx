<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="actualizardatos.aspx.cs" Inherits="WebPage.actualizardatos" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/fitnesspeople.js"></script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>

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
    <%--<asp:Literal ID="ltBannerFull" runat="server"></asp:Literal>
    <section class="parallax_window_in banner-principal"></section>--%>
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/actualizardatos.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900; text-shadow: 2px 2px 4px rgba(0,0,0,1);">ACTUALIZA TUS DATOS</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section class="margin_60" id="planes" >
        <div class="container" style="display: flex; flex-direction: column;">
            <img src="img/actualizardatos/img-actualizardatos.png" class="img-responsive"  />
        </div>
        <div class="row text-center add_top_20">
            <h2 class="indent_title" style="padding: 0 20px; font-weight: 900; color: #FFF;">CONFIANZA Y SEGURIDAD EN CADA PASO</h2>
        </div>
        <div class="row text-center add_top_20">
            <h2 class="indent_title" style="padding: 0 20px; font-weight: 900; font-size: 4rem; color: #e3ff00;">¡Tu experiencia en Fitness People evoluciona!</h2>
            <h2 class="indent_title" style="padding: 0 20px; font-weight: 900; font-size: 3rem; color: #FFF;">Próximamente los beneficios exclusivos del nuevo sotfware:</h2>
        </div>
        <div class="container row add_top_20 plans" style="justify-content: center;">
            <div class="col-xs-12 col-md-4 col-sm-4 col-xl-4 col-lg-4 col-xxl-4 card img_container" style="display: flex; justify-content: center;" >
                <img src="img/actualizardatos/01-beneficio_ingreso-face-id.png" class="img-responsive" />
            </div>

            <div class="col-xs-12 col-md-4 col-sm-4 col-xl-4 col-lg-4 col-xxl-4 card img_container" style="display: flex; justify-content: center;">
                <img src="img/actualizardatos/02-beneficio_plan-entrenamiento-a-la-mano.png" class="img-responsive" />
            </div>

            <div class="col-xs-12 col-md-4 col-sm-4 col-xl-4 col-lg-4 col-xxl-4 card img_container" style="display: flex; justify-content: center;">
                <img src="img/actualizardatos/03-beneficio_revision-evolucion-medica.png" class="img-responsive" />
            </div>
        </div>
        <div class="container add_top_60 text-center" style="display: flex; flex-direction: column; justify-content: center;">
            <a href="https://fitnesspeoplecolombia.com/register?idPlan=12" 
               target="_blank">
               <img src="img/actualizardatos/btn-actualizardatos.png" style="max-width: 100%" />
            </a>
            <h2 class="indent_title" style="padding: 0 20px; font-weight: 900; font-size: 3rem; color: #FFF;">Y DISFRUTA LA EXPERIENCIA RENOVADA</h2>
        </div>
    </section>

    <section class="margin_60_35" id="bg_gray3">
        <div class="container">
            <h2 class="main_title" style="color: #e3ff00; font-weight: 900;"><em></em>NUESTROS ALIADOS</h2>
            <!--Team Carousel -->
            <div class="row">
                <div class="owl-carousel team-carousel">

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/clientes/coopfuturo.png" style="width: 150px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/clientes/fecolsa.png" style="width: 150px;" alt="" />
                        </div>
                    </div>

                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/clientes/freskoop.png" style="width: 150px;" alt="" />
                        </div>
                    </div>
                    <div class="team-item">
                        <div class="team-item-img">
                            <img src="img/clientes/cooprofesores.png" style="width: 150px;" alt="" />
                        </div>
                    </div>

                </div>
            </div>
            <!--End Team Carousel-->
        </div>
        <!--  End container-->
    </section>
    <!--  End section-->

    <div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60" style="padding-top: 0px; padding-bottom: 30px;">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <a href="gympass">
                        <img src="img/gympass01.jpg" class="img-responsive" style="width: 470px; display: inline;" />
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End newsletter_container -->

    <div>
        <asp:Literal ID="ltMapa" runat="server"></asp:Literal>
    </div>

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

    <script>

        'use strict';
        $(".team-carousel").owlCarousel({
            items: 1,
            autoHeight: true,
            autoWidth: true,
            loop: true,
            nav: false,
            center: true,
            autoplayTimeout: 1000,
            margin: 20,
            autoplay: true,
            smartSpeed: 300,
            responsiveClass: false,
            responsive: {
                320: {
                    items: 2,
                },
                768: {
                    items: 3,
                },
                1000: {
                    items: 4,
                }
            }
        });

        $(".team-carousel3").owlCarousel({
            items: 1,
            loop: true,
            autoHeight: true,
            autoWidth: false,
            nav: false,
            center: true,
            autoplayTimeout: 3000,
            margin: 10,
            autoplay: true,
            smartSpeed: 1000,
            responsiveClass: false,
            autoplayHoverPause: true,
            responsive: {
                320: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                1000: {
                    items: 2,
                }
            }
        });

        $(".team-carousel4").owlCarousel({
            items: 1,
            autoHeight: true,
            autoWidth: true,
            loop: true,
            nav: false,
            center: true,
            autoplayTimeout: 3000,
            margin: 100,
            autoplay: true,
            smartSpeed: 1000,
            responsiveClass: false,
            responsive: {
                320: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                1000: {
                    items: 4,
                }
            }
        });
    </script>

    <script>

        const totalSteps = 5;
        let currentStep = 0;
        const answers = [];

        const allSteps = document.querySelectorAll('.question-block');
        const progressFill = document.getElementById("progress-fill");
        const btnPrev = document.getElementById("btnPrev");
        const btnNext = document.getElementById("btnNext");

        function selectCard(step, value, card) {
            const cards = document.querySelectorAll(`.card-row[data-step="${step}"] .card`);
            const wasSelected = card.classList.contains("selected");

            // Deseleccionar todas
            cards.forEach(c => {
                c.classList.remove("selected");
                const img = c.querySelector("img");
                const defaultImg = c.getAttribute("data-img-default");
                if (img && defaultImg) img.src = defaultImg;
            });

            if (!wasSelected) {
                // Marcar tarjeta como seleccionada
                card.classList.add("selected");
                answers[step] = value;

                const img = card.querySelector("img");
                const selectedImg = card.getAttribute("data-img-selected");
                if (img && selectedImg) img.src = selectedImg;

                // Lógica condicional si estamos en la pregunta de sede
                if (step === 3) mostrarOpcionesPorSede(value); // value 1 o 2

                if (step === 4) {
                    // Construimos query params con las respuestas
                    const queryParams = answers
                        .map((val, index) => `q${index + 1}=${encodeURIComponent(val)}`)
                        .join("&");

                    // Redirige a la página con las respuestas en la URL
                    window.location.href = `resultado.aspx?${queryParams}`;
                }

                goToNext();

            } else {
                // Se deseleccionó la tarjeta actual
                answers[step] = null;

                // Si deselecciona sede, ocultamos todo lo que sigue
                if (step === 3) ocultarOpcionesPorSede();
            }
        }

        function restoreSelection(step) {
            const selectedValue = answers[step];

            // Paso 4 es condicional, así que debemos buscar en el bloque visible
            if (step === 4) {
                const visibles = document.querySelectorAll(`.card-row[data-step="${step}"]`);
                visibles.forEach(row => {
                    if (getComputedStyle(row).display !== "none") {
                        const cards = row.querySelectorAll('.card');
                        cards.forEach((card, index) => {
                            card.classList.remove("selected");
                            if ((index + 1) === selectedValue) {
                                card.classList.add("selected");
                            }
                        });
                    }
                });
            } else {
                // Comportamiento normal para otros pasos
                const cards = document.querySelectorAll(`.card-row[data-step="${step}"] .card`);
                cards.forEach((card, index) => {
                    card.classList.remove("selected");
                    if ((index + 1) === selectedValue) {
                        card.classList.add("selected");
                    }
                });
            }

            btnNext.disabled = selectedValue == null;
        }

        function mostrarOpcionesPorSede(sedeSeleccionada) {
            const opcionesBga = document.querySelector('.opciones-bucaramanga');
            const opcionesCuc = document.querySelector('.opciones-cucuta');

            // Ocultamos ambas primero
            opcionesBga.style.display = "none";
            opcionesCuc.style.display = "none";

            if (sedeSeleccionada === 1) {
                opcionesBga.style.display = "flex";
            } else if (sedeSeleccionada === 2) {
                opcionesCuc.style.display = "flex";
            }
        }

        function ocultarOpcionesPorSede() {
            const opcionesBga = document.querySelector('.opciones-bucaramanga');
            const opcionesCuc = document.querySelector('.opciones-cucuta');

            opcionesBga.style.display = "none";
            opcionesCuc.style.display = "none";
        }

        function cambiarImagenHover(card) {
            const img = card.querySelector("img");
            const hoverImg = card.getAttribute("data-img-selected");
            if (img && hoverImg) img.src = hoverImg;
        }

        function restaurarImagenHover(card) {
            const img = card.querySelector("img");
            if (!img) return;

            if (card.classList.contains("selected")) {
                const selectedImg = card.getAttribute("data-img-selected");
                if (selectedImg) img.src = selectedImg;
            } else {
                const defaultImg = card.getAttribute("data-img-default");
                if (defaultImg) img.src = defaultImg;
            }
        }

        function goToNext() {
            if (answers[currentStep] == null) return;

            allSteps[currentStep].style.display = "none";
            currentStep++;

            if (currentStep < totalSteps) {
                allSteps[currentStep].style.display = "block";
                btnNext.disabled = answers[currentStep] == null;
            }

            // Restaura selección visual
            restoreSelection(currentStep);

            btnPrev.disabled = currentStep === 0;

            if (currentStep === totalSteps - 1) {
                btnNext.textContent = "Finalizar";
            }

            updateProgress();
        }

        function goToPrevious() {
            allSteps[currentStep].style.display = "none";
            currentStep--;

            allSteps[currentStep].style.display = "block";
            btnNext.disabled = answers[currentStep] == null;

            // Restaura selección visual
            restoreSelection(currentStep);

            btnPrev.disabled = currentStep === 0;
            btnNext.textContent = "Siguiente";

            updateProgress();
        }

        function updateProgress() {
            let percent = ((currentStep) / totalSteps) * 100;
            progressFill.style.width = percent + "%";
        }

        window.onload = function () {
            allSteps.forEach((block, index) => {
                block.style.display = index === 0 ? "block" : "none";
            });
            btnNext.disabled = true;
        };

    </script>

    <style>

        .banner-principal {
	        background-image: url(img/descubrir-plan/banner-principal.png);
	        background-size: cover;
	        background-position: center;
        }

        /* Para pantallas de 480px o menos */
        @media (max-width: 480px) {
            .banner-principal {
                background-image: url('img/descubrir-plan/banner-principal_movil.jpg');
            }
        }

    </style>

</body>
</html>
