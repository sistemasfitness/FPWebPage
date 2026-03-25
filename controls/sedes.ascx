<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sedes.ascx.cs" Inherits="WebPage.controls.sedes" %>

<section class="margin_60_35" id="sedes" style="padding-top: 0px;">
    <div class="container margin_60">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>Nuestras Sedes</h2>

        <div class="row">
            <asp:UpdatePanel ID="upAfiliados" runat="server">
                <ContentTemplate>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Ciudad:</label>
                            <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged" Style="background: #1A1A1A;"
                                DataTextField="NombreCiudadSede" DataValueField="idCiudadSede" AutoPostBack="true" />
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Sede:</label>
                            <asp:DropDownList ID="ddlSede" runat="server" CssClass="form-control" 
                                DataTextField="NombreSede" DataValueField="IdSede" Style="background: #1A1A1A;"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlSede_SelectedIndexChanged" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="row">
            <div class="owl-carousel team-carousel-sedes">
                <asp:Repeater ID="rpSedes" runat="server">
                    <ItemTemplate>
                        <div class="team-item">
                            <div class="team-item-img">
                                <img src="img/sedes/galeria/<%# Eval("ImagenPrincipal") %>" class="img-responsive" alt="" />
                                <div class="team-item-detail">
                                    <div class="team-item-detail-inner">
                                        <h4 style="font-weight: 900;"><%# Eval("NombreSede") %></h4>
                                        <p>
                                            <%# Eval("DireccionSede") %><br />
                                            <%# Eval("NombreCiudadSede") %><br />
                                            <%# Eval("TelefonoSede") %>
                                        </p>
                                        <a href="sedes?id=<%# Eval("idSede") %>" class="btn_1 add_bottom_15">VER SEDE</a>
                                    </div>
                                </div>
                            </div>
                            <div class="team-item-info">
                                <h4 style="font-weight: 900; color: #fff;"><%# Eval("NombreSede") %></h4>
                                <p style="color: #fff;"><%# Eval("NombreCiudadSede") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>

<script>
    Sys.Application.add_load(function () {
        $(".team-carousel-sedes").owlCarousel({
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
                320: { items: 1 },
                768: { items: 2 },
                1000: { items: 2 }
            }
        });
    });

    window.addEventListener("pageshow", function (event) {
        // Esto detecta cuando viene del historial (botón atrás)
        if (event.persisted || performance.getEntriesByType("navigation")[0].type === "back_forward") {

            var ddlSede = document.getElementById('<%= ddlSede.ClientID %>');
            var ddlCiudad = document.getElementById('<%= ddlCiudad.ClientID %>');

            if (ddlSede) ddlSede.selectedIndex = 0;
            if (ddlCiudad) ddlCiudad.selectedIndex = 0;
        }
    });
</script>