<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="convenio-comfenalco.aspx.cs" Inherits="WebPage.convenio_comfenalco" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager -->
    <%--<script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');
    </script>--%>
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-KVFTTJ9G');
    </script>
    <!-- End Google Tag Manager -->

    <!-- Microsoft Clarity -->
    <script type="text/javascript">
        (function (c, l, a, r, i, t, y) {
            c[a] = c[a] || function () { (c[a].q = c[a].q || []).push(arguments) };
            t = l.createElement(r); t.async = 1; t.src = "https://www.clarity.ms/tag/" + i;
            y = l.getElementsByTagName(r)[0]; y.parentNode.insertBefore(t, y);
        })(window, document, "clarity", "script", "tqldhc207r");
    </script>
    <!-- End Microsoft Clarity -->

    <!-- TikTok Pixel Code Start -->
    <script>
        !function (w, d, t) {
            w.TiktokAnalyticsObject = t; var ttq = w[t] = w[t] || []; ttq.methods = ["page", "track", "identify", "instances", "debug", "on", "off", "once", "ready", "alias", "group", "enableCookie", "disableCookie", "holdConsent", "revokeConsent", "grantConsent"], ttq.setAndDefer = function (t, e) { t[e] = function () { t.push([e].concat(Array.prototype.slice.call(arguments, 0))) } }; for (var i = 0; i < ttq.methods.length; i++)ttq.setAndDefer(ttq, ttq.methods[i]); ttq.instance = function (t) {
                for (
                    var e = ttq._i[t] || [], n = 0; n < ttq.methods.length; n++)ttq.setAndDefer(e, ttq.methods[n]); return e
            }, ttq.load = function (e, n) {
                var r = "https://analytics.tiktok.com/i18n/pixel/events.js", o = n && n.partner; ttq._i = ttq._i || {}, ttq._i[e] = [], ttq._i[e]._u = r, ttq._t = ttq._t || {}, ttq._t[e] = +new Date, ttq._o = ttq._o || {}, ttq._o[e] = n || {}; n = document.createElement("script")
                    ; n.type = "text/javascript", n.async = !0, n.src = r + "?sdkid=" + e + "&lib=" + t; e = document.getElementsByTagName("script")[0]; e.parentNode.insertBefore(n, e)
            };

            ttq.load('D7T28VJC77U471PH6MJ0');
            ttq.page();
            ttq.track('PageView');
        }(window, document, 'ttq');
    </script>
    <!-- TikTok Pixel Code End -->

    <meta property="og:site_name" content="Fitness People" />
    <meta property="og:title" content="Fitness People" />
    <meta property="og:description" content="Vive la experiencia, transforma tu cuerpo y tu vida." />
    <meta property="og:image" content="https://fitnesspeoplecolombia.com/img/sedes/boulevard__.jpg" />
    <meta property="og:image:width" content="600" />
    <meta property="og:image:height" content="355" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://fitnesspeoplecolombia.com" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Elige el plan que mejor se adapte a ti y entrena en Fitness People en nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta." />
    <meta name="author" content="Fitness People" />
    <title>Convenio Comfenalco | Fitness People</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon_.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png" />
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png" />

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700|Kalam:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />

    <!-- BASE CSS -->
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/menu.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="css/icon_fonts/css/all_icons.min.css" rel="stylesheet" />
    <link href="css/magnific-popup.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />

    <!-- SPECIFIC CSS -->
    <link href="layerslider/css/layerslider.css" rel="stylesheet" />
    <link href="css/pop_up.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <%--<noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>--%>
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KVFTTJ9G" height="0" width="0" style="display:none; visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <!-- Control Main Menu -->
    <uc1:mainmenu runat="server" ID="mainmenu" />
    <!-- Control Main Menu -->

    <section class="fpp-cv-hero" id="inicio">
        <div class="container">
            <div class="fpp-cv-hero-section">
                <div>
                    <h1 class="fpp-general-title">Tu caja <span>te pone a entrenar</span></h1>
                    <p class="fpp-hero-sub">
                        Si estás afiliado a <strong>Comfenalco Santander</strong>, entrenas en Fitness People por <strong>$79.000 al mes.</strong> Digita tu documento y te confirmamos al instante si aplicas al convenio, seas titular o beneficiario.
                    </p>
                    <div class="fpp-hero-ctas">
                        <a class="fpp-btn fpp-btn--solid" href="#consulta">
                            Consultar mi tarifa
                        </a>
                        <a class="fpp-btn fpp-btn--outline" href="#beneficios">
                            Ver qué incluye
                        </a>
                    </div>
                </div>

                <div class="fpp-lockup">
                    <img src="img/logos/logo_2026-04-27.svg" alt="Fitness People - Centro Médico Deportivo" data-retina="true" class="fpp-logo" />
                    <span class="x">×</span>
                    <span class="partner">
                        <img src="https://aficonsulta.comfenalcosantander.com.co/imagenes/logoblancorojoporti.png" alt="Comfenalco" class="fpp-logo-comf" />
                    </span>
                </div>
            </div>
        </div>
    </section>

    <section class="fpp-consulta" id="consulta">
        <div class="container">
            <div class="fpp-cs-card">
                <div class="fpp-kicker fpp-kicker--center">Consulta en línea</div>

                <h2 class="fpp-general-title">Mira <span>si aplicas</span></h2>

                <p class="lead">Selecciona si consultas como titular o como beneficiario, digita el documento y te confirmamos de inmediato si tienes la tarifa del convenio.</p>

                <!-- Formulario de consulta -->
                <form id="csForm" runat="server">
                    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel
                        ID="upConsultaConvenio"
                        runat="server"
                        UpdateMode="Conditional">
                        <ContentTemplate>

                            <div class="fpp-cs-form">
                                <!-- Titular / Beneficiario -->
                                <div class="fpp-radio-list" role="radiogroup" aria-label="Tipo de consulta">
                                    <label class="fpp-cs-radio on" data-radio="">
                                        <input type="radio" name="rol" value="titular" checked="checked" />
                                        <span class="dot" aria-hidden="true"></span>
                                        <span class="txt">Titular</span>
                                    </label>

                                    <label class="fpp-cs-radio" data-radio="">
                                        <input type="radio" name="rol" value="beneficiario" />
                                        <span class="dot" aria-hidden="true"></span>
                                        <span class="txt">Beneficiario</span>
                                    </label>
                                </div>

                                <asp:HiddenField
                                    ID="hfRol"
                                    runat="server"
                                    ClientIDMode="Static" />

                                <!-- Documento del titular (siempre visible) -->
                                <div class="fpp-cs-bloque">
                                    <p class="fpp-cs-bloque-t">Documento del titular</p>

                                    <div class="fpp-cs-duo">
                                        <div>
                                            <label for="<%= ddlTipoDoc.ClientID %>">Tipo</label>
                                            <asp:DropDownList
                                                ID="ddlTipoDoc"
                                                runat="server"
                                                ClientIDMode="Static"
                                                CssClass="fpp-cs-select"
                                                DataTextField="tipoDocumento"
                                                DataValueField="idTipoDoc">
                                            </asp:DropDownList>
                                        </div>

                                        <div>
                                            <label for="<%= txtNumDoc.ClientID %>">N.° de documento</label>
                                            <asp:TextBox
                                                ID="txtNumDoc"
                                                runat="server"
                                                ClientIDMode="Static"
                                                CssClass="fpp-cs-input"
                                                MaxLength="20"
                                                autocomplete="off"
                                                placeholder="Sin puntos ni comas">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Documento del beneficiario (solo si se elige "Beneficiario") -->
                                <div class="fpp-cs-bloque" id="bloqueBenef" hidden="hidden">
                                    <p class="fpp-cs-bloque-t">Documento del beneficiario</p>

                                    <div class="fpp-cs-duo">
                                        <div>
                                            <label for="<%= ddlTipoDocB.ClientID %>">Tipo</label>
                                            <asp:DropDownList
                                                ID="ddlTipoDocB"
                                                runat="server"
                                                ClientIDMode="Static"
                                                CssClass="fpp-cs-select"
                                                DataTextField="tipoDocumento"
                                                DataValueField="idTipoDoc">
                                            </asp:DropDownList>
                                        </div>
                                        <div>
                                            <label for="<%= txtNumDocB.ClientID %>">N.° de documento</label>
                                            <asp:TextBox
                                                ID="txtNumDocB"
                                                runat="server"
                                                ClientIDMode="Static"
                                                CssClass="fpp-cs-input"
                                                MaxLength="20"
                                                autocomplete="off"
                                                placeholder="Sin puntos ni comas">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Autorización -->
                                <div class="fpp-pqrs__privacy" id="csCheckWrap" runat="server" >
                                    <label class="fpp-checkbox">
                                        <asp:CheckBox ID="chkAutorizacion" runat="server" />

                                        <span class="fpp-checkbox__box"></span>

                                        <span class="fpp-checkbox__text">
                                            Acepto los <a href="terminoslegales">términos y condiciones</a> y la <a href="assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf">política de tratamiento de datos personales</a> de Fitness People.
                                        </span>
                                    </label>
                                </div>

                                <div>
                                    <asp:Button
                                        ID="btnConsultar"
                                        runat="server"
                                        Text="Consultar mi tarifa"
                                        CssClass="fpp-btn fpp-btn--solid fpp-btn-full"
                                        OnClick="btnConsultar_Click" />
                                </div>
                            </div>

                            <!-- Mensaje de error -->
                            <div
                                id="lblMensaje"
                                runat="server"
                                class="fpp-cs-msg"
                                role="alert"
                                aria-live="polite">
                            </div>

                            <!-- Cargando -->
                            <div class="fpp-cs-load" id="csLoad" runat="server"><i></i> Validando tu afiliación…</div>

                            <!-- Resultado: aplica -->
                            <div class="fpp-cs-res" id="csRes" runat="server">
                                <div class="fpp-cs-res-grid">
                                    <div class="fpp-cs-persona">
                                        <small>Resultado de la consulta</small>

                                        <b>Aplicas al convenio</b>

                                        <p class="doc"
                                            id="csDoc"
                                            runat="server">
                                        </p>

                                        <p class="doc"
                                            id="csDocB"
                                            runat="server"
                                            visible="false">
                                        </p>

                                        <span class="fpp-cs-cat">
                                            <i class="fa-solid fa-plus"></i> 
                                            <span>Tarifa del convenio habilitada</span>
                                        </span>
                                    </div>

                                    <div class="fpp-cs-precio">
                                        <div class="antes">Tarifa plena <s>$165.000</s></div>

                                        <div class="ahora">
                                            <span class="v">$79.000</span>
                                            <span class="p">/ mes</span>
                                        </div>

                                        <div class="ahorro">Ahorras $86.000 cada mes</div>

                                        <button type="button" class="fpp-btn fpp-btn--solid fpp-btn-full" id="btnComprar">Continuar mi inscripción</button>
                                    </div>
                                </div>

                                <button class="fpp-cs-reset" type="button" data-reset="data-reset">Consultar otro documento</button>
                            </div>

                            <!-- Resultado: no aplica -->
                            <div class="fpp-cs-no" id="csNo" runat="server">
                                <div class="ic"><i class="fa-solid fa-question"></i></div>

                                <h3>Este documento no aplica</h3>

                                <p>No pudimos habilitar la tarifa del convenio para el documento que digitaste. Puede ser porque la afiliación no está activa a la fecha o porque no cumple las condiciones vigentes del convenio. Un asesor puede revisarlo contigo y mostrarte las demás opciones.</p>

                                <div class="acciones">
                                    <a href="https://wa.me/573107842151" class="fpp-btn fpp-btn--solid">Hablar con un asesor</a>
                                    <a href="default#planes" class="fpp-btn fpp-btn--outline">Ver planes sin convenio</a>
                                </div>

                                <button class="fpp-cs-reset" type="button" data-reset="data-reset">Consultar otro documento</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </form>
            </div>

            <!-- ================= IFRAME DE INSCRIPCIÓN ================= -->
            <div id="contenedorIframePlan" class="fp-iframe-container">
                <div class="fp-iframe-header">
                    <div>
                        <p class="fpp-kicker">Inscripción</p>
                        <h3>Completa tu <span>registro</span></h3>
                    </div>

                    <button
                        type="button"
                        id="btnCerrarIframe"
                        class="fp-iframe-close">
                        &times;
                    </button>
                </div>

                <iframe
                    id="iframePlan"
                    src=""
                    title="Inscripción Fitness People"
                    loading="lazy">
                </iframe>
            </div>
        </div>
    </section>

    <section class="fpp-respaldo" id="beneficios">
        <div class="container">
            <div class="fpp-section-head fpp-section-head--split">
                <div>
                    <div class="fpp-kicker">Qué incluye</div>
                    <h2 class="fpp-general-title">Misma tarifa, <span>todo incluido</span></h2>
                </div>
                
                <p>El convenio cambia lo que pagas, no lo que recibes. Los afiliados de Comfenalco entran con la membresía completa de Fitness People.</p>
            </div>

            <div class="fpp-chips">
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Acceso a las 10 sedes</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Clases grupales ilimitadas</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Valoración médico-deportiva</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Valoraciones de seguimiento</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Deportólogo en sede</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Fisioterapia preventiva</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Acompañamiento nutricional</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Entrenadores en piso</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Zona cardiovascular</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Peso libre y mancuernas</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Zona funcional</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Spinning, Pilates y Xtreme</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> FP App</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Abierto los 7 días</span>
                <span class="fpp-chip"><i class="fa-solid fa-plus"></i> Sin cuota de inscripción</span>
            </div>
        </div>
    </section>

    <section class="fpp-sedes-conv">
        <div class="container">
            <div class="fpp-section-head fpp-section-head--split">
                <div>
                    <div class="fpp-kicker">Dónde entrenas</div>
                    <h2 class="fpp-general-title">Diez sedes <span>habilitadas</span></h2>
                </div>
                <p>El convenio aplica en todas nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. Entrena en la que quieras, sin costos por traslado.</p>
            </div>

            <div class="fpp-sedes-mini">
                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/boulevard1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Bucaramanga</small><b>Boulevard</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/cabecera1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Bucaramanga</small><b>Cabecera</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/prado1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Bucaramanga</small><b>El Prado</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/provenza1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Bucaramanga</small><b>Provenza</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/ciudadela1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Bucaramanga</small><b>Ciudadela</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/canaveral1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Floridablanca</small><b>Cañaveral</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/delacuesta1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Piedecuesta</small><b>DeLaCuesta</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/parquecentral1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Piedecuesta</small><b>Parque Central</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/jardin1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Cúcuta</small><b>Jardín Plaza</b>
                    </div>
                </div>

                <div class="fpp-sede-mini">
                    <figure>
                        <img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/ceiba1.jpg" alt=""/>
                    </figure>
                    <div class="t">
                        <small>Cúcuta</small><b>Ceiba II</b>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="fpp-faq" id="faq">
        <div class="container">
            <div class="fpp-faq-grid">
                <div class="fpp-section-head">
                    <div class="fpp-kicker">Preguntas frecuentes</div>
                    <h2 class="fpp-general-title">Sobre el <span>convenio</span></h2>
                    <p>Si tu duda no está aquí, un asesor te responde por WhatsApp antes de que te inscribas.</p>
                    <a href="https://wa.me/57..." class="fpp-btn fpp-btn--outline" style="margin-top:26px; max-width: 300px;">Hablar con un asesor</a>
                </div>

                <div class="fpp-fap-section">
                    <details open="open">
                        <summary>¿Cómo sé si aplico al convenio?</summary>
                        <p>No tienes que averiguar nada por tu cuenta. Digita tu documento en la consulta en línea y el sistema valida tu afiliación con Comfenalco Santander: en segundos te confirma si tienes habilitada la tarifa del convenio.</p>
                    </details>
                    <details>
                        <summary>¿Cuánto cuesta la membresía con el convenio?</summary>
                        <p>Hay una sola tarifa: $79.000 al mes, sin cuota de inscripción y sin permanencia, frente a los $165.000 de la tarifa plena. Es la misma para titulares y beneficiarios que apliquen.</p>
                    </details>
                    <details>
                        <summary>¿Mis beneficiarios también acceden a la tarifa?</summary>
                        <p>Sí, siempre que estén registrados como beneficiarios ante la caja y cumplan las condiciones del convenio. En la consulta selecciona <strong>Beneficiario</strong> e ingresa el documento del titular y el del beneficiario. Cada persona firma su propio contrato.</p>
                    </details>
                    <details>
                        <summary>Mi documento no aplicó. ¿Qué puedo hacer?</summary>
                        <p>Verifica que el número esté bien digitado y que tu afiliación a la caja esté activa. Si todo está correcto y aun así no aplica, escríbenos por WhatsApp: un asesor revisa tu caso y te muestra las demás opciones y promociones vigentes.</p>
                    </details>
                    <details>
                        <summary>¿Puedo entrenar en todas las sedes?</summary>
                        <p>Sí. La tarifa del convenio habilita el acceso a las 10 sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta, sin trámites ni costos adicionales por cambiar de sede.</p>
                    </details>
                    <details>
                        <summary>¿Qué pasa si dejo de estar afiliado a la caja?</summary>
                        <p>El beneficio está atado a tu afiliación activa. Si esta termina, tu membresía continúa pero pasa a la tarifa vigente sin convenio a partir del siguiente periodo de facturación, previo aviso.</p>
                    </details>
                    <details>
                        <summary>¿Puedo combinar el convenio con otra promoción?</summary>
                        <p>No. La tarifa del convenio no es acumulable con otras promociones, descuentos por referidos, planes corporativos ni campañas vigentes.</p>
                    </details>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= PANEL LATERAL DE CIUDAD / SEDE ================= -->
    <div id="panelSede" class="fp-panel-sede">
        <!-- Fondo oscuro -->
        <div
            id="panelSedeOverlay"
            class="fp-panel-overlay">
        </div>

        <!-- Panel -->
        <aside class="fp-panel-content">
            <!-- Cerrar -->
            <button
                type="button"
                id="btnCerrarSede"
                class="fp-panel-close"
                aria-label="Cerrar">
                &times;
            </button>

            <!-- Encabezado -->
            <div class="fp-panel-title">
                <p class="fpp-kicker">
                    Comprar tu plan
                </p>

                <h3>
                    Elige tu <span>sede</span>
                </h3>

                <p class="fp-panel-description">
                    Selecciona la ciudad y la sede donde deseas realizar tu inscripción.
                </p>
            </div>

            <!-- Ciudad -->
            <div class="fp-sede-section">
                <label for="ddlCiudad">
                    Ciudad
                </label>

                <select id="ddlCiudad">
                    <option value="">
                        Selecciona una ciudad
                    </option>

                    <option value="bucaramanga">
                        Bucaramanga
                    </option>

                    <option value="floridablanca">
                        Floridablanca
                    </option>

                    <option value="piedecuesta">
                        Piedecuesta
                    </option>

                    <option value="cucuta">
                        Cúcuta
                    </option>
                </select>
            </div>

            <!-- Sede -->
            <div class="fp-sede-section">
                <label for="ddlSede">
                    Sede
                </label>

                <select
                    id="ddlSede"
                    disabled="disabled">

                    <option value="">
                        Primero selecciona una ciudad
                    </option>
                </select>
            </div>
        </aside>
    </div>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->


    <!-- End Search Menu -->
    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="js/bootstrap-portfilter.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script src="layerslider/js/greensock.js"></script>
    <script src="layerslider/js/layerslider.transitions.js"></script>
    <script src="layerslider/js/layerslider.kreaturamedia.jquery.js"></script>



