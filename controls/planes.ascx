<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="planes.ascx.cs" Inherits="WebPage.controls.planes" %>

<section id="planes" class="margin_60_35" style="padding-top: 10px; padding-bottom: 15px;">
    <div class="container" id="scroll-to">
        <h2 class="main_title" style="font-weight: 900; color: #FFF;"><em></em>¡Únete a la familia Fitness People!</h2>
        <p class="lead styled" style="font-weight: 500; color: #FFF;">
            En Fitness People te ofrecemos una variedad de planes diseñados para adaptarse a tus necesidades y objetivos personales. No importa dónde te encuentres, siempre tendrás la oportunidad de entrenar con nosotros en nuestras sedes ubicadas en Bucaramanga, Floridablanca, Piedecuesta y Cúcuta. ¡Elige el plan que mejor se adapte a ti!
        </p>
        <div class="row text-center plans">
            <div class="col-md-4">
                <div class="img_container">
                    <a href="planes?id=18">
                        <img src="img/planes/plan_easy.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="img_container plan-center">
                    <a href="planes?id=5">
                        <img src="img/planes/plan-6-meses_2025-11-07.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="img_container">
                    <a href="planes?id=16">
                        <img src="img/planes/02_plan-3-mas-1_2025-10-17.jpg" class="img-fluid plan-img" />
                    </a>
                </div>
            </div>
        </div>
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

        <div class="banner-tarifas img_container"></div>

        <section style="padding-top: 10px; padding-bottom: 15px;">
            <div class="container" style="display: flex; flex-direction: column;">
                <div class="row">
                    <div class="card-row-tarifas">
                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 add_bottom_15" >
                            <img src="img/tarifas/01_plan-referencia-1-mes.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3 add_bottom_15" >
                            <img src="img/tarifas/02_plan-referencia-3-meses.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3" >
                            <img src="img/tarifas/03_plan-referencia-6-meses.png" class="img-responsive" />
                        </div>

                        <div class="col-xs-6 col-md-3 col-sm-3 col-xl-3 col-lg-3 col-xxl-3" >
                            <img src="img/tarifas/04_plan-referencia-10-meses.png" class="img-responsive" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>