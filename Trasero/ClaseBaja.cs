using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace ProyectoUDI.Trasero
{
    public class ClaseBaja
    {
        private SqlConnection con;  //Objeto de conexión
        private SqlCommand query;   //Objeto de consulta (ejecuta consultas)
        private SqlDataReader read; //Objeto de lectura de datos

        private String cadConex = "Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True";

        public String res2 = "";

        public ClaseBaja()
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

        public void DarDeBaja(Int16 numAula, Int16 numDia, Int16 numHoraIni, Int16 numHoraFin, Int16 numCarr, String Mate, String grupo, String profTitu, String profAdj)
        {
            int exito = 0;

            //Se inicia la conexion con la DB
            con.Open();

            SqlTransaction trans = con.BeginTransaction(System.Data.IsolationLevel.Serializable);

            try
            {
                query = new SqlCommand("sp_BajaHorario", con, trans);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.Clear();
                //Procedimiento Almacenado
                query.Parameters.AddWithValue("@aula", numAula);
                query.Parameters.AddWithValue("@titular", profTitu);
                query.Parameters.AddWithValue("@auxiliar", profAdj);
                query.Parameters.AddWithValue("@grupo", grupo);
                query.Parameters.AddWithValue("@carrera", numCarr);
                query.Parameters.AddWithValue("@inicio", numHoraIni);
                query.Parameters.AddWithValue("@fin", numHoraFin);
                query.Parameters.AddWithValue("@materia", Mate);
                query.Parameters.AddWithValue("@dia", numDia);

                query.ExecuteNonQuery();

                exito = 1;
                Console.WriteLine("Transaccion Exitosa!");
            }
            catch(Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }
            finally
            {
                if (exito == 1)
                {
                    trans.Commit();
                    res2 = "Eliminado con Exito!";
                }
                else
                {
                    trans.Rollback();
                    res2 = "No existe el horario, verifique los datos";
                }
            }
            con.Close();
        }

    }
}

