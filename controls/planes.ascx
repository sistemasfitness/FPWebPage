<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="planes.ascx.cs" Inherits="WebPage.controls.planes" %>

<section id="planes" class="margin_60">
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

                        <p class="plan-price">$ 9.900 1er Mes</p>
                        <p class="plan-title" style="font-size: 15px;">Sin inscripción</p>
                        <p class="plan-sub-title-white">DESPUÉS $99.000/mes</p>

                        <p class="plan-title">&nbsp;</p>

                        <p class="plan-sub-title-white">Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['40'],
                                    'Plan Flexible Pro',
                                    9900,
                                    'register?token=aKsoXcm34Ca4sMKeHraR'
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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
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

                        <p class="plan-sub-title-white">&nbsp;</p>

                        <p class="plan-title">+ 2 meses gratis</p>

                        <p class="plan-sub-title-white">Sin fidelidad</p>

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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
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
            <%--<div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall-2">
                    <img src="img/planes-cards/plan-basico-mensual_2026-02-27.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Básico Mensual</h2>

                        <p style="margin-bottom: 10px;">Entrena en una sola sede.</p>

                        <p class="plan-price">$ 39.800 1er Mes</p>

                        <p class="plan-title" style="font-size: 15px;">+ $ 19.900 de Inscripción</p>

                        <p>DESPUÉS $79.600/mes</p>

                        <p>Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full" 
                                onclick="planAddToCart(
                                    ['41'],
                                    'Plan Básico Mensual',
                                    59700,
                                    'register?token=4wCAVQZWA8KMirx9Q8hs'
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
            </div>--%>
			<!-- End col-md-4 -->

            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall-2">
                    <img src="img/planes-cards/plan-transformate.jpeg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Transformate</h2>

                        <p style="margin-bottom: 10px;">Entrena para lograr tu mejor versión.</p>

                        <p class="plan-price">$ 29.900 1er Mes</p>

                        <p class="plan-sub-title">Sin inscripción</p>

                        <p class="plan-sub-title-white">DESPUÉS $130.000/mes</p>

                        <p class="plan-sub-title">Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full" 
                                onclick="planAddToCart(
                                    ['43'],
                                    'Plan Transformate',
                                    29900,
                                    'register?token=XK6ZYbmaYkihB41O73I8'
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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para un amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Comunidad VIP.</li>
                            <li><i class="fa fa-circle-check"></i>Valoración física trimestral (4 en un año).</li>
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
                        <p style="margin-bottom: 10px;">Entrena en todas nuestras sedes.</p>

                        <p class="plan-price">$ 9.900 1er Mes</p>

                        <p class="plan-sub-title">Sin inscripción</p>

                        <p class="plan-sub-title-white">DESPUÉS $99.000/mes</p>

                        <p class="plan-sub-title">Fidelidad de 6 meses</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['40'],
                                    'Plan Flexible Pro',
                                    9900,
                                    'register?token=aKsoXcm34Ca4sMKeHraR'
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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-xmark"></i><span style="color: #3C3C3C;">Comunidad VIP.</span></li>
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

                        <p style="margin-bottom: 10px">Empieza y termina cuando quieras.</p>
                        <%--<p style="margin-bottom: 10px;">Entrena en todas nuestras sedes.</p>--%>

                        <p class="plan-price">$ 165.000 1er Mes</p>

                        <p class="plan-sub-title">Sin inscripción</p>

                        <p class="plan-sub-title-white">RENOVACIÓN MES A MES</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['42'],
                                    'Plan Mes a Mes',
                                    165000,
                                    'register?token=nji06llzEYJSdjPNh2Dg'
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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
                            <li><i class="fa fa-circle-check"></i>5 cortesías mensuales para amigos.</li>
                            <li><i class="fa fa-circle-check"></i>Pago mensual automático.</li>
                            <li><i class="fa fa-circle-check"></i>Membresía incluida.</li>
                            <li><i class="fa fa-circle-check"></i>Comunidad VIP.</li>
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

                        <p class="plan-sub-title">&nbsp;</p>

                        <p class="plan-title-white">≈ $ 116.666/mes</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
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
                        <p class="plan-sub-title">+ 2 meses gratis</p>

                        <p class="plan-title-white">≈ $ 70.714/mes</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
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

                        <p class="plan-sub-title">&nbsp;</p>

                        <p class="plan-title-white">≈ $ 98.333/mes</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

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
                            <li><i class="fa fa-circle-check"></i>FP App (Plan de entrenamiento).</li>
                            <li><i class="fa fa-circle-check"></i>FP App (Tips de nutrición).</li>
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

    <div class="container">
        <div id="paymentModal" class="payment-modal">
            <div id="paymentContainer" class="payment-container">

                <div id="paymentHeader" class="payment-header">
                    <h2 style="font-weight: 900; color: #E3FF00;">Paso 1: Crea tu perfil y empieza hoy en Fitness People</h2>
                    <button type="button" onclick="closePayment()" class="btn-close">✕</button>
                </div>

                <iframe id="paymentFrame" src=""></iframe>

            </div>
        </div>
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

    function isMobile() {
        return /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
    }

    function openPaymentInline(url) {

        if (isMobile() || url.includes("register?token=")) {
            // 🔥 abrir fuera del iframe (100% confiable)
            window.location.href = url;
            return;
        }

        const container = document.getElementById("paymentContainer");
        const iframe = document.getElementById("paymentFrame");
        const header = document.getElementById("paymentHeader");

        // Mostrar el contenedor
        container.style.display = "block";

        // Mostrar botón cerrar
        header.style.display = "flex";

        // Cargar URL en el iframe
        iframe.src = url;

        // Bajar suavemente hasta el iframe
        setTimeout(() => {
            container.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        }, 100);
    }


    function closePayment() {

        const container = document.getElementById("paymentContainer");
        const iframe = document.getElementById("paymentFrame");
        const planes = document.getElementById("planes");
        const header = document.getElementById("paymentHeader");

        // Limpiar iframe (detiene el proceso)
        iframe.src = "";

        // Ocultar contenedor
        container.style.display = "none";

        // Ocultar botón cerrar otra vez
        header.style.display = "none";

        // Subir suavemente a los planes
        setTimeout(() => {
            planes.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        }, 100);
    }

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
            openPaymentInline(paymentUrl);
        }, 150);
    }

</script>

<style>

    .payment-container {
        display: none;
        width: 100%;
        margin-top: 30px;
    }

    .payment-header {
        display: none;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .btn-close {
        background: #000;
        color: #fff;
        border: none;
        padding: 10px 15px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 50%;
        width: 40px;
        height: 40px;
    }

    #paymentFrame {
        width: 100%;
        height: 85vh;
        border: none;
        border-radius: 10px;
    }

    /* 📱 Mobile */
    @media (max-width: 768px) {
        #paymentFrame {
            height: 100vh;
            border-radius: 0;
        }

        .payment-header {
            position: sticky;
            top: 35px;
            padding: 10px;
            z-index: 10;
            background-color: #000000;
        }
    }




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



    @media (max-width: 1000px) {
        .plans {
            margin: 0 auto 0 0;
        }
    }

    @media (max-width: 768px) {
        .switch-btn {
            padding: 5px 13px;            
        }
    }

</style>