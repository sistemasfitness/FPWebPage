<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="aliados.ascx.cs" Inherits="WebPage.controls.aliados" %>

<section class="margin_60_35 aliados" id="bg_gray3">
    <div class="container">
        <h2 class="main_title" style="color: #e3ff00; font-weight: 900;"><em></em>NUESTROS ALIADOS</h2>

        <div class="row">
            <div class="owl-carousel team-carousel-aliados">
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
    </div>
</section>

<script src="<%= ResolveUrl("~/js/jquery-2.2.4.min.js") %>"></script>
<script src="<%= ResolveUrl("~/js/owl.carousel.js") %>"></script>

<script>

    'use strict';
    $(".team-carousel-aliados").owlCarousel({
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
