using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
	public partial class TestRedeban : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnEnviarDatos_Click(object sender, EventArgs e)
        {
            string token = RedebanClient.ObtenerToken();
            string idTransaccion = DateTime.Now.ToString("yyyyMMddHHmmss");

            // Guardar en sesión para usar luego
            Session["idTransaccion"] = idTransaccion;
            Session["token"] = token;
            Session["intentos"] = 0;

            string resultado = RedebanClient.EnviarDatosCompra(idTransaccion, token);
            lblResult.Text = "DatosCompra: " + resultado;

            if (resultado.Contains("Cod:00"))
            {
                // Activar el Timer para iniciar la consulta automática
                tmrRespuesta.Enabled = true;
            }
            else
            {
                lblResult.Text += "<br/> Error en DatosCompra, no se activará el Timer.";
            }
        }

        protected void tmrRespuesta_Tick(object sender, EventArgs e)
        {
            string idTransaccion = Session["idTransaccion"]?.ToString();
            string token = Session["token"]?.ToString();
            int intentos = (Session["intentos"] != null) ? (int)Session["intentos"] : 0;

            if (string.IsNullOrEmpty(idTransaccion) || string.IsNullOrEmpty(token))
            {
                tmrRespuesta.Enabled = false;
                lblResult.Text = "Error: Faltan datos de sesión.";
                return;
            }

            // Incrementar contador
            intentos++;
            Session["intentos"] = intentos;

            string respuesta = RedebanClient.ConsultarRespuesta(idTransaccion, token);
            lblResult.Text = $"Respuesta (Intento {intentos}/10): " + respuesta;

            // Si ya hubo respuesta definitiva, detener el Timer
            if (respuesta.Contains("Cod:00") && respuesta.Contains("Msj:0") || respuesta.Contains("Msj:00"))
            {
                tmrRespuesta.Enabled = false;
                lblResult.Text += "<br/>✅ Pago aprobado.";
                // Aquí podrías guardar en BD y mostrar pantalla de éxito
            }
            else if (respuesta.Contains("Cod:00") && respuesta.Contains("Msj:1") || respuesta.Contains("Msj:01"))
            {
                tmrRespuesta.Enabled = false;
                lblResult.Text += "<br/>❌ Pago rechazado.";
            }
            // Otros Cod: (02 = iniciando, 03+ = error) pueden seguir consultando
            else if (intentos >= 10)
            {
                tmrRespuesta.Enabled = false;
                lblResult.Text += "<br/>⚠️ Tiempo agotado. El cliente no completó el pago.";
            }
        }

        protected void btnEliminarTransaccion_Click(object sender, EventArgs e)
        {
            string token = RedebanClient.ObtenerToken();
            string idTransaccion = Session["idTransaccion"]?.ToString();

            // Guardar en sesión para usar luego
            Session["idTransaccion"] = idTransaccion;
            Session["token"] = token;

            string resultado = RedebanClient.BorrarTransaccion(idTransaccion, token);
            lblResult.Text = "BorrarTransaccion: " + resultado;

            if (resultado.Contains("Cod:00"))
            {
                // Activar el Timer para iniciar la consulta automática
                tmrRespuesta.Enabled = true;
            }
        }
    }
}