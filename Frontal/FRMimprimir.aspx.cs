using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;

namespace ProyectoUDI.Frontal
{
    public partial class FRMimprimir : System.Web.UI.Page
    {
        ClaseReporte ReporteObj = new ClaseReporte();
        FMRreportes reportesobj = new FMRreportes();
        protected void Page_Load(object sender, EventArgs e)
        {
            report.DataSource = reportesobj.repor;
            report.DataBind();
        }
        public void volveraenviar(int numHoraFin, int numHoraIni, String profTitu, String grupo, String mat, int numCarr)
        {

        }

        protected void regresar_click(object sender, EventArgs e)
        {
            Response.Redirect("FMRreportes.aspx");
        }
    }
}