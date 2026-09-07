<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="planes.ascx.cs" Inherits="WebPage.controls.planes" %>

<%@ Register Src="~/controls/PlanCard.ascx" TagPrefix="uc" TagName="PlanCard" %>

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

                // Cerrar Iframe
                cerrarIframe();

            } else {

                // Ocultar clases y mostrar planes
                planesMasVendidos.classList.add("active");
                planesEspeciales.classList.remove("active");

                // Cambiar texto del botón
                btn.textContent = "Ver planes especiales";

                // Cerrar Iframe
                cerrarIframe();
            }
        });


        /* ============= VARIABLES ============= */
        let planSeleccionado = null;
        let nombrePlanSeleccionado = null;
        let precioPlanSeleccionado = null;

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

        /* ============= URL FLEXIBLE PRO ============= */
        const urlFlexiblePro = "register?token=ONiORcTGWT6e8D2QxFgV";

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

            //FLEXIBLE_PRO: {
            //    "bucaramanga-boulevard": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a607b4d4f0-2821",
            //    "bucaramanga-cabecera": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a707140846-2725",
            //    "bucaramanga-el-prado": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6d48e5514-3381",
            //    "bucaramanga-provenza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6f07c847f-3461",
            //    "bucaramanga-ciudadela": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a662555598-3061",
            //    "floridablanca-canaveral": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a623d2bdd3-2901",
            //    "piedecuesta-delacuesta": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a681570921-3141",
            //    "piedecuesta-parque-central": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6bc17d050-3301",
            //    "cucuta-jardin-plaza": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6a059bb86-3221",
            //    "cucuta-ceiba-ii": "https://www.dash.fitmewise.com/admin/users/register/without-redirect/696a6463ea739-2981"
            //},

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
            nombrePlanSeleccionado = boton.getAttribute("data-plan-name");
            precioPlanSeleccionado = boton.getAttribute("data-plan-price");

            if (!planSeleccionado) return;

            // ==========================================
            // FLEXIBLE PRO
            // ==========================================

            if (planSeleccionado === "FLEXIBLE_PRO") {

                // GOOGLE TAG MANAGER
                window.dataLayer = window.dataLayer || [];

                window.dataLayer.push({
                    event: "AddToCart",
                    ecommerce: {
                        items: [{
                            item_id: planSeleccionado,
                            item_name: nombrePlanSeleccionado,
                            price: precioPlanSeleccionado,
                            currency: "COP",
                            quantity: 1
                        }]
                    }
                });

                // Redirección directa
                window.location.href = urlFlexiblePro;

                return;
            }

            // ==========================================
            // RESTO DE PLANES
            // ==========================================

            abrirPanelSede();



            //const boton = e.target.closest(".btn-comprar-plan");

            //if (!boton) return;

            //e.preventDefault();

            //planSeleccionado = boton.getAttribute("data-plan-id");
            //nombrePlanSeleccionado = boton.getAttribute("data-plan-name");
            //precioPlanSeleccionado = boton.getAttribute("data-plan-price");

            //if (!planSeleccionado) return;

            //abrirPanelSede();
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


            // GOOGLE TAG MANAGER
            window.dataLayer = window.dataLayer || [];

            window.dataLayer.push({
                event: "AddToCart",
                ecommerce: {
                    items: [{
                        item_id: planSeleccionado,
                        item_name: nombrePlanSeleccionado,
                        price: precioPlanSeleccionado,
                        currency: "COP",
                        quantity: 1
                    }]
                }
            });


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
        function cerrarIframe() {
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
        }

        btnCerrarIframe.addEventListener("click", function () {
            cerrarIframe();
        });
    });
</script>
