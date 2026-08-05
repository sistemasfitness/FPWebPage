using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Npgsql;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Diagnostics;
//using static WebPage.reportepagosmulticanal;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;

namespace WebPage
{
    public class clasesglobales
    {
        #region Otros

        public DataTable CargarPlanesAfiliado(string idAfiliado, string Estado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_PLANES_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_estado", Estado);
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable TraerDatos(string strQuery)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string TraerDatosStr(string strQuery)
        {
            string respuesta = string.Empty;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand(strQuery, mysqlConexion))
                    {
                        mysqlConexion.Open();
                        cmd.CommandType = CommandType.Text;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            cmd.ExecuteNonQuery();
                            respuesta = "OK";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }
            return respuesta;
        }

        public string CreatePassword(int length)
        {
            const string valid = "abcdefghkmnpqrstuvwxyzABCDEFGHKMNPQRSTUVWXYZ123456789*%$_-@#&?";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                var unused = res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public void EnviarCorreo(string strRemitente, string strDestinatario, string strAsunto, string strMensaje)
        {
            MailMessage objeto_mail = new MailMessage();
            objeto_mail.From = new MailAddress(strRemitente);
            MailAddress maTo = new MailAddress(strDestinatario);
            objeto_mail.To.Add(maTo);
            objeto_mail.Subject = strAsunto;
            objeto_mail.Body = strMensaje;

            //SmtpClient client = new SmtpClient();
            //client.Host = "localhost";
            //client.Port = 25;
            //client.UseDefaultCredentials = false;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.Credentials = new System.Net.NetworkCredential("afiliaciones@fitnesspeoplecolombia.com", "i18Jo%5b3");

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); // o 465 con SSL
            client.EnableSsl = true; // o false si estás usando 465
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("sistemas@fitnesspeoplecmd.com", "rfhw romt jngp pmpo"); // Reemplaza con tu correo y contraseña de aplicación

            try
            {
                client.Send(objeto_mail);
                objeto_mail.Dispose();
            }
            catch (Exception ex)
            {
                string strError = ex.Message;
            }

        }

        public string[] EnviarPeticionGet(string url, string idempresa, out string mensaje)
        {
            string[] strConjuntoResultados = new string[2];
            string resultado = "";
            string resultadoj = "";
            string auth = string.Empty;
            DataTable dt = new DataTable();

            if (idempresa == "4")
            {
                dt = ConsultarUrl(Convert.ToInt32(idempresa));
                auth = dt.Rows[0]["urlServicioAd1"].ToString();
            }

            try
            {
                WebRequest oRequest = WebRequest.Create(url);
                oRequest.Method = "GET";
                oRequest.ContentType = "application/json;charset=UTF-8";
                oRequest.Headers.Add("Authorization", auth);

                WebResponse oResponse = oRequest.GetResponse();
                using (var oSr = new StreamReader(oResponse.GetResponseStream()))
                {
                    resultado = oSr.ReadToEnd().Trim();
                    strConjuntoResultados[0] = resultado;
                    JObject jsonObj = JObject.Parse(resultado);
                    if (jsonObj["message"] != null)
                    {
                        resultadoj = jsonObj["message"].ToString();
                    }
                    else
                    {
                        resultadoj = "";
                    }
                    strConjuntoResultados[1] = resultadoj;
                    mensaje = "Ok";
                }

                return strConjuntoResultados;
            }
            catch (Exception ex)
            {
                string jsonError = JsonConvert.SerializeObject(new { error = "Error al enviar la petición: " + ex.Message });
                mensaje = "error";
                strConjuntoResultados[0] = jsonError;
                return strConjuntoResultados;
            }
        }

        public string ComputeSha256Hash(string strData)
        {
            // Crea un SHA256
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - devuelve una matriz de bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(strData));

                // Convierte una matriz de bytes en una cadena
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }


        #endregion

