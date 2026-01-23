using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;
using static WebPage.register;
using static WebPage.Services.SiigoClient;

namespace WebPage
{
    public partial class wompipay : System.Web.UI.Page
    {
        // PRUEBAS
        //static int idIntegracionWompi = 1; // WOMPI
        //static int idIntegracionSiigo = 3; // SIIGO


        // PRODUCCIÓN
        static int idIntegracionWompi = 4; // WOMPI
        static int idIntegracionSiigo = 6; // SIIGO

        protected int IdAfiliadoPlan
        {
            get { return ViewState["idAfiPlan"] != null ? (int)ViewState["idAfiPlan"] : 0; }
            set { ViewState["idAfiPlan"] = value; }
        }

        protected int IdAfiliado
        {
            get { return ViewState["idAfi"] != null ? (int)ViewState["idAfi"] : 0; }
            set { ViewState["idAfi"] = value; }
        }

        protected string DocumentoAfiliado
        {
            get { return ViewState["nroDoc"]?.ToString(); }
            set { ViewState["nroDoc"] = value; }
        }

        protected string CorreoAfiliado
        {
            get { return ViewState["correo"]?.ToString(); }
            set { ViewState["correo"] = value; }
        }

        protected string NombreAfiliado
        {
            get { return ViewState["nombre"]?.ToString(); }
            set { ViewState["nombre"] = value; }
        }

        protected string TelefonoAfiliado
        {
            get { return ViewState["celular"]?.ToString(); }
            set { ViewState["celular"] = value; }
        }

        //

        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
        }

        protected string NombrePlan
        {
            get { return ViewState["nombrePlan"]?.ToString(); }
            set { ViewState["nombrePlan"] = value; }
        }

        protected int MesesPlan
        {
            get { return ViewState["meses"] != null ? (int)ViewState["meses"] : 0; }
            set { ViewState["meses"] = value; }
        }

        protected int ValorPlan
        {
            get { return ViewState["valorPlan"] != null ? (int)ViewState["valorPlan"] : 0; }
            set { ViewState["valorPlan"] = value; }
        }

        protected string LtValorPlan
        {
            get { return ViewState["ltValorPlan"]?.ToString(); }
            set { ViewState["ltValorPlan"] = value; }
        }

        protected string CodSiigoPlan
        {
            get { return ViewState["codSiigoPlan"]?.ToString(); }
            set { ViewState["codSiigoPlan"] = value; }
        }

        protected string FechaInicioPlan
        {
            get { return ViewState["fechaInicioPlan"]?.ToString(); }
            set { ViewState["fechaInicioPlan"] = value; }
        }

        protected string FechaFinPlan
        {
            get { return ViewState["fechaFinPlan"]?.ToString(); }
            set { ViewState["fechaFinPlan"] = value; }
        }

        protected int IdVendedor
        {
            get { return ViewState["idVendedor"] != null ? (int)ViewState["idVendedor"] : 0; }
            set { ViewState["idVendedor"] = value; }
        }

        protected int IdSede
        {
            get { return ViewState["idSede"] != null ? (int)ViewState["idSede"] : 0; }
            set { ViewState["idSede"] = value; }
        }

        protected string CodEmbajador
        {
            get { return ViewState["CodEmbajador"]?.ToString(); }
            set { ViewState["CodEmbajador"] = value; }
        }

        // Wompi

        protected string UrlWompi
        {
            get { return ViewState["urlWompi"]?.ToString(); }
            set { ViewState["urlWompi"] = value; }
        }

        protected string IntegritySecret
        {
            get { return ViewState["integrity_secret"]?.ToString(); }
            set { ViewState["integrity_secret"] = value; }
        }

        protected string KeyPub
        {
            get { return ViewState["keyPub"]?.ToString(); }
            set { ViewState["keyPub"] = value; }
        }

        protected string KeyPriv
        {
            get { return ViewState["keyPriv"]?.ToString(); }
            set { ViewState["keyPriv"] = value; }
        }

        //

        protected string IdReferencia
        {
            get { return ViewState["idReferencia"]?.ToString(); }
            set { ViewState["idReferencia"] = value; }
        }

        protected string DataIdToken
        {
            get { return ViewState["dataIdToken"]?.ToString(); }
            set { ViewState["dataIdToken"] = value; }
        }

