using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Data.Common;
using System.Data.Odbc;
using System.Configuration;
using System.Data;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using System.Threading.Tasks;
using MySqlX.XDevAPI;
using NPOI.SS.Formula.Functions;
using System.Globalization;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Security.Policy;
using WebPage.Services;
using System.Linq;
using System.Collections.Specialized;

namespace WebPage
{
    public partial class register : System.Web.UI.Page
    {
        // PRUEBAS
        //static int idIntegracionSiigo = 3; // SIIGO


        // PRODUCCIÓN
        static int idIntegracionSiigo = 6; // SIIGO

        protected int IdPlan
        {
            get { return ViewState["idPlan"] != null ? (int)ViewState["idPlan"] : 0; }
            set { ViewState["idPlan"] = value; }
        }

        protected int ValorPlan
        {
            get { return ViewState["valorPlan"] != null ? (int)ViewState["valorPlan"] : 0; }
            set { ViewState["valorPlan"] = value; }
        }

        protected int TotalMeses
        {
            get { return ViewState["totalMeses"] != null ? (int)ViewState["totalMeses"] : 0; }
            set { ViewState["totalMeses"] = value; }
        }

        protected int IdVendedor
        {
            get { return ViewState["idVendedor"] != null ? (int)ViewState["idVendedor"] : 0; }
            set { ViewState["idVendedor"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["PagoCompletado"] = false;

                if (ValidarParametrosURL())
                {
                    ValidarPlan();

                    ConfigurarCamposFecha();

                    //CargarInformacionPlan();      COMENTADO HASTA NUEVO AVISO

                    CargarTipoDocumento();
                    CargarGeneros();
                    CargarCiudadesYSedes();

                    if (!string.IsNullOrEmpty(txbFechaIni.Text))
                    {
                        txbFechaFin.Text = CalcularFechaFinPlan(txbFechaIni.Text);
                    }
                }
            }

            // Agregar manualmente el onchange que llama al postback
            txbFechaIni.Attributes["onchange"] = Page.ClientScript.GetPostBackEventReference(txbFechaIni, "");
        }

        // - COMENTADO HASTA NUEVO AVISO -
        //protected void btnValidarCodEmbajador_Click(object sender, EventArgs e)
        //{
        //    string codigo = txtCodigoEmbajador.Text.Trim().ToLower();

        //    if (string.IsNullOrEmpty(codigo))
        //    {
        //        lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:orange;'>Por favor, ingresa un código para continuar.</span>";
        //        return;
        //    }

        //    try
        //    {
        //        clasesglobales cg = new clasesglobales();

        //        DataTable dtCodEmbajador = cg.ConsultarCodigoEmbajador(codigo);

        //        if (dtCodEmbajador.Rows.Count > 0)
        //        {
        //            Session["CodEmbajador"] = codigo;
        //            Response.Redirect("register?idPlan=20&idVendedor=156", false); // OJO CAMBIO POR ACTUALIZACIÓN DE TOKEN EN LA URL
        //            Context.ApplicationInstance.CompleteRequest();
        //        }
        //        else
        //        {
        //            lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:red;'>El código de embajador que ingresaste no es válido. Verifica y vuelve a intentarlo.</span>";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMensajeEmbajador.Text = "<span style='font-size: 15px; font-weight: 700; color:red;'>Error: " + ex.Message + "</span>";
        //    }
        //}

        private bool ValidarParametrosURL()
        {
            // 1. Validar parámetro idPlan
            string token = Request.QueryString["token"];

            if (string.IsNullOrEmpty(token)) Response.Redirect("default", true);

            clasesglobales cg = new clasesglobales();

            // Validar que el plan exista
            DataTable dtToken = cg.ConsultarToken(token);

            if (dtToken == null || dtToken.Rows.Count == 0) Response.Redirect("default", true);

            // TODO: Consultar si el afiliado ya tiene una gestión en CRM
            // Si lo tiene: Cambiar idVendedor
            // Si no lo tiene: Continuar proceso con idVendedor inicial

            // Guardar resultados
            IdPlan = Convert.ToInt32(dtToken.Rows[0]["idPlan"]);
            IdVendedor = Convert.ToInt32(dtToken.Rows[0]["idVendedor"]);

            return true;
        }

        //private void CargarInformacionPlan()
        //{
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

        private void ConfigurarCamposFecha()
        {
            txbFechaNac.Attributes.Add("type", "date");
            txbFechaIni.Attributes.Add("type", "date");
            txbFechaFin.Attributes.Add("type", "date");

            DateTime dtHoy = DateTime.Now;
            DateTime dtHoyUnAnnio = DateTime.Now.AddYears(1);
            DateTime dt14 = DateTime.Now.AddYears(-14);
            DateTime dt100 = DateTime.Now.AddYears(-100);

            txbFechaNac.Attributes.Add("min", dt100.ToString("yyyy-MM-dd"));
            txbFechaNac.Attributes.Add("max", dt14.ToString("yyyy-MM-dd"));

            string fechaHoy = dtHoy.ToString("yyyy-MM-dd");
            txbFechaIni.Attributes["value"] = fechaHoy;
            txbFechaIni.Text = fechaHoy;

            string fechaUnAnnio = dtHoyUnAnnio.ToString("yyyy-MM-dd");
            txbFechaFin.Attributes["value"] = fechaUnAnnio;
            txbFechaFin.Text = fechaUnAnnio;

            txbFechaIni.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");

            if (IdPlan != 12)
                txbFechaIni.Attributes["max"] = DateTime.Now.AddDays(3).ToString("yyyy-MM-dd");
        }

        private void ValidarPlan()
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);

