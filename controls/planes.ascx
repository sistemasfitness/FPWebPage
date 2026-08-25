<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="planes.ascx.cs" Inherits="WebPage.controls.planes" %>

<%@ Register Src="~/controls/PlanCard.ascx" TagPrefix="uc" TagName="PlanCard" %>

<%--<section id="planes2" class="margin_60">
    <div class="container" id="scroll-to">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
        <p class="lead styled" style="font-weight: 500; color: #FFF;">
            En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
        </p>

        <div class="container" id="planesSelector">
            <div class="row">
                <div class="col-12">
                    <h3 class="main_title" style="font-weight: 900; color: #e3ff00; margin-bottom: 30px;">¿Dónde quieres entrenar? Selecciona tu sede y luego elige tu plan</h3>
                </div>

                <div class="col-12">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Ciudad:</label>
                            <select id="ddlCiudadPlanes" class="form-control" style="background:#1A1A1A;"></select>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label>Sede:</label>
                            <select id="ddlSedePlanes" class="form-control" style="background:#1A1A1A;"></select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="">
                <p id="mensaje"
                    style="
                        display:none;
                        color:#E3FF00;
                        font-weight:700;
                        text-align:center;
                        text-decoration: underline;
                    ">
                </p>
            </div>
        </div>


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

                        <p class="plan-price">GRATIS 1er Mes</p>
                        <p class="plan-title" style="font-size: 15px;">$ 9.900 de inscripción</p>
                        <p class="plan-sub-title-white">DESPUÉS $99.000/mes</p>

                        <p class="plan-sub-title-white-2">No aplica para pagos en efectivo, <br /> transferencia ni datáfono.</p>

                        <p class="plan-sub-title-white">Fidelidad de 12 meses, Aplica multa</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['40'],
                                    'Plan Flexible Pro',
                                    9900, 
                                    'register?token=TKIlFPP8XYRC9l1rfGjR'
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

                        <p class="plan-sub-title-white" style="margin-top: 35px;">Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#"
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['7'],
                                    'Plan Año Imparable',
                                    990000
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
            <div class="col-md-4" style="padding: 0;">
                <div class="plan plan-oferta plan-tall-2">
                    <img src="img/planes-cards/plan-transformate.jpeg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Transfórmate</h2>

                        <p style="margin-bottom: 10px;">Entrena para lograr tu mejor versión.</p>

                        <p class="plan-price">$ 29.900 1er Mes</p>

                        <p class="plan-sub-title">Sin inscripción</p>

                        <p class="plan-sub-title-white">DESPUÉS $130.000/mes</p>

                        <p class="plan-sub-title">Fidelidad de 6 meses</p>

                        <p class="plan-sub-title-white-2">No aplica para pagos en efectivo, <br /> transferencia ni datáfono.</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full" 
                                onclick="planAddToCart(
                                    ['43'],
                                    'Plan Transformate',
                                    29900
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

                        <p style="margin-bottom: 10px;">Entrena en todas nuestras sedes.</p>

                        <p class="plan-price">GRATIS 1er Mes</p>

                        <p class="plan-sub-title">$ 9.900 de inscripción</p>

                        <p class="plan-sub-title-white">DESPUÉS $99.000/mes</p>

                        <p class="plan-sub-title">Fidelidad de 12 meses, Aplica multa</p>

                        <p class="plan-sub-title-white-2">No aplica para pagos en efectivo, <br /> transferencia ni datáfono.</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['40'],
                                    'Plan Flexible Pro',
                                    9900, 
                                    'register?token=TKIlFPP8XYRC9l1rfGjR'
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
                    <img src="img/planes-cards/plan-mes-a-mes.jpg" alt="img" />

                    <div class="plan-info">
                        <h2 class="plan-title">Plan Mes a Mes</h2>

                        <p style="margin-bottom: 10px">Empieza y termina cuando quieras.</p>

                        <p class="plan-price">$ 165.000 1er Mes</p>

                        <p class="plan-sub-title">Sin inscripción</p>

                        <p class="plan-sub-title-white">RENOVACIÓN MES A MES</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

                        <p class="plan-sub-title-white-2">No aplica para pagos en efectivo, <br /> transferencia ni datáfono.</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['42'],
                                    'Plan Mes a Mes',
                                    165000
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

                        <p class="plan-sub-title">&nbsp;</p>

                        <p class="plan-title-white">≈ $ 116.666/mes</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn_full"
                                onclick="planAddToCart(
                                    ['4'],
                                    'Plan Trimestral',
                                    350000
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

                        <p class="plan-sub-title">+ 2 meses gratis</p>

                        <p class="plan-title-white">≈ $ 70.714/mes</p>

                        <p class="plan-sub-title">Sin fidelidad</p>

                        <div class="text-center">
                            <a href="#" 
                                class="btn-confirm-alert"
                                onclick="planAddToCart(
                                    ['7'],
                                    'Plan Año Imparable',
                                    990000
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
                                    'Plan Pro',
                                    590000
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
</section>--%>


