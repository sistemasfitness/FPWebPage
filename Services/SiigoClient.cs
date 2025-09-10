using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using static WebPage.Services.SiigoClient;
using static WebPage.wompipay;

namespace WebPage.Services
{
    public class SiigoClient
    {
        private readonly HttpClient _httpClient;
        private readonly string _baseUrl;
        private readonly string _username;
        private readonly string _accessKey;
        private readonly string _partnerId;

        public SiigoClient(HttpClient httpClient, string baseUrl, string username, string accessKey, string partnerId)
        {
            _httpClient = httpClient;
            _baseUrl = baseUrl;
            _username = username;
            _accessKey = accessKey;
            _partnerId = partnerId;
        }

        public async Task<string> GetTokenAsync()
        {
            var url = $"{_baseUrl}auth";
            var payload = new
            {
                username = _username,
                access_key = _accessKey
            };

            var json = JsonConvert.SerializeObject(payload);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(url, content);
            response.EnsureSuccessStatusCode();

            var jsonResponse = await response.Content.ReadAsStringAsync();
            dynamic obj = JsonConvert.DeserializeObject(jsonResponse);
            return obj.access_token;
        }

        public async Task<string> RegisterCustomerAsync(string documento, string nombres, string apellidos, string celular, string correo)
        {
            // TODO: Insertar en la base de datos esta información
            // 1. Obtener configuración de Siigo desde la BD
            //clasesglobales cg = new clasesglobales();
            //DataTable dtConf = cg.ConsultarConfiguracionSiigo();

            //string baseUrl = dtConf.Rows[0]["BaseUrl"].ToString();
            //string username = dtConf.Rows[0]["Username"].ToString();
            //string accessKey = dtConf.Rows[0]["AccessKey"].ToString();
            //string partnerId = dtConf.Rows[0]["PartnerId"].ToString();

            //string baseUrl = "https://api.siigo.com/";
            // Datos - Pruebas
            //string username = "sandbox@siigoapi.com";
            //string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";

            // Datos - Producción
            // string username = "contabilidad@fitnesspeoplecmd.com";
            // string accessKey = "YjU2NWE3YjktYjlhZS00OTRkLWE3NDgtODc0MGUyYjhmYzNlOjh9QDZyKDdwPkE=";

            // Header - Pruebas
            //string partnerId = "SandboxSiigoApi";

            // Header - Producción
            // string header = "ProductionSiigoApi";

            //var siigo = new SiigoClient(new HttpClient(), baseUrl, username, accessKey, partnerId);

            // 2. Obtener token
            string token = await GetTokenAsync();

            // 3. Consultar tipo de documento en BD
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarCodigoSiigoPorDocumento(documento);
            string codSiigo = dt.Rows[0]["CodSiigo"].ToString();
            dt.Dispose();

            // 4. Crear el objeto Customer
            Customer oCustomer = new Customer()
            {
                person_type = "Person",
                id_type = codSiigo,
                identification = documento,
                name = new List<string> { nombres, apellidos },
                email = correo,
                phones = new List<Phone> {
                    new Phone { number = celular }
                },
                contacts = new List<Contact> {
                    new Contact
                    {
                        first_name = nombres,
                        last_name = apellidos,
                        email = correo
                    }
                }
            };

            // 5. Crear cliente en Siigo
            string respuesta = await CreateCustomerAsync(oCustomer, token);

            return respuesta;
        }

