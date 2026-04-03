<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="planes.ascx.cs" Inherits="WebPage.controls.planes" %>

<section id="planes" class="margin_60_35" style="padding-top: 10px; padding-bottom: 15px;">
    <div class="container" id="scroll-to">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
        <p class="lead styled" style="font-weight: 500; color: #FFF;">
            En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
        </p>
        <%--  + ANTES +  --%>
        <%--<div class="row text-center plans">
            <div class="col-md-4">
                <div class="img_container">
                    <a href="~/planesEasy.aspx" runat="server">
                        <img src="img/planes/plan-easy_2026-01-05.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="img_container plan-center">
                    <a href="planes?id=7">
                        <img src="img/planes/plan-12-meses_2026-02-03.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="img_container">
                    <a href="planes?id=5">
                        <img src="img/planes/plan-6-meses_2026-02-03.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>
        </div>--%>

        <%--  + AHORA +  --%>
        <%--<div class="row text-center plans">
            <div class="col-md-9">
                <div class="col-md-6">
                    <div class="img_container">
                        <a href="planes?id=5">
                            <img src="img/planes/plan-6-meses_2026-02-03.jpg" class="img-fluid plan-img" />
                        </a>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="img_container">
                        <a href="planes?id=32">
                            <img src="img/planes/plan-12-meses-duo_2026-02-17.jpg" class="img-fluid plan-img" />
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row text-center plans">
            <div class="col-md-9">
                <div class="col-md-6">
                    <div class="img_container">
                        <a href="planes?id=7">
                            <img src="img/planes/plan-12-meses_2026-02-03.jpg" class="img-fluid plan-img" />
                        </a>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="img_container">
                        <a href="~/planesEasy.aspx" runat="server">
                            <img src="img/planes/plan-easy_2026-01-05.jpg" class="img-fluid plan-img" />
                        </a>
                    </div>
                </div>
            </div>
        </div>--%>

        <%--<div class="row text-center plans">
            <div class="col-md-0" style="display: none;">
                <div class="img_container">
                    <a href="planes?id=1">
                        <img src="img/planes/01_plan-easy_2025-09-08.jpg" class="img-responsive" />
                    </a>
                </div>
            </div>

            <div class="col-md-6">
                <div class="img_container">
                    <a href="planes?id=10" style="display: flex; justify-content: center;">
                        <img src="img/planes/03_plan-6-mas-2_2025-09-08.jpg" class="img-responsive" style="height: 450px;" />
                    </a>
                </div>
            </div>

            <div class="col-md-6">
                <div class="img_container">
                    <a href="planes?id=16" style="display: flex; justify-content: center;">
                        <img src="img/planes/02_plan-3-mas-1_2025-09-08.jpg" class="img-responsive" style="height: 450px;" />
                    </a>
                </div>
            </div>
        </div>--%>
        <!-- End row plans-->


        <div class="plans-switch text-center">
            <a class="switch-btn active" data-target="mas-vendidos">
                Más Vendidos
            </a>
            <a class="switch-btn" data-target="recurrentes">
                Pagos Recurrentes
            </a>
            <a class="switch-btn" data-target="unicos">
                Pagos Únicos
            </a>
        </div>

        <div class="row plans plans-mas-vend">

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall plan-tall-oferta">
                    <p class="ribbon-3">Más recomendado</p>

                    <img src="img/planes-cards/plan-flexible-pro_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Flexible Pro</h2>
                        <h4 class="plan-title" style="font-size: 12px;">Plan Débito Automático</h4>

                        <p style="margin-bottom: 0;">Más beneficios desde el primer mes.</p>

                        <p class="plan-price">$ 19.900 1er Mes</p>
                        <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>
                        <p>DESPUÉS $99.500/mes</p>

                        <p class="plan-title">&nbsp;</p>

                        <p>Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['36'],
                                    'Plan Flexible Pro',
                                    29800,
                                    'https://www.dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3701'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>
    
                        <ul class="plan-features">
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">2 meses de cortesía.</span></li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta">
                    <img src="img/planes-cards/plan-12-meses_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Año Imparable</h2>
                        <h4 class="plan-title" style="font-size: 12px;">Plan 12 Meses</h4>

                        <p style="margin-bottom: 0;">Entrena sin pausas durante todo un año.</p>

                        <p class="plan-price">$ 990.000</p>

                        <p class="plan-title" style="font-size: 15px;">&nbsp;</p>

                        <p>&nbsp;</p>

                        <p class="plan-title">+ 2 meses gratis</p>

                        <p>Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['7'],
                                    'Plan Año Imparable (Plan 12 Meses)',
                                    990000,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3703'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>

                        <ul class="plan-features">
                            <li><i class="fa fa-circle-check"></i>2 meses de cortesía.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">Pago mensual automático.</span></li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End col-md-4 -->
        </div>
        <!-- End row plans recu -->

	    <div class="row plans plans-recu">
            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall-2">
                    <%--<p class="ribbon-3" style="width: 250px;">Entrena en una sola sede</p>--%>

                    <img src="img/planes-cards/plan-basico-mensual_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Básico Mensual</h2>

                        <%--<p style="margin-bottom: 0;">Ideal si entrenas siempre en una sola sede.</p>--%>
                        <p style="margin-bottom: 10px;">Entrena en una sola sede.</p>

                        <%--<p class="plan-price">$ 19.900 1er Mes</p>--%>
                        <p class="plan-price">$ 39.800 1er Mes</p>

                        <p class="plan-title" style="font-size: 15px;">+ $ 19.900 de Inscripción</p>

                        <p>DESPUÉS $79.600/mes</p>

                        <p>Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full" 
                                onclick="planAddToCart(
                                    ['35'],
                                    'Plan Básico Mensual',
                                    39800,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3700'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>

                        <ul class="plan-features">
                            <li><i class="fa fa-circle-check"></i>Acceso a ÚNICA sede.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">FP App (Nutrición).</span></li>
                            <li><i class="fa fa-circle-check"></i>1 cortesía mensual para un amigo.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
			<!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall plan-tall-oferta">
                    <p class="ribbon-3">Más recomendado</p>

                    <img src="img/planes-cards/plan-flexible-pro_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Flexible Pro</h2>

                        <%--<p style="margin-bottom: 0;">Entrena en todas nuestras sedes.</p>--%>
                        <p style="margin-bottom: 10px;">Entrena en todas nuestra sedes.</p>

                        <p class="plan-price">$ 19.900 1er Mes</p>

                        <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                        <p>DESPUÉS $99.500/mes</p>

                        <p>Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['36'],
                                    'Plan Flexible Pro',
                                    29800,
                                    'https://www.dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3701'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>
        
                        <ul class="plan-features">
                            <li><i class="fa fa-circle-check"></i>Acceso a TODAS las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
			<!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall-2">
                    <%--<p class="ribbon-3">Paga mes a mes</p>--%>

                    <img src="img/planes-cards/plan-mes-a-mes.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Mes a Mes</h2>

                        <%--<p style="margin-bottom: 0;">Empieza y termina cuando quieras.</p>--%>
                        <p style="margin-bottom: 10px;">Entrena en todas nuestra sedes.</p>

                        <p class="plan-price">$ 165.000 1er Mes</p>

                        <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>

                        <p>RENOVACIÓN MES A MES</p>

                        <p>Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['31'],
                                    'Plan Mes a Mes',
                                    92400,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3702'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>

                        <ul class="plan-features">
                            <li><i class="fa fa-circle-check"></i>Acceso a TODAS las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración y entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
			<!-- End col-md-4 -->
	    </div>
	    <!-- End row plans recu -->

        <div class="row plans plans-unic">
            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta">
                    <img src="img/planes-cards/plan-3-meses_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Trimestral</h2>
                        <h4 class="plan-title" style="font-size: 12px;">Plan 3 Meses</h4>

                        <p style="margin-bottom: 0;">Compromiso corto, resultados reales.</p>

                        <p class="plan-price">$ 350.000</p>
                        <%--<p>DESPUÉS $99.000</p>--%>

                        <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">&nbsp;</p>

                        <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 116.666/mes</p>

                        <p>Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['4'],
                                    'Plan Trimestral (Plan 3 Meses)',
                                    350000,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3705'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>

                        <ul class="plan-features">
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">2 meses de cortesía.</span></li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall plan-tall-oferta">
                    <p class="ribbon-3" >Más recomendado</p>

                    <img src="img/planes-cards/plan-12-meses_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Año Imparable</h2>
                        <h4 class="plan-title" style="font-size: 12px;">Plan 12 Meses</h4>

                        <p style="margin-bottom: 0;">Entrena sin pausas durante todo un año.</p>

                        <p class="plan-price">$ 990.000</p>
                        <%--<p>DESPUÉS $99.000</p>--%>

                        <%--<p class="plan-title" style="margin-bottom: 7px;">+ 2 meses gratis</p>--%>
                        <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">+ 2 meses gratis</p>

                        <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 70.714/mes</p>

                        <p>Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['7'],
                                    'Plan Año Imparable (Plan 12 Meses)',
                                    990000,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3703'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>

                        <ul class="plan-features">
                            <li><i class="fa fa-circle-check"></i>2 meses de cortesía.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta">
                    <%--<span class="ribbon-2"></span>--%>
                    <%--<p class="ribbon-3">Más beneficios</p>--%>

                    <img src="img/planes-cards/plan-6-meses_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Pro</h2>
                        <h4 class="plan-title" style="font-size: 12px;">Plan 6 Meses</h4>

                        <p style="margin-bottom: 0;">Invierte en ti y entrena sin excusas.</p>

                        <p class="plan-price">$ 590.000</p>

                        <p class="plan-title" style="margin-bottom: 10px; font-size: 15px;">&nbsp;</p>

                        <p class="plan-price" style="font-size: 18px; margin-bottom: 20px;">≈ $ 98.333/mes</p>

                        <p>Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['5'],
                                    'Plan Pro (Plan 6 Meses)',
                                    590000,
                                    'https://dash.fitmewise.com/admin/register/app/69a5f4eb88e88-3704'
                                ); return false;">
                                Comprar ya
                            </a>
                        </div>

                        <div class="plan-toggle">
                            <span>¿Qué incluye?</span>
                            <i class="fa fa-chevron-down toggle-icon"></i>
                        </div>
        
                        <ul class="plan-features">
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #191919;">2 meses de cortesía.</span></li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las sedes.</li>
                            <li><i class="fa fa-circle-check"></i>Acceso a todas las áreas de la sede.</li>
                            <li><i class="fa fa-circle-check"></i>Clases grupales con profesores.</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Valoración, entrenamiento y nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física inicial.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End col-md-4 -->
        </div>
        <!-- End row plans unic -->


        <%--<div class="banner-tarifas img_container"></div>

        <section style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container" style="display: flex; flex-direction: column;">
                <div class="row">
                    <div class="card-row-tarifas">
                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/01_tarifa-plan-easy_2025-01-05.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/02_tarifa-plan-3-meses_2025-01-05.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/03_tarifa-plan-6-meses_2025-01-05.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/04_tarifa-plan-10-meses_2025-01-05.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/05_tarifa-plan-12-meses_2025-01-05.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-4 add_bottom_15" >
                            <img src="img/tarifas/06_tarifa-plan-12-meses-duo_2026-02-17.png" class="img-responsive" />
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
    </div>
