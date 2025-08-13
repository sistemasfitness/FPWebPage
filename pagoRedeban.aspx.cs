using System;
using System.Collections.Generic;
using System.Linq;
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
                // 1. Compra del plan con Redeban
                bool pagoIniciado = await RealizarPagoAsync();

                if (!pagoIniciado)
                {
                    MostrarAlerta("Error de Pago", "No se pudo iniciar el proceso de pago.", "error");
                    return;
                }

                // Si se inició el pago, activamos el Timer para polling
                tmrRespuesta.Enabled = true;

                // 2. Registro/actualización del afiliado

                // 3. Creación del cliente en Siigo (si no existe)


                //clasesglobales cg = new clasesglobales();

                ////Guardamos los datos del afiliado
                //string strCedula = txbDocumento.Text.ToString();
                //Session.Add("documentoAfiliado", strCedula);
                //int idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedItem.Value.ToString());

                ////Session.Add("idAfiliado", "");

                //string idAfiliado = "";

                //DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(strCedula);
                //if (dtAfiliado.Rows.Count > 0)
                //{
                //    idAfiliado = dtAfiliado.Rows[0]["IdAfiliado"].ToString();
                //}

                //string strNombre = txbNombre.Text.ToString();
                //Session.Add("nombreAfiliado", strNombre);
                //string strApellido = txbApellido.Text.ToString();
                //Session.Add("apellidoAfiliado", strApellido);
                //string strCelular = txbCelular.Text.ToString();
                //Session.Add("celularAfiliado", strCelular);
                //string strEmail = txbEmail.Text.ToString();
                //Session.Add("emailAfiliado", strEmail);
                //int idGenero = int.Parse(ddlGenero.SelectedItem.Value.ToString());
                //string strFechaNac = txbFechaNac.Text.ToString();

                //string strFechaInicioPlan = txbFechaIni.Text.ToString();
                ////Session.Add("fechaInicioPlan", strFechaInicioPlan);
                //string strFechaFinPlan = CalcularFechaFinPlan(strFechaInicioPlan);
                ////Session.Add("fechaFinPlan", strFechaFinPlan);

                //DataTable dtPlan = cg.ConsultarPlanWebPorId(int.Parse(Session["idPlan"].ToString()));
                ////Session.Add("meses", dtPlan.Rows[0]["Meses"]);
                //int idCiudad = int.Parse(ddlCiudad.SelectedItem.Value.ToString());
                //int idSede = int.Parse(ddlSedes.SelectedItem.Value.ToString());
                //string strValorPlan = hfValorPlan.Value;
                ////Session.Add("valorPlan", strValorPlan);
                //string strLtValor = ltValor.Text.ToString();
                ////Session.Add("ltValorPlan", strLtValor);

                ////Buscamos el documento en la tabla afiliados. Si no existe, creamos el afiliado. Si existe, actualizamos sus datos
                //if (idAfiliado != "")
                //{
                //    // IMPORTANTE: NO ELIMINAR - SOLO SE COMENTA PARA REALIZAR PRUEBAS
                //    DataTable dtFechaFinPlan = cg.ConsultarFechaFinPlanPorDocumento(strCedula);

                //    if (dtFechaFinPlan.Rows.Count > 0)
                //    {
                //        // Obtener fecha de fin anterior
                //        DateTime fechaFinAnterior = Convert.ToDateTime(dtFechaFinPlan.Rows[0]["FechaFinalPlan"]);
                //        DateTime fechaInicioNuevo = Convert.ToDateTime(strFechaInicioPlan);

                //        if (fechaInicioNuevo <= fechaFinAnterior)
                //        {
                //            MostrarAlerta(
                //                "Fecha de inicio inválida",
                //                "La fecha de inicio del plan debe ser posterior a la fecha de finalización de un plan activo.",
                //                "warning"
                //            );

                //            return;
                //        }
                //    }

                //    dtFechaFinPlan.Dispose();

                //    cg.ActualizarAfiliadoWeb(
                //        strCedula,
                //        strNombre,
                //        strApellido,
                //        strCelular,
                //        strEmail,
                //        idGenero,
                //        strFechaNac,
                //        idCiudad,
                //        idSede,
                //        "Pendiente"
                //    );
                //}
                //else
                //{
                //    //Si no existe el documento del afiliado, lo creamos como nuevo.
                //    cg.InsertarAfiliadoWeb(
                //        strCedula,
                //        idTipoDocumento,
                //        strNombre,
                //        strApellido,
                //        strCelular,
                //        strEmail,
                //        idGenero,
                //        strFechaNac,
                //        idCiudad,
                //        idSede
                //    );

                //    //EnviarCorreoBienvenida();
                //}

                ////DataTable dtAfiliado2 = cg.ConsultarAfiliadoPorDocumento(strCedula);
                ////Session.Add("idAfiliado", dtAfiliado2.Rows[0]["IdAfiliado"]);

                //dtAfiliado.Dispose();
                ////dtAfiliado2.Dispose();
                //dtPlan.Dispose();

                //// Siigo API
                //string token = GetSiigoToken();
                //Session.Add("tokenSiigo", token);
                //bool exists = ConsultSiigoCustomer(strCedula, token);
                //ManageCustomer(exists, token);

                //if (Session["idPlan"].ToString() == "1")
                //{
                //    Response.Redirect("wompipay", false);
                //    Context.ApplicationInstance.CompleteRequest();
                //}
                //else
                //{
                //    Response.Redirect("wompiplan", false);
                //    Context.ApplicationInstance.CompleteRequest();
                //}
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        private async Task<bool> RealizarPagoAsync()
        {
            try
            {
                string token = await RedebanClient.ObtenerTokenAsync();

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

                string resultado = await RedebanClient.EnviarDatosCompraAsync(idTransaccion, token);
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

            if (string.IsNullOrEmpty(idTransaccion) || string.IsNullOrEmpty(token))
            {
                tmrRespuesta.Enabled = false;
                MostrarAlerta("Error", "No hay datos de transacción para consultar.", "error");
                return;
            }

            string respuesta = await RedebanClient.ConsultarRespuestaAsync(idTransaccion, token);

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