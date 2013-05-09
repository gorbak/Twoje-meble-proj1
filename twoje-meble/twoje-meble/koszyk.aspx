<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="koszyk.aspx.cs" Inherits="komp.koszyk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class=zawartosc>
        <div class=formularz>
        <label> Produkty z koszyka</label>

  <div class='koszyk_produkt' style='position:relative;'><div>Lp.</div><div>Nazwa</div><div>Model</div><div>Cena</div><div>Ilość</div></div>
 <div runat=server id=zawartosc_koszyka>
 Koszyk pusty
 
</div>

 <div runat=server id=Div11111></div>
 <div runat=server id=div2222><input id="Button2" type=submit runat=server onserverclick="usun_z_koszyka" value='Opróżnij koszyk'><input id="Button1" type=button runat=server onclick='kup' style='position:absolute;right:20px;' value='Kup Teraz'><!---<asp:Button 
         ID="Button3" runat="server" onclick="usun_z_koszyka" Text="Button" />--->
     </div>
 </div></div>

</asp:Content>