</section>

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const buttons = document.querySelectorAll(".switch-btn");
        const recurrentes = document.querySelector(".plans-recu");
        const unicos = document.querySelector(".plans-unic");
        const masVendidos = document.querySelector(".plans-mas-vend");

        unicos.style.display = "none";
        recurrentes.style.display = "none";

        const toggles = document.querySelectorAll(".plan-toggle");
        const features = document.querySelectorAll(".plan-features");

        let isOpen = false;

        buttons.forEach(btn => {
            btn.addEventListener("click", function () {

                // Quitar activo a todos
                buttons.forEach(b => b.classList.remove("active"));

                // Activar el actual
                this.classList.add("active");

                const target = this.getAttribute("data-target");

                if (target === "recurrentes") {
                    recurrentes.style.display = "flex";
                    unicos.style.display = "none";
                    masVendidos.style.display = "none";
                } else if (target === "unicos") {
                    recurrentes.style.display = "none";
                    unicos.style.display = "flex";
                    masVendidos.style.display = "none";
                } else {
                    recurrentes.style.display = "none";
                    unicos.style.display = "none";
                    masVendidos.style.display = "flex";
                }

                // Cerrar todos
                features.forEach(f => {
                    f.classList.remove("open");
                    f.style.maxHeight = null;
                });

                toggles.forEach(t => t.classList.remove("active"));

                isOpen = false;
            });
        });

        toggles.forEach(toggle => {
            toggle.addEventListener("click", function () {

                if (!isOpen) {
                    // Abrir todos
                    features.forEach(f => {
                        f.classList.add("open");
                        f.style.maxHeight = f.scrollHeight + "px";
                    });

                    toggles.forEach(t => t.classList.add("active"));

                    isOpen = true;
                } else {
                    // Cerrar todos
                    features.forEach(f => {
                        f.classList.remove("open");
                        f.style.maxHeight = null;
                    });

                    toggles.forEach(t => t.classList.remove("active"));

                    isOpen = false;
                }

            });
        });

    });

    function planAddToCart(contentId, contentName, value, paymentUrl) {

        window.dataLayer.push({
            event: 'add_to_cart',
            ecommerce: {
                items: [{
                    item_id: contentId,
                    item_name: contentName,
                    price: value,
                    currency: 'COP',
                    quantity: 1
                }]
            }
        });

        setTimeout(function () {
            window.open(paymentUrl, '_blank');
        }, 150);
    }

