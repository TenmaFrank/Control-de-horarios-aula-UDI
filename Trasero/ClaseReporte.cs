using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace ProyectoUDI.Trasero
{
    public class ClaseReporte
    {
        public SqlConnection con = new SqlConnection("Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True");  //Objeto de conexión
        public SqlDataReader read; //Objeto de lectura de datos

        private String cadConex = "Data Source=DESKTOP-NK51G6P; Initial Catalog=DBUDI; Trusted_Connection=True";


        public ClaseReporte()
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


        public DataTable HacerReporte(int numHoraFin, int numHoraIni, String profTitu, String grupo, String mat, int numCarr)
        {

            DataTable tablaR = new DataTable();


            //Se inicia la conexion con la DB
            con.Open();
            try
            {
                SqlDataAdapter datos = new SqlDataAdapter("sp_ReporteHorario", con);
                datos.SelectCommand.CommandType = CommandType.StoredProcedure;
                //Procedimiento Almacenado
                //Se envían parámetros al SP en SQL
                datos.SelectCommand.Parameters.AddWithValue("@inicio", numHoraIni);
                datos.SelectCommand.Parameters.AddWithValue("@fin", numHoraFin);
                datos.SelectCommand.Parameters.AddWithValue("@titular", profTitu);
                datos.SelectCommand.Parameters.AddWithValue("@grupo", grupo);
                datos.SelectCommand.Parameters.AddWithValue("@materia", mat);
                datos.SelectCommand.Parameters.AddWithValue("@carrera", numCarr);
          
                datos.Fill(tablaR);

                Console.WriteLine("Transaccion Exitosa!");

            }
            catch (Exception ex)
            {
                String error = "Error al ingresar los datos:" + ex.ToString();
            }

            con.Close();
            return tablaR;

        }

    }
}