using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;

namespace ProyectoUDI.Frontal
{
    public partial class FMRcambio : System.Web.UI.Page
    {
        ClaseCambio CambioObj = new ClaseCambio();

        public Int16 numAula, numDia1, numHoraIni, numHoraFin, numCarrera, numHoraEdit, numDia2;
        public string res = "", horaIniS = "", horaFinS = "", profTituS = "", profAdjS = "", matCursoS = "", grupoS = "", cars = "", aulaS = "", dia1S = "", dias2s = "" , horaEditS = "";

        protected void Selection_Change(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cambiar_click(object sender, EventArgs e)
        {
            aulaS = AulaList.Text;
            horaEditS = HorarioList1.Text;
            dia1S = DiaList1.Text;
            profTituS = ProfTitu.Text;
            profAdjS = ProfAdj.Text;
            matCursoS = MaT.Text;
            grupoS = Grupo.Text;
            cars = CarreraList1.Text;
            horaIniS = HoraIniList.Text;
            horaFinS = HoraFinList.Text;
            dias2s = DiaNuevoList1.Text;


            numHoraEdit = Int16.Parse(horaEditS);
            numAula = Int16.Parse(aulaS);
            numDia1 = Int16.Parse(dia1S);
            numDia2 = Int16.Parse(dias2s);
            numHoraIni = Int16.Parse(horaIniS);
            numHoraFin = Int16.Parse(horaFinS);
            numCarrera = Int16.Parse(cars);

            CambioObj.HacerCambio(numHoraEdit, numAula, numDia1, numDia2, numHoraIni, numHoraFin, numCarrera, profTituS, profAdjS, matCursoS, grupoS);

            res = CambioObj.res3;
        }

        protected void Regresar_click(object sender, EventArgs e)
        {
            Response.Redirect("MenuEncargado.aspx");
        }
    }
}