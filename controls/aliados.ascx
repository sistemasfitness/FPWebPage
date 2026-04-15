<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="aliados.ascx.cs" Inherits="WebPage.controls.aliados" %>

<section class="margin_60_35 aliados" id="aliados">
    <div class="container">
        <h2 class="main_title" style="color: #e3ff00; font-weight: 900;"><em></em>NUESTROS ALIADOS</h2>

        <div class="row">
            <div class="owl-carousel team-carousel-aliados">
                <div class="logo-item">
                    <a href="https://www.vanguardia.com" target="_blank" rel="noopener noreferrer">
                        <img src="img/aliados/logo_vanguardia.png"  alt="Vanguardia Liberal" />
                    </a>
                </div>

                <div class="logo-item logo-item-horizontal">
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
                    <a href="https://portal.upb.edu.co" target="_blank" rel="noopener noreferrer">
                        <img src="img/aliados/logo_universidad-pontificia-bolivariana.png"  alt="Universidad Pontificia Bolivariana" />
                    </a>
                </div>

                <div class="logo-item">
                    <a href="https://deportivoscarvajal.com" target="_blank" rel="noopener noreferrer">
                        <img src="img/aliados/logo_deportivos-carvajal.png"  alt="Deportivos Carvajal" />  
                    </a>  
                </div>

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
                    <a href="https://www.genteutil.net/" target="_blank" rel="noopener noreferrer">
                        <img src="img/aliados/logo_gente-util.png"  alt="GENTE UTIL" />
                    </a>
                </div>

                <div class="logo-item logo-item-horizontal" rel="noopener noreferrer">
                    <a href="https://www.uniminuto.edu/" target="_blank">
                        <img src="img/aliados/logo_uniminuto.png"  alt="UNIMINUTO" />
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="<%= ResolveUrl("~/js/jquery-2.2.4.min.js") %>"></script>
<script src="<%= ResolveUrl("~/js/owl.carousel.js") %>"></script>


<style>

    .logo-item {
        height: 150px;
        width: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .logo-item-horizontal {
        width: 250px; 
    }

    .logo-item img {
        max-height: 100%;
        max-width: 100%;
        object-fit: contain;
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

</style>


<script>

    'use strict';
    $(".team-carousel-aliados").owlCarousel({
        items: 1,
        autoHeight: true,
        autoWidth: true,
        loop: true,
        nav: true,
        center: true,
        autoplayTimeout: 3000,
        margin: 20,
        autoplay: true,
        smartSpeed: 300,
        responsiveClass: true,
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

</script>
