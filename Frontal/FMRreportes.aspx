<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMRreportes.aspx.cs" Inherits="ProyectoUDI.Frontal.FMRreportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <main>
        <header>
            <h1>Generacion de reportes</h1>
        </header>
        <form id="generacion" runat="server">
            <div>
                <p>
                    <FONT COLOR="black">Horario Inicial</font>
                    <asp:DropDownList id="HoraIniList"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server" Height="17px" Width="69px">

                  <asp:ListItem Selected="True" Value="0"> --:-- </asp:ListItem>
                  <asp:ListItem Value="1"> 07:00 </asp:ListItem>
                  <asp:ListItem Value="2"> 07:30 </asp:ListItem>
                  <asp:ListItem Value="3"> 08:00 </asp:ListItem>
                  <asp:ListItem Value="4"> 08:30 </asp:ListItem>
                  <asp:ListItem Value="5"> 09:00 </asp:ListItem>
                  <asp:ListItem Value="6"> 09:30 </asp:ListItem>
                  <asp:ListItem Value="7"> 10:00 </asp:ListItem>
                  <asp:ListItem Value="8"> 10:30 </asp:ListItem>
                    <asp:ListItem Value="9"> 11:00 </asp:ListItem>
                    <asp:ListItem Value="10"> 11:30 </asp:ListItem>
                    <asp:ListItem Value="11"> 12:00 </asp:ListItem>
                    <asp:ListItem Value="12"> 12:30 </asp:ListItem>
                    <asp:ListItem Value="13"> 13:00 </asp:ListItem>
                    <asp:ListItem Value="14"> 13:30 </asp:ListItem>
                    <asp:ListItem Value="15"> 14:00 </asp:ListItem>
                    <asp:ListItem Value="16"> 14:30 </asp:ListItem>
                    <asp:ListItem Value="17"> 15:00 </asp:ListItem>
                    <asp:ListItem Value="18"> 15:30 </asp:ListItem>
                    <asp:ListItem Value="19"> 16:00 </asp:ListItem>
                    <asp:ListItem Value="20"> 16:30 </asp:ListItem>
                    <asp:ListItem Value="21"> 17:00 </asp:ListItem>
                    <asp:ListItem Value="22"> 17:30 </asp:ListItem>
                    <asp:ListItem Value="23"> 18:00 </asp:ListItem>
                    <asp:ListItem Value="24"> 18:30 </asp:ListItem>
                    <asp:ListItem Value="25"> 19:00 </asp:ListItem>
                    <asp:ListItem Value="26"> 19:30 </asp:ListItem>
                    <asp:ListItem Value="27"> 20:00 </asp:ListItem>
                    <asp:ListItem Value="28"> 20:30 </asp:ListItem>
                    <asp:ListItem Value="29"> 21:00 </asp:ListItem>
                    <asp:ListItem Value="30"> 21:30 </asp:ListItem>
                    <asp:ListItem Value="31"> 22:00 </asp:ListItem>
               </asp:DropDownList>

                <FONT COLOR="black"> Horario final</font>
                <asp:DropDownList id="HoraFinList"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server" Height="20px" Width="65px">

                  <asp:ListItem Selected="True" Value="0"> --:-- </asp:ListItem>
                    <asp:ListItem Value="1"> 07:00 </asp:ListItem>
                  <asp:ListItem Value="2"> 07:30 </asp:ListItem>
                  <asp:ListItem Value="3"> 08:00 </asp:ListItem>
                  <asp:ListItem Value="4"> 08:30 </asp:ListItem>
                  <asp:ListItem Value="5"> 09:00 </asp:ListItem>
                  <asp:ListItem Value="6"> 09:30 </asp:ListItem>
                  <asp:ListItem Value="7"> 10:00 </asp:ListItem>
                  <asp:ListItem Value="8"> 10:30 </asp:ListItem>
                    <asp:ListItem Value="9"> 11:00 </asp:ListItem>
                    <asp:ListItem Value="10"> 11:30 </asp:ListItem>
                    <asp:ListItem Value="11"> 12:00 </asp:ListItem>
                    <asp:ListItem Value="12"> 12:30 </asp:ListItem>
                    <asp:ListItem Value="13"> 13:00 </asp:ListItem>
                    <asp:ListItem Value="14"> 13:30 </asp:ListItem>
                    <asp:ListItem Value="15"> 14:00 </asp:ListItem>
                    <asp:ListItem Value="16"> 14:30 </asp:ListItem>
                    <asp:ListItem Value="17"> 15:00 </asp:ListItem>
                    <asp:ListItem Value="18"> 15:30 </asp:ListItem>
                    <asp:ListItem Value="19"> 16:00 </asp:ListItem>
                    <asp:ListItem Value="20"> 16:30 </asp:ListItem>
                    <asp:ListItem Value="21"> 17:00 </asp:ListItem>
                    <asp:ListItem Value="22"> 17:30 </asp:ListItem>
                    <asp:ListItem Value="23"> 18:00 </asp:ListItem>
                    <asp:ListItem Value="24"> 18:30 </asp:ListItem>
                    <asp:ListItem Value="25"> 19:00 </asp:ListItem>
                    <asp:ListItem Value="26"> 19:30 </asp:ListItem>
                    <asp:ListItem Value="27"> 20:00 </asp:ListItem>
                    <asp:ListItem Value="28"> 20:30 </asp:ListItem>
                    <asp:ListItem Value="29"> 21:00 </asp:ListItem>
                    <asp:ListItem Value="30"> 21:30 </asp:ListItem>
                    <asp:ListItem Value="31"> 22:00 </asp:ListItem>
               </asp:DropDownList>
               </p>
                <asp:Table runat ="server">
                    <asp:TableRow>
                        <asp:TableCell> Profesor Titular: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "ProfTitu"></asp:TextBox></asp:TableCell>

                        <asp:TableCell> Profesor Adjunto: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "ProfAdj"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                      <asp:TableRow>
                        <asp:TableCell> Materia o curso: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "MatCurso"></asp:TextBox></asp:TableCell>

                        <asp:TableCell> Grupo: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "Grupo"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <FONT COLOR="black">Carrera</font>
                <asp:DropDownList id="CarreraList1"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">

                  <asp:ListItem Selected="True" Value="0"> ------  </asp:ListItem>
                    <asp:ListItem Value="1"> Ingenieria en Computacion </asp:ListItem>
                  <asp:ListItem Value="2"> Ingeniería en Comunicaciones y Electrónica </asp:ListItem>
                  <asp:ListItem Value="3"> Ingeniería Automotriz </asp:ListItem>
                  <asp:ListItem Value="4"> Ingeniería Mecánica </asp:ListItem>

               </asp:DropDownList>

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
                <div>
                <asp:Button ID="Generar" runat="server" Text="Generar archivo excel" OnClick="Generar_Click" Width="144px"/>
                <asp:Button ID="Imprimir" runat="server" Text="Imprimir" OnClick="Imprimir_Click" Width="79px"/>
                <asp:Button ID="regresar" runat="server" Text="Regresar" OnClick="regresar_click" Width="63px" style="height: 26px" />
                </div>
             </div>
        </form>
    </main>
</body>
</html>