<section id="planes" class="fp-planes">
    <div class="fpp-container">
        <!-- ================= ENCABEZADO ================= -->
        <div class="fpp-head">
            <div>
                <p class="fpp-kicker">Planes Fitness People</p>
                <h2>Elige tu <span>plan</span></h2>
            </div>
            <a href="javascript:void(0);" class="fpp-btn-ghost" id="btnTipoPlanes">Ver planes especiales</a>
        </div>

        <!-- ================= PLANES MÁS VENDIDOS ================= -->
        <div class="planes-mas-vendidos active">
            <div class="fpp-grid ">
                <!-- ================= PLAN MES A MES ================= -->
                <uc:PlanCard
                    ID="MesAMes"
                    runat="server"
                    PlanId="MES_A_MES" />

                <!-- ============ PLAN FLEXIBLE PRO (DESTACADO) ============ -->
                <uc:PlanCard
                    ID="PlanFlexiblePro"
                    runat="server"
                    PlanId="FLEXIBLE_PRO" />

                <!-- ================= PLAN AÑO IMPARABLE ================= -->
                <uc:PlanCard
                    ID="PlanAnoImparable"
                    runat="server"
                    PlanId="ANIO_IMPARABLE" />
            </div>
        </div>

        <!-- ================= PLANES ESPECIALES ================= -->
        <div class="planes-especiales">
            <div class="fpp-grid">
                <!-- ================= PLAN ESTUDIANTES ================= -->
                <uc:PlanCard
                    ID="Estudiantes"
                    runat="server"
                    PlanId="ESTUDIANTES" />

                <!-- ================= PLAN RESIDENTES ================= -->
                <uc:PlanCard
                    ID="Residentes"
                    runat="server"
                    PlanId="RESIDENTES" />
            </div>
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

        <!-- ================= NOTA FINAL ================= -->
        <p class="fpp-note">
            ¿Primera vez en Fitness People? <a href="agendaDiaCortesia">Tu primer día es GRATIS</a> — reserva tu clase de cortesía.
        </p>
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
                disabled>

                <option value="">
                    Primero selecciona una ciudad
                </option>
            </select>
        </div>
    </aside>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btn = document.getElementById("btnTipoPlanes");
        const planesMasVendidos = document.querySelector(".planes-mas-vendidos");
        const planesEspeciales = document.querySelector(".planes-especiales");

        // Estado inicial
        planesMasVendidos.classList.add("active");
        planesEspeciales.classList.remove("active");
        btn.textContent = "Ver planes especiales";

        btn.addEventListener("click", function () {
            if (planesMasVendidos.classList.contains("active")) {

                // Ocultar planes y mostrar clases
                planesMasVendidos.classList.remove("active");
                planesEspeciales.classList.add("active");

                // Cambiar texto del botón
                btn.textContent = "Ver planes más vendidos";

            } else {

                // Ocultar clases y mostrar planes
                planesMasVendidos.classList.add("active");
                planesEspeciales.classList.remove("active");

                // Cambiar texto del botón
                btn.textContent = "Ver planes especiales";
            }
        });
    });
