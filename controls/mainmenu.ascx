<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainmenu.ascx.cs" Inherits="WebPage.controls.mainmenu" %>

<%--<div class="row">
    <a href="https://api.whatsapp.com/send/?phone=573107842151&text=Acabo%20de%20ver%20su%20p%C3%A1gina%20y%20quiero%20info%20para%20empezar%20a%20entrenar.&type=phone_number&app_absent=0" class="whatsapp" target="_blank"> <img src="../img/whatsapp-8.png" class="img-responsive" /></a>
    <div class="col-xs-3">
        <a href="default" id="logo">
            <img src="img/logos/logo_2026-04-27.svg" width="95" height="27" alt="" data-retina="true" class="logo_normal">
            <img src="img/logos/logo_2026-04-27.svg" width="95" height="27" alt="" data-retina="true" class="logo_sticky">
        </a>
    </div>
    <nav class="col-xs-9">
        <ul id="access_top">
            <asp:Literal ID="ltMenu1" runat="server"></asp:Literal>
        </ul>
        <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>
        <div class="main-menu">
            <div id="header_menu">
                <img src="img/fp-logo-lime-f-min.svg" height="27" alt="Fitness People" data-retina="true">
            </div>
            <a href="#" class="open_close" id="close_in"><i class="icon_close"></i></a>
            <ul>
                <li>
                    <a href="default" class="show-submenu" style="font-weight: 900;">INICIO</a>
                </li>
                <li><a href="sedes" style="font-weight: 900;">SEDES</a></li>
                <li><a href="default#planes" style="font-weight: 900;">PLANES</a></li>
                <li><a href="somos" style="font-weight: 900;">NOSOTROS</a></li>
                <li><a href="corporativo" style="font-weight: 900;">CORPORATIVO</a></li>
                <li><a href="contacto" style="font-weight: 900;">CONTACTO</a></li>
            </ul>
        </div>
        <!-- End main-menu -->
    </nav>
</div>--%>

<!-- ================= 01. HEADER ================= -->
<header class="header">
    <div class="container">
        <a href="default" aria-label="Fitness People">
            <img src="img/logos/logo_2026-04-27.svg" alt="Fitness People - Centro Médico Deportivo" data-retina="true" class="fp-logo">
        </a>

        <nav class="nav" aria-label="Principal">
            <a href="sedes">Sedes</a>
            <a href="default#planes">Planes</a>
            <%--<a href="#clases">Clases</a>--%>
            <a href="somos">Nosotros</a>
            <a href="corporativo">Corporativo</a>
        </nav>

        <div class="header-actions">
            <a href="default#planes" class="fpp-btn fpp-btn--solid fpp-btn--lift">¡Inscríbete ya!</a>
        </div>
    </div>
</header>

<!-- Botón Menú Móvil --> 
<button class="icon-btn burger" id="menuToggle" type="button" aria-label="Abrir menú" aria-expanded="false" aria-controls="mobileMenu">
    <i class="fa-solid fa-bars" aria-hidden="true"></i>
</button>

<!-- Overlay --> 
<div class="mobile-menu-overlay" id="menuOverlay"></div> 

<!-- Menú móvil --> 
<aside class="mobile-menu" id="mobileMenu" aria-hidden="true">
    <div class="mobile-menu-header"> 
        <span class="mobile-menu-title"> MENÚ </span> 
        
        <span class="mobile-menu-line"></span> 
    </div> 
    
    <nav class="mobile-nav" aria-label="Menú móvil"> 
        <a href="sedes"> 
            <span>Sedes</span> 
            <i class="fa-solid fa-arrow-right"></i> 
        </a> 
        
        <a href="default#planes"> 
            <span>Planes</span> 
            <i class="fa-solid fa-arrow-right"></i> 
        </a> 
        
        <a href="somos"> 
            <span>Nosotros</span> 
            <i class="fa-solid fa-arrow-right"></i> 
        </a> 
        
        <a href="corporativo"> 
            <span>Corporativo</span>
            <i class="fa-solid fa-arrow-right"></i> 
        </a> 
    </nav> 
    
    <div class="mobile-menu-footer"> 
        <p>¿Listo para comenzar?</p> 
        <a href="default#planes" class="fpp-btn fpp-btn--solid fpp-btn--lift mobile-menu-cta">¡Inscríbete ya!</a> 
    </div> 
