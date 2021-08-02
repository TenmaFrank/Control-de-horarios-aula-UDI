using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;
using System.Data;

namespace ProyectoUDI.frontal
{
    public partial class FRMprincipal : System.Web.UI.Page
    {

        ClaseTablero TabObj = new ClaseTablero();

        public DataTable tabla = new DataTable();
        public DataTable tabes = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            Int16 numdia = 0;
            string datetime = DateTime.Now.ToString("HH:mm");

            numdia = (Int16)System.DateTime.Now.DayOfWeek;

            tabla = TabObj.Tablero(datetime, numdia);
            tablagrind.DataSource = tabla;
            tablagrind.DataBind();

            botonesEstado(2);
            gridEstadp.DataSource = tabes;
            gridEstadp.DataBind();
        }

        protected void ingresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        public void botonesEstado (Int16 tipoper)
        {
            Int16 aulab = 0;
            String estatus = "";

            if(tipoper == 1)
            {
                if(chk1.Checked)
                {
                    aulab = 1;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 1;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk2.Checked)
                {
                    aulab = 2;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 2;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk3.Checked)
                {
                    aulab = 3;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 3;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk4.Checked)
                {
                    aulab = 4;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 4;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk5.Checked)
                {
                    aulab = 5;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 5;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk6.Checked)
                {
                    aulab = 6;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 6;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk7.Checked)
                {
                    aulab = 7;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 7;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk8.Checked)
                {
                    aulab = 8;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 8;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk9.Checked)
                {
                    aulab = 9;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 9;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

                if (chk10.Checked)
                {
                    aulab = 10;
                    estatus = "ocupado";
                    TabObj.consulta(tipoper, aulab, estatus);
                }
                else
                {
                    aulab = 10;
                    estatus = "libre";
                    TabObj.consulta(tipoper, aulab, estatus);
                }

            }

            if(tipoper == 2)
            {
                tabes = TabObj.consulta(tipoper, 0, "XD");
            }
        }

        protected void chk1_CheckedChanged(object sender, EventArgs e)
        {
            botonesEstado(1);

            botonesEstado(2);
            gridEstadp.DataSource = tabes;
            gridEstadp.DataBind();
        }
    }
}