using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;

namespace ProyectoUDI.Frontal
{
    public partial class FMRreportes : System.Web.UI.Page
    {
        ClaseReporte ReporteObj = new ClaseReporte();

        public DataTable repor = new DataTable();

        public Int16  numHoraIni, numHoraFin, numCarrera;
        public string res = "", horaIniS = "", horaFinS = "", profTituS = "", profAdjS = "", matCursoS = "", grupoS = "", cars = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            printButton.Style["Visibility"] = "hidden";
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void Selection_Change(object sender, EventArgs e)
        {

        }

        protected void Generar_Click(object sender, EventArgs e)
        {
            horaIniS = HoraIniList.Text;
            horaFinS = HoraFinList.Text;
            profTituS = ProfTitu.Text;
            matCursoS = MatCurso.Text;
            grupoS = Grupo.Text;
            cars = CarreraList1.Text;

            numHoraIni = Int16.Parse(horaIniS);
            numHoraFin = Int16.Parse(horaFinS);
            numCarrera = Int16.Parse(cars);

            repor = ReporteObj.HacerReporte(numHoraFin, numHoraIni, profTituS, grupoS, matCursoS, numCarrera);
            //repor = ReporteObj.reporte2();
            report.DataSource = repor;
            report.DataBind();

            GenExel();

        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            horaIniS = HoraIniList.Text;
            horaFinS = HoraFinList.Text;
            profTituS = ProfTitu.Text;
            matCursoS = MatCurso.Text;
            grupoS = Grupo.Text;
            cars = CarreraList1.Text;

            numHoraIni = Int16.Parse(horaIniS);
            numHoraFin = Int16.Parse(horaFinS);
            numCarrera = Int16.Parse(cars);

            repor = ReporteObj.HacerReporte(numHoraFin, numHoraIni, profTituS, grupoS, matCursoS, numCarrera);
            //repor = ReporteObj.reporte2();
            report.DataSource = repor;
            report.DataBind();
            printButton.Style["Visibility"] = "visible";


        }

        protected void regresar_click(object sender, EventArgs e)
        {
            Response.Redirect("MenuEncargado.aspx");
        }

        protected void GenExel()
        {
            String fecha = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "UDI " + fecha + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            report.GridLines = GridLines.Both;
            report.HeaderStyle.Font.Bold = true;
            report.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

    }
}