        protected string DataIdFuentePago
        {
            get { return ViewState["dataIdFuentePago"]?.ToString(); }
            set { ViewState["dataIdFuentePago"] = value; }
        }

        protected string DataIdTransaccion
        {
            get { return ViewState["dataIdTransaccion"]?.ToString(); }
            set { ViewState["dataIdTransaccion"] = value; }
        }

        protected string AcceptanceToken
        {
            get { return ViewState["acceptance_token"]?.ToString(); }
            set { ViewState["acceptance_token"] = value; }
        }

        protected string AcceptPersonalAuth
        {
            get { return ViewState["accept_personal_auth"]?.ToString(); }
            set { ViewState["accept_personal_auth"] = value; }
        }

        // Siigo

        protected string UrlSiigo
        {
            get { return ViewState["urlSiigo"]?.ToString(); }
            set { ViewState["urlSiigo"] = value; }
        }

        protected string UserName
        {
            get { return ViewState["username"]?.ToString(); }
            set { ViewState["username"] = value; }
        }

        protected string AccessKey
        {
            get { return ViewState["accessKey"]?.ToString(); }
            set { ViewState["accessKey"] = value; }
        }

        protected string PartnerId
        {
            get { return ViewState["partnerId"]?.ToString(); }
            set { ViewState["partnerId"] = value; }
        }

        //

        protected int IdDocumentType
        {
            get { return ViewState["idDocumentType"] != null ? (int)ViewState["idDocumentType"] : 0; }
            set { ViewState["idDocumentType"] = value; }
        }

        protected int IdCostCenter
        {
            get { return ViewState["idCostCenter"] != null ? (int)ViewState["idCostCenter"] : 0; }
            set { ViewState["idCostCenter"] = value; }
        }

        protected int IdSellerUser
        {
            get { return ViewState["idSellerUser"] != null ? (int)ViewState["idSellerUser"] : 0; }
            set { ViewState["idSellerUser"] = value; }
        }

