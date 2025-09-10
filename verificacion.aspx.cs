using MySql.Data.MySqlClient;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPage
{
    public partial class verificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    clasesglobales cg = new clasesglobales();

                    int idAfiliado = int.Parse(Request.QueryString["id"].ToString());

                    DataTable dtAfiliado = cg.ConsultarAfiliadoPorId(idAfiliado);

                    if (dtAfiliado.Rows.Count == 0)
                    {
                        Response.Redirect("default");
                    }
                    else
                    {
                        ValidarAfiliadoWeb();
                        CargarEps();

                        hfIdAfiliado.Value = dtAfiliado.Rows[0]["IdAfiliado"].ToString();
                        ViewState["idAfiliado"] = hfIdAfiliado.Value;
                        txbNombres.Text = dtAfiliado.Rows[0]["NombreAfiliado"].ToString();
                        txbApellidos.Text = dtAfiliado.Rows[0]["ApellidoAfiliado"].ToString();
                        txbCorreo.Text = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                        txbCelular.Text = dtAfiliado.Rows[0]["CelularAfiliado"].ToString();
                        txbDireccion.Text = dtAfiliado.Rows[0]["DireccionAfiliado"].ToString();
                        txbFechaNacimiento.Text = dtAfiliado.Rows[0]["FechaNacAfiliado"].ToString();
                        if (dtAfiliado.Rows[0]["idEps"].ToString() != "")
                        {
                            ddlEPS.SelectedIndex = Convert.ToInt16(ddlEPS.Items.IndexOf(ddlEPS.Items.FindByValue(dtAfiliado.Rows[0]["idEps"].ToString())));
                        }
                        txbResponsable.Text = dtAfiliado.Rows[0]["ResponsableAfiliado"].ToString();
                        if (dtAfiliado.Rows[0]["Parentesco"].ToString() != "")
                        {
                            ddlParentesco.SelectedIndex = Convert.ToInt16(ddlParentesco.Items.IndexOf(ddlParentesco.Items.FindByValue(dtAfiliado.Rows[0]["Parentesco"].ToString())));
                        }
                        txbContacto.Text = dtAfiliado.Rows[0]["ContactoAfiliado"].ToString();
                        ViewState["EmailAfiliado"] = dtAfiliado.Rows[0]["EmailAfiliado"].ToString();
                        ViewState["ClaveAfiliado"] = dtAfiliado.Rows[0]["ClaveAfiliado"].ToString();

                        ListaPreguntasParq();
                    }
                }
                else
                {
                    Response.Redirect("default");
                }
            }
        }

        private void CargarEps()
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarEpss();
            ddlEPS.DataSource = dt;
            ddlEPS.DataBind();
            dt.Dispose();
        }

        private void ValidarAfiliadoWeb()
        {
            string origenWeb = Request.QueryString["web"];
            ViewState["origenWeb"] = origenWeb;

            if (!string.IsNullOrEmpty(origenWeb) && origenWeb.ToLower() == "true")
            {
                //id_parrafo.Visible = false;
                //txbNombres.Enabled = false;
                //txbApellidos.Enabled = false;
                //txbCorreo.Enabled = false;
                //txbCelular.Enabled = false;
            }
        }

        //private void CargarDatosAfiliado(int idAfiliado)
        //{
        //    clasesglobales cg = new clasesglobales();
        //    DataTable dt = cg.ConsultarAfiliadoPorId(idAfiliado);

        //    if (dt.Rows.Count > 0)
        //    {
        //        hfIdAfiliado.Value = dt.Rows[0]["IdAfiliado"].ToString();
        //        ViewState["idAfiliado"] = hfIdAfiliado.Value;
        //        txbNombres.Text = dt.Rows[0]["NombreAfiliado"].ToString();
        //        txbApellidos.Text = dt.Rows[0]["ApellidoAfiliado"].ToString();
        //        txbCorreo.Text = dt.Rows[0]["EmailAfiliado"].ToString();
        //        txbCelular.Text = dt.Rows[0]["CelularAfiliado"].ToString();
        //        ViewState["EmailAfiliado"] = dt.Rows[0]["EmailAfiliado"].ToString();
        //        ViewState["ClaveAfiliado"] = dt.Rows[0]["ClaveAfiliado"].ToString();
        //    }
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
            //if (txbVerificacion.Text.ToString() == "4")
            //{
                try
                {
                    clasesglobales cg = new clasesglobales();

                    int idAfiliado = ViewState["idAfiliado"] != null ? int.Parse(ViewState["idAfiliado"].ToString()) : 0;

                    DataTable dtAfiliado = cg.ConsultarAfiliadoPorId(idAfiliado);

                    if (dtAfiliado.Rows.Count == 0)
                    {
                        MostrarAlerta("Error", "El usuario no se encuentra registrado en el sistema.", "error");
                        return;
                    }

                    DataTable dtAfiliadoPlan = cg.ConsultarIdAfiliadoPlanPorIdAfiliado(idAfiliado);

                    if (dtAfiliadoPlan.Rows.Count == 0)
                    {
                        MostrarAlerta("Error", "No se encuentran planes vinculados con este afiliado.", "error");
                        return;
                    }

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
                                idAfiliado,
                                int.Parse(dtAfiliadoPlan.Rows[0]["idAfiliadoPlan"].ToString()),
                                respuestaPARQ
                            );
                        }
                    }

                    // TODO: Actualizar el estado del plan del afiliado de "Pendiente" a "Activo" (AfiliadosPlanes).

                    if (string.IsNullOrEmpty(ViewState["origenWeb"].ToString()))
                    {
                        cg.ActualizarAfiliadoWeb(
                            dtAfiliado.Rows[0]["DocumentoAfiliado"].ToString(),
                            txbNombres.Text,
                            txbApellidos.Text,
                            txbCelular.Text,
                            txbCorreo.Text,
                            txbDireccion.Text,
                            txbFechaNacimiento.Text, 
                            int.Parse(ddlEPS.SelectedItem.Value.ToString()),
                            txbResponsable.Text, 
                            ddlParentesco.SelectedItem.Value.ToString(),
                            txbContacto.Text, 
                            "Activo"
                        );
                    }


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

                    dtAfiliado.Dispose();
                    dtAfiliadoPlan.Dispose();

                    // Enviar correo de confirmación
                    EnviarConfirmacion();

                }
                catch (Exception ex)
                {
                    MostrarAlerta("Error", "Ocurrió un error inesperado al realizar la verificación.", "error");
                    System.Diagnostics.Debug.WriteLine("Error en btnVerificar_Click: " + ex.ToString());
                }
            //}
            //else
            //{
            //    MostrarAlerta("Error", "Respuesta a la pregunta de validación incorrecta. Por favor, vuelve a intentar.", "error");
            //}
        }

        private void EnviarConfirmacion()
        {
            clasesglobales cg = new clasesglobales();

            string strAsunto = "Verificación realizada";
            string strRemitente = "sistemas@fitnesspeoplecmd.com";
            //string strDestinatario = ViewState["EmailAfiliado"].ToString();
            string strDestinatario = "chrislemoce@gmail.com";
            string strMensaje = "Haz realizado la verificación correctamente.\r\n\r\n" +
                "Ahora puedes ingresar al Área de Afiliados a través de la página web: fitnesspeoplecolombia.com\r\n" +
                "Clave: " + ViewState["ClaveAfiliado"].ToString() + " \r\n\r\n";

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