using System;
using System.Collections.Generic;
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
            try
            {
                int precioPlan = int.Parse(Session["valorPlan"].ToString());

                // 1. Compra de plan por datáfono Redeban
                bool pagoIniciado = await RealizarPagoAsync(precioPlan);

                if (!pagoIniciado)
                {
                    MostrarAlerta("Error de Pago", "No se pudo iniciar el proceso de pago.", "error");
                    return;
                }

                // Si se inició el pago, activamos el Timer para polling
                tmrRespuesta.Enabled = true;

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
                string codSiigoPlan = "COD2433";
                string nombrePlan = "Pago de suscripción";
                int precioPlanSiigo = 10000;
                string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                    Session["documentoAfiliado"].ToString(),
                    codSiigoPlan,
                    nombrePlan,
                    precioPlanSiigo
                );

                // 3. Registro de afiliación en la base de datos (AfiliadoPlan)

                // 4. Registro de pago en la base de datos (PagosPlanAfiliado)

            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        private async Task<bool> RealizarPagoAsync(int precioPlan)
        {
            try
            {
                var redebanClient = CrearRedebanClient();

                string token = await redebanClient.ObtenerTokenAsync();

                if (string.IsNullOrEmpty(token))
                {
                    MostrarAlerta("Error", "No se pudo obtener el token de Redeban.", "error");
                    return false;
                }

                string idTransaccion = DateTime.Now.ToString("yyyyMMddHHmmss");

                // Guardar en sesión para usar luego
                Session["idTransaccion"] = idTransaccion;
                Session["token"] = token;
                Session["intentos"] = 0;

                // TODO: Reemplazar el código del datáfono por el real que viene de la query
                string resultado = await redebanClient.EnviarDatosCompraAsync(idTransaccion, token, precioPlan, "LM9ZZ702");
                //lblResult.Text = "DatosCompra: " + resultado;

                if (resultado.Contains("Cod:00"))
                {
                    // Activar el Timer para iniciar la consulta automática
                    //tmrRespuesta.Enabled = true;

                    return true;
                }
                else
                {
                    MostrarAlerta("Error en pago", "No se pudo iniciar la transacción. Detalle: " + resultado, "error");
                    return false;
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Ocurrió un error al procesar el pago.", "error");
                System.Diagnostics.Debug.WriteLine("Error en RealizarCompra: " + ex.ToString());
                return false;
            }
        }

        protected async void tmrRespuesta_Tick(object sender, EventArgs e)
        {
            int intentos = (int)(Session["intentos"] ?? 0);

            if (intentos >= 15)
            {
                tmrRespuesta.Enabled = false;
                MostrarAlerta("Tiempo excedido", "No se recibió respuesta del datáfono. Por favor, intente nuevamente.", "warning");
                return;
            }

            Session["intentos"] = intentos + 1;

            string idTransaccion = Session["idTransaccion"]?.ToString();
            string token = Session["token"]?.ToString();
            var redebanClient = CrearRedebanClient();

            if (string.IsNullOrEmpty(idTransaccion) || string.IsNullOrEmpty(token))
            {
                tmrRespuesta.Enabled = false;
                MostrarAlerta("Error", "No hay datos de transacción para consultar.", "error");
                return;
            }

            string respuesta = await redebanClient.ConsultarRespuestaAsync(idTransaccion, token);

            if (respuesta.Contains("Cod:00") && respuesta.Contains("Msj:0") || respuesta.Contains("Msj:00"))
            {
                tmrRespuesta.Enabled = false;
                MostrarAlerta("Pago aprobado", "La transacción fue aprobada exitosamente.", "success");
                // Aquí podrías llamar a tu registro de afiliado y Siigo
            }
            else if (respuesta.Contains("Cod:00") && respuesta.Contains("Msj:1") || respuesta.Contains("Msj:01"))
            {
                tmrRespuesta.Enabled = false;
                MostrarAlerta("Pago rechazado", "La transacción fue rechazada.", "error");
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

        private void MostrarAlerta(string titulo, string mensaje, string tipo)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{tipo}', 
                background: '#3C3C3C', 
                showCloseButton: true, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
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