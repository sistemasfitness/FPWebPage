<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pruebas.aspx.cs" Inherits="WebPage.Pruebas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .quiz-container {
            max-width: 700px;
            margin: auto;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .card-row {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .card {
            background: #f0f0f0;
            padding: 30px;
            border-radius: 10px;
            width: 22%;
            cursor: pointer;
            transition: background 0.3s;
            border: 2px solid transparent;
        }

        .card:hover {
            background: #e0e0e0;
        }

        .card.selected {
            border-color: #007bff;
            background: #cce5ff;
        }

        .progress-bar {
            height: 10px;
            background: #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .progress-fill {
            height: 10px;
            background: #007bff;
            border-radius: 5px;
            width: 0;
            transition: width 0.3s;
        }

        .quiz-controls {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .quiz-controls button {
            padding: 10px 20px;
            border: none;
            background: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .quiz-controls button:disabled {
            background: #aaa;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="quiz-container" class="quiz-container">
            <!-- Barra de progreso -->
            <div id="progress-bar" class="progress-bar">
                <div id="progress-fill" class="progress-fill" style="width: 0%;"></div>
            </div>

            <!-- Preguntas (una fila por paso) -->
            <div id="question-steps">
                <!-- Cada fila tendrá sus tarjetas -->
            </div> 

            <!-- Botones de navegación -->
            <div class="quiz-controls">
                <button type="button" id="btnPrev" onclick="goToPrevious()" disabled="">Anterior</button>
                <button type="button" id="btnNext" onclick="goToNext()" disabled="">Siguiente</button>
            </div>
        </div>
    </form>

    <script>
        const totalSteps = 5;
        let currentStep = 0;
        const answers = [];

        const questionSteps = document.getElementById("question-steps");
        const progressFill = document.getElementById("progress-fill");
        const btnPrev = document.getElementById("btnPrev");
        const btnNext = document.getElementById("btnNext");

        // Inicializa las preguntas
        function initQuestions() {
            for (let i = 0; i < totalSteps; i++) {
                const row = document.createElement("div");
                row.classList.add("card-row");
                row.dataset.step = i;
                row.style.display = i === 0 ? "flex" : "none";

                for (let j = 1; j <= 4; j++) {
                    const card = document.createElement("div");
                    card.classList.add("card");
                    card.textContent = `Opción ${j}`;
                    card.dataset.value = j;
                    card.addEventListener("click", () => selectCard(i, j, card));
                    row.appendChild(card);
                }

                questionSteps.appendChild(row);
            }
        }

        function selectCard(step, value, card) {
            // Deselecciona todas las tarjetas en esta fila
            const cards = questionSteps.querySelectorAll(`.card-row[data-step="${step}"] .card`);
            cards.forEach(c => c.classList.remove("selected"));

            // Marca esta tarjeta como seleccionada
            card.classList.add("selected");

            // Guarda la respuesta
            answers[step] = value;

            // Habilita botón siguiente
            btnNext.disabled = false;
        }

        function goToNext() {
            if (answers[currentStep] == null) return;

            // Oculta paso actual
            questionSteps.children[currentStep].style.display = "none";
            currentStep++;

            // Muestra siguiente
            if (currentStep < totalSteps) {
                questionSteps.children[currentStep].style.display = "flex";
                btnNext.disabled = answers[currentStep] == null;
            }

            // Control de botones
            btnPrev.disabled = currentStep === 0;
            if (currentStep === totalSteps - 1) {
                btnNext.textContent = "Finalizar";
            }

            // Actualiza barra
            updateProgress();
        }

        function goToPrevious() {
            // Oculta actual
            questionSteps.children[currentStep].style.display = "none";
            currentStep--;

            // Muestra anterior
            questionSteps.children[currentStep].style.display = "flex";
            btnNext.disabled = answers[currentStep] == null;

            // Control de botones
            btnPrev.disabled = currentStep === 0;
            btnNext.textContent = "Siguiente";

            // Actualiza barra
            updateProgress();
        }

        function updateProgress() {
            let percent = ((currentStep) / totalSteps) * 100;
            progressFill.style.width = percent + "%";
        }

        // Inicializa al cargar
        window.onload = initQuestions;
    </script>
</body>
</html>
