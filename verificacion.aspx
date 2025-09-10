<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verificacion.aspx.cs" Inherits="WebPage.verificacion" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/infocontacto.ascx" TagPrefix="uc1" TagName="infocontacto" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <div class="container margin_60_35">
        <div class="row">
            <div class="col-md-8">
                <h2 style="font-weight: 900; color: #fff">Verificación de Afiliado</h2>
                <p id="id_parrafo" style="color: #fff" runat="server">Confirma los siguientes datos y da clic al botón verificar:</p>
                <div>
                    <div id="message-contact"></div>
                    <form id="verificar" runat="server">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Nombres</label>
                                    <asp:HiddenField ID="hfIdAfiliado" runat="server" />
                                    <asp:TextBox ID="txbNombres" CssClass="form-control" runat="server" name="txbNombres" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Apellidos</label>
                                    <asp:TextBox ID="txbApellidos" CssClass="form-control" runat="server" name="txbApellidos" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Correo eléctronico:</label>
                                    <asp:TextBox ID="txbCorreo" CssClass="form-control" runat="server" name="txbCorreo" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Celular:</label>
                                    <asp:TextBox ID="txbCelular" CssClass="form-control" runat="server" name="txbCelular" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Dirección:</label>
                                    <asp:TextBox ID="txbDireccion" CssClass="form-control" runat="server" name="txbDireccion" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Fecha nacimiento:</label>
                                    <asp:TextBox ID="txbFechaNacimiento" CssClass="form-control" runat="server" name="txbFechaNacimiento" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label style="color: #fff">EPS:</label>
                                    <asp:DropDownList ID="ddlEPS" runat="server" CssClass="form-control" 
                                        DataTextField="NombreEps" DataValueField="idEps" AppendDataBoundItems="true" style="background-color: #3c3c3c;">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label style="color: #fff">Nombre de contacto en caso de emergencia:</label>
                                    <asp:TextBox ID="txbResponsable" CssClass="form-control" runat="server" name="txbResponsable" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Parentesco:</label>
                                    <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="form-control" 
                                        AppendDataBoundItems="true" style="background-color: #3c3c3c;">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Padre/Madre" Value="Padre/Madre"></asp:ListItem>
                                        <asp:ListItem Text="Esposo/a" Value="Esposo/a"></asp:ListItem>
                                        <asp:ListItem Text="Hermano/a" Value="Hermano/a"></asp:ListItem>
                                        <asp:ListItem Text="Hijo/a" Value="Hijo/a"></asp:ListItem>
                                        <asp:ListItem Text="Primo/a" Value="Primo/a"></asp:ListItem>
                                        <asp:ListItem Text="Sobrino/a" Value="Sobrino/a"></asp:ListItem>
                                        <asp:ListItem Text="Encargado/a" Value="Encargado/a"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label style="color: #fff">Celular de contacto en caso de emergencia:</label>
                                    <asp:TextBox ID="txbContacto" CssClass="form-control" runat="server" 
                                        name="txbContacto" style="background-color: #3c3c3c;"></asp:TextBox>
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
                                                    <h4 style="color: #fff"><b>CUESTIONARIO DE PREPARACION PARA LA ACTIVIDAD FISICA</b></h4>
                                                    <p style="color: #fff">Apreciado usuario: <b>Fitness People CMD</b> lo invita a responder el siguiente cuestionario, que contiene preguntas vitales para su salud antes de iniciar su <b>PROGRAMA DE PROMOCIÓN EN LA SALUD y PREVENCIÓN DE LA ENFERMEDAD</b> en un programa de entrenamiento.<br /><br />
                                                      Responda SI o NO:</p>
                                                    <table class="table" style="background: #fff;">
                                                        <tr>
                                                            <th>Pregunta</th>
                                                            <th>Respuesta<br />No - Si</th>
                                                        </tr>
                                                        <asp:Repeater ID="rpParq" runat="server" >
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="vertical-align: middle;">
                                                                        <%# Eval("PreguntaParq") %>
                                                                        <asp:HiddenField ID="hfIdParq" runat="server" Value='<%# Eval("idParq") %>' />
                                                                    </td>
                                                                    <td class="text-center">
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
                                    <label style="color: #fff">Observaciones:</label>
                                    <p style="color: #fff">Si seleccionó SI en alguna(s) de la(s) anterior(es) casilla(s), por favor especificar o si tiene otra observación por favor escríbala aquí:</p>
                                    <asp:TextBox ID="txbObservacionesPARQ" CssClass="form-control" runat="server" name="txbObservacionesPARQ"
                                        placeholder="Observaciones" style="background-color: #3c3c3c;"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p style="color: #fff">SI RESPONDIÓ SÍ A UNA O MÁS PREGUNTAS: Fitness People CMD lo remitirá con el médico del deporte quien lo(a) examinará de manera amable y profesional evaluando de forma segura y diagnosticando con un tratamiento oportuno, por medio de un plan de entrenamiento de acuerdo a su estado de salud el cual le será entregado después de la valoración.</p>
                                    <p style="color: #fff">SI RESPONDIÓ NO A TODAS LAS PREGUNTAS: Fitness People CMD le asignará una cita con un(a) valorador físico (Fisioterapeuta) quien lo(a) examinará y entregará una prescripción para iniciar su programa de promoción en su salud y prevención de la enfermedad mediante un plan de entrenamiento.
                                      NOTAS:
                                    </p>
                                        <ol style="color: #fff">
                                            <li>Este cuestionario solo es aplicable a personas entre 18 y 69 años de edad.</li>
                                            <li>Si está embarazada, antes de hacer ejercicio le sugerimos que consulte a su médico.</li>
                                            <li>Si se produce algún cambio en su estado de salud en relación con las preguntas anteriores, le pedimos que informe inmediatamente al profesional responsable de su programa de entrenamiento.</li>
                                            <li>Si el médico Deportólogo le restringe el entrenamiento, entonces se concluye que es una persona no apta para continuar con el plan de entrenamiento.</li>
                                        </ol>
                                      <p style="color: #fff">Fitness People CMD no asume ninguna responsabilidad por las personas que inicien actividades físicas y que tengan dudas, omitan y/u oculten información al llenar los datos personales como titular de la información y este cuestionario.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p style="color: #fff;"><b>Confirmo que he leído, comprendido y completado este cuestionario y todas las preguntas fueron respondidas bajo mi propia responsabilidad, para constancia:</b></p>
                                    <asp:CheckBox ID="chAcepto1" runat="server" Text="ACEPTO Y AUTORIZO" style="color: #fff" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <%--<div class="form-group">
                                    <label style="color: #fff">Pregunta de validación: 3 + 1 =</label>
                                    <asp:TextBox ID="txbVerificacion" CssClass="form-control" runat="server" name="txbVerificacion"></asp:TextBox>
                                </div>--%>
                                <asp:Button ID="btnVerificar" runat="server" CssClass="btn_slider"
                                    Text="VERIFICAR" OnClick="btnVerificar_Click" />
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
         $("#range").ionRangeSlider({
             hide_min_max: true,
             keyboard: true,
             min: 10000,
             max: 200000,
             from: 19000,
             to: 99000,
             type: 'double',
             step: 1000,
             prefix: "$",
             grid: false
         });
         //var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
         var elems = Array.prototype.slice.call(document.querySelectorAll('input[type="checkbox"]'));
         elems.forEach(function (html) {
             var switchery = new Switchery(html, {
                 size: 'small'
             });
         });
     </script>
    <script>
        $('.footable').footable();
    </script>
</body>
</html>
