<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainmenu.ascx.cs" Inherits="WebPage.controls.mainmenu" %>

<!-- ================= HEADER ================= -->
<header class="header">
    <div class="container-header">
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

<!-- ================= Botón Menú Móvil ================= -->
<button class="icon-btn burger" id="menuToggle" type="button" aria-label="Abrir menú" aria-expanded="false" aria-controls="mobileMenu">
    <i class="fa-solid fa-bars" aria-hidden="true"></i>
</button>

<!-- ================= Overlay ================= -->
<div class="mobile-menu-overlay" id="menuOverlay"></div> 

<!-- ================= Menú Móvil ================= -->
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

<!-- ================= Whatsapp Flotante ================= -->
<a href="https://api.whatsapp.com/send/?phone=573107842151&text=Acabo%20de%20ver%20su%20p%C3%A1gina%20y%20quiero%20info%20para%20empezar%20a%20entrenar.&type=phone_number&app_absent=0" class="wa-float" target="_blank" aria-label="Escríbenos por WhatsApp">
    <i class="fa-brands fa-whatsapp"></i>
</a>


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
