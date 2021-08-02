<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FRMbaja.aspx.cs" Inherits="ProyectoUDI.Frontal.FRMbaja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <main>
        <header>
            <h1>Baja de horario</h1>
        </header>
        <form id="Baja" runat="server">
            <div>
                <FONT COLOR="black">AULA</font>
                <asp:DropDownList id="AulaList"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">

                  <asp:ListItem Selected="True" Value="1"> Aula 1 </asp:ListItem>
                  <asp:ListItem Value="2"> Aula 2 </asp:ListItem>
                  <asp:ListItem Value="3"> Aula 3 </asp:ListItem>
                  <asp:ListItem Value="4"> Aula 4 </asp:ListItem>
                  <asp:ListItem Value="5"> Aula 5 </asp:ListItem>

               </asp:DropDownList>

                <FONT COLOR="black">Dia</font>
                    <asp:DropDownList id="DiaList1"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">

                  <asp:ListItem Selected="True" Value="1"> Lunes </asp:ListItem>
                  <asp:ListItem Value="2"> Martes </asp:ListItem>
                  <asp:ListItem Value="3"> Miercoles </asp:ListItem>
                  <asp:ListItem Value="4"> Jueves </asp:ListItem>
                  <asp:ListItem Value="5"> Viernes </asp:ListItem>
                  <asp:ListItem Value= "6"> Sabado </asp:ListItem>

               </asp:DropDownList>

                <p>
                <FONT COLOR="black">Horario Inicial</font>
                <asp:DropDownList id="HoraIniList"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">

                  <asp:ListItem Selected="True" Value="1"> 07:00 </asp:ListItem>
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

                  <asp:ListItem Selected="True" Value="1"> 07:00 </asp:ListItem>
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
                        <asp:TableCell> Grupo: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "Grupo"></asp:TextBox></asp:TableCell>

                        <asp:TableCell> Materia o curso: </asp:TableCell>
                        <asp:TableCell> <asp:TextBox runat ="server" id = "curso"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <FONT COLOR="black">Carrera</font>
                <asp:DropDownList id="CarreraList1"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">

                  <asp:ListItem Selected="True" Value="1"> Ingenieria en Computacion </asp:ListItem>
                  <asp:ListItem Value="2"> Ingeniería en Comunicaciones y Electrónica </asp:ListItem>
                  <asp:ListItem Value="3"> Ingeniería Automotriz </asp:ListItem>
                  <asp:ListItem Value="4"> Ingeniería Mecánica </asp:ListItem>

                </asp:DropDownList>
                <div>
                    <p><FONT COLOR="red"><% Response.Write(res); %></font></p>
                </div>
                <div>
                <asp:Button ID="Borrar" runat="server" Text="Borrar" OnClick="Borrar_click" Width="63px"/>
                <asp:Button ID="regresar" runat="server" Text="Regresar" OnClick="Regresar_click" Width="63px" />
                </div>
             </div>
        </form>
    </main>
</body>
</html>
