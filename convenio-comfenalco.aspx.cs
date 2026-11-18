using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.controls;

namespace WebPage
{
    public partial class convenio_comfenalco : System.Web.UI.Page
    {
        private const string UrlWebServiceComfenalco = "https://ws.comfenalcosantander.com.co/GymServis.php";

        private enum EstadoConsulta
        {
            Aplica,
            NoAplica,
            ErrorServicio
        }

        private class ResultadoConvenio
        {
            public EstadoConsulta Estado { get; set; }
            public string Mensaje { get; set; }
            public string CategoriaTitular { get; set; }
        }

        private class TarifaConvenio
        {
            public decimal ValorPlan { get; set; }
            public decimal Subsidio { get; set; }
            public decimal TotalPagar { get; set; }
        }

        // =========================================================
        // 1. CARGA INICIAL
        // =========================================================
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OcultarResultados();
                ConfigurarFAQ();
            }
        }

        // =========================================================
        // 2. EVENTO PRINCIPAL DE CONSULTA
        // =========================================================
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            OcultarResultados();

            try
            {
                // =========================================================
                // VALIDAR AUTORIZACIÓN
                // =========================================================
                if (!chkAutorizacion.Checked)
                {
                    MostrarMensaje("Debes aceptar los términos y la política de tratamiento de datos.");
                    return;
                }

                // =========================================================
                // DETERMINAR ROL
                // =========================================================
                string rol = Request.Form["rol"];

                if (string.IsNullOrEmpty(rol) || (rol != "titular" && rol != "beneficiario"))
                {
                    MostrarMensaje("Selecciona si la consulta corresponde a un titular o beneficiario.");
                    return;
                }

                hfRol.Value = rol;

                bool esBeneficiario = rol == "beneficiario";

                // =========================================================
                // OBTENER DOCUMENTO DEL TITULAR
                // =========================================================
                string tipoDocumentoTitular = ObtenerSiglaDocumento(ddlTipoDoc);
                string documentoTitular = LimpiarDocumento(txtNumDoc.Text);

                if (string.IsNullOrWhiteSpace(tipoDocumentoTitular))
                {
                    MostrarMensaje("Selecciona el tipo de documento del titular.");
                    return;
                }

                if (string.IsNullOrWhiteSpace(documentoTitular))
                {
                    MostrarMensaje("Ingresa el número de documento del titular.");
                    return;
                }

                // =========================================================
                // VALIDAR TIPO DE DOCUMENTO ADMITIDO
                // =========================================================
                if (!TipoDocumentoAdmitido(tipoDocumentoTitular))
                {
                    MostrarMensaje("El tipo de documento del titular no es válido para esta consulta.");
                    return;
                }

                // =========================================================
                // OBTENER DOCUMENTO DEL BENEFICIARIO
                // =========================================================
                string tipoDocumentoBeneficiario = "";
                string documentoBeneficiario = "";

                if (esBeneficiario)
                {
                    tipoDocumentoBeneficiario =
                        ObtenerSiglaDocumento(ddlTipoDocB);

                    documentoBeneficiario =
                        LimpiarDocumento(txtNumDocB.Text);

                    if (string.IsNullOrWhiteSpace(
                        tipoDocumentoBeneficiario))
                    {
                        MostrarMensaje("Selecciona el tipo de documento del beneficiario.");
                        return;
                    }

                    if (string.IsNullOrWhiteSpace(documentoBeneficiario))
                    {
                        MostrarMensaje("Ingresa el número de documento del beneficiario.");
                        return;
                    }

                    if (!TipoDocumentoAdmitido(
                        tipoDocumentoBeneficiario))
                    {
                        MostrarMensaje("El tipo de documento del beneficiario no es válido para esta consulta.");
                        return;
                    }

                    if (string.Equals(
                        documentoTitular,
                        documentoBeneficiario,
                        StringComparison.Ordinal))
                    {
                        MostrarMensaje("El documento del beneficiario debe ser diferente al del titular.");
                        return;
                    }
                }

                // =========================================================
                // CONSULTAR CONVENIO
                //
                // IMPORTANTE:
                // Siempre consultamos el documento del titular.
                // Para beneficiarios, revisamos si el documento
                // aparece en Conyuge o Dependiente.
                // =========================================================

                csLoad.Visible = true;

                ResultadoConvenio resultado = ConsultarConvenioApi(
                    tipoDocumentoTitular,
                    documentoTitular,
                    esBeneficiario,
                    documentoBeneficiario);

                csLoad.Visible = false;

                // ---------------------------------------------
                // INTERPRETAR RESULTADO
                // ---------------------------------------------

                if (resultado.Estado == EstadoConsulta.ErrorServicio)
                {
                    MostrarMensaje(resultado.Mensaje);
                    return;
                }

                if (resultado.Estado == EstadoConsulta.NoAplica)
                {
                    MostrarNoAplica(resultado.Mensaje);
                    return;
                }

                // =========================================================
                // MOSTRAR RESULTADO POSITIVO
                // =========================================================
                MostrarAplica(
                    tipoDocumentoTitular,
                    documentoTitular,
                    esBeneficiario,
                    tipoDocumentoBeneficiario,
                    documentoBeneficiario,
                    resultado);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError("Error en btnConsultar_Click: {0}", ex);

                csLoad.Visible = false;

                MostrarMensaje("No fue posible completar la consulta. Intenta nuevamente.");
            }
            finally
            {
                // Actualizar el contenido del UpdatePanel
                upConsultaConvenio.Update();
            }
        }

        private TarifaConvenio ObtenerTarifaPorCategoria(string categoria)
        {
            decimal valorPlan = 79200;
            decimal subsidio = 0;

            switch ((categoria ?? "").Trim().ToUpperInvariant())
            {
                case "A":
                    subsidio = 15800;
                    break;

                case "B":
                    subsidio = 11900;
                    break;

                case "C":
                    subsidio = 0;
                    break;

                default:
                    return null;
            }

            return new TarifaConvenio
            {
                ValorPlan = valorPlan,
                Subsidio = subsidio,
                TotalPagar = valorPlan - subsidio
            };
        }

        // =========================================================
        // 3. CONSUMIR API DE COMFENALCO
        // =========================================================
        private ResultadoConvenio ConsultarConvenioApi(
            string tipoDocumentoTitular,
            string documentoTitular,
            bool esBeneficiario,
            string documentoBeneficiario)
        {
            try
            {
                // 1. Obtener la credencial desde el Web.config
                string authorization = ConfigurationManager.AppSettings["ComfenalcoAuthorization"];

                if (string.IsNullOrWhiteSpace(authorization))
                {
                    return CrearResultado(
                        EstadoConsulta.ErrorServicio,
                        "El servicio de consulta no está configurado.");
                }

                // 2. Validar los datos de entrada
                if (string.IsNullOrWhiteSpace(tipoDocumentoTitular) ||
                    string.IsNullOrWhiteSpace(documentoTitular))
                {
                    return CrearResultado(
                        EstadoConsulta.ErrorServicio,
                        "Debes ingresar el tipo y número de documento del titular.");
                }

                if (esBeneficiario &&
                    string.IsNullOrWhiteSpace(documentoBeneficiario))
                {
                    return CrearResultado(
                        EstadoConsulta.ErrorServicio,
                        "Debes ingresar el documento del beneficiario.");
                }

                // 3. Preparar la solicitud al servicio de Comfenalco
                using (HttpClient cliente = new HttpClient())
                {
                    cliente.Timeout = TimeSpan.FromSeconds(20);

                    var parametros = new Dictionary<string, string>
                    {
                        { "doc", documentoTitular },
                        { "type", tipoDocumentoTitular },
                        { "Authorization", authorization }
                    };

                    using (var contenido = new FormUrlEncodedContent(parametros))
                    {
                        HttpResponseMessage respuesta = cliente
                            .PostAsync(
                                UrlWebServiceComfenalco,
                                contenido)
                            .GetAwaiter()
                            .GetResult();

                        string json = respuesta.Content
                            .ReadAsStringAsync()
                            .GetAwaiter()
                            .GetResult();

                        // 4. Verificar el estado HTTP
                        if (!respuesta.IsSuccessStatusCode)
                        {
                            System.Diagnostics.Debug.WriteLine(
                                "Error HTTP Comfenalco: " +
                                (int)respuesta.StatusCode +
                                " - " + json);

                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "No fue posible consultar el servicio de Comfenalco. " +
                                "Código HTTP: " + (int)respuesta.StatusCode);
                        }

                        // 5. Interpretar la respuesta JSON
                        JObject respuestaJson;

                        try
                        {
                            respuestaJson = JObject.Parse(json);
                        }
                        catch (Newtonsoft.Json.JsonException)
                        {
                            System.Diagnostics.Debug.WriteLine("JSON no válido de Comfenalco: " + json);

                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "El servicio de Comfenalco devolvió una respuesta no válida.");
                        }

                        // La respuesta real viene dentro de WSGymServis
                        JObject datos = respuestaJson["WSGymServis"] as JObject;

                        if (datos == null)
                        {
                            System.Diagnostics.Debug.WriteLine("Estructura inesperada de Comfenalco: " + json);

                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "La respuesta del servicio no tiene la estructura esperada.");
                        }

                        // 6. Revisar posibles mensajes de error del servicio
                        string mensajeError = ObtenerMensajeError(datos);

                        if (!string.IsNullOrWhiteSpace(mensajeError))
                        {
                            System.Diagnostics.Debug.WriteLine("Mensaje de Comfenalco: " + mensajeError);

                            if (EsMensajeNoEncontrado(mensajeError))
                            {
                                return CrearResultado(
                                    EstadoConsulta.NoAplica,
                                    "No se encontró información para el documento consultado.");
                            }

                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "Comfenalco devolvió un mensaje de error: " +
                                mensajeError);
                        }

                        // 7. Obtener el registro del titular
                        JObject trabajador = (JObject)ObtenerPrimerRegistro(
                            datos["Trabajador"]);

                        if (trabajador == null)
                        {
                            return CrearResultado(
                                EstadoConsulta.NoAplica,
                                "No se encontró un trabajador asociado al documento consultado.");
                        }

                        // 8. Confirmar que el documento corresponde al titular
                        if (!DocumentoCoincide(
                            trabajador["idper"],
                            documentoTitular))
                        {
                            System.Diagnostics.Debug.WriteLine(
                                "El documento recibido no coincide con el consultado. " +
                                "Documento consultado: " + documentoTitular);

                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "El documento del titular no coincide con la información recibida.");
                        }

                        // 9. Validar que el titular esté activo
                        string estadoTrabajador = trabajador["estadoper"]?
                            .ToString()
                            .Trim();

                        if (string.IsNullOrWhiteSpace(estadoTrabajador))
                        {
                            return CrearResultado(
                                EstadoConsulta.ErrorServicio,
                                "El servicio no devolvió el estado del titular.");
                        }

                        if (!estadoTrabajador.Equals(
                            "ACTIVO",
                            StringComparison.OrdinalIgnoreCase))
                        {
                            return CrearResultado(
                                EstadoConsulta.NoAplica,
                                "El titular se encuentra inactivo y no puede acceder al convenio.");
                        }

                        // 10. Validar que el titular pertenezca a categoría A o B
                        string categoriaTitular = trabajador["categoria"]?
                            .ToString()
                            .Trim()
                            .ToUpperInvariant();

                        if (categoriaTitular != "A" && categoriaTitular != "B" && categoriaTitular != "C")
                        {
                            return CrearResultado(
                                EstadoConsulta.NoAplica,
                                "No fue posible identificar una categoría habilitada para acceder al convenio.");
                        }

                        // 11. Si la consulta es para el titular, ya se validó
                        if (!esBeneficiario)
                        {
                            return CrearResultado(
                                EstadoConsulta.Aplica,
                                "El titular se encuentra activo y puede acceder al convenio.",
                                categoriaTitular);
                        }

                        // 12. Si es beneficiario, buscarlo en los registros asociados al titular consultado.
                        JObject conyuge = (JObject)ObtenerRegistroPorDocumento(
                            datos["Conyuge"],
                            "idcony",
                            documentoBeneficiario);

                        JObject dependiente = (JObject)ObtenerRegistroPorDocumento(
                            datos["Dependiente"],
                            "iddep",
                            documentoBeneficiario);

                        // Si el beneficiario es el cónyuge
                        // La categoría utilizada será exclusivamente la del titular.
                        if (conyuge != null)
                        {
                            return CrearResultado(
                                EstadoConsulta.Aplica,
                                "El beneficiario cumple las condiciones del convenio.",
                                categoriaTitular);
                        }

                        // Si el beneficiario es un dependiente
                        // La categoría utilizada será exclusivamente la del titular.
                        if (dependiente != null)
                        {
                            return CrearResultado(
                                EstadoConsulta.Aplica,
                                "El beneficiario cumple las condiciones del convenio.",
                                categoriaTitular);
                        }

                        return CrearResultado(
                            EstadoConsulta.NoAplica,
                            "El beneficiario no aparece registrado como cónyuge o dependiente del titular.");
                    }
                }
            }
            catch (TaskCanceledException ex)
            {
                System.Diagnostics.Debug.WriteLine("Tiempo de espera agotado en Comfenalco: " + ex);

                return CrearResultado(
                    EstadoConsulta.ErrorServicio,
                    "La consulta a Comfenalco tardó demasiado. Intenta nuevamente.");
            }
            catch (HttpRequestException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error de conexión con Comfenalco: " + ex);

                return CrearResultado(
                    EstadoConsulta.ErrorServicio,
                    "No fue posible establecer conexión con el servicio de Comfenalco.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ConsultarConvenioApi: " + ex);

                return CrearResultado(
                    EstadoConsulta.ErrorServicio,
                    "Ocurrió un error inesperado al consultar el convenio.");
            }
        }

        // =========================================================
        // 4. INTERPRETAR RESPUESTAS JSON
        // =========================================================
        private ResultadoConvenio CrearResultado(
            EstadoConsulta estado,
            string mensaje,
            string categoriaTitular = "")
        {
            return new ResultadoConvenio
            {
                Estado = estado,
                Mensaje = mensaje,
                CategoriaTitular = categoriaTitular
            };
        }

        private string ObtenerMensajeError(JObject datos)
        {
            string[] propiedadesError =
            {
                "Info",
                "Error",
                "forbidden"
            };

            foreach (string propiedad in propiedadesError)
            {
                JToken token = datos[propiedad];

                if (token == null ||
                    token.Type == JTokenType.Null)
                {
                    continue;
                }

                // Si la propiedad contiene un mensaje o un objeto
                // de error, devolvemos su contenido para clasificarlo.
                return token.ToString();
            }

            return "";
        }

        private bool EsMensajeNoEncontrado(string mensaje)
        {
            if (string.IsNullOrWhiteSpace(mensaje))
                return false;

            return mensaje.IndexOf(
                "no se encontró información",
                StringComparison.OrdinalIgnoreCase) >= 0
                ||
                mensaje.IndexOf(
                    "no se encontro informacion",
                    StringComparison.OrdinalIgnoreCase) >= 0;
        }

        private JToken ObtenerPrimerRegistro(JToken token)
        {
            if (token == null ||
                token.Type == JTokenType.Null)
            {
                return null;
            }

            if (token is JArray arreglo)
            {
                return arreglo.FirstOrDefault(
                    elemento => elemento is JObject);
            }

            if (token is JObject objeto)
            {
                return objeto;
            }

            return null;
        }

        private JToken ObtenerRegistroPorDocumento(
            JToken token,
            string campoDocumento,
            string documentoBuscado)
        {
            if (token == null ||
                token.Type == JTokenType.Null)
            {
                return null;
            }

            IEnumerable<JToken> registros;

            if (token is JArray arreglo)
            {
                registros = arreglo;
            }
            else if (token is JObject objeto)
            {
                registros = new JToken[] { objeto };
            }
            else
            {
                return null;
            }

            return registros.FirstOrDefault(registro =>
                DocumentoCoincide(
                    registro[campoDocumento],
                    documentoBuscado));
        }

        private bool DocumentoCoincide(
            JToken documentoApi,
            string documentoBuscado)
        {
            if (documentoApi == null)
                return false;

            string valorApi =
                LimpiarDocumento(documentoApi.ToString());

            string valorBuscado =
                LimpiarDocumento(documentoBuscado);

            return string.Equals(
                valorApi,
                valorBuscado,
                StringComparison.Ordinal);
        }

        // =========================================================
        // 5. TIPOS DE DOCUMENTO
        // =========================================================
        private string ObtenerSiglaDocumento(
            DropDownList lista)
        {
            if (lista == null ||
                lista.SelectedItem == null ||
                string.IsNullOrWhiteSpace(lista.SelectedValue))
            {
                return "";
            }

            string sigla =
                lista.SelectedItem.Attributes["data-sigla"];

            return (sigla ?? "").Trim().ToUpperInvariant();
        }

        private bool TipoDocumentoAdmitido(string tipo)
        {
            string[] tiposAdmitidos =
            {
                "CC",
                "CE",
                "TI",
                "PE"
            };

            return tiposAdmitidos.Contains(
                tipo,
                StringComparer.OrdinalIgnoreCase);
        }

        private string LimpiarDocumento(string documento)
        {
            if (string.IsNullOrWhiteSpace(documento))
                return "";

            return documento
                .Replace(".", "")
                .Replace(",", "")
                .Replace(" ", "")
                .Trim();
        }

        private string FormatearDocumento(string documento)
        {
            if (string.IsNullOrWhiteSpace(documento))
                return "";

            // No aplicar separadores numéricos a documentos que contengan letras.
            if (documento.Any(char.IsLetter))
                return documento;

            if (documento.Length <= 3)
                return documento;

            string resultado = "";
            int contador = 0;

            for (int i = documento.Length - 1; i >= 0; i--)
            {
                resultado = documento[i] + resultado;
                contador++;

                if (contador == 3 && i > 0)
                {
                    resultado = "." + resultado;
                    contador = 0;
                }
            }

            return resultado;
        }

        // =========================================================
        // 6. MOSTRAR RESULTADO POSITIVO
        // =========================================================
        private void MostrarAplica(
            string tipoDocumentoTitular,
            string documentoTitular,
            bool esBeneficiario,
            string tipoDocumentoBeneficiario,
            string documentoBeneficiario,
            ResultadoConvenio resultado)
        {
            csRes.Visible = true;
            csNo.Visible = false;
            csLoad.Visible = false;

            csRes.Attributes["class"] = "fpp-cs-res on";
            csNo.Attributes["class"] = "fpp-cs-no";

            csDoc.InnerText = $"Titular: {tipoDocumentoTitular}. {FormatearDocumento(documentoTitular)}";

            if (esBeneficiario)
            {
                csDocB.InnerText = $"Beneficiario: {tipoDocumentoBeneficiario}. {FormatearDocumento(documentoBeneficiario)}";
                csDocB.Visible = true;
            }
            else
            {
                csDocB.InnerText = "";
                csDocB.Visible = false;
            }

            // Mostrar mensaje de resultado
            csMensajeResultado.InnerText = resultado.Mensaje ?? "";

            // Obtener categoría del titular
            string categoria = resultado.CategoriaTitular;

            // Calcular tarifa
            TarifaConvenio tarifa = ObtenerTarifaPorCategoria(categoria);

            if (tarifa == null)
            {
                throw new Exception("No fue posible determinar la tarifa del convenio.");
            }

            // Mostrar valores económicos
            litValorPlan.Text = tarifa.ValorPlan.ToString("N0");

            litSubsidio.Text = tarifa.Subsidio.ToString("N0");

            litTotalPagar.Text = tarifa.TotalPagar.ToString("N0");

            // Guardar categoría internamente para JavaScript
            hfCategoriaTitular.Value = categoria;
        }

        // =========================================================
        // 7. MOSTRAR RESULTADO NEGATIVO
        // =========================================================
        private void MostrarNoAplica(string mensaje)
        {
            csRes.Visible = false;
            csNo.Visible = true;
            csLoad.Visible = false;

            csRes.Attributes["class"] = "fpp-cs-res";
            csNo.Attributes["class"] = "fpp-cs-no on";

            csDoc.InnerText = "";
            csDocB.InnerText = "";
            csDocB.Visible = false;

            // Mostrar la razón específica por la que no aplica
            csMensajeNoAplica.InnerText = mensaje ?? "";
        }

        // =========================================================
        // 8. OCULTAR RESULTADOS
        // =========================================================
        private void OcultarResultados()
        {
            csRes.Visible = false;
            csNo.Visible = false;
            csLoad.Visible = false;

            csRes.Attributes["class"] = "fpp-cs-res";
            csNo.Attributes["class"] = "fpp-cs-no";

            csDoc.InnerText = "";
            csDocB.InnerText = "";
            csDocB.Visible = false;

            lblMensaje.InnerText = "";
            lblMensaje.Attributes["class"] = "fpp-cs-msg";

            csMensajeNoAplica.InnerText = "";

            // Limpiar categoría anterior
            hfCategoriaTitular.Value = "";

            // Limpiar valores económicos
            litValorPlan.Text = "";
            litSubsidio.Text = "";
            litTotalPagar.Text = "";
        }

        // =========================================================
        // 9. MOSTRAR MENSAJE
        // =========================================================
        private void MostrarMensaje(string mensaje)
        {
            lblMensaje.InnerText = mensaje;
            lblMensaje.Attributes["class"] = "fpp-cs-msg on";
        }

        private void ConfigurarFAQ()
        {
            // Encabezado
            faq.SectionId = "faq";

            faq.Kicker = "Preguntas frecuentes";

            faq.Title = "Sobre el";
            faq.Highlight = "convenio";

            faq.Description = "Si tu duda no está aquí, un asesor te responde por WhatsApp antes de que te inscribas.";

            // Botón
            faq.WhatsAppUrl = "https://wa.me/573204630051";

            faq.WhatsAppText = "Hablar con un asesor";

            // Preguntas y respuestas
            faq.Items = new List<FaqItem>
            {
                new FaqItem
                {
                    Question = "¿Cómo sé si aplico al convenio?",
                    Answer = @"
                        <p>
                            No tienes que averiguar nada por tu cuenta. Digita tu documento en 
                            la <b>consulta en línea</b> y el sistema valida tu afiliación con 
                            <b>Comfenalco Santander</b>: en segundos te confirma si tienes 
                            habilitada la tarifa del convenio.
                        </p>
                    ",
                    Open = true
                },

                new FaqItem
                {
                    Question = "¿Cuánto cuesta la membresía con el convenio?",
                    Answer = @"
                        <p>
                            El valor de la membresía es de <b>$63.400, $67.300 o $79.200 al mes</b>, 
                            según el subsidio asignado al titular del convenio. Este beneficio aplica 
                            tanto para <b>titulares como para sus beneficiarios</b> que cumplan las 
                            condiciones del convenio.
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "¿Mis beneficiarios también acceden a la tarifa?",
                    Answer = @"
                        <p>
                            Sí, siempre que estén registrados como beneficiarios ante la caja 
                            y cumplan las condiciones del convenio. En la consulta selecciona 
                            <b>Beneficiario</b> e ingresa el documento del titular y el del 
                            beneficiario. <b>Cada persona firma su propio contrato.</b>
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "Mi documento no aplicó. ¿Qué puedo hacer?",
                    Answer = @"
                        <p>
                            Verifica que el número esté bien digitado y que tu <b>afiliación 
                            a la caja esté activa.</b> Si todo está correcto y aun así no aplica, 
                            <b>escríbenos por WhatsApp</b>: un asesor revisa tu caso y te muestra 
                            las demás opciones y promociones vigentes.
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "¿Puedo entrenar en todas las sedes?",
                    Answer = @"
                        <p>
                            La tarifa del convenio habilita el acceso a las <b>8 sedes 
                            de Bucaramanga, Floridablanca y Piedecuesta, sin trámites 
                            ni costos adicionales por cambiar de sede.</b> Ten en cuenta 
                            que <b>las 2 sedes de Cúcuta no cuentan con este convenio.</b>
                        </p>
                    "
                },

                new FaqItem
                {
                    Question = "¿Puedo combinar el convenio con otra promoción?",
                    Answer = @"
                        <p>
                            No. La tarifa del convenio <b>no es acumulable con otras promociones</b>, 
                            descuentos por referidos, planes corporativos ni campañas vigentes.
                        </p>
                    "
                }
            };
        }
    }
}