<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoUDI.frontal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <main>
        <header>
            <h1>Ingresa al sistema</h1>
        </header>
        <form id="Login" runat="server">
            <div>
                <asp:Table runat ="server">
                    <asp:TableRow>
                        <asp:TableCell> Usuario: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "usuario"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell> Contraseña: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "contraseña"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <div>
                    <p><FONT COLOR="red"><% Response.Write(resp); %></font></p>
                </div>
                <div>
                <asp:Button ID="ingresar" runat="server" Text="Ingresar" OnClick="ingresar_Click" Width="63px"/>
                <asp:Button ID="regresar" runat="server" Text="Regresar" OnClick="regresar_click" Width="63px" />
                </div>
             </div>
        </form>
    </main>
</body>
</html>
