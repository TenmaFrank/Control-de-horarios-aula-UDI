<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FRMusuarios.aspx.cs" Inherits="ProyectoUDI.Frontal.FRMusuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Configuración de Usuarios</h1>
        </header>
        <div>
            <asp:GridView ID="gridUs" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="usuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="contraseña" HeaderText="Contraseña" />
                    </Columns>
             </asp:GridView>
        </div>
        <div>
            <asp:Table runat ="server">
                    <asp:TableRow>
                        <asp:TableCell> Usuario: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "usu"></asp:TextBox></asp:TableCell>

                        <asp:TableCell> Contraseña: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "contra"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
        </div>
        <div>
                <asp:Button ID="agrear" runat="server" Text="Agregar Usuario" OnClick="agregar_click" Width="113px"/>
                <asp:Button ID="borrar" runat="server" Text="Borrar Usuario" OnClick="borrar_click" Width="105px" />
                <asp:Button ID="regresar" runat="server" Text="Regresar" OnClick="regresar_click" Width="105px" />
        </div>
    </form>
</body>
</html>
