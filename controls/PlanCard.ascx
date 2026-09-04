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

    <!-- Pack de bienvenida -->
    <div id="divPackBienvenida" runat="server" class="fpp-welcome-pack">
        <div class="fpp-welcome-title">
            <span class="fpp-welcome-icon"><i class="fa-solid fa-gift"></i></span>
            <span>Pack de bienvenida</span>
        </div>

        <div class="fpp-welcome-content">
            <strong>1 toalla edición Fitness People</strong>
            <strong>+ 1 semana de cortesía para una persona</strong>
        </div>
    </div>

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
    <button
        type="button"
        id="btnComprar"
        runat="server"
        class="fpp-btn fpp-btn--outline btn-comprar-plan">
        ¡Comprar Ya!
    </button>
</article>
