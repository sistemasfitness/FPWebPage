<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="WebPage.controls.footer" %>
<footer>
    <div class="container">
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-3 col-sm-12">
                <p>
                    <img src="img/fp-logo-lime-f-min.svg" height="27" alt="Fitness People" data-retina="true" />
                </p>
                <div id="social">
                    <ul>
                        <li><a href="https://www.facebook.com/FitnessPeopleBga" target="_blank"><i class="fab fa-facebook"></i></a></li>
                        <li><a href="https://www.instagram.com/fitnesspeople_colombia" target="_blank"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="https://wa.me/573107842151" target="_blank"><i class="fab fa-whatsapp"></i></a></li>
                        <%--<li><a href="#"><i class="icon-google"></i></a></li>
                        <li><a href="#"><i class="icon-linkedin"></i></a></li>--%>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <h4 style="color: #e3ff00; font-weight: 900;">Nosotros</h4>
                <ul>
                    <li><a href="sedes">Sedes</a></li>
                    <li><a href="default#planes">Planes</a></li>
                    <li><a href="somos">Quiénes somos</a></li>
                    <li><a href="terminoslegales">Términos legales</a></li>
                    <%--<li><a href="servicios">Servicios</a></li>--%>
                    <%--<li><a href="#">Blog</a></li>--%>
                </ul>
            </div>
            <div class="col-md-6 col-sm-6">
                <%--<h4 style="color: #e3ff00; font-weight: 900;">Descubre</h4>--%>
                <%--<ul>--%>
                    <%--<li><a href="#">Convenios</a></li>--%>
                    <%--<li><a href="contacto">Contacto</a></li>--%>
                    <%--<li><a href="terminoslegales">Términos legales</a></li>--%>
                    <%--<li><a href="https://docs.google.com/forms/d/e/1FAIpQLSd1ggDGONN_KsXL1gf7uWGHiPyyj7YRpt5deUqVjQmPNKmezg/viewform?pli=1" target="_blank">Trabaja con nosotros</a></li>--%>
                    <%--<li><a href="#">FAQs</a></li>--%>
                <%--</ul>--%>

                <h4 class="footer-contact-title">Líneas de atención</h4>

                <ul class="footer-contact-list">
                    <li>
                        <span class="footer-contact-name">Lucy</span>
                        <span class="footer-contact-description">
                            Línea de reconexión con exclientes
                        </span>
                        <a href="https://api.whatsapp.com/send/?phone=573502809286" target="_blank" class="footer-contact-phone">
                            <i class="fa-brands fa-whatsapp"></i>
                            +57 350 280 9286
                        </a>
                    </li>

                    <li>
                        <span class="footer-contact-name">Vicky</span>
                        <span class="footer-contact-description">
                            Línea de atención de pagos del débito automático
                        </span>
                        <a href="tel:+573024857227" target="_blank" class="footer-contact-phone">
                            <i class="fas fa-phone-alt"></i>
                            +57 302 485 7227
                        </a>
                    </li>
                </ul>
            </div>
            <%--<div class="col-md-3 hidden-sm hidden-xs">--%>
                <%--<img src="img/footer_img.png" width="257" height="302" alt="Image" class="footer_pic" />--%>
                <%--<img src="img/footer_img.png" width="155" height="271" alt="Image" class="footer_pic" />--%>
            <%--</div>--%>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->
</footer>
<!-- End footer -->
<div id="copy">
    <div class="container">
        Copyright © <asp:Literal ID="ltAnho" runat="server"></asp:Literal> Fitness People Centro Médico Deportivo S.A.S. – Todos los derechos reservados.
    </div>
</div>
<!-- End copy -->

<style>

    footer .footer-contact-title {
        color: var(--fp-lime);
        font-weight: 900;
        margin-bottom: 15px;
    }

    footer .footer-contact-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    footer .footer-contact-list li {
        margin-bottom: 18px;
    }

    footer .footer-contact-name {
        display: block;
        color: var(--fp-white);
        font-size: 15px;
        font-weight: 700;
        margin-bottom: 3px;
    }

    footer .footer-contact-description {
        display: block;
        color: var(--fp-gray-light-2);
        font-size: 13px;
        line-height: 1.5;
        margin-bottom: 5px;
    }

    footer .footer-contact-phone {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--fp-lime);
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
    }

    footer .footer-contact-phone:hover {
        color: var(--fp-white);
        text-decoration: none;
    }

    footer .footer-contact-phone i {
        font-size: 12px;
    }

    footer .footer-contact-phone .fa-whatsapp {
        font-size: 15px;
    }

</style>