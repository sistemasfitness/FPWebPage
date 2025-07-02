<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gympass.aspx.cs" Inherits="WebPage.gympass" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager -->
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');</script>
    <!-- End Google Tag Manager -->

    <!-- Meta Pixel Code -->
    <script>
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return; n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
            n.queue = []; t = b.createElement(e); t.async = !0;
            t.src = v; s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '1224942061553441');
        fbq('track', 'PageView');
    </script>
    <noscript>
        <img height="1" width="1" style="display: none"
            src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
    <!-- End Meta Pixel Code -->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Elige el plan que mejor se adapte a ti y entrena en Fitness People en nuestras sedes de Bucaramanga, Floridablanca, Piedecuesta y Cúcuta." />
    <meta name="author" content="Fitness People" />
    <title>Fitness People</title>

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
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="css/icon_fonts/css/all_icons.min.css" rel="stylesheet" />
    <link href="css/magnific-popup.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/banners/banner_gym_pass.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">GYM PASS</h1>
            <p>Una experiencia exclusiva por un día en Fitness People</p>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35">
    <div class="row">

        <div class="col-md-8">
            <h2 style="font-weight: 900; color: #e3ff00;">Gym Pass</h2>
            <%--<p style="color: #FFF;">Una experiencia exclusiva por un día en Fitness People.</p>--%>
            <div>
                <div id="message-contact"></div>
                <form method="post" id="contacto" style="color: #FFF;" runat="server">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>Nombres</label>
                                <input type="text" class="form-control styled" style="background: #FFF; color: #000;" id="name_contact" name="name_contact" placeholder="Nombre" required runat="server" />
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>Apellidos</label>
                                <input type="text" class="form-control styled" style="background: #FFF; color: #000;" id="lastname_contact" name="lastname_contact" placeholder="Apellido" required runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group">
                                <label>Correo eléctronico:</label>
                                <input type="email" id="email_contact" name="email_contact" class="form-control styled" style="background: #FFF; color: #000;" placeholder="email@email.com" required runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group">
                                <label>Celular:</label>
                                <input type="number" id="phone_contact" name="phone_contact" class="form-control styled" style="background: #FFF; color: #000;" placeholder="3993334444" required runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group">
                                <label>Nro. de documento:</label>
                                <input type="number" id="id_contact" name="id_contact" class="form-control styled" style="background: #FFF; color: #000;" required runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%--<div class="col-md-4 col-sm-4">
                            <div class="form-group">
                                <label>Ciudad:</label>
                                <select id="ddlCiudad" name="ddlCiudad" onchange="popSedes()" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <option value="Bucaramanga">Bucaramanga</option>
                                    <option value="Cúcuta">Cúcuta</option>
                                    <option value="Floridablanca">Floridablanca</option>
                                    <option value="Piedecuesta">Piedecuesta</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="col-md-8 col-sm-8">
                            <div class="form-group">
                                <label>Sede:</label>
                                <%--<select id="ddlSede" name="ddlSede" class="form-control" required>
                                    <option value="">Seleccione</option>
                                </select>--%>
                                <asp:DropDownList ID="ddlSede" runat="server" CssClass="form-control" style="background: #FFF; color: #000;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Seleccione" Value="" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group">
                                <label>Fecha que asistirá:</label>
                                <input type="text" id="date_contact" name="date_contact" class="form-control styled" style="background: #FFF; color: #000;" required runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="checkbox-holder text-left">
				                    <div class="checkbox">
					                    <input type="checkbox" value="accept" id="check_1" name="check_1" onchange="habilitarBoton();"  />
					                    <label for="check_1"><span>He leído y acepto esta política de privacidad.</span>
					                    </label>
				                    </div>
                                </div>
                                <p>Cortesía con acceso a la sede escogida por el cliente. Se debe presentar el documento de identidad en el counter de la sede. 
                                    No se permite el ingreso de menores de 14 años. Nos reservamos el derecho de admisión. 
                                    Cortesía válida para todas las sedes. Esta cortesía no tiene valor comercial. 
                                    Al hacer clic en Enviar, aceptas que Fitness people almacene y procese la información personal 
                                    suministrada arriba para proporcionarte el contenido solicitado.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn_slider" OnClick="btnEnviar_Click" disabled />
                                <%--<input type="submit" value="Enviar" class="btn_slider" id="submit-contact" disabled />--%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- End col lg 9 -->
        <aside class="col-md-4">
            <div class="box_style_1">
                <img src="img/gympass.jpg" alt="gympass" class="img-responsive" />
            </div>
        </aside>
        <!--End aside -->
    </div>
    <!-- End row -->
</div>
<!-- End container -->

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>
    <script>
        function popSedes() {
            const ddlCiudad = document.getElementById("ddlCiudad");
            const ddlSede = document.getElementById("ddlSede");

            ddlSede.innerHTML = "";
            const selectedCiudad = ddlCiudad.value;

            const sedes = {
                "Bucaramanga": ["Boulevard", "Cabecera", "El Prado", "Provenza", "Ciudadela"],
                "Cúcuta": ["Ceiba II", "Jardin Plaza"],
                "Floridablanca": ["Cañaveral"],
                "Piedecuesta": ["DeLaCuesta", "Parque Central"],
            };

            const opcionesSede = sedes[selectedCiudad];
            for (var i = 0; i < opcionesSede.length; i++) {
                const opcion = document.createElement("option");
                opcion.text = opcionesSede[i];
                opcion.value = 
                ddlSede.add(opcion);
            }
        }

        function habilitarBoton() {
            const check1 = document.getElementById('check_1')

            if (check1.checked) {
                console.log('Boton de enviar habilitado');
                document.getElementById('btnEnviar').disabled = false;
            }
        }
    </script>
</body>
</html>