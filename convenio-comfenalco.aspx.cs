using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class convenio_comfenalco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTiposDocumento();

                OcultarResultados();
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            OcultarResultados();

            // =========================================================
            // 1. VALIDAR AUTORIZACIÓN
            // =========================================================

            if (!chkAutorizacion.Checked)
            {
                MostrarMensaje("Debes aceptar los términos y la política de tratamiento de datos.");
                return;
            }

            // =========================================================
            // 2. DETERMINAR SI ES TITULAR O BENEFICIARIO
            // =========================================================

            string rol = Request.Form["rol"];

            if (string.IsNullOrEmpty(rol))
            {
                MostrarMensaje("Selecciona si la consulta corresponde a un titular o beneficiario.");
                return;
            }

            hfRol.Value = rol;

            bool esBeneficiario = rol == "beneficiario";

            // =========================================================
            // 3. OBTENER DOCUMENTO DEL TITULAR
            // =========================================================

            string tipoDocumentoTitular = ddlTipoDoc.SelectedValue;
            string documentoTitular = LimpiarDocumento(txtNumDoc.Text);

            if (string.IsNullOrEmpty(tipoDocumentoTitular))
            {
                MostrarMensaje("Selecciona el tipo de documento del titular.");
                return;
            }

            //if (!DocumentoValido(tipoDocumentoTitular, documentoTitular))
            //{
            //    MostrarMensaje("Ingresa un número de documento válido para el titular.");
            //    return;
            //}

            // =========================================================
            // 4. SI ES BENEFICIARIO, VALIDAR SU DOCUMENTO
            // =========================================================

            string tipoDocumentoBeneficiario = "";
            string documentoBeneficiario = "";

            if (esBeneficiario)
            {
                tipoDocumentoBeneficiario = ddlTipoDocB.SelectedValue;
                documentoBeneficiario = LimpiarDocumento(txtNumDocB.Text);

                if (string.IsNullOrEmpty(tipoDocumentoBeneficiario))
                {
                    MostrarMensaje("Selecciona el tipo de documento del beneficiario.");
                    return;
                }

                //if (!DocumentoValido(
                //    tipoDocumentoBeneficiario,
                //    documentoBeneficiario))
                //{
                //    MostrarMensaje("Ingresa un número de documento válido para el beneficiario.");
                //    return;
                //}
            }

            // =========================================================
            // 5. DOCUMENTO QUE SE CONSULTARÁ
            // =========================================================

            string documentoConsulta = esBeneficiario
                ? documentoBeneficiario
                : documentoTitular;

            // =========================================================
            // 6. CONSULTAR CONVENIO
            //
            // ACTUALMENTE ES UNA SIMULACIÓN.
            // POSTERIORMENTE AQUÍ IRÁ LA API REAL.
            // =========================================================

            bool aplica = ConsultarConvenio(
                documentoConsulta
            );

            // =========================================================
            // 7. MOSTRAR RESULTADO
            // =========================================================

            if (!aplica)
            {
                MostrarNoAplica();
                return;
            }

            MostrarAplica(
                tipoDocumentoTitular,
                documentoTitular,
                esBeneficiario,
                tipoDocumentoBeneficiario,
                documentoBeneficiario
            );
        }

        private string FormatearDocumento(string documento)
        {
            if (string.IsNullOrWhiteSpace(documento))
                return "";

            if (documento.Length <= 3)
                return documento;

            string resultado = "";

            int contador = 0;

            for (int i = documento.Length - 1; i >= 0; i--)
            {
                resultado = documento[i] + resultado;
                contador++;

                if (contador == 3 && i > 0)
                {
                    resultado = "." + resultado;
                    contador = 0;
                }
            }

            return resultado;
        }

        private void MostrarAplica(
            string tipoDocumentoTitular,
            string documentoTitular,
            bool esBeneficiario,
            string tipoDocumentoBeneficiario,
            string documentoBeneficiario)
        {
            csRes.Visible = true;
            csNo.Visible = false;

            // Restaurar la clase visual que utiliza el CSS
            csRes.Attributes["class"] = "fpp-cs-res on";
            csNo.Attributes["class"] = "fpp-cs-no";

            // Documento titular
            csDoc.InnerText =
                "Titular · " +
                " " +
                FormatearDocumento(documentoTitular);

            // Documento beneficiario
            if (esBeneficiario)
            {
                csDocB.InnerText =
                    "Beneficiario · " +
                    " " +
                    FormatearDocumento(documentoBeneficiario);

                csDocB.Visible = true;
            }
            else
            {
                csDocB.Visible = false;
            }
        }

        private void MostrarNoAplica()
        {
            csRes.Visible = false;
            csNo.Visible = true;

            csRes.Attributes["class"] = "fpp-cs-res";
            csNo.Attributes["class"] = "fpp-cs-no on";
        }

        private void OcultarResultados()
        {
            csRes.Visible = false;
            csNo.Visible = false;
            csLoad.Visible = false;

            csRes.Attributes["class"] = "fpp-cs-res";
            csNo.Attributes["class"] = "fpp-cs-no";

            lblMensaje.InnerText = "";
            lblMensaje.Attributes["class"] = "fpp-cs-msg";
        }

        private void MostrarMensaje(string mensaje)
        {
            lblMensaje.InnerText = mensaje;
            lblMensaje.Attributes["class"] = "fpp-cs-msg on";
        }

        private bool ConsultarConvenio(string documento)
        {
            documento = documento.Trim();

            if (documento == "1234511")
            {
                return true;
            }

            if (documento == "1234500")
            {
                return false;
            }

            return false;
        }

        private string LimpiarDocumento(string documento)
        {
            if (string.IsNullOrWhiteSpace(documento))
                return "";

            return documento
                .Replace(".", "")
                .Replace(",", "")
                .Replace(" ", "")
                .Trim();
        }

        private void CargarTiposDocumento()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultartiposDocumento();

            ddlTipoDoc.DataSource = dt;
            ddlTipoDoc.DataTextField = "tipoDocumento";
            ddlTipoDoc.DataValueField = "idTipoDoc";
            ddlTipoDoc.DataBind();

            ddlTipoDocB.DataSource = dt;
            ddlTipoDocB.DataTextField = "tipoDocumento";
            ddlTipoDocB.DataValueField = "idTipoDoc";
            ddlTipoDocB.DataBind();

            ddlTipoDoc.Items.Insert(0, new ListItem("Selecciona una opción", ""));
            ddlTipoDocB.Items.Insert(0, new ListItem("Selecciona una opción", ""));

            foreach (DataRow row in dt.Rows)
            {
                string id = row["idTipoDoc"].ToString();

                ListItem itemTitular = ddlTipoDoc.Items.FindByValue(id);
                if (itemTitular != null)
                {
                    itemTitular.Attributes["data-sigla"] =
                        row["SiglaDocumento"].ToString();
                }

                ListItem itemBeneficiario = ddlTipoDocB.Items.FindByValue(id);
                if (itemBeneficiario != null)
                {
                    itemBeneficiario.Attributes["data-sigla"] =
                        row["SiglaDocumento"].ToString();
                }
            }

            dt.Dispose();
        }
    }
}