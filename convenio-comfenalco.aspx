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
                        <a class="fpp-btn fpp-btn--solid" href="...">
                            Consultar mi tarifa
                        </a>
                        <a class="fpp-btn fpp-btn--outline" href="...">
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
            <div class="fpp-cs-card reveal">
                <div class="fpp-kicker fpp-kicker--center">Consulta en línea</div>

                <h2 class="fpp-general-title">Mira <span>si aplicas</span></h2>

                <p class="lead">Selecciona si consultas como titular o como beneficiario, digita el documento y te confirmamos de inmediato si tienes la tarifa del convenio.</p>

                <!-- Formulario de consulta -->
                <form class="fpp-cs-form" id="csForm" novalidate="novalidate" runat="server">
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

                    <!-- Documento del titular (siempre visible) -->
                    <div class="fpp-cs-bloque">
                        <p class="fpp-cs-bloque-t">Documento del titular</p>

                        <div class="fpp-cs-duo">
                            <div>
                                <label for="tipoDoc">Tipo</label>
                                <select id="tipoDoc" required="required">
                                    <option value="">Tipo</option>
                                    <option value="CC">Cédula de ciudadanía</option>
                                    <option value="CE">Cédula de extranjería</option>
                                    <option value="TI">Tarjeta de identidad</option>
                                    <option value="PA">Pasaporte</option>
                                    <option value="PPT">Permiso por Protección Temporal</option>
                                </select>
                            </div>

                            <div>
                                <label for="numDoc">N.° de documento</label>
                                <input id="numDoc" type="text" inputmode="numeric" autocomplete="off" placeholder="Sin puntos ni comas" required="required" />
                            </div>
                        </div>
                    </div>

                    <!-- Documento del beneficiario (solo si se elige "Beneficiario") -->
                    <div class="fpp-cs-bloque" id="bloqueBenef" hidden="hidden">
                        <p class="fpp-cs-bloque-t">Documento del beneficiario</p>

                        <div class="fpp-cs-duo">
                            <div>
                                <label for="tipoDocB">Tipo</label>
                                <select id="tipoDocB">
                                    <option value="">Tipo</option>
                                    <option value="CC">Cédula de ciudadanía</option>
                                    <option value="CE">Cédula de extranjería</option>
                                    <option value="TI">Tarjeta de identidad</option>
                                    <option value="RC">Registro civil</option>
                                    <option value="PA">Pasaporte</option>
                                    <option value="PPT">Permiso por Protección Temporal</option>
                                </select>
                            </div>
                            <div>
                                <label for="numDocB">N.° de documento</label>
                                <input id="numDocB" type="text" inputmode="numeric" autocomplete="off" placeholder="Sin puntos ni comas"/>
                            </div>
                        </div>
                    </div>

                    <!-- Autorización -->
                    <div class="fpp-pqrs__privacy">
                        <label class="fpp-checkbox">
                            <asp:CheckBox ID="chkAutorizacion" runat="server" />

                            <span class="fpp-checkbox__box"></span>

                            <span class="fpp-checkbox__text">
                                Acepto los <a href="terminoslegales">términos y condiciones</a> y la <a href="assets/docs/2.-PT-GH-02-POLITICA-DE-TRATAMIENTO-Y-PROTECCION-DE-DATOS-PERSONALES.pdf">política de tratamiento de datos personales</a> de Fitness People.
                            </span>
                        </label>
                    </div>

                    <div>
                        <button class="fpp-btn fpp-btn--solid fpp-btn-full" type="submit">Consultar mi tarifa</button>
                    </div>
                </form>

                <p class="fpp-cs-msg" id="csMsg">Revisa los datos: selecciona el tipo de documento y digita un número válido.</p>

                <!-- Cargando -->
                <div class="fpp-cs-load" id="csLoad"><i></i> Validando tu afiliación…</div>

                <!-- Resultado: aplica -->
                <div class="fpp-cs-res" id="csRes">
                    <div class="fpp-cs-res-grid">
                        <div class="fpp-cs-persona">
                            <small>Resultado de la consulta</small>
                            <b>Aplicas al convenio</b>
                            <p class="doc" id="csDoc">Titular · CC 1.098.765.432</p>
                            <p class="doc" id="csDocB" hidden="hidden">Beneficiario · TI 1.030.445.881</p>
                            <span class="fpp-cs-cat"><i>✓</i> <span>Tarifa del convenio habilitada</span></span>
                        </div>

                        <div class="fpp-cs-precio">
                            <div class="antes">Tarifa plena <s>$165.000</s></div>
                            <div class="ahora"><span class="v">$79.000</span><span class="p">/ mes</span></div>
                            <div class="ahorro">Ahorras $86.000 cada mes</div>
                            <a href="#pasos" class="fpp-btn fpp-btn--solid">Continuar mi inscripción <span class="arrow"></span></a>
                        </div>
                    </div>

                    <button class="fpp-cs-reset" type="button" data-reset="">Consultar otro documento</button>
                </div>

                <!-- Resultado: no aplica -->
                <div class="fpp-cs-no" id="csNo">
                    <div class="ic">?</div>
                        <h3>Este documento no aplica</h3>
                        <p>No pudimos habilitar la tarifa del convenio para el documento que digitaste. Puede ser porque la afiliación no está activa a la fecha o porque no cumple las condiciones vigentes del convenio. Un asesor puede revisarlo contigo y mostrarte las demás opciones.</p>
                        <div class="acciones">
                        <a href="https://wa.me/573107842151" class="fpp-btn fpp-btn--solid">Hablar con un asesor</a>
                        <a href="index.html#planes" class="fpp-btn fpp-btn--outline">Ver planes sin convenio</a>
                    </div>

                    <button class="fpp-cs-reset" type="button" data-reset="">Consultar otro documento</button>
                </div>
            </div>
        </div>
    </section>

    <section class="fpp-respaldo" id="beneficios">
        <div class="container">
            <div class="section-head section-head--split reveal fpp-">
                <div>
                    <div class="kicker">Qué incluye</div>
                    <h2 class="fpp-general-title">Misma tarifa, <span>todo incluido</span></h2>
                </div>
                
                <p>El convenio cambia lo que pagas, no lo que recibes. Los afiliados de Comfenalco entran con la membresía completa de Fitness People.</p>
            </div>

            <div class="chips reveal">
                <span class="chip"><i>✚</i> Acceso a las 10 sedes</span>
                <span class="chip"><i>✚</i> Clases grupales ilimitadas</span>
                <span class="chip"><i>✚</i> Valoración médico-deportiva</span>
                <span class="chip"><i>✚</i> Valoraciones de seguimiento</span>
                <span class="chip"><i>✚</i> Deportólogo en sede</span>
                <span class="chip"><i>✚</i> Fisioterapia preventiva</span>
                <span class="chip"><i>✚</i> Acompañamiento nutricional</span>
                <span class="chip"><i>✚</i> Entrenadores en piso</span>
                <span class="chip"><i>✚</i> Zona cardiovascular</span>
                <span class="chip"><i>✚</i> Peso libre y mancuernas</span>
                <span class="chip"><i>✚</i> Zona funcional</span>
                <span class="chip"><i>✚</i> Spinning, Pilates y Xtreme</span>
                <span class="chip"><i>✚</i> FP App</span>
                <span class="chip"><i>✚</i> Abierto los 7 días</span>
                <span class="chip"><i>✚</i> Sin cuota de inscripción</span>
            </div>
        </div>
    </section>



    <!-- ================= 08. SEDES ================= -->
    <section class="sedes-conv">
        <div class="container">
            <div class="section-head section-head--split reveal">
                <div>
                    <div class="kicker">Dónde entrenas</div>
                    <h2 class="display">Diez sedes <span>habilitadas</span></h2>
                </div>
                <p>El convenio aplica en todas nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. Entrena en la que quieras, sin costos por traslado.</p>
            </div>

            <div class="sedes-mini reveal">
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/boulevard1.jpg" alt=""/></figure><div class="t"><small>Bucaramanga</small><b>Boulevard</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/cabecera1.jpg" alt=""/></figure><div class="t"><small>Bucaramanga</small><b>Cabecera</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/prado1.jpg" alt=""/></figure><div class="t"><small>Bucaramanga</small><b>El Prado</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/provenza1.jpg" alt=""/></figure><div class="t"><small>Bucaramanga</small><b>Provenza</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/ciudadela1.jpg" alt=""/></figure><div class="t"><small>Bucaramanga</small><b>Ciudadela</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/canaveral1.jpg" alt=""/></figure><div class="t"><small>Floridablanca</small><b>Cañaveral</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/delacuesta1.jpg" alt=""/></figure><div class="t"><small>Piedecuesta</small><b>DeLaCuesta</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/parquecentral1.jpg" alt=""/></figure><div class="t"><small>Piedecuesta</small><b>Parque Central</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/jardin1.jpg" alt=""/></figure><div class="t"><small>Cúcuta</small><b>Jardín Plaza</b></div></a>
                <a href="index.html#sedes" class="sede-mini"><figure><img src="https://fitnesspeoplecolombia.com/img/sedes/galeria/ceiba1.jpg" alt=""/></figure><div class="t"><small>Cúcuta</small><b>Ceiba II</b></div></a>
            </div>
        </div>
    </section>



    <!-- ================= 09. FAQ ================= -->
    <section class="faq" id="faq">
        <div class="container">
            <div class="faq-grid">
                <div class="reveal">
                    <div class="kicker">Preguntas frecuentes</div>
                    <h2 class="display">Sobre el <span>convenio</span></h2>
                    <p class="lead">Si tu duda no está aquí, un asesor te responde por WhatsApp antes de que te inscribas.</p>
                    <a href="https://wa.me/573107842151" class="fpp-btn fpp-btn--outline" style="margin-top:26px; max-width: 300px;">Hablar con un asesor</a>
                </div>

                <div class="fap-section reveal">
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
    // =========================================================
    //  CONSULTA DE AFILIACIÓN — MAQUETA
    //
    //  Al implementar: reemplazar consultarDemo() por la llamada
    //  real al servicio de Comfenalco Santander (o al backend que
    //  lo consume). La respuesta solo necesita decir si el
    //  documento aplica o no: { aplica: true | false }.
    //
    //  IMPORTANTE: la categoría del afiliado (A, B o C) NO se
    //  muestra en pantalla. El convenio cubre A y B con una
    //  tarifa única; C no aplica, pero el usuario nunca ve la
    //  letra ni el motivo, solo "aplica" o "no aplica".
    //
    //  Regla de la demo, para poder ver los dos estados:
    //  documentos terminados en "00", o cuya suma de dígitos sea
    //  múltiplo de 3 más 2, devuelven "no aplica".
    // =========================================================
    (function () {
        var ETIQUETA = { CC: 'CC', CE: 'CE', TI: 'TI', RC: 'RC', PA: 'Pasaporte', PPT: 'PPT' };

        var form = document.getElementById('csForm');
        var tipo = document.getElementById('tipoDoc');
        var num = document.getElementById('numDoc');
        var tipoB = document.getElementById('tipoDocB');
        var numB = document.getElementById('numDocB');
        var bloqueB = document.getElementById('bloqueBenef');
        var chk = document.getElementById('chkAutorizacion');
        var chkBox = document.getElementById('csCheckWrap');
        var msg = document.getElementById('csMsg');
        var load = document.getElementById('csLoad');
        var res = document.getElementById('csRes');
        var no = document.getElementById('csNo');
        var linDoc = document.getElementById('csDoc');
        var linDocB = document.getElementById('csDocB');

        function esBeneficiario() {
            var r = form.querySelector('input[name="rol"]:checked');
            return r && r.value === 'beneficiario';
        }
        function miles(s) { return s.replace(/\B(?=(\d{3})+(?!\d))/g, '.'); }

        // ---- Radio group Titular / Beneficiario ----
        form.querySelectorAll('input[name="rol"]').forEach(function (r) {
            r.addEventListener('change', function () {
                form.querySelectorAll('[data-radio]').forEach(function (l) {
                    l.classList.toggle('on', l.querySelector('input').checked);
                });
                var benef = esBeneficiario();
                bloqueB.hidden = !benef;
                if (!benef) { tipoB.value = ''; numB.value = ''; tipoB.classList.remove('err'); numB.classList.remove('err'); }
                ocultar();
            });
        });

        // ---- Formato de miles mientras escribe ----
        function formatear(campoTipo, campoNum) {
            campoNum.addEventListener('input', function () {
                campoNum.classList.remove('err');
                if (campoTipo.value === 'PA') return;        // el pasaporte admite letras
                var limpio = campoNum.value.replace(/\D/g, '').slice(0, 12);
                campoNum.value = limpio ? miles(limpio) : '';
            });
            campoTipo.addEventListener('change', function () { campoTipo.classList.remove('err'); });
        }
        formatear(tipo, num);
        formatear(tipoB, numB);
        chk.addEventListener('change', function () { chkBox.classList.remove('err'); });

        // ---- Consulta simulada ----
        function consultarDemo(doc) {
            var d = doc.replace(/\D/g, '');
            if (d.slice(-2) === '00') return { aplica: false };
            var suma = 0;
            for (var i = 0; i < d.length; i++) suma += parseInt(d.charAt(i), 10) || 0;
            return { aplica: suma % 3 !== 2 };
        }

        function ocultar() {
            res.classList.remove('on');
            no.classList.remove('on');
            msg.classList.remove('on');
        }

        function valido(campoTipo, campoNum) {
            var crudo = campoNum.value.trim();
            var digitos = crudo.replace(/\D/g, '');
            var ok = true;
            if (!campoTipo.value) { campoTipo.classList.add('err'); ok = false; }
            if (campoTipo.value === 'PA' ? crudo.length < 5 : digitos.length < 6) { campoNum.classList.add('err'); ok = false; }
            return ok;
        }

        form.addEventListener('submit', function (e) {
            e.preventDefault();
            ocultar();

            var benef = esBeneficiario();
            var falla = !valido(tipo, num);
            if (benef && !valido(tipoB, numB)) falla = true;
            if (!chk.checked) { chkBox.classList.add('err'); falla = true; }
            if (falla) { msg.classList.add('on'); return; }

            load.classList.add('on');

            // El documento que define la tarifa es el del beneficiario cuando aplica;
            // el backend real debe validar el vínculo titular-beneficiario.
            var clave = (benef ? numB.value : num.value).replace(/\D/g, '');

            setTimeout(function () {
                load.classList.remove('on');
                var r = consultarDemo(clave);

                if (!r.aplica) { no.classList.add('on'); no.scrollIntoView({ block: 'center', behavior: 'smooth' }); return; }

                linDoc.textContent = 'Titular · ' + (ETIQUETA[tipo.value] || '') + ' ' + num.value.trim();
                if (benef) {
                    linDocB.textContent = 'Beneficiario · ' + (ETIQUETA[tipoB.value] || '') + ' ' + numB.value.trim();
                    linDocB.hidden = false;
                } else {
                    linDocB.hidden = true;
                }
                res.classList.add('on');
                res.scrollIntoView({ block: 'center', behavior: 'smooth' });
            }, 900);
        });

        document.querySelectorAll('[data-reset]').forEach(function (b) {
            b.addEventListener('click', function () {
                ocultar();
                form.reset();
                bloqueB.hidden = true;
                form.querySelectorAll('[data-radio]').forEach(function (l) { l.classList.toggle('on', l.querySelector('input').checked); });
                form.querySelectorAll('.err').forEach(function (x) { x.classList.remove('err'); });
                chkBox.classList.remove('err');
                num.focus();
                form.scrollIntoView({ block: 'center', behavior: 'smooth' });
            });
        });
    })();

    // Aparición suave
    (function () {
        var els = document.querySelectorAll('.reveal');
        if (!('IntersectionObserver' in window)) { els.forEach(function (e) { e.classList.add('in'); }); return; }
        var io = new IntersectionObserver(function (entries) {
            entries.forEach(function (en) { if (en.isIntersecting) { en.target.classList.add('in'); io.unobserve(en.target); } });
        }, { threshold: .12 });
        els.forEach(function (e) { io.observe(e); });
    })();
</script>




    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
