using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using NPOI.POIFS.Crypt.Agile;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
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

        protected async void btnActualizar_Click(object sender, EventArgs e)
        {
            await ActualizarTokensDePaymentSources();
        }

        private async Task BuscarPaymentSources()
        {
            int start = 18502920;
            int end = 18502921;
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

        private async Task ActualizarTokensDePaymentSources()
        {
            string query = $@"SELECT DISTINCT a.DocumentoAfiliado, CONCAT(NombreAfiliado, ' ', ApellidoAfiliado) 'Nombre del cliente', 
	                            DocumentoAfiliado AS Documento, CelularAfiliado AS Telefono, EmailAfiliado AS Email, 
	                            p.NombrePlan AS 'Plan vigente', ap.FechaInicioPlan AS 'Fecha inicio plan', 
	                            ap.FechaFinalPlan AS 'Fecha final plan', ppa.DataIdFuente 'DataIdFuente', ppa.DataIdToken 'Token'
                            FROM AfiliadosPlanes ap 
                            INNER JOIN PagosPlanAfiliado ppa ON ppa.idAfiliadoPlan = ap.idAfiliadoPlan 
                            INNER JOIN (
	                                 SELECT idAfiliadoPlan, MAX(idPago) AS idPagoUltimo
	                                 FROM PagosPlanAfiliado
	                                 GROUP BY idAfiliadoPlan
	                            ) ult ON ult.idPagoUltimo = ppa.idPago 
                            INNER JOIN Planes p ON p.idPlan = ap.idPlan 
                            INNER JOIN Afiliados a ON a.idAfiliado = ap.idAfiliado 
                            WHERE p.debitoAutomatico = 1 
                            AND ppa.DataIdToken IS NULL 
                            AND ppa.DataIdFuente IS NOT NULL 
                            AND a.idSede = 10;";

            clasesglobales cg = new clasesglobales();

            DataTable dt = cg.TraerDatos(query);


            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("H", "application/json");
                client.DefaultRequestHeaders.Add("Authorization", "Bearer prv_prod_h7JHlOIL6EjCzotPnupYSbzy16ulQ5DO");


                foreach (DataRow dr in dt.Rows)
                {
                    string dataIdFuente = dr["DataIdFuente"].ToString();

                    string url = $"https://production.wompi.co/v1/payment_sources/{dataIdFuente}";

                    var response = await client.GetAsync(url);
                    string body = await response.Content.ReadAsStringAsync();

                    if (!body.Contains("\"error\":"))
                    {
                        string dataIdToken = JsonConvert.DeserializeObject<dynamic>(body).data.token;

                        cg.ActualizarDataTokenPorDataIdFuente(dataIdFuente, dataIdToken);
                    }
                    else
                    {
                        AppendConsole($"❌ No encontrado para DataIdFuente: {dataIdFuente}");
                    }

                    await Task.Delay(200); // espera 200 ms para no saturar la API
                }
            }
        }
    }
}