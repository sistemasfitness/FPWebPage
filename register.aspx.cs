using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Newtonsoft.Json;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;
using static WebPage.Services.SiigoClient;

namespace WebPage
{
    public partial class register : System.Web.UI.Page
    {
        protected bool EsPlanDuo
        {
            get { return ViewState["esPlanDuo"] != null && (bool)ViewState["esPlanDuo"]; }
            set { ViewState["esPlanDuo"] = value; }
        }

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["PagoCompletado"] = false;

                if (ValidarParametrosURL())
                {
                    ValidarPlan();

                    GestionarIntegracionSiigo();

                    ConfigurarCamposFecha();

                    CargarInformacionPlan();

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

        private void GestionarIntegracionSiigo()
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtVendedor = cg.ConsultarUsuarioEmpleadoPorId(IdVendedor);
            int idCanalVenta = dtVendedor.Rows.Count > 0 ? Convert.ToInt32(dtVendedor.Rows[0]["idCanalVenta"]) : 0;
            dtVendedor.Dispose();

            DataTable dtIntegracion = cg.ConsultarIntegracionEmpresaPorIdCanalVenta(idCanalVenta);
            
            foreach (DataRow row in dtIntegracion.Rows)
            {
                string codigo = row["codigo"].ToString();

                if (codigo == "SIIGO")
                {
                    UrlSiigo = row["url"].ToString();
                    UserName = row["username"].ToString();
                    AccessKey = row["accessKey"].ToString();
                    PartnerId = row["partnerId"].ToString();
                }
            }
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

        private void CargarInformacionPlan()
        {
            if (IdPlan == 31)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 174.900</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 165.000/mes
                                    </div>
                                    <div class='total_cart'>
                                        INSCRIPCIÓN <span class='pull-right'>$ 190.000</span>
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 364.900</span>
                                    </div>";
            }

            if (IdPlan == 35)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 19.900</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 79.600/mes
                                    </div>
                                    <div class='total_cart'>
                                        INSCRIPCIÓN <span class='pull-right'>$ 19.900</span>
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 39.800</span>
                                    </div>";
            }

            if (IdPlan == 36)
            {
                pnlTotalCart.Visible = false;

                ltPlanEasy.Text = @"<div class='total_cart' style='margin-bottom: 0;'>
                                        PRIMER MES <span class='pull-right'>$ 19.900</span>
                                    </div>
                                    <div class='total_cart' style='font-size: 15px;'>
                                        DESPUÉS $ 99.500/mes
                                    </div>
                                    <div class='total_cart'>
                                        INSCRIPCIÓN <span class='pull-right'>$ 9.900</span>
                                    </div>
                                    <div class='total_cart'>
                                        TOTAL <span class='pull-right'>$ 29.800</span>
                                    </div>";
            }
        }

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

