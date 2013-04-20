<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="koszyk.aspx.cs" Inherits="komp.koszyk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class=zawartosc>
        <div class=formularz>
 Produkty z koszyka  <br />

 <div runat=server id=zawartosc_koszyka>
 Koszyk pusty
 
</div>
 <div runat=server id=Div11111></div>
 <div runat=server id=div2222><input id="Button1" type=button runat=server onclick='kup' value='Kup Teraz'><br /><br /><input id="Button2" type=submit runat=server onserverclick="usun_z_koszyka" value='Opróżnij koszyk'><!---<asp:Button 
         ID="Button3" runat="server" onclick="usun_z_koszyka" Text="Button" />--->
     </div>
 </div></div>

</asp:Content>