</aside>

<style>

    /* ============ 01. HEADER ============ */
    .header {
        position: fixed;
        top: 0; 
        left: 0; 
        right: 0;
        z-index: 100;
        background: rgba(0, 0, 0, .72);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        border-bottom: 1px solid rgba(255, 255, 255, .06);
    }

    .header .container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 70px;
        gap: 24px;
    }

    .header .container {
        padding-right: 0;
        padding-left: 0;
    }

    .header .container::before,
    .header .container::after {
        display: none;
    }

    .fp-logo { 
        height: 40px; 
        width: auto; 
    }

    .nav { 
        display: flex; 
        align-items: center; 
        gap: 34px; 
    }

    .nav a {
        font-size: 12.5px;
        font-weight: 700;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        text-decoration: none;
        color: var(--fp-white);
        position: relative;
        padding: 6px 0;
        transition: color .2s;
    }

    .nav a::after {
        content: "";
        position: absolute; 
        left: 0; 
        bottom: 0;
        width: 0; 
        height: 2px;
        background: var(--fp-lime);
        transition: width .25s;
    }

    .nav a:hover { 
        color: var(--fp-lime);
    }

    .nav a:hover::after { 
        width: 100%; 
    }

    .header-actions { 
        display: flex; 
        align-items: center; 
        gap: 14px; 
    }

    .header-actions .fpp-btn {
        padding: 10px 20px;
    }

    .icon-btn {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        border: 1.5px solid rgba(255,255,255,.25);
        display: inline-flex;
        align-items: center;
        justify-content: center;
        color: var(--fp-white);
        background: transparent;
        cursor: pointer;
        transition:
            border-color .2s ease,
            color .2s ease,
            background .2s ease,
            transform .2s ease;
    }

    .icon-btn:hover {
        border-color: var(--fp-lime);
        color: var(--fp-lime);
    }

    .icon-btn i {
        font-size: 17px;
        transition:
            transform .25s ease,
            opacity .2s ease;
    }

    /* Botón cuando el menú está abierto */
    .icon-btn.is-open {
        border-color: var(--fp-lime);
        color: var(--fp-lime);
        background: rgba(180, 255, 0, .06);
    }

    .icon-btn.is-open i {
        transform: rotate(90deg);
    }

    /* =========================================================
       MENÚ MÓVIL
       ========================================================= */

    /* Botón Menú Móvil */
    .burger {
        display: none;
        position: fixed;
        top: 22px;
        right: 24px;
        z-index: 1000;
    }

    /* Overlay */
    .mobile-menu-overlay {
        position: fixed;
        inset: 0;
        z-index: 998;
        background: rgba(0, 0, 0, .65);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        opacity: 0;
        visibility: hidden;
        transition:
            opacity .3s ease,
            visibility .3s ease;
    }

    /* Panel */
    .mobile-menu {
        position: fixed;
        top: 0;
        right: 0;
        width: min(390px, 88vw);
        height: 100vh;
        z-index: 999;
        display: flex;
        flex-direction: column;
        padding: 110px 32px 32px;
        background:
            linear-gradient(
                145deg,
                rgba(22, 22, 22, .98),
                rgba(5, 5, 5, .99)
            );
        border-left: 1px solid rgba(255, 255, 255, .08);
        box-shadow: -20px 0 60px rgba(0, 0, 0, .45);
        transform: translateX(100%);
        transition: transform .35s cubic-bezier(.4, 0, .2, 1);
        overflow-y: auto;
    }

    /* Estado abierto */
    .mobile-menu.is-open {
        transform: translateX(0);
    }

    .mobile-menu-overlay.is-open {
        opacity: 1;
        visibility: visible;
    }

    /* Encabezado */
    .mobile-menu-header {
        display: flex;
        align-items: center;
        gap: 14px;
        margin-bottom: 35px;
    }

    .mobile-menu-title {
        color: var(--fp-lime);
        font-size: 11px;
        font-weight: 800;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .mobile-menu-line {
        height: 1px;
        flex: 1;
        background: rgba(255, 255, 255, .12);
    }

    /* Navegación */
    .mobile-nav {
        display: flex;
        flex-direction: column;
    }

    .mobile-nav a {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px 0;
        color: var(--fp-white);
        text-decoration: none;
        font-size: 17px;
        font-weight: 800;
        letter-spacing: 1px;
        text-transform: uppercase;
        border-bottom: 1px solid rgba(255, 255, 255, .08);
        transition:
            color .2s ease,
            padding-left .2s ease;
    }

    .mobile-nav a i {
        color: var(--fp-lime);
        font-size: 13px;
        opacity: .7;
        transition:
            transform .2s ease,
            opacity .2s ease;
    }

    .mobile-nav a:hover {
        color: var(--fp-lime);
        padding-left: 8px;
    }

    .mobile-nav a:hover i {
        opacity: 1;
        transform: translateX(5px);
    }

    /* Footer */
    .mobile-menu-footer {
        margin-top: auto;
        padding-top: 40px;
    }

    .mobile-menu-footer p {
        margin: 0 0 14px;
        color: rgba(255, 255, 255, .55);
        font-size: 12px;
        font-weight: 600;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .mobile-menu-cta {
        width: 100%;
    }

    /* =========================================================
       RESPONSIVE
       ========================================================= */
    @media (max-width: 991px) {
        .header {
            padding-bottom: 0;
        }

        /* El header ocupa todo el ancho disponible */
        .header .container {
            justify-content: flex-start;
            width: 100%;
            max-width: none;
            margin: 0;
            padding-left: 0;
        }

        .nav,
        .header .fpp-btn {
            display: none;
        }

        .burger {
            display: inline-flex;
        }
    }

    @media (min-width: 992px) {
        .mobile-menu,
        .mobile-menu-overlay {
            display: none;
        }
    }

    @media (max-width: 600px) {
        .container {
            /*padding: 0 18px;*/
        }

        .header .container {
            width: 100%;
            max-width: none;
            margin: 0;
            height: 70px;
        }

        .fp-logo {
            height: 36px;
        }

        .mobile-menu {
            width: 88vw;
            padding: 100px 25px 25px;
        }

        .burger {
            top: 17px;
            right: 18px;
        }
    }

    /* Evitar scroll de la página con el menú abierto */
    body.menu-open {
        overflow: hidden;
    }

</style>


<script>
    document.addEventListener("DOMContentLoaded", function () {

        const menuToggle = document.getElementById("menuToggle");
        const mobileMenu = document.getElementById("mobileMenu");
        const menuOverlay = document.getElementById("menuOverlay");

        const mobileLinks = mobileMenu.querySelectorAll("a");

        const icon = menuToggle.querySelector("i");


        function openMenu() {

            mobileMenu.classList.add("is-open");
            menuOverlay.classList.add("is-open");
            menuToggle.classList.add("is-open");

            menuToggle.setAttribute("aria-expanded", "true");
            menuToggle.setAttribute("aria-label", "Cerrar menú");

            mobileMenu.setAttribute("aria-hidden", "false");

            document.body.classList.add("menu-open");


            // Cambiar icono
            icon.classList.remove("fa-bars");
            icon.classList.add("fa-xmark");
        }


        function closeMenu() {

            mobileMenu.classList.remove("is-open");
            menuOverlay.classList.remove("is-open");
            menuToggle.classList.remove("is-open");

            menuToggle.setAttribute("aria-expanded", "false");
            menuToggle.setAttribute("aria-label", "Abrir menú");

            mobileMenu.setAttribute("aria-hidden", "true");

            document.body.classList.remove("menu-open");


            // Volver al icono burger
            icon.classList.remove("fa-xmark");
            icon.classList.add("fa-bars");
        }


        function toggleMenu() {

            const isOpen = mobileMenu.classList.contains("is-open");

            if (isOpen) {
                closeMenu();
            } else {
                openMenu();
            }
        }


        // Abrir / cerrar
        menuToggle.addEventListener("click", toggleMenu);


        // Cerrar haciendo clic en el overlay
        menuOverlay.addEventListener("click", closeMenu);


        // Cerrar al seleccionar una opción
        mobileLinks.forEach(function (link) {

            link.addEventListener("click", function () {
                closeMenu();
            });

        });


        // Cerrar con ESC
        document.addEventListener("keydown", function (event) {

            if (event.key === "Escape") {
                closeMenu();
            }

        });

    });
</script>
