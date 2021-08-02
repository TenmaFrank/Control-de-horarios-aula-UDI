using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;

namespace ProyectoUDI.Frontal
{
    public partial class FRMalta : System.Web.UI.Page
    {

        ClaseAlta AltaObj = new ClaseAlta();
        public Int16 numAula, numDia, numHoraIni, numHoraFin, numCarrera; 
        public String res = "", horaIniS = "", horaFinS = "", profTituS = "", profAdjS = "", matCursoS = "", grupoS = "", cars = "", aulaS = "", diaS = "";

        protected void Selection_Change(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            aulaS = AulaList.Text;
            horaIniS = HoraIniList.Text;
            horaFinS = HoraFinList.Text;
            profTituS = ProfTitu.Text;
            profAdjS = ProfAdj.Text;
            matCursoS = MatCurso.Text;
            grupoS = Grupo.Text;
            cars = CarreraList1.Text;
            diaS = DiaList1.Text;


            numAula = Int16.Parse(aulaS);
            numDia = Int16.Parse(diaS);
            numHoraIni = Int16.Parse(horaIniS);
            numHoraFin = Int16.Parse(horaFinS);
            numCarrera = Int16.Parse(cars);

            AltaObj.DarDeAlta(numAula, numDia, numHoraIni, numHoraFin, numCarrera, matCursoS, grupoS, profTituS, profAdjS);

            res = AltaObj.res1;
        }

        protected void regresar_click(object sender, EventArgs e)
        {
            Response.Redirect("MenuEncargado.aspx");
        }
    }
}