                if (dtPlan == null || dtPlan.Rows.Count == 0) Response.Redirect("default", true);

                // Mostrar tipo de pago
                txbMetodoPago.Text = dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1"
                    ? "Débito Automático"
                    : "Pago Único";

                DataTable dtPlanProm = cg.ConsultarPlanPromocionPorId(IdPlan);

                if (dtPlanProm.Rows.Count > 0 && !dtPlanProm.Columns.Contains("Error"))
                {
                    ValorPlan = Convert.ToInt32(dtPlanProm.Rows[0]["PrecioProm"].ToString());
                }
                else
                {
                    ValorPlan = Convert.ToInt32(dtPlan.Rows[0]["PrecioTotal"].ToString());
                }

                txbValorPlan.Text = ValorPlan.ToString();
                hfValorPlan.Value = ValorPlan.ToString();
                ltValor.Text = "$" + ValorPlan.ToString("N0");

                if (IdPlan == 12 || IdPlan == 17)  // Plan de migracion 2.000 y 89.000
                {
                    txbFechaIni.Enabled = false;
                    txbFechaFin.Enabled = false;
                }

                dtPlanProm?.Dispose();
                dtPlan.Dispose();

            } catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en ValidarPlan: " + ex.ToString());
            }
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            dt.Dispose();
        }

        private void CargarGeneros()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarGeneros();

            ddlGenero.DataSource = dt;
            ddlGenero.DataBind();

            dt.Dispose();
        }

        private void CargarCiudadesYSedes()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtCiudad = cg.ConsultarCiudadesSedesWeb();
            ddlCiudad.DataSource = dtCiudad;
            ddlCiudad.DataTextField = "NombreCiudadSede";
            ddlCiudad.DataValueField = "idCiudadSede";
            ddlCiudad.DataBind();
            ddlCiudad.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dtCiudad.Dispose();

            DataTable dtSede = cg.ConsultarSedesWeb();
            ddlSede.DataSource = dtSede;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
            ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dtSede.Dispose();
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            clasesglobales cg = new clasesglobales();
            ddlSede.Items.Clear();

            // Si no seleccionó ciudad, mostrar todas las sedes
            if (string.IsNullOrEmpty(ddlCiudad.SelectedValue))
            {
                DataTable dtTodasSedes = cg.ConsultarSedesWeb();
                ddlSede.DataSource = dtTodasSedes;
                ddlSede.DataTextField = "NombreSede";
                ddlSede.DataValueField = "IdSede";
                ddlSede.DataBind();
                ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
                dtTodasSedes.Dispose();
                return;
            }

            // Si seleccionó una ciudad válida, filtrar las sedes
            DataTable dt = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(ddlCiudad.SelectedValue));
            ddlSede.DataSource = dt;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
            ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dt.Dispose();
        }

        protected void ddlSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlSede.SelectedValue)) return;

            clasesglobales cg = new clasesglobales();

            DataTable dtSede = cg.ConsultarSedePorId(Convert.ToInt32(ddlSede.SelectedValue));

            if (dtSede != null && dtSede.Rows.Count > 0)
            {
                DataRow sedeInfo = dtSede.Rows[0];
                string idCiudad = sedeInfo["idCiudadSede"].ToString();

                if (ddlCiudad.Items.FindByValue(idCiudad) != null)
                {
                    ddlCiudad.SelectedValue = idCiudad;
                }
            }

            // liberar si tu implementación lo requiere
            if (dtSede != null) dtSede.Dispose();
        }

        protected async void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                // 1. Extraer la información del formulario
                string strCedula = txbDocumento.Text.ToString();
                int idTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedItem.Value.ToString());

                int idAfiliado = 0;

                DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(strCedula);
                if (dtAfiliado.Rows.Count > 0)
                {
                    idAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);
                }
                dtAfiliado.Dispose();

                string strNombre = txbNombre.Text.ToUpper();
                string strApellido = txbApellido.Text.ToUpper();
                string strCelular = txbCelular.Text.ToString();
                string strEmail = txbEmail.Text.ToLower();
                int idGenero = Convert.ToInt32(ddlGenero.SelectedItem.Value.ToString());
                string strFechaNac = txbFechaNac.Text.ToString();

                string strFechaInicioPlan = txbFechaIni.Text.ToString();
                string strFechaFinPlan = txbFechaFin.Text.ToString();

                int idCiudad = Convert.ToInt32(ddlCiudad.SelectedItem.Value.ToString());
                int idSede = Convert.ToInt32(ddlSede.SelectedItem.Value.ToString());

                DataTable dtSede = cg.ConsultarSedePorId(idSede);
                string direccion = dtSede.Rows[0]["DireccionSede"].ToString();
                dtSede.Dispose();

                DataTable dtCiudad = cg.ConsultarCiudadSedeSiigoPorId(idCiudad);
                string codEstado = dtCiudad.Rows[0]["CodigoEstado"].ToString();
                string codCiudad = dtCiudad.Rows[0]["CodigoCiudad"].ToString();
                dtCiudad.Dispose();

                string strLtValor = ltValor.Text.ToString();
                Session.Add("ltValorPlan", strLtValor);

                // 2. Gestionar a afiliado
                if (idAfiliado != 0)
                {
                    // IMPORTANTE: NO ELIMINAR - SOLO SE COMENTA PARA REALIZAR PRUEBAS
                    DataTable dtFechaFinPlan = cg.ConsultarFechaFinPlanPorDocumento(strCedula);

                    if (dtFechaFinPlan.Rows.Count > 0)
                    {
                        // Obtener fecha de fin anterior
                        DateTime fechaFinAnterior = Convert.ToDateTime(dtFechaFinPlan.Rows[0]["FechaFinalPlan"]);
                        DateTime fechaInicioNuevo = Convert.ToDateTime(strFechaInicioPlan);

                        if (fechaInicioNuevo <= fechaFinAnterior)
                        {
                            MostrarAlerta(
                                "Tienes un plan activo",
                                "Ya tienes un plan en curso que cubre las fechas seleccionadas. Nuestro sistema procesará el cobro automáticamente cuando corresponda, así que no es necesario realizar otro pago. Solo asegúrate de tener saldo disponible en tu tarjeta.",
                                "warning"
                            );

                            return;
                        }
                    }

                    dtFechaFinPlan.Dispose();

                    cg.ActualizarAfiliadoRegister(
                        strCedula,
                        strNombre,
                        strApellido,
                        strCelular,
                        strEmail,
                        idGenero,
                        strFechaNac,
                        idSede,
                        "Pendiente"
                    );
                }
                else
                {
                    cg.InsertarAfiliadoWeb(
                        strCedula,
                        idTipoDocumento,
                        strNombre,
                        strApellido,
                        strCelular,
                        strEmail,
                        idGenero,
                        strFechaNac,
                        idSede
                    );

                    //EnviarCorreoBienvenida();
                }

                // 3. Gestionar afiliado en Siigo
                try
                {
                    DataTable dtIntegracion = cg.ConsultarIntegracionPorId(idIntegracionSiigo);
                    string url = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["url"].ToString() : null;
                    string username = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["username"].ToString() : null;
                    string accessKey = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["accessKey"].ToString() : null;
                    string partnerId = dtIntegracion != null && dtIntegracion.Rows.Count > 0 ? dtIntegracion.Rows[0]["partnerId"].ToString() : null;
                    dtIntegracion.Dispose();

                    DataTable dtAfi = cg.ConsultarCodigoSiigoPorDocumento(strCedula);
                    string idTipoDocSiigo = dtAfi.Rows[0]["CodSiigo"].ToString();
                    dtAfi.Dispose();

                    var siigoClient = new SiigoClient(
                        new HttpClient(),
                        url,
                        username,
                        accessKey,
                        partnerId
                    );

                    await siigoClient.ManageCustomerAsync(idTipoDocSiigo, strCedula, strNombre, strApellido, direccion, codEstado, codCiudad, strCelular, strEmail);
                }
                catch (Exception siigoEx)
                {
                    System.Diagnostics.Debug.WriteLine("Error en ManageCustomer Siigo: " + siigoEx.Message);
                }

                DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);
                bool esDebitoAutomatico = dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1";
                dtPlan.Dispose();

                // Construir payload base
                var parametros = new NameValueCollection
                {
                    { "nroDoc", strCedula },
                    { "idPlan", IdPlan.ToString() },
                    { "valorPlan", ValorPlan.ToString() },
                    { "fechaIni", strFechaInicioPlan },
                    { "fechaFin", strFechaFinPlan },
                    { "idVendedor", IdVendedor.ToString() },
                    { "idSede", idSede.ToString() }
                };

                // Agregar solo si NO es débito automático
                if (!esDebitoAutomatico) parametros.Add("totalMeses", TotalMeses.ToString());

                // Convertir NameValueCollection → querystring
                string payload = string.Join("&", parametros.AllKeys.Select(key => $"{key}={HttpUtility.UrlEncode(parametros[key])}"));

                string token = UrlEncryptor.Encrypt(payload, TimeSpan.FromMinutes(10));

                // URL destino
                string destino = esDebitoAutomatico ? "wompipay" : "wompiplan";

                // Redirigir
                Response.Redirect($"{destino}?data={HttpUtility.UrlEncode(token)}", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        protected async void GestionarDatosUsuario(object sender, EventArgs e)
        {
            string documento = txbDocumento.Text.Trim();

            if (string.IsNullOrEmpty(documento))
            {
                LimpiarCampos();
                return;
            }

            // 1. Buscar en BD
            bool afiliadoExistente = BuscarAfiliado(documento);

            if (!afiliadoExistente)
            {
                // 2. Si no, buscar en ADRES
                await BuscarPersonaADRES(documento);

                // 3. Siempre cargar Ciudades y Sedes
                CargarCiudadesYSedes();
            }
        }

        protected bool BuscarAfiliado(string documento)
        {
            if (string.IsNullOrEmpty(documento)) return false;

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dt.Rows.Count == 0)
            {
                LimpiarCampos();
                dt.Dispose();
                return false;
            }

            // Cargar datos personales
            DataRow afiliado = dt.Rows[0];
            ddlTipoDocumento.SelectedValue = afiliado["idTipoDocumento"].ToString();
            txbNombre.Text = afiliado["NombreAfiliado"].ToString();
            txbApellido.Text = afiliado["ApellidoAfiliado"].ToString();
            txbEmail.Text = afiliado["EmailAfiliado"].ToString();
            txbCelular.Text = afiliado["CelularAfiliado"].ToString();
            txbFechaNac.Text = afiliado["FechaNacAfiliado"].ToString();
            ddlGenero.SelectedValue = afiliado["idGenero"].ToString();

            int idSede = Convert.ToInt32(afiliado["idSede"]);
            DataTable dtCiudad = cg.ConsultarCiudadSedePorIdSede(idSede);

            if (dtCiudad != null && dtCiudad.Rows.Count > 0)
            {
                string idCiudad = dtCiudad.Rows[0]["idCiudadSede"].ToString();

                // Seleccionar la ciudad correspondiente
                if (ddlCiudad.Items.FindByValue(idCiudad) != null)
                {
                    ddlCiudad.SelectedValue = idCiudad;
                }

                // Recargar las sedes de esa ciudad
                DataTable dtSedes = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(idCiudad));

                ddlSede.Items.Clear(); // Importante para evitar duplicados
                ddlSede.DataSource = dtSedes;
                ddlSede.DataTextField = "NombreSede";
                ddlSede.DataValueField = "IdSede";
                ddlSede.DataBind();
                ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));

                // Seleccionar la sede correcta del afiliado
                if (ddlSede.Items.FindByValue(idSede.ToString()) != null)
                {
                    ddlSede.SelectedValue = idSede.ToString();
                }

                dtSedes.Dispose();
            }

            dt.Dispose();
            dtCiudad?.Dispose();

            return true;
        }

        protected async Task BuscarPersonaADRES(string documento)
        {
            string url = $"https://pqrdsuperargo.supersalud.gov.co/api/api/adres/0/{documento}";

            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetAsync(url);

                if (!response.IsSuccessStatusCode)
                {
                    LimpiarCampos();
                    return;
                }

                string json = await response.Content.ReadAsStringAsync();

                json = json.Replace("\\u00a5", "Ñ").Replace("\\u00a4", "ñ");

                dynamic personaADRES = JsonConvert.DeserializeObject<dynamic>(json);

                if (personaADRES == null || personaADRES.nombre == null || personaADRES.apellido == null)
                {
                    LimpiarCampos();
                    return;
                }

                txbNombre.Text = $"{(string)personaADRES.nombre} {(string)personaADRES.s_nombre}".Trim().ToUpper();
                txbApellido.Text = $"{(string)personaADRES.apellido} {(string)personaADRES.s_apellido}".Trim().ToUpper();
                txbFechaNac.Text = personaADRES.fecha_nacimiento;
                ddlGenero.SelectedValue = personaADRES.sexo;
            }
        }

        private void LimpiarCampos()
        {
            ddlTipoDocumento.ClearSelection();
            txbNombre.Text = "";
            txbApellido.Text = "";
            txbEmail.Text = "";
            txbCelular.Text = "";
            ddlGenero.ClearSelection();
            txbFechaNac.Text = "";
            ddlCiudad.ClearSelection();

            // Cargar la lista completa de sedes
            clasesglobales cg = new clasesglobales();
            DataTable dtSedes = cg.ConsultarSedesWeb();
            ddlSede.DataSource = dtSedes;
            ddlSede.DataTextField = "NombreSede";
            ddlSede.DataValueField = "IdSede";
            ddlSede.DataBind();
            ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            dtSedes.Dispose();
        }

        public string CalcularFechaFinPlan(string strFechaInicio)
        {
            DateTime fechaInicio;

            // Validar fecha
            if (!DateTime.TryParse(strFechaInicio, out fechaInicio)) return null;

            // Consultar datos del plan
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPlanWebPorId(IdPlan);

            if (dt == null || dt.Rows.Count == 0) return null;

            DataRow row = dt.Rows[0];


            int meses = 0;
            int mesesCortesia = 0;

            int.TryParse(row["Meses"].ToString(), out meses);
            int.TryParse(row["MesesCortesia"].ToString(), out mesesCortesia);

            TotalMeses = meses + mesesCortesia;

            // Calcular la fecha final sumando meses
            DateTime fechaFin = fechaInicio.AddMonths(TotalMeses);

            dt.Dispose();

            return fechaFin.ToString("yyyy-MM-dd");
        }

        protected void CambiarFechaFin(object sender, EventArgs e)
        {
            string strFechaInicio = txbFechaIni.Text;

            string strFechaFin = CalcularFechaFinPlan(strFechaInicio);

            txbFechaFin.Text = strFechaFin;
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
                showCloseButton: false, 
                confirmButtonText: 'Aceptar', 
                customClass: {{
                    popup: 'alert',
                    confirmButton: 'btn-confirm-alert'
                }},
            }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }

        // - COMENTADO HASTA NUEVO AVISO -
        //protected void btnRedireccionarRegresarRegister_Click(object sender, EventArgs e)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dtToken = cg.ConsultarTokenPorIdPlanYIdVendedor(21, 156);

        //    string token = dtToken.Rows.Count > 0 ? dtToken.Rows[0]["token"].ToString() : "";

        //    Response.Redirect($"register.aspx?token={token}", false);
        //    Context.ApplicationInstance.CompleteRequest();
        //}
    }
}