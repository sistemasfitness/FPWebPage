using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
	public partial class redebanData : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                // Muestra la alerta solo en la primera carga
                MostrarAlertaProcesando();

                // Inicia el proceso de compra
                IniciarPago();
            }
        }

        private async void IniciarPago()
        {
            string urlRedirect = $"register?idPlan={Session["idPlan"]}";

            try
            {
                int precioPlan = int.Parse(Session["valorPlan"].ToString());

                // Realizar compra de plan por datáfono Redeban
                bool pagoIniciado = await RealizarPagoAsync(precioPlan);

                if (!pagoIniciado)
                {
                    LimpiarPago();
                    MostrarAlerta("Error de Pago", "No se pudo iniciar el proceso de pago.", "error", urlRedirect);
                    return;
                }

                tmrRespuesta.Enabled = true;
            }
            catch (Exception ex)
            {
                LimpiarPago();
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error", urlRedirect);
            }
        }

        private async Task<bool> RealizarPagoAsync(int precioPlan)
        {
            string urlRedirect = $"register?idPlan={Session["idPlan"]}";

            try
            {
                var redebanClient = CrearRedebanClient();

                // 1. Obtener el token
                string token = await redebanClient.ObtenerTokenAsync();

                if (string.IsNullOrEmpty(token))
                {
                    LimpiarPago();
                    MostrarAlerta("Error", "No se pudo obtener el token de Redeban.", "error", urlRedirect);
                    return false;
                }

                // 2. Borrar transacción anterior si existe
                if (Session["idTransaccionAnterior"] != null)
                {
                    string idAnterior = Session["idTransaccionAnterior"].ToString();
                    string resultadoBorrar = await redebanClient.BorrarTransaccionAsync(idAnterior, token);

                    System.Diagnostics.Debug.WriteLine($"BorrarTransaccion Anterior: {resultadoBorrar}");
                }

                // 3. Generar un nuevo IdTransaccion único
                string idTransaccion = DateTime.Now.ToString("yyyyMMddHHmmss");

                // Guardar en sesión para usar luego
                Session["idTransaccion"] = idTransaccion;
                Session["idTransaccionAnterior"] = idTransaccion;
                Session["token"] = token;
                Session["intentos"] = 0;
                string codDatafono = Session["codDatafono"].ToString();

                // 4. Enviar la solicitud de compra
                string resultado = await redebanClient.EnviarDatosCompraAsync(idTransaccion, token, precioPlan, codDatafono);

                // 5. Extraer el código de la respuesta con Regex
                var match = System.Text.RegularExpressions.Regex.Match(resultado, @"Cod:(\d+),Msj:(.*)");

                if (match.Success)
                {
                    string cod = match.Groups[1].Value;
                    string msj = match.Groups[2].Value;

                    if (cod == "00")
                    {
                        return true;
                    }
                    else
                    {
                        LimpiarPago();
                        MostrarAlerta("Error en pago", "No se pudo iniciar la transacción. Detalle: " + resultado, "error", urlRedirect);
                        return false;
                    }
                }
                else
                {
                    LimpiarPago();
                    MostrarAlerta("Error en pago", "Respuesta inesperada del servicio Redeban: " + resultado, "error", urlRedirect);
                    return false;
                }
            }
            catch (Exception ex)
            {
                LimpiarPago();
                MostrarAlerta("Error inesperado", "Ocurrió un error al procesar el pago.", "error", urlRedirect);
                System.Diagnostics.Debug.WriteLine("Error en RealizarCompra: " + ex.ToString());
                return false;
            }
        }

        protected async void tmrRespuesta_Tick(object sender, EventArgs e)
        {
            string urlRedirect = $"register?idPlan={Session["idPlan"]}";
            int intentos = (int)(Session["intentos"] ?? 0);

            string idTransaccion = Session["idTransaccion"]?.ToString();
            string token = Session["token"]?.ToString();
            var redebanClient = CrearRedebanClient();

            if (intentos >= 15)
            {
                tmrRespuesta.Enabled = false;

                if (!string.IsNullOrEmpty(idTransaccion) && !string.IsNullOrEmpty(token))
                {
                    // Intentar borrar la transacción pendiente para evitar Cod:06
                    string resultadoBorrar = await redebanClient.BorrarTransaccionAsync(idTransaccion, token);

                    // Registrar el resultado para depuración
                    System.Diagnostics.Debug.WriteLine($"BorrarTransaccion: {resultadoBorrar}");
                }

                LimpiarPago();
                MostrarAlerta("Tiempo excedido", "No se recibió respuesta del datáfono. Por favor, intente nuevamente.", "warning", urlRedirect);
                return;
            }

            Session["intentos"] = intentos + 1;

            if (string.IsNullOrEmpty(idTransaccion) || string.IsNullOrEmpty(token))
            {
                tmrRespuesta.Enabled = false;
                LimpiarPago();
                MostrarAlerta("Error", "No hay datos de transacción para consultar.", "error", urlRedirect);
                return;
            }

            string respuesta = await redebanClient.ConsultarRespuestaAsync(idTransaccion, token);

            if ((respuesta.Contains("Cod:00") && (respuesta.Contains("Msj:0") || respuesta.Contains("Msj:00"))))
            {
                tmrRespuesta.Enabled = false;

                string[] partesRespuesta = respuesta.Split(',');

                Session["idTransaccionRRN"] = partesRespuesta[12];
                Session["numReciboDatafono"] = partesRespuesta[10];

                await ProcesarPagoExitosoAsync();
            }
            else if ((respuesta.Contains("Cod:00") && (respuesta.Contains("Msj:1") || respuesta.Contains("Msj:01"))))
            {
                tmrRespuesta.Enabled = false;
                LimpiarPago();
                MostrarAlerta("Pago rechazado", "La transacción fue rechazada.", "error", urlRedirect);
            }
        }

        private async Task ProcesarPagoExitosoAsync()
        {
            string urlRedirect = $"planesKiosco?codDatafono={Session["codDatafono"]}";

            try
            {
                // 1. Creación de factura en Siigo
                var siigoClient = new SiigoClient(
                    new HttpClient(),
                    "https://api.siigo.com/",
                    "sandbox@siigoapi.com",
                    "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=",
                    "SandboxSiigoApi"
                );

                // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
                // ESTÁ COMENTADO PARA PRUEBAS LOCALES
                //string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                //    Session["documentoAfiliado"].ToString(), 
                //    Session["codSiigoPlan"].ToString(), 
                //    Session["nombrePlan"].ToString(),
                //    int.Parse(Session["valorPlan"].ToString())
                //);

                // Siigo Pruebas
                //int idTipoDocumento = 28006;
                //int costCenterDefault = 621;
                //int idVendedor = 856;
                //int idPayment = 9438;
                int idSede = Session["idSede"] != null ? Convert.ToInt32(Session["idSede"].ToString()) : 0;
                string codSiigoPlan = "COD2433";
                string nombrePlan = "Pago de suscripción";
                int precioPlanSiigo = 10000;
                string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                    Session["documentoAfiliado"].ToString(),
                    codSiigoPlan,
                    nombrePlan,
                    precioPlanSiigo,
                    idSede
                );

                clasesglobales cg = new clasesglobales();

                // 3. Registro de afiliación en la base de datos (AfiliadoPlan)
                cg.InsertarAfiliadoPlan(
                    int.Parse(Session["idAfiliado"].ToString()),
                    int.Parse(Session["idPlan"].ToString()),
                    Session["fechaInicioPlan"].ToString(),
                    Session["fechaFinPlan"].ToString(),
                    int.Parse(Session["meses"].ToString()),
                    int.Parse(Session["valorPlan"].ToString()),
                    "Débito automático", // TODO: Cambiar dependiendo el plan
                    "Pendiente"
                );

                // 4. Obtención de idAfiliadoPlan recién creado
                DataTable dt = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(int.Parse(Session["idAfiliado"].ToString()));
                if (dt.Rows.Count == 0)
                {
                    MostrarAlerta("Error", "No se pudo recuperar el plan del afiliado.", "error", urlRedirect);
                    return;
                }

                int idAfiliadoPlan = int.Parse(dt.Rows[0]["idAfiliadoPlan"].ToString());
                Session["idAfiliadoPlan"] = idAfiliadoPlan;

                //string referencia = Session["documentoAfiliado"].ToString() + "-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                string codDatafono = Session["codDatafono"].ToString();

                // 5. Registro de pago en la base de datos (PagosPlanAfiliado)
                cg.InsertarPagoPlanAfiliadoWeb(
                    idAfiliadoPlan,
                    int.Parse(Session["valorPlan"].ToString()),
                    3,
                    Session["idTransaccion"].ToString(),
                    "Ninguno",
                    "Pendiente",
                    idSiigoFactura,
                    "",
                    "",
                    "",
                    codDatafono,
                    Session["idTransaccionRRN"].ToString(),
                    Session["numReciboDatafono"].ToString()
                );

                LimpiarTodo();
                MostrarAlerta("Pago Aprobado", "La transacción fue realizada exitosamente.", "success", urlRedirect);
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "El pago fue aprobado, pero ocurrió un error en el registro interno. Por favor, comunicarse con el área de sistemas.", "error", urlRedirect);
                System.Diagnostics.Debug.WriteLine("Error en ProcesarPagoExitosoAsync: " + ex.ToString());
            }
        }

        private RedebanClient CrearRedebanClient()
        {
            return new RedebanClient(
                new HttpClient(),
                "https://sipserviceclientetestv52.azurewebsites.net/sipservice.asmx",
                "http://tempuri.org/",
                "0020304050", 
                "sistemas@fitnesspeoplecmd.com",
                "idJ089J3Fm"
            );
        }

        private void LimpiarPago()
        {
            Session.Remove("idTransaccion");
            Session.Remove("idTransaccionAnterior");
            Session.Remove("token");
            Session.Remove("intentos");
            Session.Remove("idTransaccionRRN");
            Session.Remove("numReciboDatafono");
        }

        private void LimpiarTodo()
        {
            Session.Clear();
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo, string urlRedirect)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string script = $@"
            Swal.hideLoading();
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{tipo}', 
                background: '#3C3C3C', 
                allowOutsideClick: false, 
                showCloseButton: false, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
            }}).then((result) => {{
                if (result.isConfirmed) {{
                    window.location.replace('{urlRedirect}');
                }}
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }

        private void MostrarAlertaProcesando()
        {
            string script = @"
            let contador = 5;
            Swal.fire({
                title: 'Cargando',
                html: `Este proceso iniciará en <b>${contador}</b> segundos...`,
                icon: 'info',
                background: '#3C3C3C', 
                allowOutsideClick: false,
                showConfirmButton: false, 
                customClass: {
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                },
                didOpen: () => {
                    Swal.showLoading();
                    const interval = setInterval(() => {
                        contador--;
                        Swal.getHtmlContainer().querySelector('b').textContent = contador;
                        if (contador <= 0) {
                            clearInterval(interval);
                            Swal.fire({
                                title: 'Continúa en el datáfono',
                                html: 'Por favor, presiona la <b style=""color: #157347;"">TECLA VERDE</b> del datáfono para continuar.',
                                background: '#3C3C3C',
                                icon: 'info',
                                allowOutsideClick: false,
                                showConfirmButton: false,
                                customClass: {
                                    popup: 'alert',
                                    confirmButton: 'btn-confirm-alert'
                                },
                                didOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                        }
                    }, 1000);
                }
            });";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlertProcesando", script, true);
        }
    }
}