        public async Task<string> CreateCustomerAsync(Customer oCustomer, string token)
        {
            var url = $"{_baseUrl}v1/customers";
            var json = JsonConvert.SerializeObject(oCustomer, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            var request = new HttpRequestMessage(HttpMethod.Post, url);
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
            request.Headers.Add("Partner-Id", _partnerId);
            request.Content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                throw new Exception($"Error al crear cliente: {await response.Content.ReadAsStringAsync()}");

            return await response.Content.ReadAsStringAsync();
        }

        public async Task ManageCustomerAsync(string documento, string nombres, string apellidos, string celular, string correo)
        {
            // TODO: Insertar en la base de datos esta información
            // 1. Obtener configuración de Siigo desde la BD
            //clasesglobales cg = new clasesglobales();
            //DataTable dtConf = cg.ConsultarConfiguracionSiigo();

            //string baseUrl = dtConf.Rows[0]["BaseUrl"].ToString();
            //string username = dtConf.Rows[0]["Username"].ToString();
            //string accessKey = dtConf.Rows[0]["AccessKey"].ToString();
            //string partnerId = dtConf.Rows[0]["PartnerId"].ToString();

            //string baseUrl = "https://api.siigo.com/";
            // Datos - Pruebas
            //string username = "sandbox@siigoapi.com";
            //string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";

            // Datos - Producción
            // string username = "contabilidad@fitnesspeoplecmd.com";
            // string accessKey = "YjU2NWE3YjktYjlhZS00OTRkLWE3NDgtODc0MGUyYjhmYzNlOjh9QDZyKDdwPkE=";

            // Header - Pruebas
            //string partnerId = "SandboxSiigoApi";

            // Header - Producción
            // string header = "ProductionSiigoApi";

            //var siigo = new SiigoClient(new HttpClient(), baseUrl, username, accessKey, partnerId);

            // 2. Obtener token
            string token = await GetTokenAsync();

            // 3. Consultar si el cliente ya existe
            bool exists = await CustomerExistsAsync(documento, token);

            // 4. Si no existe, crearlo
            if (!exists)
            {
                await RegisterCustomerAsync(documento, nombres, apellidos, celular, correo);
            }
        }

        public async Task<bool> CustomerExistsAsync(string documento, string token)
        {
            var url = $"{_baseUrl}v1/customers?identification={documento}";
            var request = new HttpRequestMessage(HttpMethod.Get, url);
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
            request.Headers.Add("Partner-Id", _partnerId);

            var response = await _httpClient.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                throw new Exception($"Error al consultar cliente: {await response.Content.ReadAsStringAsync()}");

            dynamic obj = JsonConvert.DeserializeObject(await response.Content.ReadAsStringAsync());
            return obj.pagination.total_results > 0;
        }

        public async Task<string> RegisterInvoiceAsync(string cedula, string codSiigoPlan, string nombrePlan, int precioPlan, int idSede)
        {
            // TODO: Insertar en la base de datos esta información
            // 1. Obtener configuración de Siigo desde la BD
            //clasesglobales cg = new clasesglobales();
            //DataTable dtConf = cg.ConsultarConfiguracionSiigo();

            //string baseUrl = dtConf.Rows[0]["BaseUrl"].ToString();
            //string username = dtConf.Rows[0]["Username"].ToString();
            //string accessKey = dtConf.Rows[0]["AccessKey"].ToString();
            //string partnerId = dtConf.Rows[0]["PartnerId"].ToString();

            //string baseUrl = "https://api.siigo.com/";
            // Datos - Pruebas
            //string username = "sandbox@siigoapi.com";
            //string accessKey = "YmEzYTcyOGYtN2JhZi00OTIzLWE5ZjktYTgxNTVhNWUxZDM2Ojc0ODllKUZrSFM=";

            // Datos - Producción
            // string username = "contabilidad@fitnesspeoplecmd.com";
            // string accessKey = "YjU2NWE3YjktYjlhZS00OTRkLWE3NDgtODc0MGUyYjhmYzNlOjh9QDZyKDdwPkE=";

            // Header - Pruebas
            //string partnerId = "SandboxSiigoApi";

            // Header - Producción
            // string partnerId = "ProductionSiigoApi";

            clasesglobales cg = new clasesglobales();
            DataTable dtIntegracion = cg.ConsultarIntegracion(idSede);
            int idTipoDocumento = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? Convert.ToInt32(dtIntegracion.Rows[0]["idTipoDocumento"].ToString()) : 28006;
            int costCenterDefault = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? Convert.ToInt32(dtIntegracion.Rows[0]["costCenterDefault"].ToString()) : 621;
            int idVendedor = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? Convert.ToInt32(dtIntegracion.Rows[0]["idVendedor"].ToString()) : 856;
            int idPayment = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? Convert.ToInt32(dtIntegracion.Rows[0]["idPayment"].ToString()) : 856;

            // Más Datos - Pruebas
            //int idTipoDocumento = 28006;
            //int costCenterDefault = 621;
            //int idVendedor = 856;
            //int idPayment = 9438;

            // Más Datos - Producción
            //int idTipoDocumento = 66444;
            //int costCenterDefault = 13053;
            //int idVendedor = 51883;
            // TODO: CAMBIAR ESTE MÉTODO DE PAGO YA QUE SE VAN A HACER MODIFICACIONES EN SIIGO
            //int idPayment = 59576;

            //var siigo = new SiigoClient(new HttpClient(), baseUrl, username, accessKey, partnerId);

            // 2. Obtener token
            string token = await GetTokenAsync();

            string fechaActual = DateTime.Now.ToString("yyyy-MM-dd");

            // 3. Crear el objeto Invoice
            Invoice oInvoice = new Invoice()
            {
                document = new DocumentType { id = idTipoDocumento },
                date = fechaActual,
                customer = new Customer { identification = cedula },
                seller = idVendedor,
                items = new List<Items>
                {
                    new Items
                    {
                        code = codSiigoPlan,
                        description = nombrePlan,
                        quantity = 1,
                        price = precioPlan,
                        cost_center = new CostCenter { id = costCenterDefault }
                    }
                },
                stamp = new Stamp { send = true },
                mail = new Mail { send = true },
                payments = new List<Payments>
                {
                    new Payments
                    {
                        id = idPayment,
                        value = precioPlan
                    }
                }
            };

            // 4. Crear factura en Siigo
            string respuesta = await CreateInvoiceAsync(oInvoice, token);

            var jsonRespuesta = JsonConvert.DeserializeObject<dynamic>(respuesta);
            return jsonRespuesta.id;
        }

        public async Task<string> CreateInvoiceAsync(Invoice oInvoice, string token)
        {
            var url = $"{_baseUrl}v1/invoices";
            var json = JsonConvert.SerializeObject(oInvoice, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            var request = new HttpRequestMessage(HttpMethod.Post, url);
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
            request.Headers.Add("Partner-Id", _partnerId);
            request.Content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                throw new Exception($"Error al crear factura: {await response.Content.ReadAsStringAsync()}");

            return await response.Content.ReadAsStringAsync();
        }

        // Clase para la estructura del cliente
        public class Customer
        {
            public string person_type { get; set; }
            public string id_type { get; set; }
            public string identification { get; set; }
            public List<string> name { get; set; }
            public string email { get; set; }
            public List<Phone> phones { get; set; }
            public List<Contact> contacts { get; set; }
        }

        public class Phone
        {
            public string number { get; set; }
        }

        public class Contact
        {
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string email { get; set; }
        }

        // Clase para la estructura de la factura
        public class Invoice
        {
            public DocumentType document { get; set; }
            public string date { get; set; }
            public Customer customer { get; set; }
            public int seller { get; set; }
            public List<Items> items { get; set; }
            public Stamp stamp { get; set; }
            public Mail mail { get; set; }
            public List<Payments> payments { get; set; }
        }

        public class DocumentType
        {
            public int id { get; set; }
        }

        public class Items
        {
            public string code { get; set; }
            public string description { get; set; }
            public int quantity { get; set; }
            public int price { get; set; }
            public CostCenter cost_center { get; set; }
        }

        public class CostCenter
        {
            public int id { get; set; }
        }

        public class Stamp
        {
            public bool send { get; set; }
        }

        public class Mail
        {
            public bool send { get; set; }
        }

        public class Payments
        {
            public int id { get; set; }
            public int value { get; set; }
        }
    }
}