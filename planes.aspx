<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planes.aspx.cs" Inherits="WebPage.planes" %>

<%@ Register Src="~/controls/mainmenunew.ascx" TagPrefix="uc1" TagName="mainmenunew" %>
<%@ Register Src="~/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/controls/loginregister.ascx" TagPrefix="uc1" TagName="loginregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/fitnesspeople.js"></script>

    <noscript>
        <img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=1224942061553441&ev=PageView&noscript=1" />
    </noscript>

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
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PCVVM2CZ" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->
    <!-- Header ================================================== -->
    <header>
        <div class="container-fluid">
            <uc1:mainmenunew runat="server" ID="mainmenunew" />
        </div>
        <!-- End container -->
    </header>
    <!-- End Header =============================================== -->
    <!-- SubHeader =============================================== -->
    <asp:Literal ID="ltBannerFull" runat="server"></asp:Literal>
    <%--<section class="parallax_window_in" data-parallax="scroll" data-image-src="img/planeasy_1400x470.jpg" data-natural-width="1400" data-natural-height="470">
        <div id="sub_content_in">
            <h1 style="font-weight: 900;">PLAN EASY</h1>
        </div>
    </section>--%>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    <section id="feat1">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 fadeIn animated" data-wow-delay="0.2s">
                <div class="box_feat">
                    <%--<i class="fa fa-building fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                    <img src="img/svgtopng/Recurso-40.png" width="100px" />
                    <h3 style="font-weight: 900; color: #FFF;">10 Sedes</h3>
                    <p style="font-weight: 500; color: #FFF;">
                        Tenemos 8 sedes en Bucaramanga y toda su área metropolitana y 2 sedes más en Cúcuta.
                        <%--<br /><a href="sede_pg" style="font-weight: 900; color: #FFF;">Más información</a>--%>
                    </p>
                </div>
            </div>
            <div class="col-sm-4 fadeIn animated" data-wow-delay="0.5s">
                <div class="box_feat">
                    <%--<i class="fa fa-user-doctor fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                    <img src="img/svgtopng/Recurso-39.png" width="100px" />
                    <h3 style="font-weight: 900; color: #FFF;">Profesionales de la Salud</h3>
                    <p style="font-weight: 500; color: #FFF;">
                        Contamos con los mejores profesionales de la salud: Fisioterapeutas, médicos deportologos y nutricionistas.
                        <%--<br /><a href="sede_pg" style="font-weight: 900; color: #FFF;">Más información</a>--%>
                    </p>
                </div>
            </div>
            <div class="col-sm-4 fadeIn animated" data-wow-delay="1s">
                <div class="box_feat">
                    <%--<i class="fa fa-person-biking fa-5x" style="color: #E3FF00; text-shadow: 3px 3px 3px #1A1A1A; "></i>--%>
                    <img src="img/svgtopng/Recurso-33.png" width="100px" />
                    <h3 style="font-weight: 900; color: #FFF;">Clases individuales y grupales</h3>
                    <p style="font-weight: 500; color: #FFF;">
                        Más de 500 clases grupales y personalizadas al mes.
                        <%--<br /><a href="sede_pg" style="font-weight: 900; color: #FFF;">Más información</a>--%>
                    </p>
                </div>
            </div>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->
