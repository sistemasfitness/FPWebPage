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

    <!-- ================= 02. HERO ================= -->
    <section class="cv-hero" id="inicio">
        <div class="container">
            <div class="cv-hero-grid">
                <div>
                    <div class="fpp-head fpp-title-convenio">
                        <div>
                            <h2 class="title-convenio">Tu caja <span>te pone a entrenar</span></h2>
                        </div>
                    </div>

                    <p class="hero-sub">
                        Si estás afiliado a <strong>Comfenalco Santander</strong>, entrenas en Fitness People por <strong>$79.000 al mes.</strong> Digita tu documento y te confirmamos al instante si aplicas al convenio, seas titular o beneficiario.
                    </p>

                    <div class="hero-ctas">
                        <a class="fpp-btn fpp-btn--solid" href="">
                            Consultar mi tarifa
                        </a>

                        <a class="fpp-btn fpp-btn--outline" href="">
                            Ver qué incluye
                        </a>
                    </div>
                </div>

                <div class="lockup">
                    <img src="img/logos/logo_2026-04-27.svg" alt="Fitness People - Centro Médico Deportivo" data-retina="true" class="fp-logo" />
                    <span class="x">×</span>
                    <span class="partner">
                        <img src="https://aficonsulta.comfenalcosantander.com.co/imagenes/logoblancorojoporti.png" alt="Comfenalco" class="fp-logo-comf" />
                    </span>
                </div>
            </div>
        </div>
    </section>


    <!-- ================= 04. CONSULTA (pieza central) ================= -->
    <section class="consulta" id="consulta">
        <div class="container">
            <div class="cs-card reveal">
                <div class="kicker kicker--center">Consulta en línea</div>

                <div class="fpp-title-consulta-conv">
                    <h2>Mira <span>si aplicas</span></h2>
                </div>

                <p class="lead">Selecciona si consultas como titular o como beneficiario, digita el documento y te confirmamos de inmediato si tienes la tarifa del convenio.</p>

                <!-- Formulario de consulta -->
                <form class="cs-form" id="csForm" novalidate>
                    <!-- Titular / Beneficiario -->
                    <div class="cs-radios" role="radiogroup" aria-label="Tipo de consulta">
                        <label class="cs-radio on" data-radio>
                            <input type="radio" name="rol" value="titular" checked>
                            <span class="dot" aria-hidden="true"></span>
                            <span class="txt">Titular</span>
                        </label>

                        <label class="cs-radio" data-radio>
                            <input type="radio" name="rol" value="beneficiario">
                            <span class="dot" aria-hidden="true"></span>
                            <span class="txt">Beneficiario</span>
                        </label>
                    </div>

                    <!-- Documento del titular (siempre visible) -->
                    <div class="cs-bloque">
                        <p class="cs-bloque-t">Documento del titular</p>

                        <div class="cs-duo">
                            <div>
                                <label for="tipoDoc">Tipo</label>
                                <select id="tipoDoc" required>
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
                                <input id="numDoc" type="text" inputmode="numeric" autocomplete="off" placeholder="Sin puntos ni comas" required/>
                            </div>
                        </div>
                    </div>

                    <!-- Documento del beneficiario (solo si se elige "Beneficiario") -->
                    <div class="cs-bloque" id="bloqueBenef" hidden>
                        <p class="cs-bloque-t">Documento del beneficiario</p>

                        <div class="cs-duo">
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

                    <!-- Términos y condiciones -->
                    <label class="cs-check" for="acepto" id="csCheckWrap">
                        <input id="acepto" type="checkbox" required checked />
                        <span>Acepto los <a href="#">términos y condiciones</a> y la <a href="#">política de tratamiento de datos personales</a> de Fitness People.</span>
                    </label>

                    <div>
                        <button class="fpp-btn fpp-btn--solid fpp-btn-full" type="submit">Consultar mi tarifa</button>
                    </div>
                </form>

                <p class="cs-msg" id="csMsg">Revisa los datos: selecciona el tipo de documento y digita un número válido.</p>

                <!-- Cargando -->
                <div class="cs-load" id="csLoad"><i></i> Validando tu afiliación…</div>

                <!-- Resultado: aplica -->
                <div class="cs-res" id="csRes">
                    <div class="cs-res-grid">
                        <div class="cs-persona">
                            <small>Resultado de la consulta</small>
                            <b>Aplicas al convenio</b>
                            <p class="doc" id="csDoc">Titular · CC 1.098.765.432</p>
                            <p class="doc" id="csDocB" hidden>Beneficiario · TI 1.030.445.881</p>
                            <span class="cs-cat"><i>✓</i> <span>Tarifa del convenio habilitada</span></span>
                        </div>

                        <div class="cs-precio">
                            <div class="antes">Tarifa plena <s>$165.000</s></div>
                            <div class="ahora"><span class="v">$79.000</span><span class="p">/ mes</span></div>
                            <div class="ahorro">Ahorras $86.000 cada mes</div>
                            <a href="#pasos" class="fpp-btn fpp-btn--solid">Continuar mi inscripción <span class="arrow"></span></a>
                        </div>
                    </div>

                    <button class="cs-reset" type="button" data-reset>Consultar otro documento</button>
                </div>

                <!-- Resultado: no aplica -->
                <div class="cs-no" id="csNo">
                    <div class="ic">?</div>
                        <h3>Este documento no aplica</h3>
                        <p>No pudimos habilitar la tarifa del convenio para el documento que digitaste. Puede ser porque la afiliación no está activa a la fecha o porque no cumple las condiciones vigentes del convenio. Un asesor puede revisarlo contigo y mostrarte las demás opciones.</p>
                        <div class="acciones">
                        <a href="https://wa.me/573107842151" class="fpp-btn fpp-btn--solid">Hablar con un asesor</a>
                        <a href="index.html#planes" class="fpp-btn fpp-btn--outline">Ver planes sin convenio</a>
                    </div>

                    <button class="cs-reset" type="button" data-reset>Consultar otro documento</button>
                </div>
            </div>
        </div>
    </section>



    <!-- ================= 06. BENEFICIOS ================= -->
    <section class="respaldo" id="beneficios">
        <div class="container">
            <div class="section-head section-head--split reveal">
                <div>
                    <div class="kicker">Qué incluye</div>
                    <h2 class="display">Misma tarifa, <span>todo incluido</span></h2>
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
                    <details open>
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


    <style>

        /* ---- HERO DEL CONVENIO ---- */
