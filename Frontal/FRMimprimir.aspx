<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FRMimprimir.aspx.cs" Inherits="ProyectoUDI.Frontal.FRMimprimir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>REPORTE DE HORARIO</h1>
        </header>
        <div>
            <asp:GridView ID="report" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="AULA" HeaderText="Aula" />
                        <asp:BoundField DataField="DIA" HeaderText="Dia" />
                        <asp:BoundField DataField="PROFESOR TITULAR" HeaderText="Profesor Titular" />
                        <asp:BoundField DataField="PROFESOR ADJUNTO" HeaderText="Profesor Adjunto" />
                        <asp:BoundField DataField="CLAVE" HeaderText="Grupo" />
                        <asp:BoundField DataField="CARRERA" HeaderText="Carrera" />
                        <asp:BoundField DataField="HORA INICIAL" HeaderText="Hora de inicio" />
                        <asp:BoundField DataField="HORA FINAL" HeaderText="Hora de ternmino" />
                        <asp:BoundField DataField="MATERIA" HeaderText="Materia" />
                    </Columns>
             </asp:GridView>
            <asp:Button ID="printButton" runat="server" Text="Imprimir" OnClientClick="javascript:window.print();" />
            <asp:Button ID="regresar" runat="server" Text="Regresar" OnClick="regresar_click" Width="63px" style="height: 26px" />
        </div>
    </form>
</body>
</html>
