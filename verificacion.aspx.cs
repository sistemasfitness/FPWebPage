using MySql.Data.MySqlClient;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Net.Http;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPage.Services;

namespace WebPage
{
    public partial class verificacion : System.Web.UI.Page
    {
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

        protected int IdAfiliadoPlan
        {
            get { return ViewState["idAfiPlan"] != null ? (int)ViewState["idAfiPlan"] : 0; }
            set { ViewState["idAfiPlan"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarInformacion();
            }
        }

        private void CargarInformacion()
        {
            try
            {
                DocumentoAfiliado = Request.QueryString["nroDoc"];

                clasesglobales cg = new clasesglobales();

                DataTable dtAfiliado = cg.ConsultarAfiliadoPorDocumento(DocumentoAfiliado);

                if (dtAfiliado.Rows.Count == 0)
                {
                    Response.Redirect("default", false);
                    return;
                }

                IdAfiliado = Convert.ToInt32(dtAfiliado.Rows[0]["IdAfiliado"]);

                DataTable dtAfiliadoPlan = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(IdAfiliado);

                if (dtAfiliadoPlan.Rows.Count == 0)
                {
                    Response.Redirect("default", false);
                    return;
                }

                IdAfiliadoPlan = int.Parse(dtAfiliadoPlan.Rows[0]["idAfiliadoPlan"].ToString());

                dtAfiliadoPlan.Dispose();

                //CargarEps();

                txbFechaNacimiento.Attributes.Add("type", "date");

                hfIdAfiliado.Value = IdAfiliado.ToString();
                txbNombres.Text = dtAfiliado.Rows[0]["NombreAfiliado"].ToString();
                txbApellidos.Text = dtAfiliado.Rows[0]["ApellidoAfiliado"].ToString();
                txbCorreo.Text = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                txbCelular.Text = dtAfiliado.Rows[0]["CelularAfiliado"].ToString();
                txbDireccion.Text = dtAfiliado.Rows[0]["DireccionAfiliado"].ToString();
                txbFechaNacimiento.Text = dtAfiliado.Rows[0]["FechaNacAfiliado"].ToString();

                //if (dtAfiliado.Rows[0]["idEps"].ToString() != "")
                //{
                //    ddlEPS.SelectedIndex = Convert.ToInt16(ddlEPS.Items.IndexOf(ddlEPS.Items.FindByValue(dtAfiliado.Rows[0]["idEps"].ToString())));
                //}

                txbResponsable.Text = dtAfiliado.Rows[0]["ResponsableAfiliado"].ToString();

                CargarParentescos(Convert.ToInt32(dtAfiliado.Rows[0]["idTipoDocumento"]));

                if (dtAfiliado.Rows[0]["Parentesco"].ToString() != "")
                {
                    ddlParentesco.SelectedValue = dtAfiliado.Rows[0]["Parentesco"].ToString();
                }

                txbContacto.Text = dtAfiliado.Rows[0]["ContactoAfiliado"].ToString();
                CorreoAfiliado = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                //ViewState["ClaveAfiliado"] = dtAfiliado.Rows[0]["ClaveAfiliado"].ToString();

                dtAfiliado.Dispose();

                ListaPreguntasParq();

            } catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al cargar la información: " + ex.ToString());
            }
        }

        private void CargarParentescos(int idTipoDocumento)
        {
            ddlParentesco.Items.Clear();
            ddlParentesco.Items.Add(new ListItem("Selecciona una opción", ""));

            ddlParentesco.Items.Add(new ListItem("Padre/Madre", "Padre/Madre"));

            if (idTipoDocumento != 3)
            {
                ddlParentesco.Items.Add(new ListItem("Esposo/a", "Esposo/a"));
                ddlParentesco.Items.Add(new ListItem("Hermano/a", "Hermano/a"));
                ddlParentesco.Items.Add(new ListItem("Hijo/a", "Hijo/a"));
                ddlParentesco.Items.Add(new ListItem("Primo/a", "Primo/a"));
                ddlParentesco.Items.Add(new ListItem("Sobrino/a", "Sobrino/a"));
            }

            ddlParentesco.Items.Add(new ListItem("Tutor/a", "Tutor/a"));
        }

        //private void CargarEps()
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dt = cg.ConsultarEpss();

        //    ddlEPS.DataSource = dt;
        //    ddlEPS.DataBind();

