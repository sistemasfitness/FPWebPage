<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verificacion.aspx.cs" Inherits="WebPage.verificacion" %>

<%@ Register Src="~/controls/mainmenu.ascx" TagPrefix="uc1" TagName="mainmenu" %>
<%@ Register Src="~/controls/mapasedeadministrativa.ascx" TagPrefix="uc1" TagName="mapasedeadministrativa" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>
<%@ Register Src="~/controls/infocontacto.ascx" TagPrefix="uc1" TagName="infocontacto" %>


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
                        <%--<div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label>EPS:</label>
                                    <asp:DropDownList ID="ddlEPS" runat="server" CssClass="form-control" 
                                        DataTextField="NombreEps" DataValueField="idEps" AppendDataBoundItems="true">
                                        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>--%>
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
                                                    <p>
                                                        Apreciado usuario: <b>Fitness People CMD</b> lo invita a responder el siguiente cuestionario, que contiene preguntas vitales para su salud antes de iniciar su <b>PROGRAMA DE PROMOCIÓN EN LA SALUD y PREVENCIÓN DE LA ENFERMEDAD</b> en un programa de entrenamiento.<br />
                                                        <br />
                                                        Seleccione la casilla de respuesta según sea el caso.
                                                    </p>
                                                    <table class="table" style="background: #3c3c3c;">
                                                        <tr>
                                                            <th>Preguntas</th>
                                                            <th colspan="2">Respuestas</th>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <td>&nbsp;</td>
                                                            <td>Si</td>
                                                            <td>No</td>
                                                        </tr>
                                                        <asp:Repeater ID="rpParq" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="vertical-align: middle;">
                                                                        <%# Eval("PreguntaParq") %>
                                                                        <asp:HiddenField ID="hfIdParq" runat="server" Value='<%# Eval("idParq") %>' />
                                                                    </td>
                                                                    <td style="text-align: center; vertical-align: middle;">
                                                                        <asp:CheckBox ID="chbRespuestaSi" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: center; vertical-align: middle;">
                                                                        <asp:CheckBox ID="chbRespuestaNo" runat="server" />
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

                                <h3 class="nomargin_top" style="color: #fff; font-weight: 900;">Autorizaciones</h3>
                                <div class="panel-group" id="works">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseOne_works">SI RESPONDIÓ SÍ A UNA O MÁS PREGUNTAS:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne_works" class="panel-collapse in" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>Fitness People CMD lo remitirá con el médico del deporte quien lo(a) examinará de manera amable y profesional evaluando de forma segura y diagnosticando con un tratamiento oportuno, por medio de un plan de entrenamiento de acuerdo a su estado de salud el cual le será entregado después de la valoración.</p>
                                                            <p>Fitness People CMD le asignará una cita con un(a) valorador físico (Fisioterapeuta) quien lo(a) examinará y entregará una prescripción para iniciar su programa de promoción en su salud y prevención de la enfermedad mediante un plan de entrenamiento.
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
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <asp:CheckBox ID="chAcepto1" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseTwo_works">CONDICIONES DEL PRESTADOR:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo_works" class="panel-collapse collapse" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>Manifiesto  expresa e inequívocamente, conocer y aceptar las condiciones de EL PRESTADOR, entidad a la que autorizo bajo mi absoluta responsabilidad mi inscripción y vinculación al programa de PROMOCIÓN EN LA SALUD Y PREVENCIÓN DE LA ENFERMEDAD A TRAVÉS DEL DEPORTE Y LA RECREACIÓN, con el fin de contribuir a promover el cuidado integral de mi salud. Manifiesto que se me ha informado sobre el funcionamiento y conocimiento de las instalaciones; que diligencio y acepto mediante mi firma electrónica; el PAR-Q PHYSICAL ACTIVITY READINNES QUESTIONNAIRE (Cuestionario de preparación para la actividad física); acepto mediante este consentimiento escrito la matricula; entregaré la información de mi real estado de salud y datos personales; incorporaré mi huella digital para el control de acceso biométrico y registro. Entiendo y acepto que para el uso y goce de los servicios, equipos e instalaciones hay términos, condiciones y restricciones, un reglamento interno en donde me explican los derechos, deberes, obligaciones, recomendaciones ambientales, manejo de higiene y salubridad, responsabilidades y medidas preventivas como usuario, También me informaron que daré inicio a un programa básico de adaptación (contiene ejercicios básicos susceptibles de modificación por parte de un profesional de planta, dependiendo de mis condiciones físicas); mientras ingreso a consulta con la fisioterapeuta para la valoración física y posterior solicitaré en recepción mi programa de entrenamiento para promover mi salud; Las valoraciones físicas de control tienen una frecuencia de tres meses, excepto cuando hayan cambios susceptibles en mi salud; si tengo una patología o evidencia en el PAR-Q seré remitido a valoración de medicina del deporte. PARAGRAFO PRIMERO: En caso de remisión a medicina deportiva el término para ser valorado y recibir las recomendaciones junto con el programa de entrenamiento es de 30 días hábiles. Posteriormente iniciaré el programa de entrenamiento con la asesoría y acompañamiento por parte del profesional de planta. Actualmente estoy afiliado a una E.P.S o A.R.S; en caso de no estar afiliado asumo completamente toda responsabilidad que cause la no afiliación a la seguridad social integral. PARAGRAFO SEGUNDO: TELECONSULTA: autorizo libre y voluntariamente me  sea realizada la consulta para valoración de medicina deportiva , Fisioterapia o Nutrición por la Modalidad de Tele-consulta; me fueron explicados los beneficios, tales como la facilidad al acceso, la oportunidad y resolutividad  en la prestación del servicio por medio del intercambio de datos; garantizando una atención integral, oportuna y de alta calidad en cualquiera de las fases de la atención en salud. Igualmente fui informado por  EL PRESTADOR, que cuenta con talento humano en salud con las capacidades técnico científicas y con las tecnologías de información y de comunicación suficientes y necesarias para brindar el apoyo en cualquiera de las fases de la atención de mi salud en las valoraciones en fisioterapia, nutrición y medicina del deporte por Telemedicina, entre los cuales me fueron informados.- i) En casos excepcionales, la información transmitida puede no ser suficiente (p. ej. Baja resolución de las imágenes) para permitir una toma apropiada de decisiones médicas por parte del médico.- ii) Podrían ocurrir demoras en la entrega de la valoración y programas de entrenamiento, debido a deficiencias o fallos en el equipo electrónico.- iii) El Usuario podrá  revocar en cualquier momento el consentimiento para consulta de valoración física o nutricional por modalidad de Telemedicina sin consecuencia alguna. Entiendo que EL PRESTADOR del servicio, no asume ninguna responsabilidad por la omisión, ocultamiento y/o incumplimiento en la información suministrada por  EL USUARIO en PAR-Q PHYSICAL ACTIVITY READINNES QUESTIONNAIRE (Cuestionario de preparación para la actividad física), en mi valoración física, así como la extralimitación de las prescripciones, entregadas por parte de los profesionales de la salud y el deporte y la violación al Reglamento interno; igualmente EL PRESTADOR, se reserva el derecho de admisión.</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <asp:CheckBox ID="chAcepto2" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseThree_works">AUTORIZACION DEL TITULAR PARA EL TRATAMIENTO Y PROTECCION DE LA INFORMACIÓN EN NUESTRAS BASES DE DATOS:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree_works" class="panel-collapse collapse" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>Adhiero mi consentimiento autorizando a EL PRESTADOR, a realizar el tratamiento de los datos personales que se recolecten, almacenen, usen, circulen y supriman, en los documentos y medios tecnológicos empleados por EL PRESTADOR. Que como titular de la información autorizo de manera previa, expresa e informada e inequívoca a EL PRESTADOR, y/o a través de terceros para que realice recolección, uso, circulación, transmisión, transferencia, almacenamiento y supresión de mis datos personales, con la finalidad de ofrecer    nuestros productos y servicios, comunicar noticias y avisos promocionales, realizar estudios, actualizaciones de datos, acuerdos comerciales, contractuales, administrativos, de seguridad y en caso determinado informativo, cuando se trate de fotos y/o videos de EL PRESTADOR, que se publicarán en la página Web de EL PRESTADOR para el desarrollo de la misión institucional, de conformidad con lo establecido en la Ley Estatutaria 1581 de 2012. Que EL PRESTADOR, siendo el responsable del tratamiento de datos, por sí misma o en  asocio con otros, propende por la protección de los derechos de sus usuarios, contratistas, proveedores y demás partes interesadas, tipificadas en la Constitución Política y en la Ley Estatutaria 1581 de 2012, descritos en el Título II Principios Rectores. Los titulares de la  información podrán ejercer sus derechos, condiciones de legalidad y procedimientos para el tratamiento de la información, en el Manual de Protección de Datos Personales, ubicado en la página web: www.fitnesspeoplecolombia.com, a través de la línea telefónica 3153715258, o mediante comunicación escrita dirigida al correo electrónico direccionadministrativa@fitnesspeoplecmd.com. Que EL PRESTADOR, cuenta con un sistema de video vigilancia y control de acceso biométrico al interior de las instalaciones, los cuales tienen como finalidad la vigilancia de los espacios para garantizar la seguridad de usuarios, contratistas, proveedores y demás visitantes que ingresan a nuestras instalaciones. De igual manera el sistema de videovigilancia tiene otras finalidades, como son; la protección de equipos, dispositivos y elementos que allí se encuentren, para el Sistema de Gestión y Seguridad en el Trabajo SG-SST, accidentes e incidentes de trabajo,   eventos adversos y aspectos laborales en materia disciplinaria. Así mismo, se encuentran localizados avisos visibles y legibles al ingreso de  la Institución y en las demás áreas de videovigilancia, donde se indican a los titulares, acerca de la recolección de imágenes. Los procedimientos para el tratamiento que exige la norma los encontrarán en el Manual de Protección de Datos Personales, anexo sistema de videovigilancia. Que como titular cuento con la libertad de contestar las preguntas que se formulan en los formatos suministrados para los   diferentes procesos y a su vez autorizo que los datos sensibles recolectados se utilicen para cumplir la misión institucional a desarrollar en  las instalaciones de EL PRESTADOR.</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <asp:CheckBox ID="chAcepto3" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseFour_works">POLITICA DE SISTEMA DE PREVENCIÓN Y CONTROL DEL LAVADO DE ACTIVOS, LA FINANCIACION DEL TERRORISMO Y FINANCIAMIENTO DE LA PROLIFERACIÓN DE ARMAS DE DESTRUCCIÓN MASIVA:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseFour_works" class="panel-collapse collapse" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>El usuario conoce, entiende y acepta de manera voluntaria e inequívoca que EL PRESTADOR en cumplimiento de su obligación legal de prevenir y controlar el lavado de activos, la financiación del terrorismo y de la proliferación de armas de destrucción masiva, podrá cancelar sin previo aviso el contrato de prestación de servicios del USUARIO, cuando se observen o presenten uno o varios de los siguientes comportamientos. a. Cuando EL USUARIO haya sido incluido en listas internacionales tales como la ONU y la UNION EUROPEA. b. Cuando se verifique el inicio de una investigación o condena al titular o USUARIO por una autoridad competente relacionados con temas LAFT – FPADM o cualquier delito conexo en el código penal Colombiano. c. Cuando se detecten transacciones o actividad comercial entre EL USUARIO y una persona u organización vinculada en listas restrictivas / vinculantes o actividades ilícitas. d. Cuando se identifique que los pagos del USUARIO, está siendo empleado para mover recursos provenientes de actividades ilícitas o cuyo destino sea el patrocinio de actividades ilícitas. e. Si al requerir al USUARIO que presente justificación de operaciones catalogadas como inusuales o atípicas, éste se rehúse a suministrarla o entregue información errada, inexacta o inconsistente. LEGISLACION APLICABLE Ley 1581 de 2012 – Decreto Reglamentario 1377 de 2013 – Ley 1072 de 2015 COMPROMISO DEL USUARIO • Mantener actualizado sus datos personales • Mantener la confidencialidad de su clave / contraseña o método biométrico de acceso la cual es de uso personal e intransferible • No encontrarse involucrado por investigación o restricción o acción penal en especial con referente al lavado de activos.</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <asp:CheckBox ID="chAcepto4" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseFive_works">POLÍTICA DE CANCELACIÓN, SUSPENCIÓN, INCTIVACIÓN Y EXCLUSIÓN COMO USUARIO:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseFive_works" class="panel-collapse collapse" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>Sin perjuicio de otras medidas EL PRESTADOR se reserva el DERECHO DE ADMISIÓN y a su exclusiva discreción de cancelar o suspender, inactivar de forma inmediata el registro como USUARIO en el caso en que se verifique cualquiera de los siguientes eventos. • Incumplir cualquiera de las cláusulas del contrato de prestación de servicios para el uso de las instalaciones y servicios: a. Objeto del contrato, b. MODULO 1.- TERMINOS, CONDICIONES Y RESTRICCIONES c. MODULO 2.- RECOMENDACIONES AMBIENTALES DE HIGIENE Y SALUBRIDAD d. MODULO 3.- RESPONSABILIDADES, MEDIDAS PREVENTIVAS Y RESTRICTIVAS e. MODULO 4.- REGLAMENTO INTERNO: Derechos, Deberes y obligaciones, • Omitir y/o ocultar información sobre su estado de salud • Incumplimiento de la política en el sistema de prevención y control de lavado de activos, la financiación del terrorismo y financiamiento de la proliferación de armas de destrucción masiva – SIPLAFT / FPADM • Si el USUARIO incurre en conductas en detrimento del PRESTADOR.</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <asp:CheckBox ID="chAcepto5" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="font-weight: 600;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseSix_works">DERECHOS DE PROPIEDAD INDUSTRIAL Y PROPIEDAD INTELCTUAL:<i class="indicator icon_minus_alt2 pull-right"></i></a>
                                            </h4>
                                        </div>
                                        <div id="collapseSix_works" class="panel-collapse collapse" style="background: #3c3c3c;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p>El software usado para la comercialización del servicio y sus mecánicas adicionales y/o complementarias, el material gráfico, publicitario, fotográfico, de multimedia, audiovisual, o de diseño, así como los contenidos, textos y bases de datos; las marcas, nombres comerciales y signos distintivos contenidos en la pagina web www.fitnesspeoplecolombia.com son de propiedad del PRESTADOR que ha licenciado y concedido su uso, por tanto se considerará uso indebido de los mismos, cualquier modificación o alteración que realice EL USUARIO o cualquier tercero con fines comerciales sin autorización expresa del PRESTADOR.</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group" style="margin-bottom: 0;">
                                                            <p><b>Confirmo que he leído, comprendido y completado este cuestionario y todas las preguntas fueron respondidas bajo mi propia responsabilidad, para constancia:</b></p>
                                                            <asp:CheckBox ID="chAcepto6" CssClass="chk-autorizacion" runat="server" Text="ACEPTO Y AUTORIZO" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row margin_30">
                            <div class="col-md-12">
                                <asp:Button 
                                    ID="btnVerificar" 
                                    runat="server" 
                                    CssClass="btn_slider"
                                    Text="VERIFICAR" 
                                    OnClick="btnVerificar_Click" 
                                    OnClientClick="return validarYEjecutar();" 
                                    UseSubmitBehavior="false" />
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

    <uc1:mapasedeadministrativa runat="server" ID="mapasedeadministrativa" />

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

         // VALIDACIÓN DE FORMULARIO
         function validarCamposFormulario() {
             const campos = [
                 { id: "<%= txbNombres.ClientID %>", msg: "Por favor, ingresa tu nombre." },
                 { id: "<%= txbApellidos.ClientID %>", msg: "Por favor, ingresa tus apellidos." },
                 { id: "<%= txbCorreo.ClientID %>", msg: "Por favor, ingresa tu correo electrónico.", tipo: "correo" },
                 { id: "<%= txbCelular.ClientID %>", msg: "Por favor, ingresa tu número de celular." },
                 { id: "<%= txbDireccion.ClientID %>", msg: "Por favor, ingresa la dirección en la que resides." },
                 { id: "<%= txbFechaNacimiento.ClientID %>", msg: "Por favor, ingresa tu fecha de nacimiento.", tipo: "fecha" },
                 { id: "<%= txbResponsable.ClientID %>", msg: "Por favor, ingresa el nombre del contacto de emergencia.", },
                 { id: "<%= txbContacto.ClientID %>", msg: "Por favor, ingresa el teléfono del contacto de emergencia." }
             ];

             for (let campo of campos) {
                 const input = document.getElementById(campo.id);

                 if (!input || !input.value.trim()) {
                     mostrarAlerta("Campo requerido", campo.msg, "warning", input);
                     return false;
                 }

                 if (campo.tipo === "correo" && !correoValido(input.value)) {
                     mostrarAlerta("Correo inválido", "Ingresa un correo electrónico válido.", "warning", input);
                     return false;
                 }

                 if (campo.tipo === "fecha" && !fechaValida(input.value)) {
                     mostrarAlerta("Fecha inválida", "La fecha de nacimiento no es válida.", "warning", input);
                     return false;
                 }
             }

             return true;
         }


         // VALIDACIÓN DE CHECKBOX
         function validarAutorizaciones() {
             const contenedores = document.querySelectorAll(".chk-autorizacion");

             return [...contenedores].every(c => {
                 const checkbox = c.querySelector("input[type='checkbox']");
                 return checkbox && checkbox.checked;
             });
         }


         //FUNCIÓN PRINCIPAL
         function validarYEjecutar() {

             if (!validarAutorizaciones()) {
                 mostrarAlerta(
                     "Confirmación requerida",
                     "Debes aceptar todas las autorizaciones para continuar.",
                     "warning"
                 );
                 return false;
             }

             if (!validarCamposFormulario()) {
                 return false;
             }

             __doPostBack("<%= btnVerificar.UniqueID %>", "");
             return false;
         }


         // VALIDACIONES AUXILIARES
         function correoValido(correo) {
             return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo);
         }

         function fechaValida(fechaStr) {
             const fecha = new Date(fechaStr);
             const hoy = new Date();

             if (isNaN(fecha.getTime())) return false;
             if (fecha >= hoy) return false;

             return true;
         }


         // ALERTA REUTILIZABLE
         function mostrarAlerta(titulo, mensaje, tipo, enfoque) {
             Swal.fire({
                 title: titulo,
                 text: mensaje,
                 icon: tipo,
                 background: "#3C3C3C",
                 confirmButtonText: "Aceptar",
                 customClass: {
                     popup: "alert",
                     confirmButton: "btn-confirm-alert"
                 },
                 didClose: () => {
                     if (enfoque) enfoque.focus();
                 }
             });
         }

     </script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>
</body>
</html>