</script>

<style>

    .plans {
        margin: 50px auto 0px 0;
    }

    .plans-switch {
        display: flex;
        justify-content: center;
        margin: 0 20px;
    }

    .switch-btn {
        background: transparent;
        border: 2px solid #d6ff00;
        color: #d6ff00;
        padding: 10px 25px;
        margin: 0 10px;
        font-weight: 600;
        border-radius: 30px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .switch-btn:hover {
        background: #d6ff00;
        color: #000;
    }

    .switch-btn.active {
        background: #d6ff00;
        color: #000;
    }


    .plan-features {
        overflow: hidden;
        max-height: 0;
        opacity: 0;
        transition: max-height 0.35s ease, opacity 0.25s ease;
    }

    .plan-features.open {
        opacity: 1;
    }

    .plan-toggle {
        cursor: pointer;
        font-weight: 600;
        margin-top: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .plan-toggle .toggle-icon {
        transition: transform 0.3s ease;
    }

    .plan-toggle.active .toggle-icon {
        transform: rotate(180deg);
    }


    .plans-wrapper {
        margin: 60px auto 0px 0;
    }

    .plans-carousel {
        width: auto;
    }

    @media (max-width: 992px) {
        .plans-wrapper {
            margin-top: 25px;
        }
    }


    .banner-promo {
        background-image: url('img/banners/plan-12-meses-duo_2026-02-25.jpg');
        background-size: cover;
        background-position: center;
        height: 470px;
    }

    @media (max-width: 1000px) {
        .plans {
            margin: 0 auto 0 0;
        }

        .banner-promo {
            background-image: url('img/banners/plan-12-meses-duo_mobile_2026-02-25.jpg');
        }
    }

</style>