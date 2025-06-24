<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainmenulanding.ascx.cs" Inherits="WebPage.controls.mainmenulanding" %>
<div class="row">
    <div class="col-xs-3">
        <a href="default" id="logo">
            <img src="img/fp-logo-lime-f-min.svg" width="95" height="27" alt="" data-retina="true" class="logo_normal">
            <img src="img/fp-logo-lime-f-min.svg" width="95" height="27" alt="" data-retina="true" class="logo_sticky">
        </a>
    </div>
    <nav class="col-xs-9">
        <ul id="access_top">
            <%--<li><a href="#" class="search-overlay-menu-btn"><i class="icon-search-6"></i></a></li>--%>
            <asp:Literal ID="ltMenu1" runat="server"></asp:Literal>
            <%--<li><a href="#" data-toggle="modal" data-target="#register" class="hidden-xs">Registro</a></li>--%>
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
                    <%--<ul>
                        <li><a href="index.html">Parallax Mp4 Video</a></li>
                        <li><a href="index-2.html">Parallax Youtube</a></li>
                        <li><a href="index-3.html">Parallax Vimeo</a></li>
                        <li><a href="index-4.html">Parallax Image</a></li>
                        <li><a href="index-5.html">Video Fallback Mobile</a></li>
                        <li><a href="index-6.html">Home GDPR Cookie Bar</a></li>
                        <li><a href="index-7.html">Home Layer Slider</a></li>
                        <li><a href="index-8.html">Home PopUp</a></li>
                    </ul>--%>
                </li>
                <%--<li class="submenu">
                    <a href="#0" class="show-submenu">Páginas<i class="icon-down-open-mini"></i></a>
                    <ul>
                        <li><a href="explore-1.html">Workout list page</a></li>
                        <li><a href="fitness-course-1.html">Workout page</a></li>
                        <li><a href="fitness-course-2.html">Workout page 2</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="subscribe-working.html">Subscribe working</a></li>
                        <li><a href="#0">Cart section</a>
                            <ul>
                                <li><a href="cart-page-1.html">Cart section 1</a></li>
                                <li><a href="cart-page-2.html">Cart section 2</a></li>
                                <li><a href="cart-page-3.html">Cart section 3</a></li>
                            </ul>
                        </li>
                        <li><a href="faq.html">Preguntas frecuentes</a></li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="gallery.html">Galería</a></li>
                        <li><a href="trainer-profile.html">Perfil entrenador</a></li>
                        <li><a href="contacts.html">Contáctenos</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#0" class="show-submenu">Otros elementos<i class="icon-down-open-mini"></i></a>
                    <ul>
                        <li><a href="shortcodes.html">Shortcodes</a></li>
                        <li><a href="pricing-tables.html">Pricing tables</a></li>
                        <li><a href="coming_soon/index.html">Site launch</a></li>
                        <li><a href="icon_pack_1.html">Icon pack 1</a></li>
                        <li><a href="icon_pack_2.html">Icon pack 2</a></li>
                    </ul>
                </li>--%>
                <li><a href="default#sedes" style="font-weight: 900;">SEDES</a></li>
                <li><a href="default#planes" style="font-weight: 900;">PLANES</a></li>
                <li><a href="corporativo" style="font-weight: 900;">CORPORATIVO</a></li>
                <li><a href="servicios" style="font-weight: 900;">SERVICIOS</a></li>
                <%--<li><a href="blog" style="font-weight: 900;">BLOG</a></li>--%>
                <li><a href="contacto" style="font-weight: 900;">CONTACTO</a></li>
                <asp:Literal ID="ltMenuAfil" runat="server"></asp:Literal>
                <asp:Literal ID="ltMenu2" runat="server"></asp:Literal>
                <%--<li><a href="#" style="font-weight: 900;" data-toggle="modal" data-target="#register" class="visible-xs">REGISTRO</a></li>--%>
            </ul>
        </div>
        <!-- End main-menu -->
    </nav>
</div>
<!-- End row -->