        protected int IdPayment
        {
            get { return ViewState["idPayment"] != null ? (int)ViewState["idPayment"] : 0; }
            set { ViewState["idPayment"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Evitar que el navegador use versiones en caché
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

            if (!IsPostBack)
            {
                // Inicialización de estado de pago
                // Solo inicializa la variable si aún no existe
                if (Session["PagoCompletado"] == null)
                    Session["PagoCompletado"] = false;

                // Si viene un código de la sesión, se pasa al ViewState
                //if (Session["CodEmbajador"] is string codigo && !string.IsNullOrEmpty(codigo))
                //{
                //    CodEmbajador = codigo;

                //    // Limpias la variable de sesión inmediatamente después de usarla
                //    Session.Remove("CodEmbajador");
                //}

                ValidarTokenURLEncryptor();
            }
        }

        private void ValidarTokenURLEncryptor()
        {
            // 1. Si el usuario ya completó un pago, no puede volver aquí
            if (Session["PagoCompletado"] != null && (bool)Session["PagoCompletado"] == true)
            {
                Response.Redirect("default", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            string token = Request.QueryString["data"];

            // 2. Si no hay token en la URL, redirigir al inicio
            if (string.IsNullOrEmpty(token))
            {
                Response.Redirect("default", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // 3. Intentar desencriptar el token
            if (UrlEncryptor.TryDecryptToCollection(token, out NameValueCollection q, out DateTime? expiresUtc))
            {
                // 4. Verificar expiración
                if (expiresUtc.HasValue && expiresUtc.Value < DateTime.UtcNow)
                {
                    Response.Redirect("default", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                DocumentoAfiliado = q["nroDoc"];
                IdPlan = Convert.ToInt32(q["idPlan"]);
                ValorPlan = Convert.ToInt32(q["valorPlan"]);
                FechaInicioPlan = q["fechaIni"];
                FechaFinPlan = q["fechaFin"];
                IdVendedor = Convert.ToInt32(q["idVendedor"]);
                IdSede = Convert.ToInt32(q["idSede"]);

                if (int.TryParse(q["idAfiPlan"], out int idAfiPlan))
                {
                    IdAfiliadoPlan = idAfiPlan;
                }
                else
                {
                    IdAfiliadoPlan = 0;
                }

                LtValorPlan = Session["ltValorPlan"].ToString();
                ltValor.Text = LtValorPlan;
                //CargarInformacionPlan();      COMENTADO HASTA NUEVO AVISO
            }
            else
            {
                // Token inválido
                Response.Redirect("default", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
        }

        //private void CargarInformacionPlan()
        //{
        //    ltValor.Text = LtValorPlan;

        //    if (IdPlan == 18)
        //    {
        //        ltInfoPlan.Text = @"Lo que debes saber de tu plan:<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Entrena por $99.000 cada mes.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Débito automático (6 meses).<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 10 sedes + valoración profesional.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 2 invitaciones cada mes.";
        //    }

        //    if (IdPlan == 19)
        //    {
        //        pnlTotalCart.Visible = false;

        //        ltPlanEasy.Text = @"<div id='total_cart' style='font-size: 15px; margin-bottom: 0;'>
        //                                ANTES <span class='pull-right' style='text-decoration: line-through;'>$149.000</span>
        //                            </div>
        //                            <div id='total_cart'>
        //                                AHORA <span class='pull-right'>$89.000</span>
        //                            </div>";

        //        ltInfoPlan.Text = @"Lo que debes saber de tu plan:<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Entrena por $89.000 cada mes.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Débito automático (12 meses).<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 10 sedes + valoración profesional.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 2 invitaciones cada mes.";
        //    }

        //    if (IdPlan == 20)
        //    {
        //        pnlTotalCart.Visible = false;

        //        ltPlanEasy.Text = @"<div id='total_cart' style='margin-bottom: 0;'>
        //                                2 MESES <span class='pull-right'>$49.900</span>
        //                            </div>
        //                            <div id='total_cart' style='font-size: 15px;'>
        //                                DESPUÉS <span class='pull-right'>$99.000</span>
        //                            </div>";

        //        ltInfoPlan.Text = @"Lo que debes saber de tu plan:<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Débito automático (12 meses).<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 10 sedes + valoración profesional.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 2 invitaciones cada mes.";
        //    }

        //    if (IdPlan == 21)
        //    {
        //        pnlTotalCart.Visible = false;

        //        ltPlanEasy.Text = @"<div id='total_cart' style='margin-bottom: 0;'>
        //                                PRIMER MES <span class='pull-right'>$9.900</span>
        //                            </div>
        //                            <div id='total_cart' style='font-size: 15px;'>
        //                                DESPUÉS <span class='pull-right'>$89.000</span>
        //                            </div>";

        //        ltInfoPlan.Text = @"Lo que debes saber de tu plan:<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> Débito automático (12 meses).<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 10 sedes + valoración profesional.<br/>
        //                            <i class='fa fa-circle-check' style='color: #000000;'></i> 2 invitaciones cada mes.";
        //    }
        //}

        private void ConsultarInformacion()
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                DataTable dtAfi = cg.ConsultarAfiliadoPorDocumento(DocumentoAfiliado);
                IdAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? Convert.ToInt32(dtAfi.Rows[0]["idAfiliado"].ToString()) : 0;
                CorreoAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? dtAfi.Rows[0]["emailAfiliado"].ToString() : null;
                NombreAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? dtAfi.Rows[0]["nombreAfiliado"].ToString() + " " + dtAfi.Rows[0]["apellidoAfiliado"].ToString() : null;
                TelefonoAfiliado = dtAfi != null && dtAfi.Rows.Count > 0 ? dtAfi.Rows[0]["celularAfiliado"].ToString() : null;
                dtAfi.Dispose();

                DataTable dtPlan = cg.ConsultarPlanPorId(IdPlan);
                MesesPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? Convert.ToInt32(dtPlan.Rows[0]["meses"].ToString()) : 0;
                NombrePlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["nombrePlan"].ToString() : null;
                CodSiigoPlan = dtPlan != null && dtPlan.Rows.Count > 0 ? dtPlan.Rows[0]["codSiigoPlan"].ToString() : null;
                dtPlan.Dispose();

                DataTable dtIntegracionWompi = cg.ConsultarIntegracionPorId(idIntegracionWompi);
                UrlWompi = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["url"].ToString() : null;
                IntegritySecret = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["integrity_secret"].ToString() : null;
                KeyPub = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["keyPub"].ToString() : null;
                KeyPriv = dtIntegracionWompi != null && dtIntegracionWompi.Rows.Count > 0 ? dtIntegracionWompi.Rows[0]["keyPriv"].ToString() : null;
                dtIntegracionWompi.Dispose();

                DataTable dtIntegracionSiigo = cg.ConsultarIntegracionPorId(idIntegracionSiigo);
                UrlSiigo = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? dtIntegracionSiigo.Rows[0]["url"].ToString() : null;
                UserName = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? dtIntegracionSiigo.Rows[0]["username"].ToString() : null;
                AccessKey = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? dtIntegracionSiigo.Rows[0]["accessKey"].ToString() : null;
                PartnerId = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? dtIntegracionSiigo.Rows[0]["partnerId"].ToString() : null;

                IdDocumentType = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? Convert.ToInt32(dtIntegracionSiigo.Rows[0]["idDocumentType"].ToString()) : 0;
                IdSellerUser = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? Convert.ToInt32(dtIntegracionSiigo.Rows[0]["idSellerUser"].ToString()) : 0;
                IdPayment = dtIntegracionSiigo != null && dtIntegracionSiigo.Rows.Count > 0 ? Convert.ToInt32(dtIntegracionSiigo.Rows[0]["idPayment"].ToString()) : 0;
                dtIntegracionSiigo.Dispose();

                DataTable dtSede = cg.ConsultarSedePorId(IdSede);
                IdCostCenter = dtSede != null && dtSede.Rows.Count > 0 ? Convert.ToInt32(dtSede.Rows[0]["idCostCenterSiigo"].ToString()) : 0;
                dtSede.Dispose();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos confirmar tu información.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en ConsultarInformacion: " + ex.ToString());
            }
        }
        
        protected async void btnPagar_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Obtener datos necesarios
                ConsultarInformacion();

                string cardNumber = txbCreditCard.Text.Replace(" ", "");
                if (!cardNumber.All(char.IsDigit))
                {
                    MostrarAlerta("Error", "El número de tarjeta no es válido.", "error");
                    return;
                }

                string cvc = txbCVC.Text.Trim();
                if (cvc.Length < 3 || cvc.Length > 4 || !cvc.All(char.IsDigit))
                {
                    MostrarAlerta("Error", "El CVC debe ser numérico y de 3 o 4 dígitos.", "error");
                    return;
                }

                // 2. Tokenización de tarjeta
                bool tarjetaTokenizada = await TokenizarTarjetaAsync(
                    cardNumber,
                    cvc,
                    ddlMes.SelectedValue,
                    ddlAnho.SelectedValue,
                    txbNombreTarjeta.Text.Trim()
                );

                if (!tarjetaTokenizada)
                {
                    MostrarAlerta("Error de tokenización", "La tarjeta no pudo ser procesada.", "error");
                    return;
                }

                string strDescripcion = $"Débito automático, Plan: {NombrePlan}, Precio: ${ValorPlan}";
                string strEstado = "Pendiente";

                if (IdPlan == 12 || IdPlan == 17)
                {
                    strDescripcion = "Débito automático Migración Clez";
                    strEstado = "Activo";
                }

                clasesglobales cg = new clasesglobales();

                // 3. Gestión de AfiliadoPlan
                if (IdAfiliadoPlan == 0) // SI NO EXISTE, CREAR AFILIADO PLAN
                {
                    IdAfiliadoPlan = cg.InsertarAfiliadoPlanYDevolverId(
                        IdAfiliado,
                        IdPlan,
                        FechaInicioPlan,
                        FechaFinPlan,
                        MesesPlan,
                        ValorPlan,
                        strDescripcion,
                        strEstado
                    );
                } 
                else
                {
                    const int mesCobrado = 1;
                    cg.ActualizarFechaProximoCobro(IdAfiliadoPlan, mesCobrado);
                }

                // 4. Inserción de PagoPlanAfiliado en la Base de Datos
                int idPago = cg.InsertarPagoPlanAfiliadoWebYDevolverId(
                    IdAfiliadoPlan,
                    ValorPlan,
                    4,
                    IdReferencia,
                    "Wompi",
                    IdVendedor, // TODO: Cambiar cuando se realice lógica [Validar que si la persona que intenta comprar un plan por la página, PERO tiene un registro en el CRM del mismo plan que está comprando por web, no queda la compra por web, sino, tiene en cuenta el CRM realizado anteriormente]
                    "Aprobado",
                    null,
                    DataIdToken, 
                    DataIdFuentePago, 
                    DataIdTransaccion, 
                    null,
                    null,
                    null
                );

                if (IdPlan != 12)
                {
                    // 5. Facturar en Siigo
                    try
                    {
                        string fechaActual = DateTime.Now.ToString("yyyy-MM-dd");

                        // Creación de factura
                        var siigoClient = new SiigoClient(
                            new HttpClient(),
                            UrlSiigo,
                            UserName,
                            AccessKey,
                            PartnerId
                        );


                        // COMENTADO HASTA NUEVO AVISO

                        DataTable dtAfi = cg.ConsultarAfiliadoPorId(IdAfiliado);
                        // Obtener datos del afiliado
                        string strNombre = dtAfi.Rows[0]["NombreAfiliado"].ToString();
                        string strApellido = dtAfi.Rows[0]["ApellidoAfiliado"].ToString();
                        dtAfi.Dispose();

                        DataTable dtCodSiigo = cg.ConsultarCodigoSiigoPorDocumento(DocumentoAfiliado);
                        string idTipoDocSiigo = dtCodSiigo.Rows[0]["CodSiigo"].ToString();
                        dtCodSiigo.Dispose();

                        DataTable dtSede = cg.ConsultarSedePorId(IdSede);
                        string strDireccion = dtSede.Rows[0]["DireccionSede"].ToString();
                        int idCiudad = Convert.ToInt32(dtSede.Rows[0]["idCiudadSede"].ToString());
                        dtSede.Dispose();

                        DataTable dtCiudad = cg.ConsultarCiudadSedeSiigoPorId(idCiudad);
                        string codEstado = dtCiudad.Rows[0]["CodigoEstado"].ToString();
                        string codCiudad = dtCiudad.Rows[0]["CodigoCiudad"].ToString();
                        dtCiudad.Dispose();

                        await siigoClient.ManageCustomerAsync(idTipoDocSiigo, DocumentoAfiliado, strNombre, strApellido, strDireccion, codEstado, codCiudad, TelefonoAfiliado, CorreoAfiliado);

                        // COMENTADO HASTA NUEVO AVISO


                        // PRODUCCIÓN
                        // TODO: NO ELIMINAR ESTO, SE USA EN LA CREACIÓN DE LA FACTURA
                        // ESTÁ COMENTADO PARA PRUEBAS LOCALES
                        string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                            DocumentoAfiliado,
                            CodSiigoPlan,
                            NombrePlan,
                            ValorPlan,
                            IdSellerUser,
                            IdDocumentType,
                            fechaActual,
                            IdCostCenter,
                            IdPayment
                        );


                        // PRUEBAS
                        //if (idIntegracionSiigo == 3) IdCostCenter = 621;

                        //string codSiigoPlan = "COD2433";
                        //string nombrePlan = "Pago de suscripción";
                        //int precioPlan = 10000;
                        //string idSiigoFactura = await siigoClient.RegisterInvoiceAsync(
                        //    DocumentoAfiliado,
                        //    codSiigoPlan,
                        //    nombrePlan,
                        //    precioPlan,
                        //    IdSellerUser,
                        //    IdDocumentType,
                        //    fechaActual,
                        //    IdCostCenter,
                        //    IdPayment
                        //);

                        // Actualizar pago con id de factura
                        cg.ActualizarIdSiigoFacturaDePagoPlanAfiliado(idPago, idSiigoFactura);
                    }
                    catch (Exception siigoEx)
                    {
                        System.Diagnostics.Debug.WriteLine("Error creando factura en Siigo: " + siigoEx.ToString());
                    }
                }

                // COMENTADO DEBIDO A QUE NO SE UTILIZARÁ MÁS
                // 6. Registrar pago para embajador si la persona utiliza su código
                //if (!string.IsNullOrEmpty(CodEmbajador))
                //{
                //    cg.InsertarVentaEmbajador(
                //        IdAfiliado,
                //        IdAfiliadoPlan,
                //        CodEmbajador
                //    );
                //}

                Session["ltValorPlan"] = LtValorPlan;

                string payload = $"idAfi={HttpUtility.UrlEncode(IdAfiliado.ToString())}" +
                                 $"&nroDoc={HttpUtility.UrlEncode(DocumentoAfiliado)}" +
                                 $"&idPlan={HttpUtility.UrlEncode(IdPlan.ToString())}";

                TimeSpan ttl = TimeSpan.FromMinutes(10); // Token válido 10 minutos
                string token = UrlEncryptor.Encrypt(payload, ttl);

                Response.Redirect($"wompiexito.aspx?data={HttpUtility.UrlEncode(token)}", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Hubo un problema interno al procesar tu pago.<br>Por favor, toma una captura de pantalla y comunícate con nosotros al número de WhatsApp para ayudarte.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en btnPagar_Click: " + ex.ToString());
            }
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo, bool esHtml = false)
        {
            // tipo puede ser: 'success', 'error', 'warning', 'info', 'question'
            string contenido = esHtml ? $"html: '{mensaje}'" : $"text: '{mensaje}'";

            string script = $@"
            Swal.fire({{
                title: '{titulo}',
                {contenido},
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

        private async Task<bool> TokenizarTarjetaAsync(string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            try
            {
                string url = $"{UrlWompi}tokens/cards";

                string respuesta = await GetPostAsync(url, creditcard, cvc, mes, anho, cardholder);

                Root1 rObjetc = JsonConvert.DeserializeObject<Root1>(respuesta);

                if (rObjetc.status == "CREATED" && rObjetc.data != null && !string.IsNullOrEmpty(rObjetc.data.id))
                {
                    ObtenerTokensDeAceptacion();

                    DataIdToken = rObjetc.data.id;

                    // Creación de fuente de pago en Wompi
                    bool fuentePagoCreada = await CrearFuentePagoAsync(
                        CorreoAfiliado,
                        "CARD",
                        DataIdToken,
                        AcceptanceToken,
                        AcceptPersonalAuth
                    );

                    if (!fuentePagoCreada)
                    {
                        string estado = rObjetc?.status ?? "Respuesta desconocida";
                        MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                        return false;
                    }

                    return true;
                }
                else
                {
                    string estado = rObjetc?.status ?? "Respuesta desconocida";
                    MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                    return false;
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "Hubo un problema al procesar la tarjeta.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en TokenizarTarjetaAsync: " + ex.ToString());
                return false;
            }
        }
        private async Task<bool> CrearFuentePagoAsync(string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            try
            {
                string url = $"{UrlWompi}payment_sources";

                string respuesta = await GetPostFuentePagoAsync(url, customer_email, type, token, acceptance_token, accept_personal_auth);

                Root2 rObjetc = JsonConvert.DeserializeObject<Root2>(respuesta);

                if (rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id.ToString()))
                {
                    MostrarAlerta("Error en fuente de pago", "No se pudo crear la fuente de pago en Wompi.", "error");
                    return false;
                }

                DataIdFuentePago = rObjetc.data.id.ToString();

                // Crear referencia única para el cobro
                IdReferencia = $"{DocumentoAfiliado}-{DateTime.Now.ToString("yyyyMMddHHmmss")}";

                // Calcular hash SHA256
                string monto = $"{ValorPlan}00"; // en centavos
                string moneda = "COP";

                string concatenado = $"{IdReferencia}{monto}{moneda}{IntegritySecret}";
                string hash256 = ComputeSha256Hash(concatenado);

                // Ejecutar el cobro inicial
                bool transaccionCreada = await CrearTransaccionAsync(
                    Convert.ToInt32(monto), 
                    moneda, 
                    hash256, 
                    CorreoAfiliado, 
                    NombreAfiliado, 
                    TelefonoAfiliado, 
                    1,
                    IdReferencia, 
                    Convert.ToInt32(DataIdFuentePago)
                );

                if (!transaccionCreada) 
                {
                    string estado = rObjetc?.data?.status ?? "Respuesta desconocida";
                    MostrarAlerta("Error de tokenización", $"La tarjeta no pudo ser procesada. Estado: {estado}", "error");
                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos registrar el método de pago.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en CrearFuentePagoAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<bool> CrearTransaccionAsync(int amount_in_cents, string currency, string signature, string customer_email, string customer_full_name, string customer_phone, int installments, string reference, int payment_source_id)
        {
            try
            {
                string url = $"{UrlWompi}transactions";

                string respuesta = await GetPostTransaccionAsync(url, amount_in_cents, currency, signature, customer_email, customer_full_name, customer_phone, installments, reference, payment_source_id);

                Root3 rObjetc = JsonConvert.DeserializeObject<Root3>(respuesta);

                if (rObjetc.data == null || string.IsNullOrEmpty(rObjetc.data.id))
                {
                    MostrarAlerta("Error", "No se recibió un ID válido para la transacción.", "error");
                    return false;
                }

                DataIdTransaccion = rObjetc.data.id;


                string estado = null;
                string estadoMensaje = null;
                int maxIntentos = 15;
                int intentos = 0;

                do
                {
                    await Task.Delay(1000);
                    (estado, estadoMensaje) = await ConsultarTransaccionPorReferencia(reference);
                    intentos++;
                }
                while (estado == "PENDING" && intentos < maxIntentos);

                if (estado != "APPROVED")
                {
                    if (estado == "DECLINED")
                    {
                        MostrarAlerta("Transacción rechazada", $"{estadoMensaje}.", "error");
                    } 
                    else
                    {
                        MostrarAlerta("Transacción rechazada", $"Estado de la tarjeta: {estado ?? "Desconocido"}", "error");
                    }
                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No pudimos procesar tu transacción.<br>Por favor, cierra esta página e inténtalo nuevamente.", "error", true);
                System.Diagnostics.Debug.WriteLine("Error en CrearTransaccionAsync: " + ex.ToString());
                return false;
            }
        }

        private async Task<(string Estado, string EstadoMensaje)> ConsultarTransaccionPorReferencia(string referencia)
        {
            try
            {
                string respuesta = await GetPostConsultaTransaccionAsync(referencia);

                // Deserializar respuesta de Wompi
                var json = JsonConvert.DeserializeObject<dynamic>(respuesta);

                if (json.status == "ERROR")
                {
                    MostrarAlerta("Error al consultar", (string)json.message, "error");
                    return (null, null);
                }

                var data = json.data;
                if (data == null || data.Count == 0)
                {
                    MostrarAlerta("Sin resultados", "No se encontraron transacciones con esta referencia.", "info");
                    return (null, null);
                }

                string estado = data[0].status;
                string estadoMensaje = data[0].status_message;
                return (estado, estadoMensaje); // Ejemplo: "APPROVED", "DECLINED", "PENDING"
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error inesperado", "No se pudo consultar el estado de la transacción.", "error");
                System.Diagnostics.Debug.WriteLine("Error en ConsultarTransaccionPorReferencia: " + ex.ToString());
                return (null, null);
            }
        }

        static string ComputeSha256Hash(string rawData)
        {
            // Crea un SHA256
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - devuelve una matriz de bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convierte una matriz de bytes en una cadena
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public async Task<string> GetPostAsync(string url, string creditcard, string cvc, string mes, string anho, string cardholder)
        {
            var oTarjeta = new Tarjeta
            {
                number = creditcard,
                cvc = cvc,
                exp_month = mes,
                exp_year = anho,
                card_holder = cardholder
            };

            string json = JsonConvert.SerializeObject(oTarjeta);

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = 
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", KeyPub);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public async Task<string> GetPostFuentePagoAsync(string url, string customer_email, string type, string token, string acceptance_token, string accept_personal_auth)
        {
            var oFuentePago = new FuentePago
            {
                type = type,
                token = token,
                customer_email = customer_email,
                acceptance_token = acceptance_token,
                accept_personal_auth = accept_personal_auth
            };

            string json = JsonConvert.SerializeObject(oFuentePago);

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = 
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", KeyPriv);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public async Task<string> GetPostTransaccionAsync(string url, int amount_in_cents, string currency, string signature, string customer_email, string customer_full_name, string customer_phone, int installments, string reference, int payment_source_id)
        {
            var oTransaccion = new Transaccion
            {
                amount_in_cents = amount_in_cents,
                currency = currency,
                signature = signature,
                customer_email = customer_email,
                payment_method = new PaymentMethod { installments = installments },
                reference = reference,
                payment_source_id = payment_source_id,
                customer_data = new CustomerData
                {
                    email = customer_email,
                    full_name = customer_full_name,
                    phone_number = customer_phone
                }
            };

            string json = JsonConvert.SerializeObject(oTransaccion);

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", KeyPriv);

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        public async Task<string> GetPostConsultaTransaccionAsync(string idReferencia)
        {
            string url = $"{UrlWompi}transactions?reference={idReferencia}";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", KeyPriv);

                try
                {
                    HttpResponseMessage response = await client.GetAsync(url);
                    string result = await response.Content.ReadAsStringAsync();

                    if (!response.IsSuccessStatusCode)
                    {
                        return $"{{\"status\":\"ERROR\",\"message\":\"{result}\"}}";
                    }

                    return result;
                }
                catch (Exception ex)
                {
                    return $"{{\"status\":\"ERROR\",\"message\":\"{ex.Message}\"}}";
                }
            }
        }

        private void ObtenerTokensDeAceptacion()
        {
            string url = $"{UrlWompi}merchants/{KeyPub}";

            try
            {
                string respuesta = GetHTTP(url);

                // Deserializar la respuesta JSON
                Root rObjetc = JsonConvert.DeserializeObject<Root>(respuesta);

                // Guardar los tokens en la sesión
                AcceptanceToken = rObjetc.data.presigned_acceptance.acceptance_token;
                AcceptPersonalAuth = rObjetc.data.presigned_personal_data_auth.acceptance_token;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los tokens de aceptación de Wompi: " + ex.Message);
            }
        }

        //
        // Wompi API - Tokenización
        public static string GetHTTP(string url)
        {
            WebRequest wRequest = WebRequest.Create(url);
            WebResponse wResponse = wRequest.GetResponse();
            StreamReader sReader = new StreamReader(wResponse.GetResponseStream());
            return sReader.ReadToEnd().Trim();
        }

        public class PresignedAcceptance
        {
            public string acceptance_token { get; set; }
        }

        public class PresignedPersonalDataAuth
        {
            public string acceptance_token { get; set; }
        }

        public class Data
        {
            public PresignedAcceptance presigned_acceptance { get; set; }
            public PresignedPersonalDataAuth presigned_personal_data_auth { get; set; }
        }

        public class Root
        {
            public Data data { get; set; }
        }

        // 

        public class Tarjeta
        {
            public string number { get; set; }
            public string cvc { get; set; }
            public string exp_month { get; set; }
            public string exp_year { get; set; }
            public string card_holder { get; set; }
        }

        public class FuentePago
        {
            public string type { get; set; }
            public string token { get; set; }
            public string customer_email { get; set; }
            public string acceptance_token { get; set; }
            public string accept_personal_auth { get; set; }
        }

        public class Transaccion
        {
            public int amount_in_cents { get; set; }
            public string currency { get; set; }
            public string signature { get; set; }
            public string customer_email { get; set; }
            public PaymentMethod payment_method { get; set; }
            public string reference { get; set; }
            public int payment_source_id { get; set; }
            public CustomerData customer_data { get; set; }
        }

        public class PaymentMethod
        {
            public int installments { get; set; }
        }

        public class CustomerData
        {
            public string email { get; set; }
            public string full_name { get; set; }
            public string phone_number { get; set; }
        }

        public class Data1
        {
            public string id { get; set; }
            public DateTime created_at { get; set; }
            public string brand { get; set; }
            public string name { get; set; }
            public string last_four { get; set; }
            public string bin { get; set; }
            public string exp_year { get; set; }
            public string exp_month { get; set; }
            public string card_holder { get; set; }
            public DateTime expires_at { get; set; }
        }

        public class Root1
        {
            public string status { get; set; }
            public Data1 data { get; set; }
        }

        public class Data2
        {
            public int id { get; set; }
            public PublicData public_data { get; set; }
            public string type { get; set; }
            public string status { get; set; }
        }

        public class PublicData
        {
            public string type { get; set; }
        }

        public class Root2
        {
            public Data2 data { get; set; }
        }

        public class Data3
        {
            public string id { get; set; }
            public DateTime created_at { get; set; }
            public object finalized_at { get; set; }
            public int amount_in_cents { get; set; }
            public string reference { get; set; }
            public string customer_email { get; set; }
            public string currency { get; set; }
            public string payment_method_type { get; set; }
            public PaymentMethod2 payment_method { get; set; }
            public string status { get; set; }
            public object status_message { get; set; }
            public object billing_data { get; set; }
            public object shipping_address { get; set; }
            public object redirect_url { get; set; }
            public int payment_source_id { get; set; }
            public object payment_link_id { get; set; }
            public object customer_data { get; set; }
            public object bill_id { get; set; }
            public List<object> taxes { get; set; }
            public object tip_in_cents { get; set; }
        }

        public class Extra
        {
            public bool is_three_ds { get; set; }
            public object three_ds_auth_type { get; set; }
        }

        public class Meta
        {
        }

        public class PaymentMethod2
        {
            public string type { get; set; }
            public Extra extra { get; set; }
            public string phone_number { get; set; }
        }

        public class Root3
        {
            public Data3 data { get; set; }
            public Meta meta { get; set; }
        }
    }
}