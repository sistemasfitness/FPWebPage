using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
	public partial class EncontrarFuentePago : System.Web.UI.Page
	{
        protected async void btnBuscar_Click(object sender, EventArgs e)
        {
            await BuscarPaymentSources();
        }

        private async Task BuscarPaymentSources()
        {
            int start = 17437740;
            int end = 17444919;
            string foundId = null;

            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("H", "application/json");
                client.DefaultRequestHeaders.Add("Authorization", "Bearer prv_prod_h7JHlOIL6EjCzotPnupYSbzy16ulQ5DO");

                for (int id = start; id <= end; id++)
                {
                    string url = $"https://production.wompi.co/v1/payment_sources/{id}";
                    AppendConsole($"Consultando: {url}");

                    var response = await client.GetAsync(url);
                    string body = await response.Content.ReadAsStringAsync();

                    if (!body.Contains("\"error\":"))
                    {
                        AppendConsole("✅ Encontrado:");
                        AppendConsole(body);
                        foundId = id.ToString();
                        break;
                    }

                    await Task.Delay(200); // espera 200 ms para no saturar la API
                }
            }

            if (foundId != null)
                AppendConsole($"👉 El primer payment_source válido está en ID: {foundId}");
            else
                AppendConsole("No se encontró ningún payment_source válido en el rango.");
        }

        private void AppendConsole(string text)
        {
            txtConsola.Text += text + Environment.NewLine;
        }
    }
}