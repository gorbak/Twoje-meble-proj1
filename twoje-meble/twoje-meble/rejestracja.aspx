<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="rejestracja.aspx.cs" Inherits="komp.rejestracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>
        <div runat=server id=div_bledy class="bledy">
        <asp:Label ID="Label1_b" runat="server" Text=""></asp:Label></div>
    <div class=formularz>
        <label>Rejestracja</label>
    <br />
<table style="height: 0px; width: 100%;">
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
<tr>
<td align="right">
    <label runat=server id=Powtorz_text>Powtórz hasło:</label></td>
<td>
    <asp:TextBox runat=server ID="powtorz" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
    E-mail:</td>
<td>
    <asp:TextBox runat=server ID="mail" runat="server" Width="200px"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
   <label runat=server id=Imie_text> Imię:</label></td>
<td>
    <asp:TextBox runat=server ID="imie" runat="server" Width="200px"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
    Nazwisko:</td>
<td>
    <asp:TextBox runat=server ID="nazwisko" runat="server" Width="200px"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right"><label runat=server id=regulamin_text>
    Akceptacja regulaminu:</label></td>
<td>
    <asp:CheckBox ID="checkbox_regulamin" runat="server" Width="200px"></asp:CheckBox>
</td>
</tr>
<tr>
<td align="right">
    
</td>
<td>
    <asp:Button runat=server ID="rejestruj" runat="server" Text="Rejestruj" onclick="rejestruj_Click" 
        />
</td>
</tr>

</table>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS %>" 
        SelectCommand="SELECT * FROM [produkty]"></asp:SqlDataSource>
</div>

</asp:Content>
