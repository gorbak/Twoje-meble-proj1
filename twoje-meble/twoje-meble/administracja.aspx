<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="administracja.aspx.cs" Inherits="komp.administracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>

    <div runat=server id=produkty class='produkty'>  <div class=label><label id="Label155" runat=server>Panel Administracyjny</label></div>
<ul id=lista_menu_admina>
<li><a href="1"><div runat='server' id="m_a_1" class='label_menu_admin'>Produkty</div></a></li>
<li><a href="2"><div runat='server' id="m_a_2" class='label_menu_admin'>Użytkownicy</div></a></li>
<li><a href="3"><div runat='server' id="m_a_3" class='label_menu_admin'>Magazyn</div></a></li>
</ul>
    </div>
        <div class=formularz>
     <div style=''>

        <div id=uzytkownicy_admin runat='server'>
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

         </div>
         <div id=produkty_admin runat='server'>
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
                 <asp:BoundField DataField="KategoriaID" HeaderText="kategoria" SortExpression="KategoriaID" />
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
FROM            produkty" UpdateCommand="UPDATE produkty SET nazwa = @nazwa, kategoria = @KategoriaID, grupa = @grupa, podgrupa = @podgrupa, cena = @cena, dostepnosc = @dostepnosc, model = @model
WHERE produktID = @produktID">
             <DeleteParameters>
                 <asp:Parameter Name="produktID" />
             </DeleteParameters>
             <UpdateParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="KategoriaID" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="podgrupa" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="dostepnosc" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="produktID" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <br />
        
          <div class='a_naglowek'><label runat='server' id="label_dodaj_prod" class="label_opis_Admin tytul" style='margin-left:-148px;'>Dodawanie produktu</label><br /></div>
       <div style='width:100%;top:4px;position:relative;'> 
         <div id="dodaj_przedmiot" style="border:2px solid #ff7700;border-radius:10px 0;width:300px;height:215px; position:relative;">
            <div class='mini_obraz' style="float:left;width:100px;height:100px;overflow:hidden;">
            <label id=obraz_admin_up>Brak Obrazu </label>
    <asp:FileUpload ID="FileUploadmin" runat="server" name="plik2" type="file" CssClass='upload_admin'/>
            </div>
            <div  style="float:left;width:200px;height:115px;overflow:hidden;">

           
                <table style="width: 100%" id=opis_admin_produkt>
                    <tr>
                        <td>
                            <label class=label_opis_Admin>Nazwa</label>
                            <asp:TextBox  ID="TextBoxnazwa" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class=label_opis_Admin>Model</label>
                            <asp:TextBox ID="TextBoxmodel" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <div style='float:left;width:70px;'><label class=label_opis_Admin>Cena</label>
                            <asp:TextBox ID="TextBoxcena" runat="server" style='width:70px;'></asp:TextBox></div>
                            <div style='float:right;width:110px;text-align:right;'><label class=label_opis_Admin style='border-radius:0 20px;'>Kategoria</label>
                                <asp:DropDownList ID="DropDownkat" 
                                    style='margin-right:0px;width:90px;border-radius:10px 0;' runat="server" 
                                    DataSourceID="SqlDataSource2_dropdownlista" DataTextField="nazwa" 
                                    DataValueField="KategoriaID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2_dropdownlista" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                                    SelectCommand="SELECT * FROM [Kategoria]"></asp:SqlDataSource>
                        </div>
                        </td>

                    </tr>
                </table>

            </div>
                              
                        <asp:Button ID="Button1" runat="server" class='styl-1' 
                 style='width:100%;border:0px;left:0px;border-radius:0 0 7px 0px;bottom:0px;position:absolute;bottom:-2px;' 
                 Text="Dodaj Produkt" onclick="Button1_Click" 
                         PostBackUrl="~/admin/" />

                <label class=label_opis_Admin style='margin-left:2px;'>Opis</label>  <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
         </div>
         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             InsertCommand="INSERT INTO produkty(nazwa, model, cena,kategoria , grupa, podgrupa, dostepnosc) VALUES (@nazwa, @model, @cena,@KategoriaID, @grupa, @podgrupa, @dostepnosc)" 
             SelectCommand="select TOP 1 * from produkty">
             <InsertParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="KategoriaID" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="podgrupa" />
                 <asp:Parameter Name="dostepnosc" />
             </InsertParameters>
         </asp:SqlDataSource>
          </div>
         <div id=magazyn_admin runat='server'>
             <asp:DataList ID="DataList1" runat="server" DataSourceID="DS_magazyn_admin" 
                 RepeatColumns="4" DataKeyField="ProduktID">
                 <ItemTemplate>
                     ProduktID:
                     <asp:Label ID="ProduktIDLabel" runat="server" Text='<%# Eval("ProduktID") %>' />
                     <br />
                     nazwa:
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     model:
                     <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
<br />
                     ilosc:
                     <asp:Label ID="iloscLabel" runat="server" Text='<%# Eval("ilosc") %>' />
                     <br />
                     <br />
                 </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="DS_magazyn_admin" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 SelectCommand="SELECT P.ProduktID,P.nazwa,P.model,M.ilosc from produkty P,stan_magazynu M where P.ID_Magazynu=M.ID_Magazynu"></asp:SqlDataSource>
         </div>
</div>
 </div></div>

</asp:Content>
