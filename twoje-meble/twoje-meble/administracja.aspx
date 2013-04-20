<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="administracja.aspx.cs" Inherits="komp.administracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>
      <br />
     <div style=''>
Użytkownicy


     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
         CellPadding="2" DataKeyNames="userID" DataSourceID="zrodlo_userzy" 
         ForeColor="Black" GridLines="None">
         <AlternatingRowStyle BackColor="PaleGoldenrod" />
         <Columns>
             <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" 
                 ReadOnly="True" SortExpression="userID" />
             <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
             <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" 
                 SortExpression="nazwisko" />
             <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
             <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
             <asp:BoundField DataField="haslo" HeaderText="haslo" SortExpression="haslo" />
             <asp:BoundField DataField="uprawnienia" HeaderText="uprawnienia" 
                 SortExpression="uprawnienia" />
             <asp:CommandField HeaderText="Edycja" ShowEditButton="True" 
                 CancelText="Przerwij" DeleteText="Usuń" EditText="Zmień" 
                 UpdateText="Aktualizuj" ShowDeleteButton="True" />
         </Columns>
         <FooterStyle BackColor="Tan" />
         <HeaderStyle BackColor="#FF9900" Font-Bold="True" />
         <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
             HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
         <SortedAscendingCellStyle BackColor="#FAFAE7" />
         <SortedAscendingHeaderStyle BackColor="#DAC09E" />
         <SortedDescendingCellStyle BackColor="#E1DB9C" />
         <SortedDescendingHeaderStyle BackColor="#C2A47B" />
     </asp:GridView>
     <asp:SqlDataSource ID="zrodlo_userzy" runat="server" 
         ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT     *
FROM   uzytkownicy" DeleteCommand="DELETE FROM uzytkownicy Where login = @login" 
             UpdateCommand="UPDATE uzytkownicy SET imie = @imie, nazwisko = @nazwisko, mail = @mail, login = @login, uprawnienia = @uprawnienia, haslo = @haslo WHERE (login = @login)">
         <DeleteParameters>
             <asp:Parameter Name="login" />
         </DeleteParameters>
         <UpdateParameters>
             <asp:Parameter Name="imie" />
             <asp:Parameter Name="nazwisko" />
             <asp:Parameter Name="mail" />
             <asp:Parameter Name="login" />
             <asp:Parameter Name="uprawnienia" />
             <asp:Parameter Name="haslo" />
         </UpdateParameters>
         </asp:SqlDataSource>
         <br />
         Produkty
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
             BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
             CellPadding="2" DataKeyNames="produktID" DataSourceID="produktyDataSrsc" 
             ForeColor="Black" GridLines="None">
             <AlternatingRowStyle BackColor="PaleGoldenrod" />
             <Columns>
                 <asp:BoundField DataField="produktID" HeaderText="produktID" 
                     InsertVisible="False" ReadOnly="True" SortExpression="produktID" />
                 <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                 <asp:BoundField DataField="kategoria" HeaderText="kategoria" SortExpression="kategoria" />
                 <asp:BoundField DataField="grupa" HeaderText="grupa" SortExpression="grupa" />                 
                 <asp:BoundField DataField="podgrupa" HeaderText="podgrupa" 
                     SortExpression="podgrupa" />
                 <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                 <asp:BoundField DataField="dostepnosc" HeaderText="dostepnosc" 
                     SortExpression="dostepnosc" />
                 <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                 <asp:CommandField ButtonType="Button" CancelText="Przerwij" DeleteText="Usuń" 
                     EditText="Zmień" HeaderText="Edycja" SelectText="Wybierz" 
                     ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" 
                     UpdateText="Aktualizuj" />
             </Columns>
             <FooterStyle BackColor="Tan" />
             <HeaderStyle BackColor="#FF9900" Font-Bold="True" />
             <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                 HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
             <SortedAscendingCellStyle BackColor="#FAFAE7" />
             <SortedAscendingHeaderStyle BackColor="#DAC09E" />
             <SortedDescendingCellStyle BackColor="#E1DB9C" />
             <SortedDescendingHeaderStyle BackColor="#C2A47B" />
         </asp:GridView>
         <asp:SqlDataSource ID="produktyDataSrsc" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             DeleteCommand="DELETE FROM produkty Where produktID = @produktID" SelectCommand="SELECT        *
FROM            produkty" UpdateCommand="UPDATE produkty SET nazwa = @nazwa, kategoria = @kategoria, grupa = @grupa, podgrupa = @podgrupa, cena = @cena, dostepnosc = @dostepnosc, model = @model
WHERE produktID = @produktID">
             <DeleteParameters>
                 <asp:Parameter Name="produktID" />
             </DeleteParameters>
             <UpdateParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="kategoria" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="podgrupa" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="dostepnosc" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="produktID" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <br />
         Dodaj produkt<br />
       <div style='width:600px;'>  <table style='background:orange;'>
             <tr>
                 <td>
                     Nazwa</td>
                 <td>
                     model</td>
                 <td>
                     cena</td>
                 <td>
                     kategoria</td>
                 <td>
                     grupa</td>
                 <td>
                     podgrupa</td>
                 <td>
                     dostepnosc</td>
                 <td>
                     miniaturka</td>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td>
                     <asp:TextBox ID="TextBoxnazwa" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxmodel" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxcena" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxkat" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxgrp" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxpgrp" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TextBoxdost" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUploadmin" runat="server" />
                 </td>
                 <td>
                     <asp:Button ID="Button1" runat="server" Text="Dodaj" onclick="Button1_Click" 
                         PostBackUrl="~/administracja.aspx" />
                 </td>
             </tr>
         </table></div>
         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             InsertCommand="INSERT INTO produkty(nazwa, model, cena,kategoria , grupa, podgrupa, dostepnosc) VALUES (@nazwa, @model, @cena,@kategoria, @grupa, @podgrupa, @dostepnosc)" 
             SelectCommand="select TOP 1 * from produkty">
             <InsertParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="kategoria" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="podgrupa" />
                 <asp:Parameter Name="dostepnosc" />
             </InsertParameters>
         </asp:SqlDataSource>
</div>
 </div>

</asp:Content>