<script>
    (function () {
        /* ====== VARIABLES ====== */
        var panelSede = document.getElementById("panelSede");
        var panelOverlay = document.getElementById("panelSedeOverlay");

        var btnCerrarSede = document.getElementById("btnCerrarSede");

        var ddlCiudad = document.getElementById("ddlCiudad");
        var ddlSede = document.getElementById("ddlSede");

        var contenedorIframe = document.getElementById("contenedorIframePlan");
        var iframePlan = document.getElementById("iframePlan");

        var btnCerrarIframe = document.getElementById("btnCerrarIframe");

        /* ====== SEDES POR CIUDAD ====== */
        var sedesPorCiudad = {
            bucaramanga: [
                {
                    nombre: "Boulevard",
                    valor: "bucaramanga-boulevard"
                },
                {
                    nombre: "Cabecera",
                    valor: "bucaramanga-cabecera"
                },
                {
                    nombre: "El Prado",
                    valor: "bucaramanga-el-prado"
                },
                {
                    nombre: "Provenza",
                    valor: "bucaramanga-provenza"
                },
                {
                    nombre: "Ciudadela",
                    valor: "bucaramanga-ciudadela"
                }
            ],
            floridablanca: [
                {
                    nombre: "Cañaveral",
                    valor: "floridablanca-canaveral"
                }
            ],
            piedecuesta: [
                {
                    nombre: "DeLaCuesta",
                    valor: "piedecuesta-delacuesta"
                },
                {
                    nombre: "Parque Central",
                    valor: "piedecuesta-parque-central"
                }
            ],
            cucuta: [
                {
                    nombre: "Jardín Plaza",
                    valor: "cucuta-jardin-plaza"
                },
                {
                    nombre: "Ceiba II",
                    valor: "cucuta-ceiba-ii"
                }
            ]
        };

        /* ====== URLS POR SEDE - CONVENIO ====== */
        var urlsSedes = {
            "bucaramanga-boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-2821",
            "bucaramanga-cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-2725",
            "bucaramanga-el-prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-3381",
            "bucaramanga-provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-3461",
            "bucaramanga-ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-3061",
            "floridablanca-canaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-2901",
            "piedecuesta-delacuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-3141",
            "piedecuesta-parque-central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-3301",
            "cucuta-jardin-plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-3221",
            "cucuta-ceiba-ii": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-2981"
        };

        /* ====== ABRIR PANEL DE SEDE ====== */
        function abrirPanelSede() {
            if (!panelSede) {
                return;
            }

            panelSede.classList.add("active");
            document.body.style.overflow = "hidden";

            // Reiniciar selección de ciudad
            if (ddlCiudad) {
                ddlCiudad.value = "";
            }

            // Reiniciar selección de sede
            if (ddlSede) {
                ddlSede.innerHTML = "";

                var option = document.createElement("option");

                option.value = "";
                option.textContent = "Primero selecciona una ciudad";

                ddlSede.appendChild(option);

                ddlSede.disabled = true;
            }
        }

        /* ====== CERRAR PANEL DE SEDE ====== */
        function cerrarPanelSede() {
            if (!panelSede) {
                return;
            }

            panelSede.classList.remove("active");

            document.body.style.overflow = "";
        }

        /* ====== CAMBIO DE CIUDAD ====== */
        function configurarCiudad() {
            if (!ddlCiudad || !ddlSede) {
                return;
            }

            // Evitar registrar el evento más de una vez
            if (ddlCiudad.dataset.configurado === "true") {
                return;
            }

            ddlCiudad.dataset.configurado = "true";

            ddlCiudad.addEventListener("change", function () {
                var ciudad = this.value;

                // Limpiar sedes
                ddlSede.innerHTML = "";

                // ====== NO HAY CIUDAD SELECCIONADA ====== 
                if (!ciudad || !sedesPorCiudad[ciudad]) {
                    ddlSede.disabled = true;

                    var optionInicial = document.createElement("option");

                    optionInicial.value = "";
                    optionInicial.textContent =
                        "Primero selecciona una ciudad";

                    ddlSede.appendChild(optionInicial);

                    return;
                }

                // ====== OPCIÓN INICIAL ======
                var optionSeleccion = document.createElement("option");

                optionSeleccion.value = "";
                optionSeleccion.textContent = "Selecciona una sede";

                ddlSede.appendChild(optionSeleccion);

                // ====== CARGAR SEDES ======
                sedesPorCiudad[ciudad].forEach(function (sede) {
                    var option = document.createElement("option");

                    option.value = sede.valor;
                    option.textContent = sede.nombre;

                    ddlSede.appendChild(option);
                });

                ddlSede.disabled = false;
            });
        }

        /* ====== CAMBIO DE SEDE ====== */
        function configurarSede() {
            if (!ddlSede) {
                return;
            }

            // Evitar registrar el evento más de una vez
            if (ddlSede.dataset.configurado === "true") {
                return;
            }

            ddlSede.dataset.configurado = "true";

            ddlSede.addEventListener("change", function () {
                var sede = this.value;

                if (!sede) {
                    return;
                }

                // ====== BUSCAR URL DE LA SEDE ======
                var url = urlsSedes[sede];

                if (!url) return;

                // ====== CERRAR PANEL ====== 
                cerrarPanelSede();

                // ====== MOSTRAR IFRAME ====== 
                mostrarIframe(url);
            });
        }

        /* ====== MOSTRAR IFRAME ====== */
        function mostrarIframe(url) {
            if (!iframePlan || !contenedorIframe) {
                return;
            }

            iframePlan.src = url;

            contenedorIframe.classList.add("active");

            // Scroll hasta el iframe
            setTimeout(function () {
                contenedorIframe.scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });

            }, 350);
        }

        /* ====== CERRAR IFRAME ====== */
        function cerrarIframe() {
            if (!contenedorIframe) {
                return;
            }

            iframePlan.src = "";

            contenedorIframe.classList.remove("active");

            // Limpiar selección de ciudad
            if (ddlCiudad) {
                ddlCiudad.value = "";
            }

            // Limpiar selección de sede
            if (ddlSede) {
                ddlSede.innerHTML = "";

                var option = document.createElement("option");

                option.value = "";
                option.textContent = "Primero selecciona una ciudad";

                ddlSede.appendChild(option);

                ddlSede.disabled = true;
            }
        }

        /* =========================================================
           BOTÓN CONTINUAR MI INSCRIPCIÓN
           Está dentro del UpdatePanel
           ========================================================= */
        function configurarBotonComprar() {
            var btnComprar = document.getElementById("btnComprar");

            if (!btnComprar) {
                return;
            }

            // Evitar registrar el evento varias veces
            if (btnComprar.dataset.configurado === "true") {
                return;
            }

            btnComprar.dataset.configurado = "true";

            btnComprar.addEventListener("click", function (e) {
                e.preventDefault();

                abrirPanelSede();
            });
        }

        /* ====== BOTONES DE CIERRE ====== */
        function configurarBotonesCierre() {
            if (btnCerrarSede &&
                btnCerrarSede.dataset.configurado !== "true") {

                btnCerrarSede.dataset.configurado = "true";

                btnCerrarSede.addEventListener(
                    "click",
                    cerrarPanelSede
                );
            }

            if (panelOverlay &&
                panelOverlay.dataset.configurado !== "true") {

                panelOverlay.dataset.configurado = "true";

                panelOverlay.addEventListener(
                    "click",
                    cerrarPanelSede
                );
            }

            if (btnCerrarIframe &&
                btnCerrarIframe.dataset.configurado !== "true") {

                btnCerrarIframe.dataset.configurado = "true";

                btnCerrarIframe.addEventListener(
                    "click",
                    cerrarIframe
                );
            }
        }

        /* ====== INICIALIZAR ====== */
        function inicializar() {
            // Elementos que pueden existir nuevamente
            // después de un UpdatePanel
            panelSede = document.getElementById("panelSede");
            panelOverlay = document.getElementById("panelSedeOverlay");

            btnCerrarSede = document.getElementById("btnCerrarSede");

            ddlCiudad = document.getElementById("ddlCiudad");

            ddlSede = document.getElementById("ddlSede");

            contenedorIframe = document.getElementById("contenedorIframePlan");

            iframePlan = document.getElementById("iframePlan");

            btnCerrarIframe = document.getElementById("btnCerrarIframe");

            configurarBotonComprar();

            configurarCiudad();

            configurarSede();

            configurarBotonesCierre();
        }

        /*  ====== PRIMERA CARGA ====== */
        inicializar();

        /* ====== UPDATEPANEL ====== */
        if (typeof Sys !== "undefined" &&
            Sys.WebForms &&
            Sys.WebForms.PageRequestManager) {

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function () {
                inicializar();
            });
        }
    })();