</script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        /* ============= VARIABLES ============= */
        let planSeleccionado = null;

        const panelSede = document.getElementById("panelSede");
        const panelOverlay = document.getElementById("panelSedeOverlay");

        const btnCerrarSede = document.getElementById("btnCerrarSede");

        const ddlCiudad = document.getElementById("ddlCiudad");
        const ddlSede = document.getElementById("ddlSede");

        const contenedorIframe = document.getElementById("contenedorIframePlan");
        const iframePlan = document.getElementById("iframePlan");

        const btnCerrarIframe = document.getElementById("btnCerrarIframe");

        /* ============= SEDES POR CIUDAD ============= */
        const sedesPorCiudad = {
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

        /* ============= URLS POR PLAN + SEDE ============= */
        const urlsPlanes = {
            MES_A_MES: {
                "bucaramanga-boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-2822",
                "bucaramanga-cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-2726",
                "bucaramanga-el-prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-3382",
                "bucaramanga-provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-3462",
                "bucaramanga-ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-3062",
                "floridablanca-canaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-2902",
                "piedecuesta-delacuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-4000",
                "piedecuesta-parque-central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-3302",
                "cucuta-jardin-plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-3222",
                "cucuta-ceiba-ii": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-2982"
            },

            FLEXIBLE_PRO: {
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
            },

            ANIO_IMPARABLE: {
                "bucaramanga-boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-3918",
                "bucaramanga-cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-3874",
                "bucaramanga-el-prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-3878",
                "bucaramanga-provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-4152",
                "bucaramanga-ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-3958",
                "floridablanca-canaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-4142",
                "piedecuesta-delacuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-3994",
                "piedecuesta-parque-central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-3303",
                "cucuta-jardin-plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-3223",
                "cucuta-ceiba-ii": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-2983"
            },

            ESTUDIANTES: {
                "bucaramanga-boulevard": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-4863",
                "bucaramanga-cabecera": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-4869",
                "bucaramanga-el-prado": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-4867",
                "bucaramanga-provenza": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-4868",
                "bucaramanga-ciudadela": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-4860",
                "floridablanca-canaveral": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-4862",
                "piedecuesta-delacuesta": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-4864",
                "piedecuesta-parque-central": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-4866",
                "cucuta-jardin-plaza": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-4865",
                "cucuta-ceiba-ii": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-4861"
            },

            RESIDENTES: {
                "bucaramanga-boulevard": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-4870",
                "bucaramanga-cabecera": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-4879",
                "bucaramanga-el-prado": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-4877",
                "bucaramanga-provenza": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-4878",
                "bucaramanga-ciudadela": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-4873",
                "floridablanca-canaveral": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-4871",
                "piedecuesta-delacuesta": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-4874",
                "piedecuesta-parque-central": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-4876",
                "cucuta-jardin-plaza": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-4875",
                "cucuta-ceiba-ii": "https://dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-4872"
            }
        };

        /* ============= COMPRAR PLAN ============= */
        document.addEventListener("click", function (e) {
            const boton = e.target.closest(".btn-comprar-plan");

            if (!boton) return;

            e.preventDefault();

            planSeleccionado = boton.getAttribute("data-plan-id");

            if (!planSeleccionado) return;

            abrirPanelSede();
        });

        /* ============= ABRIR PANEL ============= */
        function abrirPanelSede() {
            panelSede.classList.add("active");

            document.body.style.overflow = "hidden";
        }

        /* ============= CERRAR PANEL ============= */
        function cerrarPanelSede() {
            panelSede.classList.remove("active");

            document.body.style.overflow = "";
        }

        /* ============= BOTONES CERRAR ============= */
        btnCerrarSede.addEventListener("click", cerrarPanelSede);

        panelOverlay.addEventListener("click", cerrarPanelSede);

        /* ============= CAMBIO DE CIUDAD ============= */
        ddlCiudad.addEventListener("change", function () {
            const ciudad = this.value;

            // Limpiar sedes
            ddlSede.innerHTML = "";

            // No hay ciudad
            if (!ciudad || !sedesPorCiudad[ciudad]) {
                ddlSede.disabled = true;

                const option = document.createElement("option");

                option.value = "";
                option.textContent = "Primero selecciona una ciudad";

                ddlSede.appendChild(option);

                return;
            }

            // Opción inicial
            const optionInicial = document.createElement("option");

            optionInicial.value = "";

            optionInicial.textContent ="Selecciona una sede";

            ddlSede.appendChild(optionInicial);


            // Cargar sedes
            sedesPorCiudad[ciudad].forEach(function (sede) {
                const option = document.createElement("option");

                option.value = sede.valor;

                option.textContent = sede.nombre;

                ddlSede.appendChild(option);
            });


            ddlSede.disabled = false;

        });

        /* ============= CAMBIO DE SEDE ============= */
        ddlSede.addEventListener("change", function () {
            const sede = this.value;

            if (!sede) return;

            // Buscar URL correspondiente
            const planUrls = urlsPlanes[planSeleccionado];

            if (!planUrls) return;

            const url = planUrls[sede];

            if (!url) return;

            // Cerrar panel
            cerrarPanelSede();

            // Mostrar iframe
            mostrarIframe(url);
        });

        /* ============= MOSTRAR IFRAME ============= */
        function mostrarIframe(url) {
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

        /* ============= CERRAR IFRAME ============= */
        btnCerrarIframe.addEventListener("click", function () {
            iframePlan.src = "";

            contenedorIframe.classList.remove("active");

            // Limpiar selección
            planSeleccionado = null;

            ddlCiudad.value = "";

            ddlSede.innerHTML = "";

            const option = document.createElement("option");

            option.value = "";

            option.textContent = "Primero selecciona una ciudad";

            ddlSede.appendChild(option);

            ddlSede.disabled = true;

            // Regresar a planes
            document.getElementById("planes").scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        });
    });
</script>
