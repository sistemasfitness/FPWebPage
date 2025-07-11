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

                    ValidarAfiliadoWeb();

                    CargarDatosAfiliado(idAfiliado);
                    
                    ListaPreguntasParq(idAfiliado);
                }
                else
                {
                    Response.Redirect("default");
                }
            }
        }

        private void ValidarAfiliadoWeb()
        {
            string origenWeb = Request.QueryString["web"];
            ViewState["origenWeb"] = origenWeb;

            if (!string.IsNullOrEmpty(origenWeb) && origenWeb.ToLower() == "true")
            {
                id_parrafo.Visible = false;
                txbNombres.Enabled = false;
                txbApellidos.Enabled = false;
                txbCorreo.Enabled = false;
                txbCelular.Enabled = false;
            }
        }

        private void CargarDatosAfiliado(int idAfiliado)
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarAfiliadoPorId(idAfiliado);

            if (dt.Rows.Count > 0)
            {
                hfIdAfiliado.Value = dt.Rows[0]["IdAfiliado"].ToString();
                ViewState["idAfiliado"] = hfIdAfiliado.Value;
                txbNombres.Text = dt.Rows[0]["NombreAfiliado"].ToString();
                txbApellidos.Text = dt.Rows[0]["ApellidoAfiliado"].ToString();
                txbCorreo.Text = dt.Rows[0]["EmailAfiliado"].ToString();
                txbCelular.Text = dt.Rows[0]["CelularAfiliado"].ToString();
                ViewState["EmailAfiliado"] = dt.Rows[0]["EmailAfiliado"].ToString();
                ViewState["ClaveAfiliado"] = dt.Rows[0]["ClaveAfiliado"].ToString();
            }
        }

        private void ListaPreguntasParq(int idAfiliado)
        {
            clasesglobales cg = new clasesglobales();
            DataTable dt = cg.ConsultarPreguntasParQPorIdAfiliado(idAfiliado);

            if (dt.Rows.Count > 0)
            {
                rpParq.DataSource = dt;
                rpParq.DataBind();
                dt.Dispose();
            }
        }

        private void VerificarAfiliado()
        {
            //if (txbVerificacion.Text.ToString() == "4")
            //{
            //    try
            //    {
            //        clasesglobales cg = new clasesglobales();
            //        DataTable dt = cg.ConsultarAfiliadoPorId(int.Parse(ViewState["idAfiliado"].ToString()));

            //        if (string.IsNullOrEmpty(ViewState["origenWeb"].ToString()))
            //        {
            //            cg.ActualizarAfiliadoWeb(
            //                dt.Rows[0]["DocumentoAfiliado"].ToString(),
            //                txbNombres.Text, 
            //                txbApellidos.Text,
            //                txbCelular.Text, 
            //                txbCorreo.Text, 
            //                int.Parse(dt.Rows[0]["idGenero"].ToString()),
            //                dt.Rows[0]["FechaNacAfiliado"].ToString(), 
            //                int.Parse(dt.Rows[0]["idCiudad"].ToString()), 
            //                int.Parse(dt.Rows[0]["idSede"].ToString()), 
            //                "Activo"
            //            );
            //        }

            //        dt.Dispose();

            //        foreach (RepeaterItem item in rpParq.Items)
            //        {
            //            if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
            //            {
            //                CheckBox chbRespuesta = (CheckBox)item.FindControl("chbRespuesta");
            //                HiddenField hfidParqAfiliado = (HiddenField)item.FindControl("hfidParqAfiliado");
            //                if (chbRespuesta != null && chbRespuesta.Checked)
            //                {
            //                    // Aquí se puede acceder al valor del checkbox seleccionado
            //                    strQuery = "UPDATE ParqAfiliados SET Respuesta1Parq = 1 WHERE idParqAfiliado = " + hfidParqAfiliado.Value.ToString();

            //                    try
            //                    {
            //                        string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

            //                        using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
            //                        {
            //                            mysqlConexion.Open();
            //                            using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
            //                            {
            //                                cmd.CommandType = CommandType.Text;
            //                                cmd.ExecuteNonQuery();
            //                            }
            //                            mysqlConexion.Close();
            //                        }
            //                    }
            //                    catch (Exception ex)
            //                    {
            //                        string respuesta = "ERROR: " + ex.Message;
            //                    }
            //                }
            //            }
            //        }

            //        EnviarConfirmacion();

            //    }
            //    catch (Exception ex)
            //    {
            //        ltMensaje.Text = "<table class=\"table table-striped nomargin\"><tbody><tr>" +
            //            "<td class=\"total_confirm\">" + ex.Message + "</td></tr></tbody></table>";
            //    }
            //}
            //else
            //{
            //    ltMensaje.Text = "<table class=\"table table-striped nomargin\"><tbody><tr>" +
            //        "<td class=\"total_confirm\">Respuesta a la pregunta de validación incorrecta. Vuelve a intentar." +
            //        "</td></tr></tbody></table>";
            //}
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            //VerificarAfiliado();
        }

        private void EnviarConfirmacion()
        {
            //clasesglobales cg = new clasesglobales();

            //string strAsunto = "Verificación realizada";
            //string strRemitente = "sistemas@fitnesspeoplecmd.com";
            ////string strDestinatario = ViewState["EmailAfiliado"].ToString();
            //string strDestinatario = "chrislemoce@gmail.com";
            //string strMensaje = "Haz realizado la verificación correctamente.\r\n\r\n" +
            //    "Ahora puedes ingresar al Área de Afiliados a través de la página web: fitnesspeoplecolombia.com\r\n" +
            //    "Clave: " + ViewState["ClaveAfiliado"].ToString() + " \r\n\r\n";

            //cg.EnviarCorreo(strRemitente, strDestinatario, strAsunto, strMensaje);
        }
    }
}