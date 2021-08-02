using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace ProyectoUDI.Trasero
{
    public class ClaseCambio
    {
        private SqlConnection con;  //Objeto de conexión
        private SqlCommand query;   //Objeto de consulta (ejecuta consultas)
        private SqlDataReader read; //Objeto de lectura de datos

        private String cadConex = "Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True";

        public String res3 = "";

        public ClaseCambio()
        {
            con = new SqlConnection(cadConex);
        }

        private void ConDB()
        {
            try
            {
                con.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al intentar conectar a la Base de Datos" + ex.ToString());
            }
        }

        public void HacerCambio (Int16 numHoraEdit, Int16 numAula, Int16 dia1, Int16 dia2, Int16 numHoraIni, Int16 numHoraFin, Int16 numCarrera, String profTito, String profAdj, String mat, String grupo)
        {
            int exito = 0;

            //Se inicia la conexion con la DB
            con.Open();

            SqlTransaction trans = con.BeginTransaction(System.Data.IsolationLevel.Serializable);

            try
            {
                query = new SqlCommand("sp_CambioHorario", con, trans);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.Clear();
                //Procedimiento Almacenado
                //Se envían parámetros al SP en SQL
                query.Parameters.AddWithValue("@aula", numAula);
                query.Parameters.AddWithValue("@dia", dia1);
                query.Parameters.AddWithValue("@horario", numHoraEdit);
                //---
                query.Parameters.AddWithValue("@inicio", numHoraIni);
                query.Parameters.AddWithValue("@fin", numHoraFin);
                query.Parameters.AddWithValue("@titular", profTito);
                query.Parameters.AddWithValue("@auxiliar", profAdj);
                query.Parameters.AddWithValue("@grupo", grupo);
                query.Parameters.AddWithValue("@materia", mat);
                query.Parameters.AddWithValue("@carrera", numCarrera);
                query.Parameters.AddWithValue("@day", dia2);

                query.Parameters.Add("@msg", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.ReturnValue;

                query.ExecuteNonQuery();

                exito = (int)query.Parameters["@msg"].Value;

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
                    res3 = "Guardado con Exito!";
                }
                else
                {
                    trans.Rollback();
                    res3 = "Existe un Traslape, verifique los datos";
                }
            }

        }

    }
}