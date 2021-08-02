using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoUDI.Trasero;

namespace ProyectoUDI.Frontal
{
    public partial class FRMusuarios : System.Web.UI.Page
    {
        ClaseUsuarios UsObj = new ClaseUsuarios();
        DataTable TabUs = new DataTable();
        String userS = "", passS = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            TabUs = UsObj.ConUs(2);
            gridUs.DataSource = TabUs;
            gridUs.DataBind();
        }

        protected void agregar_click(object sender, EventArgs e)
        {
            userS = usu.Text;
            passS = contra.Text;

            UsObj.ingresar(3, userS, passS);
        }

        protected void borrar_click(object sender, EventArgs e)
        {
            userS = usu.Text;
            passS = contra.Text;

            UsObj.ingresar(4, userS, passS);
        }

        protected void regresar_click(object sender, EventArgs e)
        {
            Response.Redirect("MenuEncargado.aspx");
        }
    }
}