        //    dt.Dispose();
        //}

        private void ListaPreguntasParq()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPreguntasParQPorEstado("Activo");

            if (dt.Rows.Count > 0)
            {
                rpParq.DataSource = dt;
                rpParq.DataBind();
                dt.Dispose();
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ddlParentesco.SelectedValue))
                {
                    MostrarAlerta("Campo requerido", "Debes seleccionar el parentesco del contacto de emergencia.", "warning");
                    return;
                }

                clasesglobales cg = new clasesglobales();

                // TODO: Validar que si el afiliado ya ha respondido las preguntas, no se vuelvan a insertar.

                foreach (RepeaterItem item in rpParq.Items)
                {
                    if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
                    {
                        CheckBox chbRespuesta = (CheckBox)item.FindControl("chbRespuesta");
                        HiddenField hfidParq = (HiddenField)item.FindControl("hfidParq");

                        int respuestaPARQ = chbRespuesta != null && chbRespuesta.Checked ? 1 : 0;

                        cg.InsertarRespuestasDePreguntasParQPorIdAfiliadoWeb(
                            int.Parse(hfidParq.Value.ToString()),
                            IdAfiliado,
                            IdAfiliadoPlan,
                            respuestaPARQ
                        );
                    }
                }

                // Actualizar el estado del plan del afiliado
                cg.ActualizarEstadoAfiliadoPlan(
                    "Activo",
                    IdAfiliado,
                    IdAfiliadoPlan
                );

                // Actualizar la información y estado del afiliado
                cg.ActualizarAfiliadoWeb(
                    DocumentoAfiliado,
                    txbNombres.Text,
                    txbApellidos.Text,
                    txbCelular.Text,
                    txbCorreo.Text,
                    txbDireccion.Text,
                    txbFechaNacimiento.Text, 
                    /*int.Parse(ddlEPS.SelectedItem.Value.ToString())*/
                    txbResponsable.Text, 
                    ddlParentesco.SelectedItem.Value.ToString(),
                    txbContacto.Text, 
                    "Activo", 
                    txbObservacionesPARQ.Text
                );


                // ConsultarPreguntaParQPorEstado


                //foreach (RepeaterItem item in rpParq.Items)
                //{
                //    if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
                //    {
                //        CheckBox chbRespuesta = (CheckBox)item.FindControl("chbRespuesta");
                //        HiddenField hfidParqAfiliado = (HiddenField)item.FindControl("hfidParqAfiliado");
                //        if (chbRespuesta != null && chbRespuesta.Checked)
                //        {
                //            // Aquí se puede acceder al valor del checkbox seleccionado
                //            string strQuery = "UPDATE ParqAfiliados SET Respuesta = 1 WHERE idParqAfiliado = " + hfidParqAfiliado.Value.ToString();

                //            try
                //            {
                //                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                //                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                //                {
                //                    mysqlConexion.Open();
                //                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                //                    {
                //                        cmd.CommandType = CommandType.Text;
                //                        cmd.ExecuteNonQuery();
                //                    }
                //                    mysqlConexion.Close();
                //                }
                //            }
                //            catch (Exception ex)
                //            {
                //                string respuesta = "ERROR: " + ex.Message;
                //            }
                //        }
                //    }
                //}

                // TODO: Comentado para realizar pruebas
                // Enviar correo de confirmación
                //EnviarConfirmacion();

                Response.Redirect("gracias", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", "Ocurrió un error inesperado al realizar la verificación.", "error");
                System.Diagnostics.Debug.WriteLine("Error en btnVerificar_Click: " + ex.ToString());
            }
        }

        private void EnviarConfirmacion()
        {
            clasesglobales cg = new clasesglobales();

            string strAsunto = "Bienvenido a Fitness People CMD";
            string strRemitente = "sistemas@fitnesspeoplecmd.com";
            string strDestinatario = CorreoAfiliado;
            //string strDestinatario = "chrislemoce@gmail.com";
            string strMensaje = "Bienvenido a Fitness People CMD.\r\n\r\n" +
                "Ahora haces parte de la familia Fitness People CMD. Ingresa a nuestra página web: fitnesspeoplecolombia.com\r\n"; // +
                //"Contrato: fitnesspeoplecolombia.com/contrato \r\n\r\n";

            cg.EnviarCorreo(strRemitente, strDestinatario, strAsunto, strMensaje);
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
    }
}