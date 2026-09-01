<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainmenu.ascx.cs" Inherits="WebPage.controls.mainmenu" %>

<!-- ================= 01. HEADER ================= -->
<header class="header">
    <div class="container">
        <a href="default" aria-label="Fitness People">
            <img src="img/logos/logo_2026-04-27.svg" alt="Fitness People - Centro Médico Deportivo" data-retina="true" class="fp-logo">
        </a>

        <nav class="nav" aria-label="Principal">
            <a href="sedes">Sedes</a>
            <a href="default#planes">Planes</a>
            <a href="#clases">Clases</a>
            <a href="somos">Nosotros</a>
            <a href="corporativo">Corporativo</a>
        </nav>

        <div class="header-actions">
            <a href="default#planes" class="fpp-btn fpp-btn--solid">¡Inscríbete ya!</a>

            <button class="icon-btn burger" aria-label="Menú">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 6h18M3 12h18M3 18h18"/></svg>
            </button>
        </div>
    </div>
</header>

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
        height: 82px;
        gap: 24px;
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

    .icon-btn {
        width: 42px; 
        height: 42px;
        border-radius: 50%;
        border: 1.5px solid rgba(255,255,255,.25);
        display: inline-flex; 
        align-items: center; 
        justify-content: center;
        color: var(--fp-white);
        text-decoration: none;
        transition: all .2s;
    }

    .icon-btn:hover { 
        border-color: var(--fp-lime); 
        color: var(--fp-lime); 
    }

    .icon-btn svg { 
        width: 18px; 
        height: 18px; 
    }

    .burger { 
        display: none;
    }

    @media (max-width: 991px) {
        .nav, .header .fpp-btn { 
            display: none; 
        }

        .burger { 
            display: inline-flex; 
        }
    }

    @media (max-width: 600px) {
        .container { 
            padding: 0 18px; 
        }

        .header .container { 
            height: 70px; 
        }
    }

</style>