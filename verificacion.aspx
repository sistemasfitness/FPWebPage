<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verificacion.aspx.cs" Inherits="WebPage.verificacion" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/infocontacto.ascx" TagPrefix="uc1" TagName="infocontacto" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PCVVM2CZ');
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/3.1.6/footable.bootstrap.min.css" rel="stylesheet" />

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />

    <!-- SPECIFIC CSS -->
    <link href="css/ion.rangeSlider.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <div id="preloader">
        <div data-loader="circle-side"></div>
    </div>
    <!-- End Preload -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenu runat="server" ID="mainmenu" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="img/contact.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">VERIFICACIÓN</h1>
        </div>
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <div class="container margin_60_35" style="color: #F4F4F4;">
        <div class="row">
            <div class="col-md-8">
                <h2 style="font-weight: 900; color: #E3FF00;">Verificación de afiliado</h2>
                <p id="id_parrafo" runat="server">Confirma los siguientes datos y da clic al botón verificar:</p>
                <div>
                    <div id="message-contact"></div>
                    <form id="verificar" runat="server" class="form-web">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Nombres</label>
                                    <asp:HiddenField ID="hfIdAfiliado" runat="server" />
                                    <asp:TextBox ID="txbNombres" CssClass="form-control" runat="server" name="txbNombres" required=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Apellidos</label>
                                    <asp:TextBox ID="txbApellidos" CssClass="form-control" runat="server" name="txbApellidos" required=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Correo eléctronico:</label>
                                    <asp:TextBox ID="txbCorreo" CssClass="form-control" runat="server" name="txbCorreo"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Teléfono</label>
                                    <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" name="txbCelular" required=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Dirección:</label>
                                    <asp:TextBox ID="txbDireccion" CssClass="form-control" runat="server" name="txbDireccion" required=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Fecha nacimiento:</label>
                                    <asp:TextBox ID="txbFechaNacimiento" CssClass="form-control" runat="server" name="txbFechaNacimiento" required=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label>EPS:</label>
                                    <asp:DropDownList ID="ddlEPS" runat="server" CssClass="form-control" 
                                        DataTextField="NombreEps" DataValueField="idEps" AppendDataBoundItems="true">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label>Nombre de contacto en caso de emergencia:</label>
                                    <asp:TextBox ID="txbResponsable" CssClass="form-control" runat="server" name="txbResponsable"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Parentesco:</label>
                                    <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="form-control" 
                                        AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Teléfono de contacto en caso de emergencia:</label>
                                    <asp:TextBox ID="txbContacto" CssClass="form-control" runat="server" 
                                        name="txbContacto"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="upParq" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <br />
                                                    <h4><b>CUESTIONARIO DE PREPARACION PARA LA ACTIVIDAD FISICA</b></h4>
                                                    <p>Apreciado usuario: <b>Fitness People CMD</b> lo invita a responder el siguiente cuestionario, que contiene preguntas vitales para su salud antes de iniciar su <b>PROGRAMA DE PROMOCIÓN EN LA SALUD y PREVENCIÓN DE LA ENFERMEDAD</b> en un programa de entrenamiento.<br /><br />
                                                      Seleccione la casilla de respuesta según sea el caso.</p>
                                                    <table class="table" style="background: #3c3c3c;">
                                                        <tr>
                                                            <th>Pregunta</th>
                                                            <th>Respuesta</th>
                                                        </tr>
                                                        <asp:Repeater ID="rpParq" runat="server" >
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="vertical-align: middle;">
                                                                        <%# Eval("PreguntaParq") %>
                                                                        <asp:HiddenField ID="hfIdParq" runat="server" Value='<%# Eval("idParq") %>' />
                                                                    </td>
                                                                    <td style="text-align: center; vertical-align: middle;">
                                                                        <asp:CheckBox ID="chbRespuesta" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Observaciones:</label>
                                    <p>Si seleccionó SI en alguna(s) de la(s) anterior(es) casilla(s), por favor especificar o si tiene otra observación por favor escríbala aquí:</p>
                                    <asp:TextBox ID="txbObservacionesPARQ" CssClass="form-control" runat="server" name="txbObservacionesPARQ"
                                        placeholder="Observaciones"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p>SI RESPONDIÓ SÍ A UNA O MÁS PREGUNTAS: Fitness People CMD lo remitirá con el médico del deporte quien lo(a) examinará de manera amable y profesional evaluando de forma segura y diagnosticando con un tratamiento oportuno, por medio de un plan de entrenamiento de acuerdo a su estado de salud el cual le será entregado después de la valoración.</p>
                                    <p>SI RESPONDIÓ NO A TODAS LAS PREGUNTAS: Fitness People CMD le asignará una cita con un(a) valorador físico (Fisioterapeuta) quien lo(a) examinará y entregará una prescripción para iniciar su programa de promoción en su salud y prevención de la enfermedad mediante un plan de entrenamiento.
                                      NOTAS:
                                    </p>
                                        <ol>
                                            <li>Este cuestionario solo es aplicable a personas entre 18 y 69 años de edad.</li>
                                            <li>Si está embarazada, antes de hacer ejercicio le sugerimos que consulte a su médico.</li>
                                            <li>Si se produce algún cambio en su estado de salud en relación con las preguntas anteriores, le pedimos que informe inmediatamente al profesional responsable de su programa de entrenamiento.</li>
                                            <li>Si el médico Deportólogo le restringe el entrenamiento, entonces se concluye que es una persona no apta para continuar con el plan de entrenamiento.</li>
                                        </ol>
                                      <p>Fitness People CMD no asume ninguna responsabilidad por las personas que inicien actividades físicas y que tengan dudas, omitan y/u oculten información al llenar los datos personales como titular de la información y este cuestionario.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p><b>Confirmo que he leído, comprendido y completado este cuestionario y todas las preguntas fueron respondidas bajo mi propia responsabilidad, para constancia:</b></p>
                                    <asp:CheckBox ID="chAcepto1" runat="server" Text="ACEPTO Y AUTORIZO" />
                                </div>
                            </div>
                        </div>

                        <div class="row margin_30">
                            <div class="col-md-12">
                                <%--<div class="form-group">
                                    <label style="color: #fff">Pregunta de validación: 3 + 1 =</label>
                                    <asp:TextBox ID="txbVerificacion" CssClass="form-control" runat="server" name="txbVerificacion"></asp:TextBox>
                                </div>--%>
                                <asp:Button ID="btnVerificar" runat="server" CssClass="btn_slider"
                                    Text="VERIFICAR" OnClick="btnVerificar_Click" UseSubmitBehavior="false" 
                                    OnClientClick="return validarYEjecutar();" />
                                <%--<p><input type="submit" value="Verificar" class="btn_1" id="submit-contact" /></p>--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- End col lg 9 -->
            <uc1:infocontacto runat="server" id="infocontacto" />
            <!--End aside -->
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d989.764486790383!2d-73.11025033039041!3d7.119283530320726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e683f7e428fb6e5%3A0x3a67714ea25f138b!2sFitness%20People%20centro%20administrativo!5e0!3m2!1sen!2sco!4v1733155568363!5m2!1sen!2sco" width="100%" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <uc1:footer runat="server" ID="footer" />

    <div id="toTop"></div>
    <!-- Back to top button -->

    <uc1:loginregister runat="server" ID="loginregister" />

    <!-- Search Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"><i class="icon_close"></i></span>
        <form role="search" id="searchform" method="get">
            <input value="" name="q" type="search" placeholder="Buscar..." />
            <button type="submit">
                <i class="icon-search-6"></i>
            </button>
        </form>
    </div>
    <!-- End Search Menu -->
    <!-- COMMON SCRIPTS -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="assets/validate.js"></script>
    <script src="js/functions.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/3.1.6/footable.min.js"></script>

     <!-- SPECIFIC SCRIPTS -->
     <script src="js/ion.rangeSlider.min.js"></script>
     <script src="js/switchery.min.js"></script>
     <script>
         //var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
         var elems = Array.prototype.slice.call(document.querySelectorAll('input[type="checkbox"]'));
         elems.forEach(function (html) {
             var switchery = new Switchery(html, {
                 size: 'small', 
                 color: '#E3FF00'
             });
         });


         function validarCamposFormulario() {

             document.getElementById("btnVerificar").addEventListener("click", function (event) {
                 event.preventDefault()
             });

             const nombre = document.getElementById("<%= txbNombres.ClientID %>");
             const apellido = document.getElementById("<%= txbApellidos.ClientID %>");
             const correo = document.getElementById("<%= txbCorreo.ClientID %>");
             const celular = document.getElementById("<%= txbCelular.ClientID %>");
             const direccion = document.getElementById("<%= txbDireccion.ClientID %>");
             const fechanacimiento = document.getElementById("<%= txbFechaNacimiento.ClientID %>");
             const responsable = document.getElementById("<%= txbResponsable.ClientID %>");
             const contacto = document.getElementById("<%= txbContacto.ClientID %>");

             const observaciones = document.getElementById("<%= txbObservacionesPARQ.ClientID %>");
             <%--const mes = document.getElementById("<%= ddlMes.ClientID %>");
             const anho = document.getElementById("<%= ddlAnho.ClientID %>");
                const cvc = document.getElementById("<%= txbCVC.ClientID %>");
             const nombre = document.getElementById("<%= txbNombreTarjeta.ClientID %>");--%>

             if (!nombre.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa nombre(s).', 'warning', nombre);
                 return false;
             }

             if (!apellido.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa apellido(s).', 'warning', apellido);
                 return false;
             }

             if (!correo.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa el correo electrónico.', 'warning', correo);
                 return false;
             }

             if (!celular.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa el número de celular.', 'warning', celular);
                 return false;
             }

             if (!direccion.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa la dirección.', 'warning', direccion);
                 return false;
             }

             if (!fechanacimiento.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa la fecha de nacimiento.', 'warning', fechanacimiento);
                 return false;
             }

             if (!responsable.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa el nombre de contacto en caso de emergencia.', 'warning', responsable);
                 return false;
             }

             if (!contacto.value.trim()) {
                 mostrarAlerta('Campo requerido', 'Por favor, ingresa el número de celular de contacto en caso de emergencia.', 'warning', contacto);
                 return false;
             }

             return true;
         }

         function validarYEjecutar() {
             const cb1 = document.getElementById("chAcepto1");

             const autorizacionesOK = cb1.checked;
             const formularioOK = validarCamposFormulario();

             if (!autorizacionesOK) {
                 mostrarAlerta('Confirmación requerida', 'Debes aceptar todas las autorizaciones para continuar.', 'warning');
                 return false;
             }

             if (!formularioOK) {
                 return false;
             }

             setTimeout(function () {
                 __doPostBack('<%= btnVerificar.UniqueID %>', '');
             }, 100);
             return false;
         }

         function mostrarAlerta(titulo, mensaje, tipo, enfoque) {
             Swal.fire({
                 title: titulo,
                 text: mensaje,
                 icon: tipo,
                 background: '#3C3C3C',
                 showCloseButton: false,
                 confirmButtonText: 'Aceptar',
                 customClass: {
                     popup: 'alert',
                     confirmButton: 'btn-confirm-alert'
                 },
                 didClose: () => {
                     enfoque.focus();
                 }
             });
         }
     </script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
