<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="servicios.ascx.cs" Inherits="WebPage.controls.servicios" %>

<section class="margin_30 servicios" id="servicios">
    <div class="container">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Nuestros Servicios</h2>

        <div class="row">
            <div class="owl-carousel team-carousel-servicios">
                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/7_dias_semana.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/10_sedes.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/breakee.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/clases_grupales.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/deportologo.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/fisioterapeuta.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/nutricionista.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/profesionales.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/salon_grupales.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/salon_pilates.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/salon_spinning.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/salon_xtreme.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/zona_cardiovascular.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/zona_hammer.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/zona_mancuernas.png" style="width: 140px;" alt="" />
                    </div>
                </div>

                <div class="team-item">
                    <div class="team-item-img">
                        <img src="img/servicios/zona_poleas.png" style="width: 140px;" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="<%= ResolveUrl("~/js/jquery-2.2.4.min.js") %>"></script>
<script src="<%= ResolveUrl("~/js/owl.carousel.js") %>"></script>

<script>

    'use strict';
    $(".team-carousel-servicios").owlCarousel({
        items: 1,
        autoHeight: true,
        autoWidth: true,
        loop: true,
        nav: true,
        center: true,
        autoplayTimeout: 2000,
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
