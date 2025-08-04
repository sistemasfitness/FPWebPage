using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;

namespace WebPage.Services
{
    public class RedebanClient
    {
        public static string ObtenerToken()
        {
            string url = "https://sipserviceclientetestv52.azurewebsites.net/sipservice.asmx";
            string accionSoap = "http://tempuri.org/Token";

            // Cambia estos valores por los que te dio Redeban
            string codigoUnico = "0020304050";
            string usuario = "sistemas@fitnesspeoplecmd.com";
            string clave = "idJ089J3Fm";

            string soapXml = $@"<?xml version=""1.0"" encoding=""utf-8""?>
                                <soapenv:Envelope xmlns:soapenv=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:tem=""http://tempuri.org/"">
                                   <soapenv:Header/>
                                   <soapenv:Body>
                                      <tem:Token>
                                         <tem:Cod_unico>{codigoUnico}</tem:Cod_unico>
                                         <tem:usuario>{usuario}</tem:usuario>
                                         <tem:clave>{clave}</tem:clave>
                                      </tem:Token>
                                   </soapenv:Body>
                                </soapenv:Envelope>";

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                byte[] data = Encoding.UTF8.GetBytes(soapXml);

                request.Method = "POST";
                request.ContentType = "text/xml; charset=utf-8";
                request.ContentLength = data.Length;
                request.Headers.Add("SOAPAction", accionSoap);

                // Requiere TLS 1.2
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                using (WebResponse response = request.GetResponse())
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    string result = reader.ReadToEnd();

                    // Parsear respuesta SOAP para extraer solo el token
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(result);
                    XmlNamespaceManager ns = new XmlNamespaceManager(doc.NameTable);
                    ns.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");
                    ns.AddNamespace("ns", "http://tempuri.org/");

                    XmlNode tokenNode = doc.SelectSingleNode("//ns:TokenResult", ns);
                    return tokenNode?.InnerText ?? "No se pudo leer el token";
                }
            }
            catch (Exception ex)
            {
                return $"Error al obtener token: {ex.Message}";
            }
        }

        public static string EnviarDatosCompra(string idTransaccion, string token)
        {
            string url = "https://sipserviceclientetestv52.azurewebsites.net/sipservice.asmx";
            string soapAction = "http://tempuri.org/DatosCompra";

            // ⚠️ CAMBIA ESTOS VALORES
            string codigoUnico = "0020304050"; // Código Redeban
            string sobreescribir = "S"; // TODO: Cambiar a N
            string terminal = "LM9ZZ702";

            // ⚙️ Armar la cadena 'Data'
            //string data = $"15630,1200,2500,1234567,10630,987653,800,14000,1630,12345,{terminal},3,N";

            var builder = new CompraDataBuilder
            {
                Valor = 120000,
                Propina = 0,
                IVA = 22800,
                Factura = "F123456",
                BaseDevolucionIVA = 97200,
                CodigoCajero = "KIOSCO01",
                ImpuestoConsumo = 0,
                MontoBaseIVA = 100000,
                MontoBaseImpConsumo = 0,
                Recibo = "R123456",
                Terminal = terminal,
            };

            string data = builder.GenerarCadena();

            string soapXml = $@"<?xml version=""1.0"" encoding=""utf-8""?>
                                <soapenv:Envelope xmlns:soapenv=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:tem=""http://tempuri.org/"">
                                   <soapenv:Header/>
                                   <soapenv:Body>
                                      <tem:DatosCompra>
                                         <tem:Cod_Unico>{codigoUnico}</tem:Cod_Unico>
                                         <tem:id_transaccion>{idTransaccion}</tem:id_transaccion>
                                         <tem:Data>{data}</tem:Data>
                                         <tem:token>{token}</tem:token>
                                         <tem:sobreescribir>{sobreescribir}</tem:sobreescribir>
                                      </tem:DatosCompra>
                                   </soapenv:Body>
                                </soapenv:Envelope>";

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                byte[] dataBytes = Encoding.UTF8.GetBytes(soapXml);

                request.Method = "POST";
                request.ContentType = "text/xml; charset=utf-8";
                request.ContentLength = dataBytes.Length;
                request.Headers.Add("SOAPAction", soapAction);

                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(dataBytes, 0, dataBytes.Length);
                }

                using (WebResponse response = request.GetResponse())
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    string result = reader.ReadToEnd();

                    // Extraer el mensaje: Cod:XX,Msj:XXXX
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(result);
                    XmlNamespaceManager ns = new XmlNamespaceManager(doc.NameTable);
                    ns.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");
                    ns.AddNamespace("ns", "http://tempuri.org/");

                    XmlNode resultado = doc.SelectSingleNode("//ns:DatosCompraResult", ns);
                    return resultado?.InnerText ?? "No se obtuvo respuesta del datáfono.";
                }
            }
            catch (Exception ex)
            {
                return $"Error en DatosCompra: {ex.Message}";
            }
        }

        public static string ConsultarRespuesta(string idTransaccion, string token)
        {
            string url = "https://sipserviceclientetestv52.azurewebsites.net/sipservice.asmx";
            string soapAction = "http://tempuri.org/Respuesta";

            string codigoUnico = "0020304050";

            string soapXml = $@"<?xml version=""1.0"" encoding=""utf-8""?>
                                <soapenv:Envelope xmlns:soapenv=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:tem=""http://tempuri.org/"">
                                   <soapenv:Header/>
                                   <soapenv:Body>
                                      <tem:Respuesta>
                                         <tem:Cod_unico>{codigoUnico}</tem:Cod_unico>
                                         <tem:id_transaccion>{idTransaccion}</tem:id_transaccion>
                                         <tem:token>{token}</tem:token>
                                      </tem:Respuesta>
                                   </soapenv:Body>
                                </soapenv:Envelope>";

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                byte[] data = Encoding.UTF8.GetBytes(soapXml);

                request.Method = "POST";
                request.ContentType = "text/xml; charset=utf-8";
                request.ContentLength = data.Length;
                request.Headers.Add("SOAPAction", soapAction);

                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                using (WebResponse response = request.GetResponse())
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    string result = reader.ReadToEnd();

                    // Extraer el contenido de RespuestaResult
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(result);
                    XmlNamespaceManager ns = new XmlNamespaceManager(doc.NameTable);
                    ns.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");
                    ns.AddNamespace("ns", "http://tempuri.org/");

                    XmlNode node = doc.SelectSingleNode("//ns:RespuestaResult", ns);
                    return node?.InnerText ?? "No se recibió respuesta del datáfono.";
                }
            }
            catch (Exception ex)
            {
                return $"Error al consultar respuesta: {ex.Message}";
            }
        }


        public class CompraDataBuilder
        {
            public int Valor { get; set; }
            public int Propina { get; set; }
            public int IVA { get; set; }
            public string Factura { get; set; }
            public int BaseDevolucionIVA { get; set; }
            public string CodigoCajero { get; set; }
            public int ImpuestoConsumo { get; set; }
            public int MontoBaseIVA { get; set; }
            public int MontoBaseImpConsumo { get; set; }
            public string Recibo { get; set; }
            public string Terminal { get; set; }
            public int Vigencia { get; set; } = 3;
            public string Persistente { get; set; } = "N";

            public string GenerarCadena()
            {
                return string.Join(",", new string[]
                {
                    Valor.ToString(),
                    Propina.ToString(),
                    IVA.ToString(),
                    Factura,
                    BaseDevolucionIVA.ToString(),
                    CodigoCajero,
                    ImpuestoConsumo.ToString(),
                    MontoBaseIVA.ToString(),
                    MontoBaseImpConsumo.ToString(),
                    Recibo,
                    Terminal,
                    Vigencia.ToString(),
                    Persistente
                });
            }
        }
    }
}