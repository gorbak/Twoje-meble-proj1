<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="komp.logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>
    <div class=formularz>
    <br />
<table style="height: 0px; " align="center">

<tr>
<td align="right">
    <label runat=server id=Login_text>Login:</label></td>
<td>
    <asp:TextBox runat=server ID="login" runat="server" Width="200px"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
    <label runat=server id=Haslo_text>Hasło:</label></td>
<td>
    <asp:TextBox runat=server ID="haslo" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
</td>
</tr>
<td align="right"><label runat=server id=zapamietaj_text>
    Zapamiętaj mnie:</label></td>
<td>
    <asp:CheckBox ID="checkbox_zapamietaj" runat="server" Width="200px"></asp:CheckBox>
</td>
</tr>
<tr>
<td align="right">
    
</td>
<td>
    <asp:Button runat=server ID="Zaloguj" runat="server" Text="Zaloguj" onclick="Zaloguj_Click" 
        />
</td>
</tr>

</table>
    </div>
    <div runat=server id=div_bledy class="bledy">
        <asp:Label ID="Label1_b" runat="server" Text=""></asp:Label></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        SelectCommand="SELECT * FROM [produkty]"></asp:SqlDataSource>
</div>

</asp:Content>
