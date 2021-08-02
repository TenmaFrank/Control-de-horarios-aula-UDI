using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoUDI.Trasero
{
    public class ClaseUsuarios
    {
        public int exito = 0;
        private SqlConnection con;  //Objeto de conexión
        private SqlCommand query;   //Objeto de consulta (ejecuta consultas)
        private SqlDataReader read; //Objeto de lectura de datos

        private String cadConex = "Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True";

        public ClaseUsuarios()
        {
            con = new SqlConnection(cadConex);
        }

        public void ingresar(Int16 tipoper, String user, String pass)
        {
            //Se inicia la conexion con la DB
            con.Open();

            SqlTransaction trans = con.BeginTransaction(System.Data.IsolationLevel.Serializable);

            try
            {

                query = new SqlCommand("sp_ManejaUsuario", con, trans);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.Clear();
                //Procedimiento Almacenado
                //Se envían parámetros al SP en SQL
                query.Parameters.AddWithValue("@tipoper", tipoper);
                query.Parameters.AddWithValue("@usuario", user);
                query.Parameters.AddWithValue("@contrasena", pass);

                /*SqlParameter ruturn = new SqlParameter("@msg", SqlDbType.Int);

                ruturn.Direction = ParameterDirection.Output;

                query.Parameters.Add(ruturn);

                */

                query.Parameters.Add("@msq", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.ReturnValue;

                query.ExecuteNonQuery();

                exito = (int)query.Parameters["@msq"].Value;

                Console.WriteLine("Transaccion Exitosa!");
            }
            catch (Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            finally
            {
                if (exito == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            con.Close();

        }

        public DataTable ConUs (Int16 tipoper)
        {
            DataTable tablaUs = new DataTable();


            //Se inicia la conexion con la DB
            con.Open();

            try
            {
                SqlDataAdapter datos = new SqlDataAdapter("sp_ManejaUsuario", con);
                datos.SelectCommand.CommandType = CommandType.StoredProcedure;
                //Procedimiento Almacenado
                //Se envían parámetros al SP en SQL
                datos.SelectCommand.Parameters.AddWithValue("@tipoper", tipoper);
                datos.SelectCommand.Parameters.AddWithValue("@usuario", "");
                datos.SelectCommand.Parameters.AddWithValue("@contrasena", "");

                datos.Fill(tablaUs);

                Console.WriteLine("Transaccion Exitosa!");

            }
            catch (Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            con.Close();
            return tablaUs;

        }


        public void InUser (Int16 tipoper, String user, String pass)
        {
            con.Open();

            SqlTransaction trans = con.BeginTransaction(System.Data.IsolationLevel.Serializable);
            try
            {
                query = new SqlCommand("sp_ManejaUsuario", con, trans);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.Clear();
                //Procedimiento Almacenado
                //Se envían parámetros al SP en SQL
                query.Parameters.AddWithValue("@tipoper", tipoper);
                query.Parameters.AddWithValue("@usuario", user);
                query.Parameters.AddWithValue("@contrasena", pass);
                query.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            con.Close();
        }

    }
}