<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FRMprincipal.aspx.cs" Inherits="ProyectoUDI.frontal.FRMprincipal" %>

<!DOCTYPE html>
<meta http-equiv="Refresh" content="900; URL=FRMprincipal.aspx">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Horario de Aulas UDI</title>
<style>
    .switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
        top: 27px;
        left: -64px;
    }

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: -27px;
  left: 66px;
  right: -66px;
  bottom: 27px;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}
</style>
</head>
<body>
    <main>
        <header>
            <h1>Horarios</h1>
        </header>
        <form id="FRMprincipal" runat="server">
            <div>
                <asp:Button ID="ingresar" runat="server" Text="Ingresar" OnClick="ingresar_Click" Width="63px" />
                <asp:Button ID="act" runat="server" Text="Actualizar Estado" OnClick="chk1_CheckedChanged" Width="158px" />
            </div>
                <div>
                <asp:Table runat ="server">
                    <asp:TableRow>
                        <asp:TableCell> Aula 1 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk1" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 2 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk2" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 3 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk3" runat="server" Checked="true" /><span class="slider"></span></label></asp:TableCell>
                        <asp:TableCell> Aula 4 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk4" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 5 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk5" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell> Aula 6 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk6" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 7 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk7" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 8 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk8" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 9 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk9" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                        <asp:TableCell> Aula 10 </asp:TableCell>
                        <asp:TableCell> <label class="switch"> <asp:CheckBox ID="chk10" runat="server" Checked="true" /><span class="slider"></span> </label></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>
                <div>
                <asp:GridView ID="tablagrind" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="AULA" HeaderText="Aula" />
                        <asp:BoundField DataField="PROFESOR TITULAR" HeaderText="Profesor Titular" />
                        <asp:BoundField DataField="HORA INICIAL" HeaderText="Hora de inicio" />
                        <asp:BoundField DataField="HORA FINAL" HeaderText="Hora de ternmino" />
                        <asp:BoundField DataField="MATERIA" HeaderText="Materia" />
                        <asp:BoundField DataField="DIA" HeaderText="Dia" />
                    </Columns>
                </asp:GridView> 
                    <asp:GridView ID="gridEstadp" runat="server" AutoGenerateColumns="false" Height="74px" style="margin-top: 4px" Width="72px">
                    <Columns>
                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </main>
</body>
</html>
