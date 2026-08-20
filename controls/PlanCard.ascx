<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanCard.ascx.cs" Inherits="WebPage.controls.PlanCard" %>

<article id="cardPlan" runat="server" class="fpp-card">

    <!-- Badge del plan destacado -->
    <div id="divBadge" runat="server" class="fpp-badge">
        Más popular
    </div>

    <!-- Tipo de plan -->
    <div class="fpp-plan-label">Plan</div>

    <!-- Nombre -->
    <h3>
        <asp:Literal ID="litNombre" runat="server"></asp:Literal>
    </h3>

    <!-- Modalidad -->
    <div class="fpp-mode">
        <asp:Literal ID="litModalidad" runat="server"></asp:Literal>
    </div>

    <!-- Descripción -->
    <div class="fpp-tagline">
        <asp:Literal ID="litTagline" runat="server"></asp:Literal>
    </div>

    <!-- Precio anterior / inscripción / promoción -->
    <div id="divPrecioAntes" runat="server" class="fpp-price-before">
        <asp:Literal ID="litPrecioAntes" runat="server"></asp:Literal>
    </div>

    <!-- Precio actual -->
    <div class="fpp-price-now">

        <span id="spanLabelPrecio" runat="server" class="fpp-label">
            <asp:Literal ID="litLabelPrecio" runat="server"></asp:Literal>
        </span>

        <span class="fpp-amount">
            <asp:Literal ID="litPrecio" runat="server"></asp:Literal>
        </span>

        <span id="spanPeriodo" runat="server" class="fpp-period">
            <asp:Literal ID="litPeriodo" runat="server"></asp:Literal>
        </span>

    </div>

    <!-- Permanencia / condiciones -->
    <div class="fpp-permanencia">
        <asp:Literal ID="litPermanencia" runat="server"></asp:Literal>
    </div>

    <!-- Nota método de pago -->
    <span id="spanNota" runat="server" class="fpp-nota">
        <asp:Literal ID="litNota" runat="server"></asp:Literal>
    </span>

    <hr class="fpp-divider">

    <!-- Beneficios -->
    <ul class="fpp-benefits">
        <asp:Repeater ID="rptBeneficios" runat="server">
            <ItemTemplate>
                <li>
                    <%# Container.DataItem %>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

    <!-- Botón -->
    <asp:HyperLink
        ID="lnkInscripcion"
        runat="server"
        CssClass="fpp-btn fpp-btn--outline">
        ¡Comprar Ya!
    </asp:HyperLink>

</article>