.cv-hero { position: relative; padding: 148px 0 74px; background: #000; overflow: hidden; }
.cv-hero-media { position: absolute; inset: 0; }
.cv-hero-media img { width: 100%; height: 100%; object-fit: cover; object-position: 65% 30%; opacity: .5; }
.cv-hero-media::after {
  content: ""; position: absolute; inset: 0;
  background:
    radial-gradient(75% 90% at 12% 45%, rgba(0,0,0,.95) 0%, rgba(0,0,0,.74) 45%, rgba(0,0,0,.5) 100%),
    linear-gradient(0deg, #000 0%, rgba(0,0,0,0) 45%);
}
.cv-hero .container { position: relative; z-index: 2; }
/*.cv-hero-grid { display: grid; grid-template-columns: 1.2fr .8fr; gap: 56px; align-items: center; }*/
.cv-hero-grid { display: flex; gap: 56px; align-items: center; }
.cv-hero h1 { font-size: clamp(50px, 7.6vw, 100px); }
.cv-hero .hero-sub { max-width: 580px; }

/* Lockup de marcas */
.lockup {
  display: inline-flex; align-items: center; gap: 20px;
  border: 1px solid var(--fp-border); background: rgba(0,0,0,.55);
  border-radius: 10px; padding: 12px 24px 12px 16px;
}
.lockup .fp-logo { height: 35px; }
.lockup .fp-logo-comf { height: 110px; }
.lockup .x { color: var(--fp-gray-2); font-size: 25px; font-weight: 300; }

.fpp-title-convenio {
    margin-bottom: 20px;
}

.title-convenio {
    font-size: clamp(40px, 5vw, 55px) !important;
}

.hero-sub {
  font-size: 15px;
  line-height: 1.6;
  color: #E6E6E6;
  max-width: 560px;
  font-weight: 500;
}
.hero-sub strong { color: var(--fp-lime); font-weight: 800; }

.hero-ctas { display: flex; flex-wrap: wrap; gap: 14px; margin-top: 36px; }

/* Tarjeta lateral del hero */
.cv-side {
  background: rgba(18,18,18,.8);
  backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px);
  border: 1px solid var(--fp-border); border-radius: var(--radius);
  padding: 30px 28px 26px;
}
.cv-side > small { display: block; font-size: 10.5px; font-weight: 800; letter-spacing: 2.5px; text-transform: uppercase; color: var(--fp-lime); margin-bottom: 12px; }
.cv-side h3 { font-family: var(--font-display); font-size: 38px; letter-spacing: 1px; line-height: 1; margin-bottom: 10px; }
.cv-side > p { color: var(--fp-gray); font-size: 13.5px; line-height: 1.6; margin-bottom: 20px; }
.cv-side ul { list-style: none; }
.cv-side li {
  display: grid; grid-template-columns: 30px 1fr auto; gap: 12px; align-items: center;
  padding: 13px 0; border-top: 1px solid var(--fp-border);
}
.cv-side li i {
  font-style: normal; width: 30px; height: 30px; border-radius: 50%;
  background: var(--fp-lime-soft); color: var(--fp-lime);
  font-family: var(--font-display); font-size: 17px;
  display: flex; align-items: center; justify-content: center;
}
.cv-side li span { font-size: 12.5px; font-weight: 600; color: #D9D9D9; }
.cv-side li b { font-size: 16px; font-weight: 900; color: #fff; letter-spacing: -.3px; }
.cv-side .btn { width: 100%; margin-top: 22px; }
.cv-side em { display: block; text-align: center; font-style: normal; font-size: 10.5px; color: var(--fp-gray-2); margin-top: 12px; }






/* ============ SECCIÓN DE CONSULTA (pieza central) ============ */

.fpp-title-consulta-conv {
	text-align: center;
	margin-bottom: 20px;
}

.fpp-title-consulta-conv h2 {
	font-size: clamp(20px, 4vw, 40px) !important;
	font-weight: 900;
	text-transform: uppercase;
	letter-spacing: 1px;
	line-height: 1.05;
	color: var(--fp-white);
}

	.fpp-title-consulta-conv span {
		color: var(--fp-lime);
	}

.kicker {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: 3px;
  text-transform: uppercase;
  color: var(--fp-lime);
  margin-bottom: 16px;
}
.kicker::before {
  content: "";
  width: 46px; height: 2px;
  background: var(--fp-lime);
  display: inline-block;
}
.kicker--center { justify-content: center; }
.kicker--center::after {
  content: "";
  width: 46px; height: 2px;
  background: var(--fp-lime);
  display: inline-block;
}


.consulta { padding: 100px 0; background: var(--fp-bg-2); position: relative; overflow: hidden; }
.consulta::before {
  content: ""; position: absolute; left: 50%; top: 0; transform: translateX(-50%);
  width: 1000px; height: 560px; pointer-events: none;
  background: radial-gradient(50% 50% at 50% 0%, rgba(227,255,0,.12) 0%, rgba(0,0,0,0) 100%);
}
.consulta .container { position: relative; }
.cs-card {
  background: linear-gradient(170deg, var(--fp-card-2) 0%, #101204 100%);
  border: 1.5px solid var(--fp-lime);
  border-radius: 24px; padding: 46px 46px 40px;
  box-shadow: 0 0 60px;
  max-width: 960px; margin: 0 auto;
}
.cs-card .kicker { justify-content: center; }
.cs-card .kicker::after { content: ""; width: 46px; height: 2px; background: var(--fp-lime); display: inline-block; }
.cs-card h2 { font-size: clamp(38px, 5vw, 62px); text-align: center; }
.cs-card > p.lead { text-align: center; color: var(--fp-gray-3); font-size: 15px; line-height: 1.65; max-width: 560px; margin: 16px auto 0; font-weight: 400; }

.fpp-btn-full { width: 100%; }

  .cs-form { margin: 36px auto 0; max-width: 620px; }

  /* Selector Titular / Beneficiario */
  .cs-radios { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-bottom: 28px; }
  .cs-radio {
    position: relative; display: flex; align-items: center; gap: 12px;
    border: 1px solid var(--fp-border); background: #0A0A0A; border-radius: 14px;
    padding: 16px 18px; cursor: pointer; transition: border-color .2s, background .2s;
  }
  .cs-radio input { position: absolute; opacity: 0; width: 0; height: 0; }
  .cs-radio .dot { position: relative; width: 22px; height: 22px; border-radius: 50%; border: 2px solid var(--fp-gray-2); flex-shrink: 0; transition: border-color .2s; }
  .cs-radio .dot::after { content: ""; position: absolute; inset: 4px; border-radius: 50%; background: var(--fp-lime); transform: scale(0); transition: transform .18s ease; }
  .cs-radio .txt { font-size: 12.5px; font-weight: 800; letter-spacing: 1.5px; text-transform: uppercase; color: var(--fp-gray); transition: color .2s; }
  .cs-radio:hover { border-color: var(--fp-gray-2); }
  .cs-radio.on { border-color: var(--fp-lime); background: var(--fp-lime-soft); }
  .cs-radio.on .dot { border-color: var(--fp-lime); }
  .cs-radio.on .dot::after { transform: scale(1); }
  .cs-radio.on .txt { color: #fff; }
  .cs-radio input:focus-visible ~ .dot { box-shadow: 0 0 0 3px rgba(227,255,0,.35); }

  /* Bloques de documento */
  .cs-bloque { margin-bottom: 22px; }
  .cs-bloque[hidden] { display: none; }
  .cs-bloque-t {
    font-size: 11px; font-weight: 800; letter-spacing: 2.5px; text-transform: uppercase;
    color: var(--fp-lime); margin-bottom: 16px; padding-bottom: 11px; border-bottom: 1px solid var(--fp-border);
  }
  .cs-duo { display: grid; grid-template-columns: 210px 1fr; gap: 12px; }

  /* Aceptación de términos */
  .cs-check {
    display: grid; grid-template-columns: 22px 1fr; gap: 12px; align-items: start;
    margin: 6px 0 22px; font-size: 12.5px; line-height: 1.6; color: #C4C4C4; cursor: pointer;
  }
  .cs-check input { width: 22px; height: 22px; border-radius: 6px; accent-color: var(--fp-lime); cursor: pointer; }
  .cs-check a { color: var(--fp-lime); font-weight: 700; text-decoration: none; }
  .cs-check a:hover { text-decoration: underline; }
  .cs-check.err span { color: #FF7B7B; }

  .cs-form label { display: block; font-size: 10.5px; font-weight: 800; letter-spacing: 2px; text-transform: uppercase; color: var(--fp-gray); margin-bottom: 9px; }
  .cs-form select, .cs-form input {
    width: 100%; font-family: var(--font-body); font-size: 15px; font-weight: 600; color: #fff;
    background: #0A0A0A; border: 1px solid var(--fp-border); border-radius: 14px;
    padding: 17px 18px; outline: none; transition: border-color .2s;
    /*-webkit-appearance: none; appearance: none;*/
  }
  .cs-form select {
    background-image: linear-gradient(45deg, transparent 50%, #E3FF00 50%), linear-gradient(135deg, #E3FF00 50%, transparent 50%);
    background-position: calc(100% - 22px) 50%, calc(100% - 17px) 50%;
    background-size: 5px 5px; background-repeat: no-repeat;
    -webkit-appearance: none;
  }
  .cs-form select:focus, .cs-form input:focus { border-color: var(--fp-lime); }
  .cs-form input::placeholder { color: #6E6E6E; font-weight: 500; }
  .cs-form input.err, .cs-form select.err { border-color: #FF5C5C; }
  .cs-form .btn { width: 100%; padding: 18px 30px; }

  /* Overrides: el radio y el check no heredan el estilo de los campos */
  .cs-form label.cs-radio { display: flex; align-items: center; gap: 12px; margin-bottom: 0; }
  .cs-form .cs-radio .dot { display: block; }
  .cs-form .cs-radio input[type="radio"] {
    position: absolute; top: 0; left: 0; width: 100%; height: 100%;
    opacity: 0; margin: 0; padding: 0; border: none; background: none; cursor: pointer;
  }
  .cs-form label.cs-check {
      display: flex;
    font-size: 12.5px; font-weight: 500; letter-spacing: normal; text-transform: none;
    color: #C4C4C4; margin-bottom: 22px;
  }
  .cs-form .cs-check input[type="checkbox"] {
    width: 22px; height: 22px; padding: 0; border-radius: 6px;
    background: #141414; border: 1px solid var(--fp-border); accent-color: var(--fp-lime);
  }
  .cs-nota { margin-top: 18px; text-align: center; font-size: 12px; color: var(--fp-gray-2); line-height: 1.6; }
  .cs-nota a { color: var(--fp-lime); text-decoration: none; font-weight: 700; }
  .cs-msg { display: none; margin-top: 16px; text-align: center; color: #FF7B7B; font-size: 13px; font-weight: 700; }
  .cs-msg.on { display: block; }

/* Estado de carga */
.cs-load { display: none; margin-top: 34px; text-align: center; color: var(--fp-gray); font-size: 13px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; }
.cs-load.on { display: block; }
.cs-load i {
  display: block; width: 34px; height: 34px; margin: 0 auto 16px;
  border: 3px solid var(--fp-border); border-top-color: var(--fp-lime); border-radius: 50%;
  animation: gira .8s linear infinite;
}
@keyframes gira { to { transform: rotate(360deg); } }

/* Resultado */
.cs-res { display: none; margin-top: 36px; padding-top: 34px; border-top: 1px solid rgba(227,255,0,.25); }
.cs-res.on { display: block; }
.cs-res-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 26px; align-items: center; }
.cs-persona small { display: block; font-size: 10.5px; font-weight: 800; letter-spacing: 2px; text-transform: uppercase; color: var(--fp-gray); margin-bottom: 8px; }
.cs-persona b { display: block; font-size: 30px; text-transform: uppercase; color: var(--fp-white); line-height: 1.05; }
.cs-persona .doc { font-size: 13px; color: var(--fp-gray); font-weight: 600; margin-top: 8px; margin-bottom: 0; }
.cs-cat {
  display: inline-flex; align-items: center; gap: 12px; margin-top: 18px;
  background: var(--fp-lime); color: #000; border-radius: 999px; padding: 9px 20px 9px 10px;
  font-size: 12px; font-weight: 800; letter-spacing: 1.5px; text-transform: uppercase;
}
.cs-cat i { font-style: normal; width: 28px; height: 28px; border-radius: 50%; background: #000; color: var(--fp-lime); display: flex; align-items: center; justify-content: center; font-family: var(--font-display); font-size: 17px; }
.cs-precio { background: #0A0A0A; border: 1px solid var(--fp-border); border-radius: 18px; padding: 26px 28px; }
.cs-precio .antes { font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; color: var(--fp-gray); }
.cs-precio .antes s { color: var(--fp-gray-2); font-size: 16px; margin-left: 6px; }
.cs-precio .ahora { display: flex; align-items: baseline; gap: 10px; margin: 8px 0 6px; flex-wrap: wrap; }
.cs-precio .ahora .v { font-size: clamp(38px, 4vw, 50px); font-weight: 900; color: var(--fp-lime); letter-spacing: -1.5px; line-height: 1; }
.cs-precio .ahora .p { font-size: 15px; font-weight: 800; text-transform: uppercase; color: #fff; }
.cs-precio .ahorro { font-size: 12px; font-weight: 800; letter-spacing: 1.5px; text-transform: uppercase; color: var(--fp-lime); margin-bottom: 22px; }
.cs-precio .btn { width: 100%; margin-top: 22px; }
.cs-precio .demo { display: block; text-align: center; font-size: 10.5px; color: var(--fp-gray-2); margin-top: 12px; letter-spacing: .5px; }

/* Resultado: no afiliado */
.cs-no { display: none; margin-top: 36px; padding-top: 34px; border-top: 1px solid var(--fp-border); text-align: center; }
.cs-no.on { display: block; }
.cs-no .ic { width: 62px; height: 62px; border-radius: 50%; margin: 0 auto 20px; border: 2px solid var(--fp-gray-2); color: var(--fp-gray); display: flex; align-items: center; justify-content: center; font-size: 28px; }
.cs-no h3 { font-size: 32px; text-transform: uppercase; margin-bottom: 10px; color: var(--fp-white); font-weight: 800; }
.cs-no p { color: var(--fp-gray-3); font-size: 14px; line-height: 1.7; max-width: 480px; margin: 0 auto 24px; }
.cs-no .acciones { display: flex; gap: 12px; justify-content: center; flex-wrap: wrap; }

.cs-reset { background: none; border: none; color: var(--fp-gray); font-family: var(--font-body); font-size: 12px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; cursor: pointer; margin: 24px auto 0; display: block; border-bottom: 1px solid var(--fp-border); padding-bottom: 3px; }
.cs-reset:hover { color: var(--fp-lime); border-color: var(--fp-lime); }





.respaldo { padding: 100px 0; background: var(--fp-card); }
.section-head { margin-bottom: 24px; }
.section-head h2 { font-size: clamp(34px, 5vw, 50px); font-weight: 900;
text-transform: uppercase;
letter-spacing: 1px;
line-height: 1.05;
color: var(--fp-white); }

.section-head span {
	color: var(--fp-lime);
}


.section-head p {
  /*margin-top: 16px;*/
  font-size: 16px;
  color: var(--fp-gray);
  max-width: 560px;
  line-height: 1.6;
  font-weight: 400;
}
.section-head--center { text-align: center; }
.section-head--center p { margin-left: auto; margin-right: auto; }
.section-head--split {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 24px;
}

.chips { display: flex; flex-wrap: wrap; gap: 10px; }
.chip {
  display: inline-flex; align-items: center; gap: 10px;
  border: 1px solid var(--fp-border); background: var(--fp-card);
  border-radius: 999px; padding: 12px 18px 12px 12px;
  color: var(--fp-white);
  font-size: 12.5px; font-weight: 700; letter-spacing: .5px; text-transform: uppercase;
  transition: border-color .2s, color .2s;
}
.chip i {
  width: 26px; height: 26px; border-radius: 50%;
  background: var(--fp-lime-soft); color: var(--fp-lime);
  display: inline-flex; align-items: center; justify-content: center;
  font-style: normal; font-size: 12px; font-weight: 900;
}
.chip:hover { border-color: var(--fp-lime); color: var(--fp-lime); }











/* ---- SEDES DEL CONVENIO ---- */
.sedes-conv { padding: 96px 0; background: var(--fp-bg); }
.sedes-mini { display: grid; grid-template-columns: repeat(5, 1fr); gap: 14px; }
.sede-mini {
  border: 1px solid var(--fp-border); background: var(--fp-card); border-radius: 16px; overflow: hidden;
  text-decoration: none; transition: transform .25s, border-color .25s;
}
.sede-mini:hover { transform: translateY(-5px); border-color: rgba(227,255,0,.5); }
.sede-mini figure { aspect-ratio: 4 / 3; overflow: hidden; background: #151515; }
.sede-mini img { width: 100%; height: 100%; object-fit: cover; filter: brightness(.7); transition: transform .6s, filter .3s; }
.sede-mini:hover img { transform: scale(1.06); filter: brightness(.9); }
.sede-mini .t { padding: 14px 16px 16px; }
.sede-mini .t small { font-size: 10px; font-weight: 800; letter-spacing: 2px; text-transform: uppercase; color: var(--fp-gray); }
.sede-mini .t b { display: block; color: var(--fp-white); font-size: 20px; margin-top: 5px; line-height: 1; }


  /* ============ 07. SEDES ============ */
  .sedes { padding: 100px 0; background: var(--fp-lime); overflow: hidden; }
  .sedes-layout { display: grid; grid-template-columns: 340px 1fr; gap: 50px; align-items: start; }
  .sedes h2 { font-size: clamp(48px, 6vw, 84px); }
  .sedes p.lead { color: var(--fp-gray); font-size: 15px; line-height: 1.7; margin-top: 18px; }
  .city-filter { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 26px; }
  .city-filter button {
    font-family: var(--font-body); font-size: 11.5px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase;
    border: 1px solid var(--fp-border); background: transparent; color: var(--fp-white);
    border-radius: 999px; padding: 10px 16px; cursor: pointer; transition: all .2s;
  }
  .city-filter button:hover, .city-filter button.on { background: var(--fp-lime); border-color: var(--fp-lime); color: #000; }
  .sedes .btn { margin-top: 30px; }
  .sedes-track {
    display: flex; gap: 16px;
    overflow-x: auto; scroll-snap-type: x mandatory;
    padding: 6px 6px 24px;
    margin: -6px -6px 0;
    scrollbar-width: thin; scrollbar-color: var(--fp-border) transparent;
  }
  .sede {
    flex: 0 0 280px; scroll-snap-align: start;
    position: relative; border-radius: 18px; overflow: hidden;
    aspect-ratio: 3 / 4; background: #151515; border: 1px solid var(--fp-border);
    text-decoration: none; transition: transform .25s, border-color .25s;
  }
  .sede img { width: 100%; height: 100%; object-fit: cover; filter: brightness(.65); transition: transform .6s, filter .3s; }
  .sede:hover { transform: translateY(-6px); border-color: rgba(227,255,0,.6); }
  .sede:hover img { transform: scale(1.06); filter: brightness(.8); }
  .sede .city {
    position: absolute; top: 14px; left: 14px;
    font-size: 10.5px; font-weight: 800; letter-spacing: 2px; text-transform: uppercase;
    background: rgba(0,0,0,.6); border: 1px solid rgba(255,255,255,.2);
    border-radius: 999px; padding: 6px 12px;
  }
  .sede .name {
    position: absolute; left: 0; right: 0; bottom: 0; padding: 20px 18px;
    background: linear-gradient(0deg, rgba(0,0,0,.95) 0%, rgba(0,0,0,0) 100%);
  }
  .sede .name b { display: block; font-family: var(--font-display); font-size: 36px; letter-spacing: 1px; line-height: 1; }
  .sede .name small { display: flex; align-items: center; gap: 6px; margin-top: 8px; font-size: 12px; font-weight: 700; letter-spacing: 1px; text-transform: uppercase; color: var(--fp-lime); }
  .sede.hide { display: none; }











  /* ============ 09. FAQ + ALIADOS ============ */
.faq { padding: 100px 0 80px; background: var(--fp-bg); }
.faq-grid { display: grid; grid-template-columns: 1fr 1.4fr; gap: 60px; }
.faq h2 { font-size: clamp(34px, 5vw, 50px); font-weight: 900;
text-transform: uppercase;
letter-spacing: 1px;
line-height: 1.05;
color: var(--fp-white); }
.faq span {
    color: var(--fp-lime);
}

.faq p.lead { color: var(--fp-gray); margin-top: 16px; line-height: 1.7; font-size: 15px; font-weight: 500; }
.faq details { border-bottom: 1px solid var(--fp-border); }
.faq details:first-of-type { border-top: 1px solid var(--fp-border); }
.faq summary {
  list-style: none; cursor: pointer;
  display: flex; align-items: center; justify-content: space-between; gap: 20px;
  color: var(--fp-white);
  padding: 24px 0; font-size: 16px; font-weight: 700;
  transition: color .2s;
}
.faq summary::-webkit-details-marker { display: none; }
.faq summary::after {
  content: "+"; flex-shrink: 0;
  width: 34px; height: 34px; border-radius: 50%;
  border: 1px solid var(--fp-border);
  display: inline-flex; align-items: center; justify-content: center;
  font-size: 20px; font-weight: 400; color: var(--fp-lime);
  transition: all .25s;
}
.faq details[open] summary { color: var(--fp-lime); }
.faq details[open] summary::after { content: "–"; background: var(--fp-lime); color: #000; border-color: var(--fp-lime); }
.faq details p { color: var(--fp-gray); font-size: 15px; font-weight: 500; line-height: 1.7; padding: 0 0 24px; max-width: 640px; }

.aliados { padding: 30px 0 90px; background: var(--fp-bg); }
.aliados .lbl { text-align: center; font-size: 11.5px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; color: var(--fp-gray); margin-bottom: 28px; }
.aliados-row { display: flex; flex-wrap: wrap; justify-content: center; align-items: center; gap: 18px 44px; }
.aliados-row img { height: 36px; width: auto; max-width: 140px; object-fit: contain; filter: grayscale(1) brightness(10); opacity: .55; transition: opacity .2s, filter .2s; }
.aliados-row img:hover { opacity: 1; filter: grayscale(0) brightness(1); }










    /* ============ RESPONSIVE ============ */
  @media (max-width: 1100px) {
    .clases-thumbs { grid-template-columns: repeat(5, 1fr); }
    .footer-grid { grid-template-columns: 1fr 1fr 1fr; }
    .footer .brand { grid-column: 1 / -1; }
  }
  @media (max-width: 991px) {
    .nav, .header .btn--lime, .header .icon-btn.user { display: none; }
    .burger { display: inline-flex; }
    .hero h1 { font-size: clamp(60px, 15vw, 110px); }
    .fp-grid { grid-template-columns: 1fr; max-width: 480px; margin: 0 auto; gap: 40px; }
    .fp-card--featured { transform: none; order: -1; }
    .fp-card--featured:hover { transform: translateY(-6px); }
    .respaldo-grid, .freepass-grid, .faq-grid { grid-template-columns: 1fr; gap: 40px; }
    .sedes-layout { grid-template-columns: 1fr; gap: 34px; }
    .clases-stage { aspect-ratio: 4 / 3; }
    .clases-stage .cap { left: 22px; right: 22px; bottom: 22px; }
    .freepass::before { display: none; }
  }
  @media (max-width: 600px) {
    .container { padding: 0 18px; }
    .header .container { height: 70px; }
    .hero { padding-top: 70px; }
    .hero-controls { display: none; }
    .stat .num { font-size: 42px; }
    .clases-thumbs { grid-template-columns: repeat(3, 1fr); }
    .pro-cards { grid-template-columns: 1fr 1fr; gap: 10px; }
    .sede { flex-basis: 230px; }
    .fp-form { padding: 24px; }
    .fp-form .row { grid-template-columns: 1fr; }
    .footer-grid { grid-template-columns: 1fr 1fr; }
  }



/* ---- RESPONSIVE ---- */
@media (max-width: 1100px) {
  .sedes-mini { grid-template-columns: repeat(3, 1fr); }
  .pasos { grid-template-columns: 1fr 1fr; }
  .paso:nth-child(2) { border-right: none; }
  .paso:nth-child(3), .paso:nth-child(4) { border-top: 1px solid var(--fp-border); }
}
@media (max-width: 991px) {

    .lockup .fp-logo { height: 30px; }
.lockup .fp-logo-comf { height: 100px; }


.fpp-title-convenio { margin-top: 0; }


  .cv-hero { padding: 100px 0 58px; }
  .cs-form, .cs-res-grid, .requisitos { grid-template-columns: 1fr; gap: 34px; }
  .cv-hero-grid { flex-direction: column-reverse; gap: 10px; }
  .cs-form { gap: 16px; }
  .cs-form .btn { width: 100%; }
  .franja .container { grid-template-columns: 1fr 1fr; }
  .fr-item:nth-child(2) { border-right: none; }
  .fr-item:nth-child(3) { padding-left: 0; border-top: 1px solid var(--fp-border); }
  .fr-item:nth-child(4) { border-top: 1px solid var(--fp-border); }
  .cs-card { padding: 34px 26px 30px; }


  .consulta, .respaldo, .sedes-conv, .faq { padding: 50px 0; }

  

}
@media (max-width: 600px) {
  .franja .container { grid-template-columns: 1fr; }
  .fr-item, .fr-item + .fr-item { border-right: none; padding: 22px 0; border-top: 1px solid var(--fp-border); }
  .fr-item:first-child { border-top: none; }
  .sedes-mini { grid-template-columns: 1fr 1fr; gap: 10px; }
  .pasos { grid-template-columns: 1fr; }
  .paso, .paso + .paso { border-right: none; padding: 28px 0; border-top: 1px solid var(--fp-border); }
  .paso:first-child { border-top: none; }
  .lockup { padding: 10px 16px 10px 12px; gap: 12px; }
  .lockup .fp-logo { height: 22px; }
  .lockup .partner b { font-size: 14px; }
  .aviso { grid-template-columns: 1fr; }
  .cs-card { padding: 26px 20px; }
  .cs-duo { grid-template-columns: 1fr; }
}

@media (max-width: 400px) {
    .cs-radio {
        padding: 5px;
    }
}

    </style>




<%--<script>
    // =========================================================
    //  CONSULTA DE AFILIACIÓN — MAQUETA
    //  Al implementar: reemplazar consultarDemo() por la llamada
    //  real al servicio de Comfenalco Santander (o al backend que
    //  lo consume) y mapear la respuesta a {nombre, categoria}.
    //  Regla de la demo: cualquier número válido devuelve una
    //  categoría; los que terminan en "00" simulan "no afiliado".
    // =========================================================
    (function () {
        var TARIFAS = {
            A: { txt: 'Categoría A · hasta 2 SMMLV', valor: 79000 },
            B: { txt: 'Categoría B · de 2 a 4 SMMLV', valor: 89000 },
            C: { txt: 'Categoría C · más de 4 SMMLV', valor: 99000 }
        };
        var PLENA = 165000;
        var ETIQUETA = { CC: 'CC', CE: 'CE', TI: 'TI', PA: 'Pasaporte', PPT: 'PPT' };

        var form = document.getElementById('csForm');
        var tipo = document.getElementById('tipoDoc');
        var num = document.getElementById('numDoc');
        var msg = document.getElementById('csMsg');
        var load = document.getElementById('csLoad');
        var res = document.getElementById('csRes');
        var no = document.getElementById('csNo');

        function pesos(n) { return '$' + n.toLocaleString('es-CO'); }
        function miles(s) { return s.replace(/\B(?=(\d{3})+(?!\d))/g, '.'); }

        // Formato de miles mientras escribe (solo para documentos numéricos)
        num.addEventListener('input', function () {
            num.classList.remove('err');
            if (tipo.value === 'PA') return;           // pasaporte admite letras
            var limpio = num.value.replace(/\D/g, '').slice(0, 12);
            num.value = limpio ? miles(limpio) : '';
        });
        tipo.addEventListener('change', function () { tipo.classList.remove('err'); });

        function consultarDemo(doc) {
            var d = doc.replace(/\D/g, '');
            if (d.slice(-2) === '00') return null;     // simula "no afiliado"
            var letras = ['A', 'B', 'C'];
            var suma = 0;
            for (var i = 0; i < d.length; i++) suma += parseInt(d.charAt(i), 10) || 0;
            return { nombre: 'Afiliado Comfenalco', categoria: letras[suma % 3] };
        }

        function ocultar() {
            res.classList.remove('on');
            no.classList.remove('on');
            msg.classList.remove('on');
        }

        form.addEventListener('submit', function (e) {
            e.preventDefault();
            ocultar();

            var crudo = num.value.trim();
            var soloDigitos = crudo.replace(/\D/g, '');
            var falla = false;

            if (!tipo.value) { tipo.classList.add('err'); falla = true; }
            if (tipo.value === 'PA') {
                if (crudo.length < 5) { num.classList.add('err'); falla = true; }
            } else if (soloDigitos.length < 6) {
                num.classList.add('err'); falla = true;
            }
            if (falla) { msg.classList.add('on'); return; }

            load.classList.add('on');

            setTimeout(function () {
                load.classList.remove('on');
                var r = consultarDemo(soloDigitos || crudo);

                if (!r) { no.classList.add('on'); no.scrollIntoView({ block: 'center', behavior: 'smooth' }); return; }

                var t = TARIFAS[r.categoria];
                document.getElementById('csNombre').textContent = r.nombre;
                document.getElementById('csDoc').textContent = (ETIQUETA[tipo.value] || '') + ' ' + crudo;
                document.getElementById('csLetra').textContent = r.categoria;
                document.getElementById('csCatTxt').textContent = t.txt;
                document.getElementById('csValor').textContent = pesos(t.valor);
                document.getElementById('csAhorro').textContent = 'Ahorras ' + pesos(PLENA - t.valor) + ' cada mes';
                res.classList.add('on');
                res.scrollIntoView({ block: 'center', behavior: 'smooth' });
            }, 900);
        });

        document.querySelectorAll('[data-reset]').forEach(function (b) {
            b.addEventListener('click', function () {
                ocultar();
                form.reset();
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
</script>--%>


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
        var chk = document.getElementById('acepto');
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