</section>

    <section class="margin_60_35" id="testimonials">
        <div class="container margin_60_35">
            <div class="row" style="display: flex;">
                <div class="col-md-6" style="display: flex; flex-direction: column; justify-content: space-around;">
                    <%--<h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00; ">¡Activa tu Plan Easy y entrena sin preocuparte por los pagos! 💳💪</h2>--%>
                    <h2 class="nomargin_top" style="font-weight: 900; color: #e3ff00; "><asp:Literal ID="ltTitulo" runat="server"></asp:Literal></h2>
                    <%--<p class="lead" style="color: #FFF; margin-top: 20px;">
                        ¿Cansado de estar pendiente cada mes del pago del gym?
                        <br/>
                        Con nuestro Plan Easy, te olvidas de eso. El cobro es automático mes a mes, para que tú solo te concentres en tu entrenamiento, como lo haces con tu disciplina.
                    </p>--%>
                    <p class="lead" style="color: #FFF; margin-top: 20px;"><asp:Literal ID="ltDescripcion" runat="server"></asp:Literal></p>
                    <%--<h2 class="lead" style="color: #FFF; margin-top: 0;">
                        <strong>🔥 Precio especial de campaña: $99.000 (antes $149.000)</strong>
                        <br/>
                        Solo por tiempo limitado, si lo activas antes del <strong>8 de junio</strong> de 2025.
                    </h2>
                    <p class="lead" style="color: #FFF;">
                        ✔ Sin filas
                        <br/>
                        ✔ Sin recordatorios
                        <br/>
                        ✔ Sin interrupciones en tu entrenamiento
                        <br/>
                        ✔ Todo desde tu cuenta, de forma segura y automática
                    </p>
                    <p class="lead" style="color: #FFF;"><strong>Haz clic en el botón, activa tu Plan Easy y disfruta del gym sin pausas.</strong></p>
                    <h2 class="nomargin_top" style="color: #FFF; margin-bottom: 0; font-weight: 900;">¡Porque lo más fácil es seguir entrenando!</h2>--%>
                    <%--<h2 class="nomargin_top" style="color: #FFF; margin-bottom: 0; font-weight: 900;"><asp:Literal ID="ltPrecioTotal" runat="server"></asp:Literal></h2>--%>
                    <asp:Literal ID="ltBotonPago" runat="server"></asp:Literal>
                    <%--<a href="https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23365" target="_blank" style="margin: 4rem 3rem 0 3rem;">
                        <button class="btn_1 add_bottom_15" style="width: 100%; background-color: black; font-size: x-large; margin-bottom: 0;">
                            ¡COMPRAR AQUI!
                        </button>
                    </a>--%>
                </div>
                <%--<div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs" style="display: flex; flex-direction: column; justify-content: center; cursor: pointer;" onclick="window.open('https://pagos.fitnesspeoplecolombia.com/index.php?r=pagos/pagoPlan&token=4cc23d7fecb8a312901ee6e46ae30455&user=&plan=23365', '_blank')">--%>
                    <%--<h2 class="nomargin_top" style="font-weight: 900;">&nbsp;</h2>--%>
                    <asp:Literal ID="ltImagenMarketing" runat="server"></asp:Literal>
                <%--</div>--%>
            </div>
            <!-- End row -->
        </div>
    </section>

    <div class="container_styled_1">
	<div class="container margin_60_35">
		<div class="row">
			<div class="col-md-12">
            
				<h3 class="nomargin_top" style="color: #fff; font-weight: 900; ">Preguntas frecuentes</h3>
				<div class="panel-group" id="works">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseOne_works">Puedo cancelar mi suscripción?<i class="indicator icon_minus_alt2 pull-right"></i></a>
                      </h4>
						</div>
						<div id="collapseOne_works" class="panel-collapse collapse in">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseTwo_works">Como funcionan los pagos automáticos?<i class="indicator icon_plus_alt2 pull-right"></i></a>
                      </h4>
						</div>
						<div id="collapseTwo_works" class="panel-collapse collapse">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseThree_works">Qué sucede si cambio de sede?<i class="indicator icon_plus_alt2 pull-right"></i></a>
                      </h4>
						</div>
						<div id="collapseThree_works" class="panel-collapse collapse">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#works" href="#collapseFour_works">Qué métodos de pago aceptan?<i class="indicator icon_plus_alt2 pull-right"></i></a>
							</h4>
						</div>
						<div id="collapseFour_works" class="panel-collapse collapse">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
				</div>
				<!-- End panel-group -->

				

			</div>
			<!-- End col-md-9 -->
		</div>
		<!-- End row -->
	</div>
	<!-- End container -->
</div>

    <section class="promo_full">
	<div class="promo_full_wp">
		<div>
			<h3 style="font-weight: 900;">Lo que dicen nuestros usuarios</h3>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="carousel_testimonials">
							<div>
								<div class="box_overlay">
									<div class="pic">
										<figure style="width: 100%; height: auto;"><img src="img/testimonios/comment1.png" alt="" />
										</figure>
									</div>
									<div class="comment">
										"El mejor ambiente para entrenar y poner mi cuerpo en armonia. Gracias Fitness People."
									</div>
								</div>
								<!-- End box_overlay -->
							</div>

							<div>
								<div class="box_overlay">
									<div class="pic">
										<figure style="width: 100%; height: auto;"><img src="img/testimonios/comment2.png" alt="" />
										</figure>
									</div>
									<div class="comment">
										"No nam indoctum accommodare, vix ei discere civibus philosophia. Vis ea dicant diceret ocurreret."
									</div>
								</div>
								<!-- End box_overlay -->
							</div>

							<div>
								<div class="box_overlay">
									<div class="pic">
										<figure style="width: 100%; height: auto;"><img src="img/testimonios/comment3.png" alt="" />
										</figure>
									</div>
									<div class="comment">
										"No nam indoctum accommodare, vix ei discere civibus philosophia. Vis ea dicant diceret ocurreret."
									</div>
								</div>
								<!-- End box_overlay -->
							</div>

						</div>
						<!-- End carousel_testimonials -->
					</div>
					<!-- End col-md-8 -->
				</div>
				<!-- End row -->
			</div>
			<!-- End container -->
		</div>
		<!-- End promo_full_wp -->
	</div>
	<!-- End promo_full -->
</section>

    <div id="newsletter_container" style="background-color: #000;">
        <div class="container margin_60">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <h3 style="font-weight: 600; color: #FFF;">ENTÉRATE DE NOTICIAS Y PROMOCIONES</h3>
                    <div id="message-newsletter"></div>
                    <form method="post" action="newsletter" name="newsletter" id="newsletter" class="form-inline">
                        <input name="email_newsletter" id="email_newsletter" type="email" value="" placeholder="Ingresa tu correo electrónico" class="form-control">
                        <button id="submit-newsletter" class="btn_1">SUSCRÍBETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End newsletter_container -->

    <div>
        <asp:Literal ID="ltMapa" runat="server"></asp:Literal>
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

</body>
</html>