        #region Ciudades
        public DataTable ConsultarCiudades()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCiudadesPorId(int codigoCiudad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad", codigoCiudad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCiudadesPorNombre(string nombreCiudad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDAD_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_ciudad", nombreCiudad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ValidarCiudadTablas(string idCiudad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_CIUDAD_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad", Convert.ToInt32(idCiudad));

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ValidarCiudadSedesTablas(string idCiudadSede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_CIUDAD_SEDES_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", Convert.ToInt32(idCiudadSede));

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarDepartamentos()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_DEPARTAMENTOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCiudadesCol()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES_COL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Profesiones
        public DataTable ConsultarProfesiones()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PROFESIONES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarProfesionPorNombre(string Profesion)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PROFESION_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_profesion", Profesion);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarProfesionPorId(int idProfesion)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PROFESION", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_profesion", idProfesion);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string ActualizarProfesion(int idProfesion, string Profesion, string Area)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PROFESION", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_profesion", idProfesion);
                        cmd.Parameters.AddWithValue("@p_profesion", Profesion);
                        cmd.Parameters.AddWithValue("@p_area", Area);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarProfesion(int idProfesion)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_PROFESION", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_profesion", idProfesion);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarProfesion(string Profesion, string Area)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PROFESION", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_profesion", Profesion);
                        cmd.Parameters.AddWithValue("@p_area", Area);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarProfesionTablas(int idProfesion)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_PROFESION_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_profesion", idProfesion);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Eps
        public DataTable ConsultarEpss()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_EPSS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarEpsPorNombre(string nombreEps)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_EPS_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_eps", nombreEps);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarEpsPorId(int idEps)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_EPS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_eps", idEps);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string ActualizarEps(int idEps, string nombreEps)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_EPS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_nombre_eps", nombreEps);
                        cmd.Parameters.AddWithValue("@p_id_eps", idEps);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarEps(int idEps)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_EPS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_eps", idEps);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarEps(string nombreEps)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_EPS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_eps", nombreEps);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarEpsTablas(int idEps)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_EPS_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_eps", idEps);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Paginas

        public string InsertarPagina(string Pagina, string Aspx, int idCategoria)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PAGINA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_pagina", Pagina);
                        cmd.Parameters.AddWithValue("@p_pagina_aspx", Aspx);
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ConsultarUltimaPagina()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ULTIMA_PAGINA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public string ActualizarPagina(int idPagina, string nombrePagina, string nombreAspx, int idCategoria)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PAGINA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_nombre_pagina", nombrePagina);
                        cmd.Parameters.AddWithValue("@p_pagina_aspx", nombreAspx);
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);
                        cmd.Parameters.AddWithValue("@p_id_pagina", idPagina);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ConsultarPaginaPorNombre(string nombre_pagina)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGINA_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_pagina", nombre_pagina);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarPaginas()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGINAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarPaginaPorId(int idPagina)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGINA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_pagina", idPagina);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string EliminarPagina(int idPagina)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_PAGINA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_pagina", idPagina);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

        #region Categorias Paginas

        public DataTable ConsultarCategoriasPaginas()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CATEGORIAS_PAGINAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        #endregion

        #region Ciudades sedes

        public DataTable ConsultarCiudadesSedes()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES_SEDES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarCiudadSedePorId(int idCiudadSede)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUD_SEDE_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCiudadSedePorIdSede(int idSede)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES_SEDES_POR_ID_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarCiudadSede(string nombreCiudadSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_CIUDAD_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_ciu_sede", nombreCiudadSede);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarCiudadSede(int idCiudadSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_CIUDAD_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarCiudadSede(int idCiudadSede, string nombreCiudadSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_CIUDAD_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);
                        cmd.Parameters.AddWithValue("@p_nombre_ciudad_sede", nombreCiudadSede);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }
            return respuesta;
        }

        public DataTable ConsultarCiudadSedePorNombre(string nombreCiudadSede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUD_SEDE_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_ciudad_sede", nombreCiudadSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        #endregion

        #region Sedes

        public DataTable ConsultarSedes()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarSedesWeb()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarSedesCiudadesWeb()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES_CIUDADES_SEDES_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarSedePorId(int idSede)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarSedePorNombre(string nombreSede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_sede", nombreSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultaCargarSedesPorId(int? idSede, string p_clase_sede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CARGAR_SEDES_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede.HasValue ? idSede.Value : (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@p_clase_sede", p_clase_sede);// Gimnasio / Oficina / Todos 

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultaCargarSedes(string p_clase_sede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CARGAR_SEDES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_clase_sede", p_clase_sede);// Gimnasio / Oficina / Todos 

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public string InsertarSede(string nombreSede, string direccionSede, int idCiudadSede, string telefonoSede, string horarioSede, string googleMaps, string tipoSede, string claseSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_sede", nombreSede);
                        cmd.Parameters.AddWithValue("@p_direccion_sede", direccionSede);
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);
                        cmd.Parameters.AddWithValue("@p_telefono_sede", telefonoSede);
                        cmd.Parameters.AddWithValue("@p_horario_sede", horarioSede);
                        cmd.Parameters.AddWithValue("@p_google_maps", googleMaps);
                        cmd.Parameters.AddWithValue("@p_tipo_sede", tipoSede);
                        cmd.Parameters.AddWithValue("@p_clase_sede", claseSede);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarSede(int idSede, string nombreSede, string direccionSede, int idCiudadSede, string telefonoSede, string horarioSede, string tipoSede, string claseSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.Parameters.AddWithValue("@p_nombre_sede", nombreSede);
                        cmd.Parameters.AddWithValue("@p_direccion_sede", direccionSede);
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);
                        cmd.Parameters.AddWithValue("@p_telefono_sede", telefonoSede);
                        cmd.Parameters.AddWithValue("@p_horario_sede", horarioSede);
                        cmd.Parameters.AddWithValue("@p_tipo_sede", tipoSede);
                        cmd.Parameters.AddWithValue("@p_clase_sede", claseSede);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }
            return respuesta;
        }

        public string EliminarSede(int idSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }


        #endregion

        #region Tipos de documento

        public DataTable ConsultartiposDocumento()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPOS_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultartiposDocumentoPorId(int idTipoDocumento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPO_DOC_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_doc", idTipoDocumento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarTiposDocumentoPorNombre(string nombreTipoDocumento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPO_DOC_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_tipo_documento", nombreTipoDocumento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }
        public string InsertarTipoDocumento(string tipoDocumento, string siglaDocumento)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_TIPO_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_tipo_documento", tipoDocumento);
                        cmd.Parameters.AddWithValue("@p_sigla_documento", siglaDocumento);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarTipoDocumento(int idTipoDocumento, string tipoDocumento, string sigladocumento)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_TIPO_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_tipo_documento", idTipoDocumento);
                        cmd.Parameters.AddWithValue("@p_tipo_documento", tipoDocumento);
                        cmd.Parameters.AddWithValue("@p_sigla_documento", sigladocumento);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarTipoDocumento(int idTipoDocumento)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_TIPO_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_documento", idTipoDocumento);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarTiposDocumentoTablas(int idTipoDocumento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_TIPO_DOCUMENTO_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_documento", idTipoDocumento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Genero

        public DataTable ConsultarGeneros()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GENEROS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarGeneroPorId(int idGenero)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GENERO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_genero", idGenero);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarGenerosPorNombre(string genero)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GENERO_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_genero", genero);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarGenero(string genero)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_GENERO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_genero", genero);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarGenero(int idGenero)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_GENERO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_genero", idGenero);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarGeneroTablas(string idGenero)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_GENERO_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_genero", Convert.ToInt32(idGenero));

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string ActualizarGenero(int idGenero, string genero)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_GENERO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_genero", idGenero);
                        cmd.Parameters.AddWithValue("@p_genero", genero);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

        #region Estado civil

        public DataTable ConsultarEstadosCiviles()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ESTADOS_CIVILES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarEstadoCivilPorId(int idEstadoCivil)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ESTADO_CIVIL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_estado_civil", idEstadoCivil);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarEstadoCivilPorNombre(string estadoCivil)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ESTADO_CIVIL_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p__estado_civil", estadoCivil);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarEstadoCivil(string estadoCivil)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_ESTADO_CIVIL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_estado_civil", estadoCivil);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarEstadoCivil(int idEstadoCivil, string estadoCivil)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_ESTADO_CIVIL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_estado_civil", idEstadoCivil);
                        cmd.Parameters.AddWithValue("@p_estado_civil", estadoCivil);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarEstadoCivil(int idEstadoCivil)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_ESTADO_CIVIL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_estado_civil", idEstadoCivil);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarEstadoCivilTablas(string idEstadoCivil)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_ESTADO_CIVIL_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_estado_civil", Convert.ToInt32(idEstadoCivil));

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Objetivos del afiliado

        public DataTable ConsultarObjetivosAfiliados()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_OBJETIVOS_AFILIADOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarObjetivoAfiliadoPorId(int idObjetivoAfiliadol)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_OBJETIVO_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_objetivo", idObjetivoAfiliadol);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarObjetivoAfiliadoPorNombre(string objetivo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_OBJETIVO_AFILIADO_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_objetivo", objetivo);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarObjetivoAfiliado(string objetivo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_OBJETIVO_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_objetivo", objetivo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarObjetivoAfiliado(int idObjetivo, string objetivo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_OBJETIVO_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_objetivo", idObjetivo);
                        cmd.Parameters.AddWithValue("@p_objetivo", objetivo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarObjetivoAfiliado(int idObjetivoAfiliado)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_OBJETIVO_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_objetivo", idObjetivoAfiliado);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarObjetivoAfiliadoTablas(string idObjetivo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_OBJETIVO_AFILIADO_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_objetivo", Convert.ToInt32(idObjetivo));

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Preguntas ParQ

        public DataTable ConsultarPreguntasParq()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PREGUNTAS_PARQ", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPreguntaParQPorId(int idParq)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PREGUNTA_PARQ", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_parq", idParq);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPreguntaParQPorNombre(string preguntaParq)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PREGUNTA_PARQ_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_pregunta_parq", preguntaParq);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPreguntasParQPorEstado(string estado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PREGUNTAS_PARQ_POR_ESTADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_estado", estado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPreguntasParQPorIdAfiliado(int idAfiliado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PREGUNTAS_PARQ_POR_ID_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarPreguntaParQ(string preguntaParQ, out int _idParQ)
        {
            string respuesta = string.Empty;
            _idParQ = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PREGUNTA_PARQ", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_pregunta_parq", preguntaParQ);

                        // Parámetro de salida
                        MySqlParameter idParQ = new MySqlParameter("@p_pregunta_id", MySqlDbType.Int32);
                        idParQ.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(idParQ);

                        cmd.ExecuteNonQuery();
                        _idParQ = Convert.ToInt32(idParQ.Value);

                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPreguntaParQ(int idParQ, string preguntaParQ, string estadoParQ, int orden)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PREGUNTA_PARQ", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_parq", idParQ);
                        cmd.Parameters.AddWithValue("@p_pregunta_parq", preguntaParQ);
                        cmd.Parameters.AddWithValue("@p_estado_parq", estadoParQ);
                        cmd.Parameters.AddWithValue("@p_orden", orden);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarPreguntaParQ(int idParQ)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_PREGUNTA_PARQ", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_parq", idParQ);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarPreguntaParQTablas(int idparQ)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_PREGUNTAS_PARQ_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_parq", idparQ);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Tipos de Incapacidad

        public DataTable ConsultarTiposIncapacidades()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPOS_INCAPACIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarTipoIncapacidadPorId(int idTipoIncapacidad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPO_INCAPACIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_incapacidad", idTipoIncapacidad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarTipoIncapacidadPorNombre(string tipoIncapacidad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TIPO_INCAPACIDAD_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_tipo_incapacidad", tipoIncapacidad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarTipoIncapacidad(string tipoIncapacidad)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_TIPO_INCAPACIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_tipo_incapacidad", tipoIncapacidad);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarTipoIncapacidad(int idTipoIncapacidad, string tipoIncapacidad)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_TIPO_INCAPACIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_tipo_incapacidad", idTipoIncapacidad);
                        cmd.Parameters.AddWithValue("@p_tipo_incapacidad", tipoIncapacidad);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarTipoIncapacidad(int idTipoIncapacidad)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_TIPO_INCAPACIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_incapacidad", idTipoIncapacidad);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarTipoIncapacidadTablas(int idTipoIncapacidad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_TIPO_INCAPACIDAD_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_incapacidad", idTipoIncapacidad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        #endregion

        #region Reportes

        public DataTable ConsultarPagosPlanAfiliados()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_PLAN_AFILIADOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        //public DataTable ConsultarPagosRecientes()
        //{
        //    DataTable dt = new DataTable();

        //    try
        //    {
        //        string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
        //        using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
        //        {
        //            using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_RECIENTES", mysqlConexion))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
        //                {
        //                    mysqlConexion.Open();
        //                    dataAdapter.Fill(dt);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        dt = new DataTable();
        //        dt.Columns.Add("Error", typeof(string));
        //        dt.Rows.Add(ex.Message);
        //    }

        //    return dt;
        //}

        public DataTable ConsultarPagosRecientes(out decimal valorTotal, out int totalRegistros)
        {
            DataTable dt = new DataTable();
            valorTotal = 0;
            totalRegistros = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_RECIENTES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        MySqlParameter ValorTotal = new MySqlParameter("@p_total_valor", MySqlDbType.Decimal);
                        MySqlParameter TotalRegistros = new MySqlParameter("@v_total_registros", MySqlDbType.Int32);

                        ValorTotal.Direction = ParameterDirection.Output;
                        TotalRegistros.Direction = ParameterDirection.Output;

                        cmd.Parameters.Add(ValorTotal);
                        cmd.Parameters.Add(TotalRegistros);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);

                            if (ValorTotal.Value != DBNull.Value)
                            {
                                valorTotal = Convert.ToDecimal(ValorTotal.Value);
                            }
                            if (TotalRegistros.Value != DBNull.Value)
                            {
                                totalRegistros = Convert.ToInt32(TotalRegistros.Value);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPagosRecientes()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_RECIENTES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        public DataTable ConsultarPagosPorId(int idAfiliadoPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_TRANSAC_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_pago", idAfiliadoPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPagosPorTipo(string tipoPago, string fechaIni, string fechaFin, out decimal valorTotal)
        {
            DataTable dt = new DataTable();
            valorTotal = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGOS_POR_TIPO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_tipo_pago", tipoPago);
                        cmd.Parameters.AddWithValue("@p_fecha_ini", fechaIni);
                        cmd.Parameters.AddWithValue("@p_fecha_fin", fechaFin);

                        // Parámetro de salida
                        MySqlParameter ValorTotal = new MySqlParameter("@p_total_valor", MySqlDbType.Decimal);
                        ValorTotal.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(ValorTotal);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);

                            if (ValorTotal.Value != DBNull.Value)
                            {
                                valorTotal = Convert.ToDecimal(ValorTotal.Value);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPagosTransaccWompi(string fechaIni, string fechaFin, out decimal valorTotal)
        {
            DataTable dt = new DataTable();
            valorTotal = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TRANSAC_WOMPI", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_fecha_ini", fechaIni);
                        cmd.Parameters.AddWithValue("@p_fecha_fin", fechaFin);
                        // Parámetro de salida
                        MySqlParameter ValorTotal = new MySqlParameter("@p_total_sum", MySqlDbType.Decimal);
                        ValorTotal.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(ValorTotal);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);

                            if (ValorTotal.Value != DBNull.Value)
                            {
                                valorTotal = Convert.ToDecimal(ValorTotal.Value);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        public DataTable ConsultarUrl(int idIntegracion)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_URL", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_integracion", idIntegracion);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable InsertarYObtenerTransaccionesWompi(string json)
        {
            DataTable dataTable = new DataTable();
            try
            {
                var data = JsonConvert.DeserializeObject<Root>(json);
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection conn = new MySqlConnection(strConexion))
                {
                    conn.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_DATOS_JSON_WOMPI", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        foreach (var item in data.data)
                        {
                            cmd.Parameters.Clear();


                            //Validación de fecha/hora ss
                            DateTime createdAt, finalizedAt;

                            string normalizedCreatedAt = NormalizeDate(item.created_at);
                            string normalizedFinalizedAt = NormalizeDate(item.finalized_at);

                            bool createdAtValid = DateTime.TryParseExact(normalizedCreatedAt,
                                "yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal, out createdAt);

                            bool finalizedAtValid = DateTime.TryParseExact(normalizedFinalizedAt,
                                "yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal, out finalizedAt);

                            cmd.Parameters.AddWithValue("@p_id", item.id);
                            cmd.Parameters.AddWithValue("@p_created_at", createdAtValid ? (object)createdAt : DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_finalized_at", finalizedAtValid ? (object)finalizedAt : DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_amount_in_cents", item.amount_in_cents);
                            cmd.Parameters.AddWithValue("@p_reference", item.reference);
                            cmd.Parameters.AddWithValue("@p_customer_email", item.customer_email);
                            cmd.Parameters.AddWithValue("@p_currency", item.currency);
                            cmd.Parameters.AddWithValue("@p_payment_method_type", item.payment_method_type);
                            cmd.Parameters.AddWithValue("@p_status", item.status);
                            cmd.Parameters.AddWithValue("@p_status_message", (object)item.status_message ?? DBNull.Value);

                            cmd.Parameters.AddWithValue("@p_device_id", string.IsNullOrEmpty(item.customer_data?.device_id) ? DBNull.Value : (object)item.customer_data.device_id);
                            cmd.Parameters.AddWithValue("@p_full_name", string.IsNullOrEmpty(item.customer_data?.full_name) ? DBNull.Value : (object)item.customer_data.full_name);
                            cmd.Parameters.AddWithValue("@p_phone_number", string.IsNullOrEmpty(item.customer_data?.phone_number) ? DBNull.Value : (object)item.customer_data.phone_number);

                            var extra = item.payment_method?.extra;
                            cmd.Parameters.AddWithValue("@p_card_bin", extra?.bin ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_name", extra?.name ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_brand", extra?.brand ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_exp_year", extra?.exp_year ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_exp_month", extra?.exp_month ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_last_four", extra?.last_four ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_holder", extra?.card_holder ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_card_type", extra?.card_type ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_is_three_ds", extra?.is_three_ds ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_three_ds_step", extra?.three_ds_auth?.three_ds_auth?.current_step ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_three_ds_status", extra?.three_ds_auth?.three_ds_auth?.current_step_status ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_external_identifier", extra?.external_identifier ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@p_processor_response_code", extra?.processor_response_code ?? (object)DBNull.Value);

                            using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                            {
                                adapter.Fill(dataTable);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR: " + ex.Message);
            }

            return dataTable;
        }

        string NormalizeDate(string date)
        {
            if (string.IsNullOrEmpty(date))
                return date;

            // Eliminar la 'Z' si está presente y recortar milisegundos si existen
            int dotIndex = date.IndexOf('.');
            if (dotIndex > 0)
            {
                date = date.Substring(0, dotIndex); // Recortar desde el punto en adelante
            }
            else if (date.EndsWith("Z"))
            {
                date = date.TrimEnd('Z'); // Si no tiene milisegundos pero tiene 'Z', la quitamos
            }

            return date;
        }

        #endregion

        #region Planes

        public DataTable ConsultarPlanes()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PLANES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPlanPorId(int idPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ValidarPlanAfiliados(int idPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_PLAN_AFILIADOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPlanPorNombre(string NombrePlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PLAN_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_plan", NombrePlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarPlan(string nombrePlan, string descripcionPlan, int precio, int precioTotal, int mesesMaximo,
            int idUsuario, double Dias, string fechaInicio, string fechaFinal, int permanente, string tituloPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_plan", nombrePlan);
                        cmd.Parameters.AddWithValue("@p_descripcion_plan", descripcionPlan);
                        cmd.Parameters.AddWithValue("@p_precio_base", precio);
                        cmd.Parameters.AddWithValue("@p_precio_total", precioTotal);
                        cmd.Parameters.AddWithValue("@p_meses_maximo", mesesMaximo);
                        //cmd.Parameters.AddWithValue("@p_color_plan", color);
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);
                        cmd.Parameters.AddWithValue("@p_dias_congelamiento", Dias);
                        cmd.Parameters.AddWithValue("@p_fecha_inicial", fechaInicio);
                        cmd.Parameters.AddWithValue("@p_fecha_final", fechaFinal);
                        cmd.Parameters.AddWithValue("@p_permanente", permanente);
                        cmd.Parameters.AddWithValue("@p_titulo_plan", tituloPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPlan(int idPlan, string nombrePlan, string descripcionPlan, int precio, int precioTotal, int mesesMaximo,
            double Dias, string fechaInicio, string fechaFinal, int permanente, string tituloPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);
                        cmd.Parameters.AddWithValue("@p_nombre_plan", nombrePlan);
                        cmd.Parameters.AddWithValue("@p_descripcion_plan", descripcionPlan);
                        cmd.Parameters.AddWithValue("@p_precio_base", precio);
                        cmd.Parameters.AddWithValue("@p_precio_total", precioTotal);
                        cmd.Parameters.AddWithValue("@p_meses_maximo", mesesMaximo);
                        //cmd.Parameters.AddWithValue("@p_color_plan", color);
                        cmd.Parameters.AddWithValue("@p_dias_congelamiento", Dias);
                        cmd.Parameters.AddWithValue("@p_fecha_inicial", fechaInicio);
                        cmd.Parameters.AddWithValue("@p_fecha_final", fechaFinal);
                        cmd.Parameters.AddWithValue("@p_permanente", permanente);
                        cmd.Parameters.AddWithValue("@p_titulo_plan", tituloPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarPlan(int idPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

        #region Agenda

        public DataTable ConsultaCargarAgenda(int idSede)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_AGENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultaCargarAgendaPorSedePorEspecialidad(int idSede, int idEspecialidad)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_AGENDA_POR_SEDE_POR_ESPECIALIDAD", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.Parameters.AddWithValue("@p_id_especialidad", idEspecialidad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultaCargarAgendaPorSedePorEspecialista(int idSede, int idEspecialista)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_AGENDA_POR_SEDE_POR_ESPECIALISTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.Parameters.AddWithValue("@p_id_especialista", idEspecialista);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultaCargarAgendaPorEspecialista(int idUsuario)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_AGENDA_ESPECIALISTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultaCargarEspecialistas()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_ESPECIALISTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Congelaciones

        public DataTable ConsultaCargarCongelaciones(int idAfiliado)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CARGAR_CONGELACIONES", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        #endregion

        #region Canales de venta

        public DataTable ConsultarCanalesVenta()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CANALES_VENTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCanalesVentaPorId(int idCanalVenta)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CANALES_VENTA_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCanalesVentaPorNombre(string nombreCanalVenta)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CANALES_VENTA_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_canal_venta", nombreCanalVenta);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCanalesVentaSedePorId(int idSede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CANALES_VENTA_SEDES_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarCanalVenta(string nombreCanalVenta)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_CANAL_VENTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_canal_venta", nombreCanalVenta);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarCanalVenta(int idCanalVEnta, string nombreCanalVenta)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_CANAL_VENTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVEnta);
                        cmd.Parameters.AddWithValue("@p_nombre_canal_venta", nombreCanalVenta);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarCanalVenta(int idCanalVenta)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_CANAL_VENTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarCanalVentaTablas(int idCanalVenta)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_CANAL_VENTA_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        #endregion

        #region Cargos


        public DataTable ConsultarCargos()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CARGOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCargosPorId(int idCargo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CARGOS_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_cargo", idCargo);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCargoPorNombre(string nombreCargo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CARGOS_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p__estado_civil", nombreCargo);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarCargo(string nombreCargo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_CARGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_cargo", nombreCargo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarCargo(int idCargo, string nombreCargo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_CARGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_cargo", idCargo);
                        cmd.Parameters.AddWithValue("@p_nombre_cargo", nombreCargo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarCargo(int idCargo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_CARGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_cargo", idCargo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarCargoTablas(int idCargo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_CARGOS_TABLAS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_cargo", idCargo);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        #endregion

        #region Categorias tienda
        public DataTable ConsultarCategorias()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CATEGORIAS_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCategoriaPorNombre(string nombreCategoria)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CATEGORIAS_TIENDA_POR_NOMBRE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_categoria", nombreCategoria);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCategoriaPorId(int idCategoria)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CATEGORIA_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string ActualizarCategoria(int idCategoria, string nombreCategoria)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_CATEGORIA_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_nombre_categoria", nombreCategoria);
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarCategoria(int idCategoria)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_CATEGORIA_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarCategoria(string nombreCategoria)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_CATEGORIA_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombre_categoria", nombreCategoria);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ValidarCategoriaTienda(int idCategoria)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_VALIDAR_CATEGORIA_TIENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_categoria", idCategoria);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }


        #endregion

        #region GymPass

        public DataTable ConsultarGymPass()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarGymPassPorId(int idGymPass)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_gym_pass", idGymPass);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarGymPassPorDocumento(string nroDocumento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_doc_gym_pass", nroDocumento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public string InsertarGymPass( string nombres, string apellidos, string documento, string correo, string telefono, int idSede, string fechaAsistencia)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_GYM_PASS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombres", nombres);
                        cmd.Parameters.AddWithValue("@p_apellidos", apellidos);
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_correo", correo);
                        cmd.Parameters.AddWithValue("@p_telefono", telefono);
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.Parameters.AddWithValue("@p_fecha_asistencia", fechaAsistencia);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

        #region GymPass Agenda

        public DataTable ConsultarGymPassAgendaPorId(int idGymPass)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_gym_pass", idGymPass);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarGymPassAgendaPorDocumento(string nroDocumento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_doc_gym_pass", nroDocumento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarGymPassAgendaPorSede(int idSede)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA_POR_SEDE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarGymPassAgendaPorEstado(string estado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA_POR_ESTADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_estado", estado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarGymPassAgenda(int? idSede, string estado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede.HasValue ? idSede.Value : (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@p_estado", string.IsNullOrEmpty(estado) ? (object)DBNull.Value : estado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarEstadosGymPassAgenda()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_GYM_PASS_AGENDA_ESTADOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable EliminarGymPassAgenda(int idAgenda)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_AGENDA_GYM_PASS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_agenda_gym_pass", idAgenda);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        #endregion

        #region Afiliados

        public DataTable ConsultarAfiliadoPorId(int idAfiliado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_AFILIADO_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarAfiliadoPorDocumento(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_AFILIADO_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public string EliminarAfiliado(int idAfiliado, string estado)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_estado", estado);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ConsultarAfiliadoPlanPorId(int idAfiliadoPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_AFILIADO_PLAN_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        #endregion

        #region Pagos Plan Afiliado

        public string InsertarPagoPlanAfiliado(int idAfiliadoPlan, int valor, string tipoPago, string idReferencia, string banco, string estado, int idCanalVenta)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PAGO_PLAN_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_valor", valor);
                        cmd.Parameters.AddWithValue("@p_tipo_pago", tipoPago);
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);
                        cmd.Parameters.AddWithValue("@p_banco", banco);
                        //cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);
                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPagoPlanAfiliadoFuentePago(string idDataFuente, int idAfiliadoPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PAGO_PLAN_AFILIADO_FUENTE_PAGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_data_fuente", idDataFuente);
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPagoPlanAfiliadoTransaccion(string idDataTransaccion, int idAfiliadoPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PAGO_PLAN_AFILIADO_TRANSACCION", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_data_transaction", idDataTransaccion);
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

        #region Usuarios

        public DataTable ConsultarUsuarioEmpleadoPorId(int idUsuario)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_USUARIO_EMPLEADO_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        #endregion

        #region Web

        public DataTable ConsultarCiudadesSedesWeb()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES_SEDES_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarSedesPorIdCiudadWeb(int idCiudad)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_SEDES_POR_ID_CIUDAD_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudad);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarVendedorPorId(int idUsuario)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_VENDEDOR_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarAfiliadoWeb(string documento, int idTipoDocumento, string nombres, string apellidos, string celular, string correo, int idGenero, string fechaNac, int idSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_AFILIADO_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_id_tipo_documento", idTipoDocumento);
                        cmd.Parameters.AddWithValue("@p_nombres", nombres);
                        cmd.Parameters.AddWithValue("@p_apellidos", apellidos);
                        cmd.Parameters.AddWithValue("@p_celular", celular);
                        cmd.Parameters.AddWithValue("@p_correo", correo);
                        cmd.Parameters.AddWithValue("@p_id_genero", idGenero);
                        cmd.Parameters.AddWithValue("@p_fecha_nac", fechaNac);
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarAfiliadoWeb(string documento, string nombres, string apellidos, string celular, string correo, string direccion, string fechaNac, string responsable, string parentesco, string celularcontacto, string estado, string observacionesparq)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_AFILIADO_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_nombres", nombres);
                        cmd.Parameters.AddWithValue("@p_apellidos", apellidos);
                        cmd.Parameters.AddWithValue("@p_celular", celular);
                        cmd.Parameters.AddWithValue("@p_correo", correo);
                        cmd.Parameters.AddWithValue("@p_direccion", direccion);
                        cmd.Parameters.AddWithValue("@p_fecha_nac", fechaNac);
                        cmd.Parameters.AddWithValue("@p_responsable", responsable);
                        cmd.Parameters.AddWithValue("@p_parentesco", parentesco);
                        cmd.Parameters.AddWithValue("@p_celular_contacto", celularcontacto);
                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_observaciones_parq", observacionesparq);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarAfiliadoRegister(string documento, string nombres, string apellidos, string celular, string correo, int idGenero, string fechaNac, int idSede, string estado)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_AFILIADO_WEB_REGISTER", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_nombres", nombres);
                        cmd.Parameters.AddWithValue("@p_apellidos", apellidos);
                        cmd.Parameters.AddWithValue("@p_celular", celular);
                        cmd.Parameters.AddWithValue("@p_correo", correo);
                        cmd.Parameters.AddWithValue("@p_id_genero", idGenero);
                        cmd.Parameters.AddWithValue("@p_fecha_nac", fechaNac);
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarEstadoAfiliado(string estado, int idAfiliado)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_ESTADO_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarDataTokenPorDataIdFuente(string idFuente, string idToken)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_TOKEN_POR_ID_FUENTE", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_data_id_fuente", idFuente);
                        cmd.Parameters.AddWithValue("@p_data_id_token", idToken);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public DataTable ConsultarPlanesWeb()
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PLANES_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPlanWebPorId(int idPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PLAN_WEB_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarPlanPromocionPorId(int idPlan)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PROMOCION_PLAN_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarIdAfiliadoPlanPorIdAfiliado(int idAfiliado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ID_AFILIADO_PLAN_POR_ID_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarPagoPorReferenciaPendienteWeb(string referencia)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGO_POR_REFERENCIA_PENDIENTE_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_referencia", referencia);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarFechaFinPlanPorDocumento(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_FECHA_FIN_PLAN_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public DataTable ConsultarPagoPorReferencia(string idReferencia)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_PAGO_POR_REFERENCIA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        public int InsertarAfiliadoPlanYDevolverId(int idAfiliado, int idPlan, string fechaInicioPlan, string fechaFinalPlan, int meses, int valor, string observaciones, string estado)
        {
            int idAfiliadoPlan = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_AFILIADO_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);
                        cmd.Parameters.AddWithValue("@p_fecha_inicio", fechaInicioPlan);
                        cmd.Parameters.AddWithValue("@p_fecha_fin", fechaFinalPlan);
                        cmd.Parameters.AddWithValue("@p_meses", meses);
                        cmd.Parameters.AddWithValue("@p_valor", valor);
                        cmd.Parameters.AddWithValue("@p_observaciones", observaciones);
                        cmd.Parameters.AddWithValue("@p_estado", estado);

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                idAfiliadoPlan = Convert.ToInt32(reader["idAfiliadoPlan"]);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en InsertarAfiliadoPlan: " + ex.Message);
                idAfiliadoPlan = -1; // -1 indica error
            }

            return idAfiliadoPlan;
        }

        public int InsertarPagoPlanAfiliadoWebYDevolverId(int idAfiliadoPlan, int valor, int idMedioPago, string idReferencia, string banco, int idUsuario, string estado, string idSiigoFactura, int idCanalVenta, string idDataToken, string idDataFuente, string idDataTransaccion, string codDatafono, string idTransaccionRRN, string numFacturaDatafono)
        {
            int idPago = 0;

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PAGO_PLAN_AFILIADO_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_valor", valor);
                        cmd.Parameters.AddWithValue("@p_id_medio_pago", idMedioPago);
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);
                        cmd.Parameters.AddWithValue("@p_banco", banco);
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);
                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_id_siigo_factura", idSiigoFactura);
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);
                        cmd.Parameters.AddWithValue("@p_id_data_token", idDataToken);
                        cmd.Parameters.AddWithValue("@p_id_data_fuente", idDataFuente);
                        cmd.Parameters.AddWithValue("@p_id_data_transaction", idDataTransaccion);
                        cmd.Parameters.AddWithValue("@p_cod_datafono", codDatafono);
                        cmd.Parameters.AddWithValue("@p_id_transaccion_RRN", idTransaccionRRN);
                        cmd.Parameters.AddWithValue("@p_num_recibo_datafono", numFacturaDatafono);

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                idPago = Convert.ToInt32(reader["idPago"]);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en InsertarAfiliadoPlan: " + ex.Message);
                idPago = -1; // -1 indica error
            }

            return idPago;
        }

        public string InsertarPagoPlanAfiliadoWeb(int idAfiliadoPlan, int valor, int idMedioPago, string idReferencia, string banco, int idUsuario, string estado, string idSiigoFactura, string idDataToken, string idDataFuente, string idDataTransaccion, string codDatafono, string idTransaccionRRN, string numFacturaDatafono)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PAGO_PLAN_AFILIADO_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_valor", valor);
                        cmd.Parameters.AddWithValue("@p_id_medio_pago", idMedioPago);
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);
                        cmd.Parameters.AddWithValue("@p_banco", banco);
                        cmd.Parameters.AddWithValue("@p_id_usuario", idUsuario);
                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_id_siigo_factura", idSiigoFactura);
                        cmd.Parameters.AddWithValue("@p_id_data_token", idDataToken);
                        cmd.Parameters.AddWithValue("@p_id_data_fuente", idDataFuente);
                        cmd.Parameters.AddWithValue("@p_id_data_transaction", idDataTransaccion);
                        cmd.Parameters.AddWithValue("@p_cod_datafono", codDatafono);
                        cmd.Parameters.AddWithValue("@p_id_transaccion_RRN", idTransaccionRRN);
                        cmd.Parameters.AddWithValue("@p_num_recibo_datafono", numFacturaDatafono);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPagoPlanAfiliadoTarjeta(int idPago, string nombreTarjeta, string numeroTarjeta, string fechaExpTarjeta, string codigoSegTarjeta)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("PA_ACTUALIZAR_PAGO_PLAN_AFILIADO_TARJETA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_pago", idPago);
                        cmd.Parameters.AddWithValue("@p_nombre_tarjeta", nombreTarjeta);
                        cmd.Parameters.AddWithValue("@p_numero_tarjeta", numeroTarjeta);
                        cmd.Parameters.AddWithValue("@p_fecha_exp_tarjeta", fechaExpTarjeta);
                        cmd.Parameters.AddWithValue("@p_cod_seg_tarjeta", codigoSegTarjeta);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarEstadoAfiliadoPlan(string estado, int idAfiliado, int idAfiliadoPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_ESTADO_AFILIADO_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@p_estado", estado);
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarPagoGrupoAfiliadoPlan(int idAfiliadoPlan, int idPagoGrupo)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_PAGO_GRUPO_AFILIADO_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_id_pago_grupo", idPagoGrupo);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarPagoPlanAfiliadoPendienteWeb(int idAfiliado, string documentoAfiliado, int idPlan, string fechaInicioPlan, string fechaFinPlan, string estadoPago, int valorPlan, int mesesPlan, string descripcionPlan, string idReferencia, int idVendedor, int idSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_PAGOS_PLAN_AFILIADO_PENDIENTE_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", documentoAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);
                        cmd.Parameters.AddWithValue("@p_fecha_inicio_plan", fechaInicioPlan);
                        cmd.Parameters.AddWithValue("@p_fecha_final_plan", fechaFinPlan);
                        cmd.Parameters.AddWithValue("@p_estado_pago", estadoPago);
                        cmd.Parameters.AddWithValue("@p_valor_plan", valorPlan);
                        cmd.Parameters.AddWithValue("@p_meses_plan", mesesPlan);
                        cmd.Parameters.AddWithValue("@p_descripcion_plan", descripcionPlan);
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);
                        cmd.Parameters.AddWithValue("@p_id_vendedor", idVendedor);
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarEstadoPagoPlanAfiliadoPendienteWeb(string documentoAfiliado, string idReferencia, string estadoPago)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_ESTADO_PAGOS_PLAN_AFILIADO_PENDIENTE_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", documentoAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);
                        cmd.Parameters.AddWithValue("@p_estado_pago", estadoPago);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarRegistroPagoPlanAfiliadoPendienteWeb(string idReferencia)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_PAGO_PLAN_AFILIADO_PENDIENTE_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_referencia", idReferencia);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string ActualizarIdSiigoFacturaDePagoPlanAfiliado(int idPago, string idSiigoFactura)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_ID_SIIGO_FACTURA_DE_PAGO_PLAN_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_pago", idPago);
                        cmd.Parameters.AddWithValue("@p_id_siigo_factura", idSiigoFactura);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarRespuestasDePreguntasParQPorIdAfiliadoWeb(int idParQ, int idAfiliado, int idAfiliadoPlan, int respuestaParQ)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_RESPUESTAS_DE_PREGUNTAS_PARQ_POR_ID_AFILIADO_WEB", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_parq", idParQ);
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_respuesta", respuestaParQ);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

		// Estudiafit
        public DataTable ConsultarEstudiafitPorDocumento(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ESTUDIAFIT_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarEstudiafitUniPorCodigo(string codigo)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ESTUDIAFIT_UNI_POR_CODIGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_cod_estudiafit_uni", codigo);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarEstudiafit(string documento, int idUni, string carnetEstudiantil)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_ESTUDIAFIT", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_id_estudiafit_uni", idUni);
                        cmd.Parameters.AddWithValue("@p_carnet_estudiantil", carnetEstudiantil);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        // Concurso Gym Pass

        public DataTable ConsultarConcursoGymPassPorDocumento(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CONCURSO_GYM_PASS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_numero_documento", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCodigoEmbajador(string codEmbajador)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CODIGO_EMBAJADOR", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_cod_embajador", codEmbajador);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarVentaEmbajador(int idAfiliado, int idAfiliadoPlan, string codEmbajador)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_VENTA_EMBAJADOR", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado", idAfiliado);
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_cod_embajador", codEmbajador);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarConcursoGymPass(string nombres, string apellidos, string documento, string correo, string celular, string fechaInicio, string sede, string codEmbajador, string archivoCaptura)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_CONCURSO_GYM_PASS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_nombres", nombres);
                        cmd.Parameters.AddWithValue("@p_apellidos", apellidos);
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_correo", correo);
                        cmd.Parameters.AddWithValue("@p_telefono", celular);
                        cmd.Parameters.AddWithValue("@p_fecha_asistencia", fechaInicio);
                        cmd.Parameters.AddWithValue("@p_sede", sede);
                        cmd.Parameters.AddWithValue("@p_cod_embajador", codEmbajador);
                        cmd.Parameters.AddWithValue("@p_nombre_archivo", archivoCaptura);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string InsertarCortesia(int idTipoDocumento, string documento, string nombre, string celular, string fechaCortesia, int idCiudad, int idSede)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("PA_INSERTAR_CORTESIA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_tipo_documento", idTipoDocumento);
                        cmd.Parameters.AddWithValue("@p_documento", documento);
                        cmd.Parameters.AddWithValue("@p_nombre", nombre);
                        cmd.Parameters.AddWithValue("@p_celular", celular);
                        cmd.Parameters.AddWithValue("@p_fecha_cortesia", fechaCortesia);
                        cmd.Parameters.AddWithValue("@p_id_ciudad", idCiudad);
                        cmd.Parameters.AddWithValue("@p_id_sede", idSede);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        // Redeban - Datáfonos
        public DataTable ConsultarDatafonoPorCodigo(string codDatafono)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_DATAFONO_POR_CODIGO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_cod_datafono", codDatafono);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }
            return dt;
        }

        // Siigo API
        public DataTable ConsultarCodigoSiigoPorDocumento(string docAfiliado)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_COD_SIIGO_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", docAfiliado);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarCiudadSedeSiigoPorId(int idCiudadSede)
        {
            DataTable dt = new DataTable();
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CIUDADES_SEDES_SIIGO_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_ciudad_sede", idCiudadSede);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarIntegracionPorId(int idIntegracion)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_INTEGRACION_POR_ID", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_integracion", idIntegracion);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarIntegracionEmpresaPorIdCanalVenta(int idCanalVenta)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_INTEGRACION_EMPRESA_POR_ID_CANAL_VENTA", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_canal_venta", idCanalVenta);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        // Token idPlan y idVendedor

        public DataTable ConsultarTokenPorIdPlanYIdVendedor(int idPlan, int idVendedor)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TOKEN_POR_PLAN_VENDEDOR", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);
                        cmd.Parameters.AddWithValue("@p_id_vendedor", idVendedor);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarToken(string token)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_TOKEN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_token", token);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string InsertarTokenPlanVendedor(int idPlan, int idVendedor, string token)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_INSERTAR_TOKEN_PLAN_VENDEDOR", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_plan", idPlan);
                        cmd.Parameters.AddWithValue("@p_id_vendedor", idVendedor);
                        cmd.Parameters.AddWithValue("@p_token", token);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public int ConsultarCantidadMesesPagadosPorIdAfiliadoPlan(int idAfiliadoPlan)
        {
            int meses = 0;

            try
            {
                string strConexion = ConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_CANTIDAD_MESES_PAGADOS_POR_ID_AFILIADO_PLAN", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                meses = Convert.ToInt32(reader["CantidadMesesPagados"]);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error en InsertarAfiliadoPlan: " + ex.Message);
                meses = -1; // -1 indica error
            }

            return meses;
        }

        public int ObtenerValorMesPlan(int idPlan, int idAfiliadoPlan, int precioNormal)
        {
            if (idPlan == 12) return 89000;

            DataTable promo = ConsultarPlanPromocionPorId(idPlan);

            // Si el plan NO tiene promoción → cobrar precio normal
            if (promo == null || promo.Rows.Count == 0) return precioNormal;


            DataRow row = promo.Rows[0];

            // Leer valores de la promoción
            int.TryParse(row["MesesDuracion"]?.ToString(), out int mesesPromo);
            int.TryParse(row["PrecioProm"]?.ToString(), out int precioPromo);
            int.TryParse(row["PrecioTotal"]?.ToString(), out int precioTotal);

            int mesesPagados = ConsultarCantidadMesesPagadosPorIdAfiliadoPlan(idAfiliadoPlan);

            // Si aún está dentro de la promoción
            if (mesesPagados < mesesPromo) return precioPromo;

            // Si ya terminó la promoción
            // Si existe PrecioTotal válido, usarlo; si no, usar el precio normal
            return precioTotal > 0 ? precioTotal : precioNormal;
        }

        public DataTable ConsultarAfiliadoPlanActivoPorDocumentoAfiliado(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_AFILIADO_PLAN_ACTIVO_POR_DOCUMENTO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public DataTable ConsultarUltimoPagoPlaAfiliadoPorDocumentoAfiliado(string documento)
        {
            DataTable dt = new DataTable();

            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;
                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    using (MySqlCommand cmd = new MySqlCommand("Pa_CONSULTAR_ULTIMO_PAGO_PLAN_AFILIADO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_documento_afiliado", documento);

                        using (MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd))
                        {
                            mysqlConexion.Open();
                            dataAdapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                dt = new DataTable();
                dt.Columns.Add("Error", typeof(string));
                dt.Rows.Add(ex.Message);
            }

            return dt;
        }

        public string ActualizarFechaProximoCobro(int idAfiliadoPlan, int mesesCobrados)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open(); // Abrir conexión antes de usarla

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ACTUALIZAR_FECHA_PROXIMO_COBRO", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);
                        cmd.Parameters.AddWithValue("@p_meses_cobrados", mesesCobrados);
                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        public string EliminarHistorialCobrosRechazados(int idAfiliadoPlan)
        {
            string respuesta = string.Empty;
            try
            {
                string strConexion = WebConfigurationManager.ConnectionStrings["ConnectionFP"].ConnectionString;

                using (MySqlConnection mysqlConexion = new MySqlConnection(strConexion))
                {
                    mysqlConexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("Pa_ELIMINAR_COBROS_RECHAZADOS", mysqlConexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_id_afiliado_plan", idAfiliadoPlan);

                        cmd.ExecuteNonQuery();
                        respuesta = "OK";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta = "ERROR: " + ex.Message;
            }

            return respuesta;
        }

        #endregion

    }

    #region Modelos


    public class pagoswompidet
    {
        public string Id { get; set; }
        public string FechaCreacion { get; set; }
        public string FechaFinalizacion { get; set; }
        public string Valor { get; set; }
        public string Moneda { get; set; }
        public string MetodoPago { get; set; }
        public string Estado { get; set; }
        public string Referencia { get; set; }
        public string NombreTarjeta { get; set; }
        public string UltimosDigitos { get; set; }
        public string MarcaTarjeta { get; set; }
        public string TipoTarjeta { get; set; }
        public string NombreComercio { get; set; }
        public string ContactoComercio { get; set; }
        public string TelefonoComercio { get; set; }
        public string URLRedireccion { get; set; }
        public string PaymentLinkId { get; set; }
        public string PublicKeyComercio { get; set; }
        public string EmailComercio { get; set; }
        public string Estado3DS { get; set; }
        public CustomerData customer_data { get; set; }
    }
    public class Datum
    {
        public string id { get; set; }
        public string created_at { get; set; }
        public string finalized_at { get; set; }
        public long amount_in_cents { get; set; }
        public string reference { get; set; }
        public string customer_email { get; set; }
        public string currency { get; set; }
        public string payment_method_type { get; set; }
        public string status { get; set; }
        public string status_message { get; set; }
        public CustomerData customer_data { get; set; }
        public PaymentMethod payment_method { get; set; }
    }

    public class Root
    {
        public List<Datum> data { get; set; }
    }

    public class CustomerData
    {
        public string device_id { get; set; }
        public string full_name { get; set; }
        public string phone_number { get; set; }
    }

    public class PaymentMethod
    {
        public string type { get; set; }
        public Extra extra { get; set; }
        public int installments { get; set; }
    }

    public class Extra
    {
        public string bin { get; set; }
        public string name { get; set; }
        public string brand { get; set; }
        public string exp_year { get; set; }
        public string card_type { get; set; }
        public string exp_month { get; set; }
        public string last_four { get; set; }
        public string card_holder { get; set; }
        public bool is_three_ds { get; set; }
        public ThreeDsAuth three_ds_auth { get; set; }
        public string external_identifier { get; set; }
        public string processor_response_code { get; set; }
    }

    public class ThreeDsAuth
    {
        public ThreeDsAuthStep three_ds_auth { get; set; }
    }

    public class ThreeDsAuthStep
    {
        public string current_step { get; set; }
        public string current_step_status { get; set; }
    }


    #endregion
}