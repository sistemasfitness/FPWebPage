using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
    public partial class cambioMetodoPago : System.Web.UI.Page
    {
        protected string DocumentoAfiliado
        {
            get { return ViewState["nroDoc"]?.ToString(); }
            set { ViewState["nroDoc"] = value; }
        }

        protected int ValorPagar
        {
            get { return ViewState["valorPagar"] != null ? (int)ViewState["valorPagar"] : 0; }
            set { ViewState["valorPagar"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("default", true);

            if (!IsPostBack)
            {
                ltValor.Text = "$0";
            } 
        }

        protected void btnCambiarMetodoPago_Click(object sender, EventArgs e)
        {
            clasesglobales cg = new clasesglobales();

            DataTable dtAfiPlan = cg.ConsultarAfiliadoPlanActivoPorDocumentoAfiliado(DocumentoAfiliado);

            if (dtAfiPlan == null && dtAfiPlan.Rows.Count == 0 || ValorPagar <= 0)
            {
                MostrarAlerta("No se puede continuar", "No se encontró un plan activo para ese número de cédula. Por favor revisa tu información o comunícate con un asesor.", "error");
                return;
            }

            int idAfiliadoPlan = Convert.ToInt32(dtAfiPlan.Rows[0]["idAfiliadoPlan"]);
            int idAfiliado = Convert.ToInt32(dtAfiPlan.Rows[0]["idAfiliado"]);
            string idPlan = dtAfiPlan.Rows[0]["idPlan"].ToString();
            string fechaIniPlan = dtAfiPlan.Rows[0]["fechaInicioPlan"].ToString();
            string fechaFinPlan = dtAfiPlan.Rows[0]["fechaFinalPlan"].ToString();
            string idSede = dtAfiPlan.Rows[0]["idSede"].ToString();
            dtAfiPlan.Dispose();

            DataTable dtUltimoPagoPlanAfi = cg.ConsultarUltimoPagoPlaAfiliadoPorDocumentoAfiliado(DocumentoAfiliado);
            string idVendedor = dtUltimoPagoPlanAfi.Rows[0]["idUsuario"].ToString();
            dtUltimoPagoPlanAfi.Dispose();

            // Construir payload base
            var parametros = new NameValueCollection
            {
                { "nroDoc", DocumentoAfiliado },
                { "idPlan", idPlan },
                { "valorPlan", ValorPagar.ToString() },
                { "fechaIni", fechaIniPlan },
                { "fechaFin", fechaFinPlan },
                { "idVendedor", idVendedor },
                { "idSede", idSede },
                { "idAfiPlan", idAfiliadoPlan.ToString() }
            };

            // Convertir NameValueCollection → querystring
            string payload = string.Join("&", parametros.AllKeys.Select(key => $"{key}={HttpUtility.UrlEncode(parametros[key])}"));

            string token = UrlEncryptor.Encrypt(payload, TimeSpan.FromMinutes(10));

            // Redirigir
            Response.Redirect($"wompipay?data={HttpUtility.UrlEncode(token)}", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }

        protected void GestionarDatosUsuario(object sender, EventArgs e)
        {
            DocumentoAfiliado = txbDocumento.Text.Trim();

            if (string.IsNullOrEmpty(DocumentoAfiliado))
            {
                LimpiarCampos();
                ltValor.Text = "$0";
                return;
            }

            // 1. Buscar en BD
            BuscarAfiliado(DocumentoAfiliado);

            clasesglobales cg = new clasesglobales();

            DataTable dtAfiPlan = cg.ConsultarAfiliadoPlanActivoPorDocumentoAfiliado(DocumentoAfiliado);

            if (dtAfiPlan == null || dtAfiPlan.Rows.Count == 0)
            {
                ltValor.Text = "$0";
                return;
            }

            int idAfiPlan = Convert.ToInt32(dtAfiPlan.Rows[0]["idAfiliadoPlan"]);
            int idPlan = Convert.ToInt32(dtAfiPlan.Rows[0]["idPlan"]);
            int valorPlan = Convert.ToInt32(dtAfiPlan.Rows[0]["valor"]);

            ValorPagar = cg.ObtenerValorMesPlan(idPlan, idAfiPlan, valorPlan);

            ltValor.Text = ValorPagar.ToString("C0");
            Session.Add("ltValorPlan", ltValor.Text.ToString());
        }

        protected void BuscarAfiliado(string documento)
        {
            if (string.IsNullOrEmpty(documento)) return;

            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorDocumento(documento);

            if (dt.Rows.Count == 0)
            {
                LimpiarCampos();
                dt.Dispose();
                return;
            }

            // Cargar datos personales
            DataRow afiliado = dt.Rows[0];

            DataTable dtTipoDoc = cg.ConsultartiposDocumentoPorId(Convert.ToInt32(afiliado["idTipoDocumento"].ToString()));
            string tipoDoc = dtTipoDoc.Rows[0]["TipoDocumento"].ToString();
            dtTipoDoc.Dispose();

            lblTipoDocumento.Text = tipoDoc;
            lblNombre.Text = afiliado["NombreAfiliado"].ToString();
            lblApellido.Text = afiliado["ApellidoAfiliado"].ToString();
            lblEmail.Text = afiliado["EmailAfiliado"].ToString();
            lblCelular.Text = afiliado["CelularAfiliado"].ToString();

            dt.Dispose();
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

        private void LimpiarCampos()
        {
            lblTipoDocumento.Text = "";
            lblNombre.Text = "";
            lblApellido.Text = "";
            lblEmail.Text = "";
            lblCelular.Text = "";
        }
    }
}