<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="faq.ascx.cs" Inherits="WebPage.controls.faq1" %>

<section class="fpp-faq" id="faq">
    <div class="container">
        <div class="fpp-faq-grid">
            <div class="fpp-section-head">
                <div class="fpp-kicker">Preguntas frecuentes</div>
                <h2 class="fpp-general-title"><%: Title %> <span><%: Highlight %></span></h2>
                <p><%: Description %></p>
                <a href="<%: WhatsAppUrl %>" class="fpp-btn fpp-btn--outline" style="margin-top:26px; max-width: 300px;"><%: WhatsAppText %></a>
            </div>

            <div class="fpp-fap-section">
                <asp:Repeater ID="rptPreguntas" runat="server">
                    <ItemTemplate>
                        <details <%# (bool)Eval("Open") ? "open" : "" %>>
                            <summary>
                                <%#: Eval("Question") %>
                            </summary>
                            <div class="fpp-faq-answer">
                                <asp:Literal
                                    ID="litAnswer"
                                    runat="server"
                                    Mode="PassThrough"
                                    Text='<%# Eval("Answer") %>' />
                            </div>
                        </details>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</section>


<style>

    /*.fpp-faq-answer {
    font-size: 15px;
    line-height: 1.6;
    color: inherit;
}

.fpp-faq-answer strong {
    font-weight: 700;
}

.fpp-faq-answer a {
    color: inherit;
    font-weight: 700;
    text-decoration: underline;
}*/

/**/

/* Contenedor general */
/*.section-prin-logos-met-pagos {
    margin-top: 15px;
}*/

/* Título tarjetas */
/*.section-prin-logos-met-pagos > p {
    font-weight: 700;
    margin-bottom: 15px;
}*/

/* Distribución crédito y débito */
/*.section-prin-logos {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
}*/

/* Cada grupo */
/*.section-logos-met-pagos {
    flex: 1;
    min-width: 180px;
}*/

/* Subtítulos */
/*.section-logos-met-pagos > p {
    font-weight: 700;
    margin-bottom: 10px;
}*/

/* Contenedor de imágenes */
/*.logos-met-pagos {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;
}*/

/* Imágenes */
/*.logos-met-pagos img {
    width: 55px;
    height: 35px;
    object-fit: contain;
}*/

/* Ajustes móviles */
/*@media (max-width: 767px) {
    .section-prin-logos {
        flex-direction: column;
        gap: 20px;
    }
}*/

</style>