            if (IdPlan == 32)
            {
                txbFechaNac2.Attributes.Add("type", "date");

                txbFechaNac2.Attributes.Add("min", dt100.ToString("yyyy-MM-dd"));
                txbFechaNac2.Attributes.Add("max", dt14.ToString("yyyy-MM-dd"));
            }
        }

        private void ValidarPlan()
        {
            try
            {
                clasesglobales cg = new clasesglobales();

                DataTable dtPlan = cg.ConsultarPlanWebPorId(IdPlan);

                if (dtPlan == null || dtPlan.Rows.Count == 0) Response.Redirect("default", true);

                EsPlanDuo = IdPlan == 32;
                ValidarVisibilidadFormulario(EsPlanDuo);

                bool esDebitoAutomatico = dtPlan.Rows[0]["DebitoAutomatico"].ToString() == "1";

                // Mostrar tipo de pago
                txbMetodoPago.Text = esDebitoAutomatico
                    ? "Débito Automático"
                    : "Pago Único";

                // Texto en autorización
                lbTipoCobro.Text = esDebitoAutomatico ? " recurrente" : null;

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

        private void ValidarVisibilidadFormulario(bool esPlanDuo)
        {
            if (esPlanDuo)
            {
                divPlanDuo.Visible = true;
            }
            else
            {
                divPlanDuo.Visible = false;
            }
        }

        private void CargarTipoDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDocumento.DataSource = dt;
            ddlTipoDocumento.DataBind();

            if (EsPlanDuo)
            {
                ddlTipoDocumento2.DataSource = dt;
                ddlTipoDocumento2.DataBind();
            }

            dt.Dispose();
        }

        private void CargarGeneros()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarGeneros();

            ddlGenero.DataSource = dt;
            ddlGenero.DataBind();

            if (EsPlanDuo)
            {
                ddlGenero2.DataSource = dt;
                ddlGenero2.DataBind();
            }

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

                int idAfiliado = await GestionarAfiliado(strCedula, idTipoDocumento, strNombre, strApellido, strCelular, strEmail, idGenero, strFechaNac, strFechaInicioPlan, idSede, direccion, codEstado, codCiudad);

                string strCedula2 = "";

                if (EsPlanDuo)
                {
                    strCedula2 = txbDocumento2.Text.Trim();

                    // VALIDACIÓN: No permitir misma cédula en plan dúo
                    if (strCedula == strCedula2)
                    {
                        MostrarAlerta("Documento duplicado", "En un plan dúo los dos afiliados deben tener documentos diferentes.", "warning");
                        return;
                    }

                    int tipoDoc2 = Convert.ToInt32(ddlTipoDocumento2.SelectedItem.Value.ToString());
                    string nombre2 = txbNombre2.Text.ToUpper();
                    string apellido2 = txbApellido2.Text.ToUpper();
                    string celular2 = txbCelular2.Text.Trim();
                    string email2 = txbEmail2.Text.ToLower();
                    int genero2 = Convert.ToInt32(ddlGenero2.SelectedItem.Value.ToString());
                    string fechaNac2 = txbFechaNac2.Text.Trim();

                    int idAfiliadoDuo = await GestionarAfiliado(strCedula2, tipoDoc2, nombre2, apellido2, celular2, email2, genero2, fechaNac2, strFechaInicioPlan, idSede, direccion, codEstado, codCiudad);
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

                if (EsPlanDuo) parametros.Add("nroDocDuo", strCedula2);

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
                if (ex.Message == "PLAN_ACTIVO") return;

                MostrarAlerta("Error", "Ha ocurrido un error inesperado: " + ex.Message, "error");
            }
        }

        private async Task<int> GestionarAfiliado(string documento, int tipoDoc, string nombre, string apellido, string celular, string email, int genero, string fechaNac, string fechaIniPlan, int idSede, string direccion, string codEstado, string codCiudad)
        {
            clasesglobales cg = new clasesglobales();

            int idAfiliado = 0;

            DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dtAfiliado.Rows.Count > 0)
            {
                idAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);

                bool tienePlanActivo = ConsultarPlanActivoAfiliado(documento, fechaIniPlan);

                if (tienePlanActivo) throw new Exception("PLAN_ACTIVO");

                cg.ActualizarAfiliadoRegister(
                    documento,
                    nombre,
                    apellido,
                    celular,
                    email,
                    genero,
                    fechaNac,
                    idSede,
                    "Pendiente"
                );
            }
            else
            {
                cg.InsertarAfiliadoWeb(
                    documento,
                    tipoDoc,
                    nombre,
                    apellido,
                    celular,
                    email,
                    genero,
                    fechaNac,
                    idSede
                );

                // Vuelves a consultar para obtener el id
                DataTable dtNew = cg.ConsultarAfiliadoPorDocumento(documento);
                idAfiliado = Convert.ToInt32(dtNew.Rows[0]["IdAfiliado"]);
                dtNew.Dispose();
            }

            dtAfiliado.Dispose();

            // ---- Gestionar en Siigo ----
            try
            {
                DataTable dtAfi = cg.ConsultarCodigoSiigoPorDocumento(documento);
                string idTipoDocSiigo = dtAfi.Rows[0]["CodSiigo"].ToString();
                dtAfi.Dispose();

                var siigoClient = new SiigoClient(
                    new HttpClient(),
                    UrlSiigo,
                    UserName,
                    AccessKey,
                    PartnerId
                );

                await siigoClient.ManageCustomerAsync(
                    idTipoDocSiigo,
                    documento,
                    nombre,
                    apellido,
                    direccion,
                    codEstado,
                    codCiudad,
                    celular,
                    email
                );
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error Siigo: " + ex.Message);
            }

            return idAfiliado;
        }

        private bool ConsultarPlanActivoAfiliado(string cedula, string fechaInicioPlan)
        {
            // IMPORTANTE: NO ELIMINAR - SOLO SE COMENTA PARA REALIZAR PRUEBAS
            clasesglobales cg = new clasesglobales();

            DataTable dtFechaFinPlan = cg.ConsultarFechaFinPlanPorDocumento(cedula);

            if (dtFechaFinPlan.Rows.Count > 0)
            {
                // Obtener fecha de fin anterior
                DateTime fechaFinAnterior = Convert.ToDateTime(dtFechaFinPlan.Rows[0]["FechaFinalPlan"]);
                DateTime fechaInicioNuevo = Convert.ToDateTime(fechaInicioPlan);

                if (fechaInicioNuevo <= fechaFinAnterior)
                {
                    MostrarAlerta(
                        "Tienes un plan activo",
                        "Ya tienes un plan en curso que cubre las fechas seleccionadas. Nuestro sistema procesará el cobro automáticamente cuando corresponda, así que no es necesario realizar otro pago. Solo asegúrate de tener saldo disponible en tu tarjeta.",
                        "warning"
                    );

                    return true;
                }
            }

            dtFechaFinPlan.Dispose();

            return false;
        }

        public class FormularioAfiliado
        {
            public TextBox txbDocumento { get; set; }
            public DropDownList ddlTipoDocumento { get; set; }
            public TextBox txbNombre { get; set; }
            public TextBox txbApellido { get; set; }
            public TextBox txbEmail { get; set; }
            public TextBox txbCelular { get; set; }
            public TextBox txbFechaNac { get; set; }
            public DropDownList ddlGenero { get; set; }

            // Solo aplica para afiliado principal
            public DropDownList ddlCiudad { get; set; }
            public DropDownList ddlSede { get; set; }

            public bool EsSecundario { get; set; }
        }

        private FormularioAfiliado ObtenerFormulario1()
        {
            return new FormularioAfiliado
            {
                txbDocumento = txbDocumento,
                ddlTipoDocumento = ddlTipoDocumento,
                txbNombre = txbNombre,
                txbApellido = txbApellido,
                txbEmail = txbEmail,
                txbCelular = txbCelular,
                txbFechaNac = txbFechaNac,
                ddlGenero = ddlGenero,
                ddlCiudad = ddlCiudad,
                ddlSede = ddlSede,
                EsSecundario = false
            };
        }

        private FormularioAfiliado ObtenerFormulario2()
        {
            return new FormularioAfiliado
            {
                txbDocumento = txbDocumento2,
                ddlTipoDocumento = ddlTipoDocumento2,
                txbNombre = txbNombre2,
                txbApellido = txbApellido2,
                txbEmail = txbEmail2,
                txbCelular = txbCelular2,
                txbFechaNac = txbFechaNac2,
                ddlGenero = ddlGenero2,
                EsSecundario = true
            };
        }

        protected async void GestionarDatosUsuario(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            string documento = txt.Text.Trim();

            bool EsPlanDuo = IdPlan == 32;

            FormularioAfiliado form;

            if (txt.ID == "txbDocumento2")
            {
                if (!EsPlanDuo) return; // seguridad extra

                form = ObtenerFormulario2();
            }
            else
            {
                form = ObtenerFormulario1();
            }

            if (string.IsNullOrEmpty(documento))
            {
                LimpiarCampos(form);
                return;
            }

            bool existe = BuscarAfiliado(documento, form);

            if (!existe)
            {
                await BuscarPersonaADRES(documento, form);

                // Solo el principal necesita ciudades y sedes
                if (!form.EsSecundario)
                    CargarCiudadesYSedes();
            }
        }

        protected bool BuscarAfiliado(string documento, FormularioAfiliado form)
        {
            if (string.IsNullOrEmpty(documento)) return false;

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dt.Rows.Count == 0)
            {
                LimpiarCampos(form);
                dt.Dispose();
                return false;
            }

            DataRow afiliado = dt.Rows[0];

            form.txbDocumento.Text = documento;
            form.ddlTipoDocumento.SelectedValue = afiliado["idTipoDocumento"].ToString();
            form.txbNombre.Text = afiliado["NombreAfiliado"].ToString();
            form.txbApellido.Text = afiliado["ApellidoAfiliado"].ToString();
            form.txbEmail.Text = afiliado["EmailAfiliado"].ToString();
            form.txbCelular.Text = afiliado["CelularAfiliado"].ToString();
            form.txbFechaNac.Text = afiliado["FechaNacAfiliado"].ToString();
            form.ddlGenero.SelectedValue = afiliado["idGenero"].ToString();

            // Solo si es afiliado principal
            if (!form.EsSecundario)
            {
                int idSede = Convert.ToInt32(afiliado["idSede"]);
                DataTable dtCiudad = cg.ConsultarCiudadSedePorIdSede(idSede);

                if (dtCiudad != null && dtCiudad.Rows.Count > 0)
                {
                    string idCiudad = dtCiudad.Rows[0]["idCiudadSede"].ToString();

                    if (form.ddlCiudad.Items.FindByValue(idCiudad) != null)
                        form.ddlCiudad.SelectedValue = idCiudad;

                    DataTable dtSedes = cg.ConsultarSedesPorIdCiudadWeb(Convert.ToInt32(idCiudad));

                    form.ddlSede.Items.Clear();
                    form.ddlSede.DataSource = dtSedes;
                    form.ddlSede.DataTextField = "NombreSede";
                    form.ddlSede.DataValueField = "IdSede";
                    form.ddlSede.DataBind();
                    form.ddlSede.Items.Insert(0, new ListItem("Selecciona una opción", ""));

                    if (form.ddlSede.Items.FindByValue(idSede.ToString()) != null)
                        form.ddlSede.SelectedValue = idSede.ToString();

                    dtSedes.Dispose();
                }

                dtCiudad?.Dispose();
            }

            dt.Dispose();
            return true;
        }

        protected async Task BuscarPersonaADRES(string documento, FormularioAfiliado form)
        {
            if (string.IsNullOrEmpty(documento))
            {
                LimpiarCampos(form);
                return;
            }

            string url = $"https://pqrdsuperargo.supersalud.gov.co/api/api/adres/0/{documento}";

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    var response = await client.GetAsync(url);

                    if (!response.IsSuccessStatusCode)
                    {
                        LimpiarCampos(form);
                        return;
                    }

                    string json = await response.Content.ReadAsStringAsync();

                    json = json.Replace("\\u00a5", "Ñ")
                               .Replace("\\u00a4", "ñ");

                    dynamic personaADRES = JsonConvert.DeserializeObject<dynamic>(json);

                    if (personaADRES == null ||
                        personaADRES.nombre == null ||
                        personaADRES.apellido == null)
                    {
                        LimpiarCampos(form);
                        return;
                    }

                    // Campos comunes (principal y secundario)
                    form.txbDocumento.Text = documento;

                    form.txbNombre.Text =
                        $"{(string)personaADRES.nombre} {(string)personaADRES.s_nombre}"
                        .Trim()
                        .ToUpper();

                    form.txbApellido.Text =
                        $"{(string)personaADRES.apellido} {(string)personaADRES.s_apellido}"
                        .Trim()
                        .ToUpper();

                    form.txbFechaNac.Text = personaADRES.fecha_nacimiento;
                    form.ddlGenero.SelectedValue = personaADRES.sexo;
                }
                catch (Exception)
                {
                    LimpiarCampos(form);
                }
            }
        }

        private void LimpiarCampos(FormularioAfiliado form)
        {
            form.txbNombre.Text = "";
            form.txbApellido.Text = "";
            form.txbEmail.Text = "";
            form.txbCelular.Text = "";
            form.txbFechaNac.Text = "";
            form.ddlGenero.SelectedIndex = 0;

            if (!form.EsSecundario)
            {
                form.ddlCiudad.SelectedIndex = 0;
                form.ddlSede.Items.Clear();
            }
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