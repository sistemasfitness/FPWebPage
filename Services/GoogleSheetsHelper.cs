using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Sheets.v4;
using Google.Apis.Sheets.v4.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Hosting;

namespace WebPage.Services
{
    public class GoogleSheetsHelper
    {
        private readonly SheetsService _sheetsService; 
        private readonly string _spreadsheetId;

        /// <summary>
        /// Inicializa el servicio de Google Sheets utilizando
        /// la configuración definida en Web.config.
        /// </summary>

        public GoogleSheetsHelper() 
        {
            // ==========================================
            // Obtener configuración desde Web.config
            // ==========================================

            _spreadsheetId = ConfigurationManager
                .AppSettings["GoogleSheetsSpreadsheetId"];

            string credentialsPath = ConfigurationManager
                .AppSettings["GoogleSheetsCredentials"];


            // ==========================================
            // Validar configuración
            // ==========================================

            if (string.IsNullOrWhiteSpace(_spreadsheetId))
            {
                throw new ConfigurationErrorsException(
                    "No se encontró la configuración 'GoogleSheetsSpreadsheetId' en Web.config.");
            }

            if (string.IsNullOrWhiteSpace(credentialsPath))
            {
                throw new ConfigurationErrorsException(
                    "No se encontró la configuración 'GoogleSheetsCredentials' en Web.config.");
            }


            // ==========================================
            // Resolver ruta física del JSON
            // ==========================================

            string physicalPath;

            if (credentialsPath.StartsWith("~/"))
            {
                physicalPath = HostingEnvironment.MapPath(credentialsPath);
            }
            else
            {
                physicalPath = credentialsPath;
            }

            if (string.IsNullOrWhiteSpace(physicalPath))
            {
                throw new FileNotFoundException(
                    "No fue posible resolver la ruta del archivo de credenciales.");
            }

            if (!File.Exists(physicalPath))
            {
                throw new FileNotFoundException(
                    "No se encontró el archivo de credenciales de Google Sheets.",
                    physicalPath);
            }


            // ==========================================
            // Crear credenciales
            // ==========================================

            GoogleCredential credential;

            using (var stream = new FileStream(
                physicalPath,
                FileMode.Open,
                FileAccess.Read,
                FileShare.Read))
            {
                credential = CredentialFactory
                    .FromFile<ServiceAccountCredential>(physicalPath)
                    .ToGoogleCredential()
                    .CreateScoped(SheetsService.Scope.Spreadsheets);
            }


            // ==========================================
            // Crear servicio Google Sheets
            // ==========================================

            _sheetsService = new SheetsService(
                new BaseClientService.Initializer
                {
                    HttpClientInitializer = credential,
                    ApplicationName = "Fitness People"
                });
        }

        /// <summary>
        /// Agrega una fila al final del rango especificado.
        /// </summary>
        public async Task AgregarFilaAsync(
            string range,
            IList<object> values)
        {
            ValidarRange(range);

            if (values == null || values.Count == 0)
            {
                throw new ArgumentException(
                    "Debe proporcionar los valores de la fila.",
                    nameof(values));
            }

            var valueRange = new ValueRange
            {
                Values = new List<IList<object>>
                {
                    values
                }
            };

            var request = _sheetsService
                .Spreadsheets
                .Values
                .Append(
                    valueRange,
                    _spreadsheetId,
                    range);

            request.ValueInputOption =
                SpreadsheetsResource.ValuesResource
                    .AppendRequest
                    .ValueInputOptionEnum.USERENTERED;

            request.InsertDataOption =
                SpreadsheetsResource.ValuesResource
                    .AppendRequest
                    .InsertDataOptionEnum.INSERTROWS;

            await request.ExecuteAsync();
        }

        /// <summary>
        /// Agrega múltiples filas al final del rango especificado.
        /// </summary>
        public async Task AgregarFilasAsync(
            string range,
            IList<IList<object>> rows)
        {
            ValidarRange(range);

            if (rows == null || rows.Count == 0)
            {
                throw new ArgumentException(
                    "Debe proporcionar las filas.",
                    nameof(rows));
            }

            var valueRange = new ValueRange
            {
                Values = rows
            };

            var request = _sheetsService
                .Spreadsheets
                .Values
                .Append(
                    valueRange,
                    _spreadsheetId,
                    range);

            request.ValueInputOption =
                SpreadsheetsResource.ValuesResource
                    .AppendRequest
                    .ValueInputOptionEnum.USERENTERED;

            request.InsertDataOption =
                SpreadsheetsResource.ValuesResource
                    .AppendRequest
                    .InsertDataOptionEnum.INSERTROWS;

            await request.ExecuteAsync();
        }

        /// <summary>
        /// Actualiza un rango específico.
        /// </summary>
        public async Task ActualizarRangoAsync(
            string range,
            IList<IList<object>> values)
        {
            ValidarRange(range);

            if (values == null || values.Count == 0)
            {
                throw new ArgumentException(
                    "Debe proporcionar los valores.",
                    nameof(values));
            }

            var valueRange = new ValueRange
            {
                Values = values
            };

            var request = _sheetsService
                .Spreadsheets
                .Values
                .Update(
                    valueRange,
                    _spreadsheetId,
                    range);

            request.ValueInputOption =
                SpreadsheetsResource.ValuesResource
                    .UpdateRequest
                    .ValueInputOptionEnum.USERENTERED;

            await request.ExecuteAsync();
        }

        /// <summary>
        /// Obtiene los valores de un rango.
        /// </summary>
        public async Task<IList<IList<object>>> ObtenerRangoAsync(
            string range)
        {
            ValidarRange(range);

            var request = _sheetsService
                .Spreadsheets
                .Values
                .Get(
                    _spreadsheetId,
                    range);

            var response = await request.ExecuteAsync();

            return response.Values
                   ?? new List<IList<object>>();
        }

        /// <summary>
        /// Limpia los valores de un rango.
        /// </summary>
        public async Task LimpiarRangoAsync(
            string range)
        {
            ValidarRange(range);

            var request = _sheetsService
                .Spreadsheets
                .Values
                .Clear(
                    new ClearValuesRequest(),
                    _spreadsheetId,
                    range);

            await request.ExecuteAsync();
        }

        /// <summary>
        /// Valida que el rango tenga información.
        /// </summary>
        private void ValidarRange(string range)
        {
            if (string.IsNullOrWhiteSpace(range))
            {
                throw new ArgumentException(
                    "El rango de Google Sheets es obligatorio.",
                    nameof(range));
            }
        }
    }
}