</script>


    <script>

        (function () {
            // ======== ELEMENTOS ========
            var form = document.getElementById('csForm');

            if (!form) {
                return;
            }

            var tipo = document.getElementById('ddlTipoDoc');
            var num = document.getElementById('txtNumDoc');

            var tipoB = document.getElementById('ddlTipoDocB');
            var numB = document.getElementById('txtNumDocB');

            var bloqueB = document.getElementById('bloqueBenef');

            var btnConsultar = document.getElementById('<%= btnConsultar.ClientID %>');

            var mensaje = document.getElementById('lblMensaje');

            var checkWrap = document.getElementById('<%= csCheckWrap.ClientID %>');
            var autorizacion = document.getElementById('<%= chkAutorizacion.ClientID %>');

            // ======== TITULAR / BENEFICIARIO ========
            function esBeneficiario() {
                var radio = form.querySelector(
                    'input[name="rol"]:checked'
                );

                return radio && radio.value === 'beneficiario';
            }

            function configurarRoles() {
                var radios = form.querySelectorAll(
                    'input[name="rol"]'
                );

                radios.forEach(function (radio) {
                    radio.addEventListener(
                        'change',
                        function () {
                            // Guardar el rol seleccionado
                            var hfRol = document.getElementById('hfRol');

                            if (hfRol) {
                                hfRol.value = radio.value;
                            }

                            form.querySelectorAll(
                                '[data-radio]'
                            ).forEach(function (label) {
                                var input = label.querySelector('input');

                                if (input) {
                                    label.classList.toggle(
                                        'on',
                                        input.checked
                                    );
                                }
                            });

                            var beneficiario = esBeneficiario();

                            if (bloqueB) {
                                bloqueB.hidden = !beneficiario;
                            }

                            if (!beneficiario) {

                                if (tipoB) {
                                    tipoB.value = '';
                                    tipoB.classList.remove('err');
                                }

                                if (numB) {
                                    numB.value = '';
                                    numB.classList.remove('err');
                                }
                            }
                        }
                    );
                });
            }

            function restaurarRol() {
                var hfRol = document.getElementById('hfRol');

                if (!hfRol || !hfRol.value) {
                    return;
                }

                var radio = form.querySelector(
                    'input[name="rol"][value="' + hfRol.value + '"]'
                );

                if (!radio) {
                    return;
                }

                radio.checked = true;

                form.querySelectorAll(
                    '[data-radio]'
                ).forEach(function (label) {
                    var input = label.querySelector('input');

                    if (input) {
                        label.classList.toggle(
                            'on',
                            input.checked
                        );
                    }
                });

                var beneficiario = hfRol.value === 'beneficiario';

                if (bloqueB) {
                    bloqueB.hidden = !beneficiario;
                }
            }


            // ======== FORMATEAR DOCUMENTOS ========
            function miles(valor) {
                return valor.replace(
                    /\B(?=(\d{3})+(?!\d))/g,
                    '.'
                );
            }

            function formatear(campoTipo, campoNumero) {
                // Evita errores si algún elemento no existe
                if (!campoNumero) {
                    return;
                }

                campoNumero.addEventListener(
                    'input',
                    function () {
                        campoNumero.classList.remove('err');

                        if (campoTipo && campoTipo.value === 'PA') {
                            return;
                        }

                        var limpio =
                            campoNumero.value
                                .replace(/\D/g, '')
                                .slice(0, 12);

                        campoNumero.value =
                            limpio ? miles(limpio) : '';
                    }
                );

                if (campoTipo) {
                    campoTipo.addEventListener(
                        'change',
                        function () {
                            campoTipo.classList.remove('err');
                        }
                    );
                }
            }

            // ======== AUTORIZACIÓN ========
            function configurarAutorizacion() {
                if (!autorizacion) {
                    return;
                }

                autorizacion.addEventListener(
                    'change',
                    function () {
                        if (autorizacion.checked && checkWrap) {
                            checkWrap.classList.remove('err');
                        }
                    }
                );
            }

            // ======== MENSAJES ========
            function mostrarError(texto) {
                mensaje = document.getElementById('lblMensaje');

                if (!mensaje) {
                    return;
                }

                mensaje.textContent = texto;
                mensaje.classList.add('on');
            }

            function limpiarMensaje() {
                mensaje = document.getElementById('lblMensaje');

                if (!mensaje) {
                    return;
                }

                mensaje.textContent = '';
                mensaje.classList.remove('on');
            }

            function limpiarErrores() {
                if (tipo) {
                    tipo.classList.remove('err');
                }

                if (num) {
                    num.classList.remove('err');
                }

                if (tipoB) {
                    tipoB.classList.remove('err');
                }

                if (numB) {
                    numB.classList.remove('err');
                }

                if (checkWrap) {
                    checkWrap.classList.remove('err');
                }

                limpiarMensaje();
            }

            // ======== VALIDAR FORMULARIO ANTES DEL POSTBACK ========
            function validarFormulario() {
                limpiarErrores();

                var beneficiario = esBeneficiario();

                // ----- AUTORIZACIÓN -----
                if (!autorizacion || !autorizacion.checked) {
                    if (checkWrap) {
                        checkWrap.classList.add('err');
                    }

                    mostrarError(
                        'Debes aceptar los términos y la política de tratamiento de datos.'
                    );

                    return false;
                }

                // ----- TIPO DOCUMENTO TITULAR -----
                if (!tipo || !tipo.value) {
                    if (tipo) {
                        tipo.classList.add('err');
                    }

                    mostrarError(
                        'Selecciona el tipo de documento del titular.'
                    );

                    return false;
                }

                // ----- DOCUMENTO TITULAR -----
                if (!num || !num.value.trim()) {
                    if (num) {
                        num.classList.add('err');
                    }

                    mostrarError(
                        'Ingresa el número de documento del titular.'
                    );

                    return false;
                }

                // ----- TIPO DOCUMENTO BENEFICIARIO -----
                if (beneficiario) {
                    if (!tipoB || !tipoB.value) {
                        if (tipoB) {
                            tipoB.classList.add('err');
                        }

                        mostrarError(
                            'Selecciona el tipo de documento del beneficiario.'
                        );

                        return false;
                    }

                    // ----- DOCUMENTO BENEFICIARIO -----
                    if (!numB || !numB.value.trim()) {
                        if (numB) {
                            numB.classList.add('err');
                        }

                        mostrarError(
                            'Ingresa el número de documento del beneficiario.'
                        );

                        return false;
                    }
                }

                return true;
            }

            // ======== CONFIGURAR BOTÓN ========
            function configurarBoton() {
                if (!btnConsultar) {
                    return;
                }

                btnConsultar.addEventListener(
                    'click',
                    function (e) {
                        if (!validarFormulario()) {

                            e.preventDefault();

                            return false;
                        }

                        return true;
                    }
                );
            }

            // ======== INICIALIZAR ========
            function inicializar() {
                // Volver a obtener elementos porque UpdatePanel
                // puede haber reemplazado el contenido.

                tipo = document.getElementById('ddlTipoDoc');
                num = document.getElementById('txtNumDoc');

                tipoB = document.getElementById('ddlTipoDocB');
                numB = document.getElementById('txtNumDocB');

                bloqueB = document.getElementById('bloqueBenef');

                btnConsultar = document.getElementById('<%= btnConsultar.ClientID %>');

                mensaje = document.getElementById('lblMensaje');

                checkWrap = document.getElementById('<%= csCheckWrap.ClientID %>');

                autorizacion = document.getElementById('<%= chkAutorizacion.ClientID %>');

                configurarRoles();

                formatear(tipo, num);

                formatear(tipoB, numB);

                configurarAutorizacion();

                configurarBoton();

                restaurarRol();
            }

            // Primera carga
            inicializar();


            // ======== UPDATEPANEL ========
            if (typeof Sys !== 'undefined' &&
                Sys.WebForms &&
                Sys.WebForms.PageRequestManager) {

                var prm =
                    Sys.WebForms.PageRequestManager.getInstance();

                prm.add_endRequest(function () {
                    inicializar();
                });
            }

            // ======== RESET ========
            document.addEventListener(
                'click',
                function (e) {
                    var boton = e.target.closest('[data-reset]');

                    if (!boton) {
                        return;
                    }

                    window.location.reload();
                }
            );
        })();

    </script>



    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
