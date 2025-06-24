<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainmenunew.ascx.cs" Inherits="WebPage.controls.mainmenunew" %>
<div class="row">
    <a href="https://wa.me/573146887259?text=Quiero%20empezar%20mi%20cambio%2C%20¿Cómo%20obtengo%20mi%20gym%20pass%3F" class="whatsapp" target="_blank"> <img src="../img/whatsapp-8.png" class="img-responsive" /></a>
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
                <li><a href="default_" class="show-submenu" style="font-weight: 900;">INICIO</a></li>
                <li><a href="sedespg" style="font-weight: 900;">SEDES</a></li>
                <li><a href="default_#planes" style="font-weight: 900;">PLANES</a></li>
                <li><a href="corporativo" style="font-weight: 900;">CORPORATIVO</a></li>
                <li><a href="servicios" style="font-weight: 900;">SERVICIOS</a></li>
                <li><a href="peoplewear.html" style="font-weight: 900;">PEOPLE WEAR</a></li>
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