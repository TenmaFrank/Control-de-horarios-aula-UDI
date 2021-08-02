using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoUDI.Trasero
{
    public class ClaseTablero
    {
        private SqlConnection con;
        private SqlCommand ComQrY;
        private SqlDataReader lec;
        private String cadConex = "Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True";

        public ClaseTablero()
        {
            con = new SqlConnection(cadConex);
        }

        public DataTable Tablero (string hora, Int16 dia)
        {
            con.Open();

            DataTable tablaTablero = new DataTable();
            try
            {
                SqlDataAdapter datos = new SqlDataAdapter("sp_TableroHorario", con);
                datos.SelectCommand.CommandType = CommandType.StoredProcedure;

                datos.SelectCommand.Parameters.AddWithValue("@hora", hora);
                datos.SelectCommand.Parameters.AddWithValue("@dia", dia);

                datos.Fill(tablaTablero);

                //exito = 1;

                Console.WriteLine("Transaccion Exitosa!");

            }
            catch(Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            con.Close();
            return tablaTablero;
            
        }

        public DataTable consulta(Int16 tipoper, Int16 Aula, String estado)
        {
            con.Open();

            DataTable est = new DataTable();
            try
            {
                SqlDataAdapter datos = new SqlDataAdapter("sp_estado", con);
                datos.SelectCommand.CommandType = CommandType.StoredProcedure;

                datos.SelectCommand.Parameters.AddWithValue("@tipoper", tipoper);
                datos.SelectCommand.Parameters.AddWithValue("@aulas", Aula);
                datos.SelectCommand.Parameters.AddWithValue("@estados", estado);

                datos.Fill(est);

                //exito = 1;

                Console.WriteLine("Transaccion Exitosa!");

            }
            catch (Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            con.Close();
            return est;
        }

    }
}