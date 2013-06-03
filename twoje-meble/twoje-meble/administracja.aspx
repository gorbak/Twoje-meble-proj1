<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="administracja.aspx.cs" Inherits="komp.administracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript"  src="/jquery-2.0.0.min.js"></script>
<asp:ScriptManager ID="ScriptManager2" runat="server">
             </asp:ScriptManager>

             <script type="text/javascript">

                 function czytajurl(input) {
                     if (input.files && input.files[0]) {
                         var reader = new FileReader();

                         reader.onload = function (e) {
                             $('#podglad').css('background-image', "url(" + e.target.result + ")");
                             $('#podglad').css('background-size', "100%");
                             $('#podglad').css('background-repeat', "no-repeat");
                             $("#obraz_admin_up").html(" ");
                         }
                         reader.readAsDataURL(input.files[0]);
                     }
                 }
             
             </script>

    <div class=zawartosc>

    <div runat=server id=produkty class='produkty'>  <div class=label><label id="Label155" runat=server>Panel Administracyjny</label></div>
<ul id=lista_menu_admina>
<li><a href="1"><div runat='server' id="m_a_1" class='label_menu_admin'>Produkty</div></a></li>
<li><a href="2"><div runat='server' id="m_a_2" class='label_menu_admin'>Użytkownicy</div></a></li>
<li><a href="3"><div runat='server' id="m_a_3" class='label_menu_admin'>Magazyn</div></a></li>
<li><a href="4"><div runat='server' id="m_a_4" class='label_menu_admin'>Kategorie</div></a></li>
</ul>
    </div>
        <div class=formularz>
     <div style=''>

        <div id=uzytkownicy_admin runat='server'>
Użytkownicy

                         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
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
         </ContentTemplate>
         </asp:UpdatePanel>
         </div>

         <div id=produkty_admin runat='server'>
       <br />
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
         
         <asp:SqlDataSource ID="produktyDataSrsc" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             DeleteCommand="DELETE FROM Stan_magazynu Where ID_Magazynu = @produktID" SelectCommand="SELECT        *
FROM            produkty" UpdateCommand="UPDATE produkty SET nazwa = @nazwa, kategoria = @KategoriaID, grupa = @grupa, galeria = @galeria, cena = @cena, dostepnosc = @dostepnosc, model = @model
WHERE produktID = @produktID">
             <DeleteParameters>
                 <asp:Parameter Name="produktID" />
             </DeleteParameters>
             <UpdateParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="KategoriaID" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="galeria" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="dostepnosc" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="produktID" />
             </UpdateParameters>
         </asp:SqlDataSource>
         </ContentTemplate>
         </asp:UpdatePanel>

                 <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
               <div id=produkt_admin_lista runat='server' class='magazyn_admin'>
           <asp:DataList ID="DataList_produkty" runat="server" DataSourceID="SqlDataSource_produkty" 
                 RepeatColumns="3" DataKeyField="ProduktID" 
                 oneditcommand="DS_Produkty_EditCommand" 
                 onupdatecommand="DS_Produkty_UpdateCommand" RepeatDirection="Horizontal" 
                       RepeatLayout="Table" ItemStyle-VerticalAlign="Top" 
                       ondeletecommand="DataList_produkty_DeleteCommand">
                 <EditItemTemplate>
                    <div id="dodaj_przedmiot" style="font-size:16px;border:2px solid #ff7700;margin:5px;border-radius:10px 0;width:200px; position:relative;" class='magazyn edytowany_magazyn'>
                     ProduktID:
                     <asp:Label ID="ProduktIDLabel_e" runat="server" Text='<%# Eval("ProduktID") %>' />
                     <br />
                     Nazwa:
                     <asp:Label ID="nazwaLabel_e" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     Model:
                     <asp:Label ID="modelLabel_e" runat="server" Text='<%# Eval("model") %>' />
            <br />
                    
                     <asp:TextBox ID="iloscLabel_e" runat="server" Text='<%# Eval("opis") %>' />
                     <asp:Button
                         ID="edycja_magazynu_e" runat="server" Text="" style='position:absolute;right:0px;' class='edytuj_magazyn' CommandName="update" />
                     <br />
  
                     </div>
                 </EditItemTemplate>
                 <ItemTemplate>

                 <div class='a_naglowek' style='position:relative;text-align:left !important;'><asp:Label ID="ProduktIDLabel" runat="server" class="label_opis_Admin tytul"  style='margin-left:6px;' Text='<%# Eval("ProduktID") %>' /><div ID="Label3" runat="server" class="label_opis_Admin tytul"  style='position:absolute;top:3px;margin:auto;margin-left:33%;width:60px !important;text-align:center;border-radius:40px 40px 0 0;' ><%# Eval("nazwa_kategorii") %></div> <asp:Button
                         ID="Button1" runat="server" Text="X" class="label_opis_Admin tytul usun"  style='position:absolute;right:2px;top:0px;margin:3px;border-radius:0 20px;width:34px;height:25px;padding-right:7px;' CommandName="delete" /><br /></div>
                  <div id="przedmiot" style="font-size:16px;border:2px solid #ff7700;margin:5px;margin-bottom:30px !important;border-radius:10px 0;width:200px; position:relative;" class='magazyn'>
                  
                 <div style='float:left;height:50px;width:50px;overflow:hidden;padding-right:5px;'> <asp:Image ID="Image1" runat="server" style='max-height:50px;max-width:50px;' ImageUrl='<%# "zdjecia/produkty/"+Eval("nazwa")+Eval("produktID")+".jpg" %>' /></div>
        
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     
                     <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                     <br />
                      <asp:Label ID="cenalabel" runat="server" Text='<%# Eval("cena") %>' />ZŁ
                      <br />
                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("opis") %>' />
                        <br />

                     <asp:Button
                         ID="edycja_magazynu" runat="server" Text="" style='position:absolute;right:0px;' class='edytuj_magazyn' CommandName="edit" />
                     <br />

                     </div>
                 </ItemTemplate>
             </asp:DataList>
                   <asp:SqlDataSource ID="SqlDataSource_produkty" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:CS %>" 
                       DeleteCommand="DELETE * FROM produkty WHERE" 
                       SelectCommand="SELECT        p.*,k.nazwa as nazwa_kategorii
FROM            produkty p, kategoria k
WHERE p.KategoriaID = k.KategoriaID" 
                       
                       UpdateCommand="UPDATE produkty SET nazwa =, model =, cena =, KategoriaID =, ID_Magazynu =, opis =, galeria =">
                   </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 
                 SelectCommand="SELECT P.ProduktID,P.nazwa,P.model,M.ilosc from produkty P,stan_magazynu M where P.ID_Magazynu=M.ID_Magazynu" 
                 
                 UpdateCommand="UPDATE Stan_Magazynu SET ilosc = @ilosc WHERE (ID_Magazynu = @ProduktID_org)">
                 <UpdateParameters>
                     <asp:Parameter Name="ilosc"  Type="String" />
                     <asp:Parameter Name="ProduktID_org"  Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>
               </ContentTemplate>
         </asp:UpdatePanel>
    
          <div class='a_naglowek'><label runat='server' id="label_dodaj_prod" class="label_opis_Admin tytul" style='margin-left:-148px;'>Dodawanie produktu</label><br /></div>
       <div style='width:100%;top:4px;position:relative;'> 
         <div id="dodaj_przedmiot" style="border:2px solid #ff7700;border-radius:10px 0;width:300px;height:215px; position:relative;">
            <div class='mini_obraz' id=podglad style="float:left;width:100px;height:100px;overflow:hidden; font-size:16px;">
          
            <label id=obraz_admin_up>Brak Obrazu </label>
    <asp:FileUpload ID="FileUploadmin" runat="server" name="plik2" type="file" CssClass='upload_admin' onchange="czytajurl(this);"/>
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
                              
                        <asp:Button ID="button_dodaj_produkt" runat="server" class='styl-1' 
                 style='width:100%;border:0px;left:0px;border-radius:0 0 7px 0px;bottom:0px;position:absolute;bottom:-2px;' 
                 Text="Dodaj Produkt" onclick="button_dodaj_produkt_Click" 
                         PostBackUrl="~/admin/" />

                <label class=label_opis_Admin style='margin-left:2px;'>Opis</label>  <asp:TextBox ID="text_opis_admin" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
         </div>

         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             InsertCommand="INSERT INTO produkty(nazwa, model, cena,kategoria , grupa, galeria, dostepnosc) VALUES (@nazwa, @model, @cena,@KategoriaID, @grupa, @galeria, @dostepnosc)" 
             SelectCommand="select TOP 1 * from produkty">
             <InsertParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="model" />
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="KategoriaID" />
                 <asp:Parameter Name="grupa" />
                 <asp:Parameter Name="galeria" />
                 <asp:Parameter Name="dostepnosc" />
             </InsertParameters>
         </asp:SqlDataSource>
          </div>
           
               <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
   

         <div id=magazyn_admin runat='server' class='magazyn_admin'>
             <asp:DataList ID="DataList1_magazyn" runat="server" DataSourceID="DS_magazyn_admin" 
                 RepeatColumns="3" DataKeyField="ProduktID" 
                 oneditcommand="DataList1_EditCommand" 
                 onupdatecommand="DataList1_magazyn_UpdateCommand" 
                 RepeatDirection="Horizontal">
                 <EditItemTemplate>
                    <div id="dodaj_przedmiot" style="font-size:16px;border:2px solid #ff7700;margin:5px;border-radius:10px 0;width:200px; position:relative;" class='magazyn edytowany_magazyn'>
                     ProduktID:
                     <asp:Label ID="ProduktIDLabel_e" runat="server" Text='<%# Eval("ProduktID") %>' />
                     <br />
                     Nazwa:
                     <asp:Label ID="nazwaLabel_e" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     Model:
                     <asp:Label ID="modelLabel_e" runat="server" Text='<%# Eval("model") %>' />
            <br />
                     Ilość:
                     <asp:TextBox ID="iloscLabel_e" runat="server" Text='<%# Eval("ilosc") %>' />
                     <asp:Button
                         ID="edycja_magazynu_e" runat="server" Text="" style='position:absolute;right:0px;' class='edytuj_magazyn' CommandName="update" />
                     <br />
  
                     </div>
                 </EditItemTemplate>
                 <ItemTemplate>
                  <div id="dodaj_przedmiot" style="font-size:16px;border:2px solid #ff7700;margin:5px;border-radius:10px 0;width:200px; position:relative;" class='magazyn'>
                     ProduktID:
                     <asp:Label ID="ProduktIDLabel" runat="server" Text='<%# Eval("ProduktID") %>' />
                     <br />
                     Nazwa:
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     Model:
                     <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
<br />
                     Ilość:
                     <asp:Label ID="iloscLabel" runat="server" Text='<%# Eval("ilosc") %>' />
                     <asp:Button
                         ID="edycja_magazynu" runat="server" Text="" style='position:absolute;right:0px;' class='edytuj_magazyn' CommandName="edit" />
                     <br />
  
                     </div>
                 </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="DS_magazyn_admin" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 
                 SelectCommand="SELECT P.ProduktID,P.nazwa,P.model,M.ilosc from produkty P,stan_magazynu M where P.ID_Magazynu=M.ID_Magazynu" 
                 
                 UpdateCommand="UPDATE Stan_Magazynu SET ilosc = @ilosc WHERE (ID_Magazynu = @ProduktID_org)">
                 <UpdateParameters>
                     <asp:Parameter Name="ilosc"  Type="String" />
                     <asp:Parameter Name="ProduktID_org"  Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>

                     </ContentTemplate>
        </asp:UpdatePanel>

              <div id=kategorie_admin_menu runat='server' class='magazyn_admin'>
         Kategorie
                           <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                 BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                 CellPadding="2" DataKeyNames="KategoriaID" 
                 DataSourceID="sql_kategorie_admin" ForeColor="Black" GridLines="None">
                 <AlternatingRowStyle BackColor="PaleGoldenrod" />
                 <Columns>
                     <asp:BoundField DataField="KategoriaID" HeaderText="KategoriaID" 
                         InsertVisible="False" ReadOnly="True" SortExpression="KategoriaID" />
                     <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                     <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
                     <asp:BoundField DataField="obraz" HeaderText="obraz" SortExpression="obraz" />
                     <asp:CommandField ButtonType="Button" CancelText="Przerwij" DeleteText="Usuń" 
                     EditText="Zmień" HeaderText="Edycja" SelectText="Wybierz" 
                     ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" 
                     UpdateText="Aktualizuj" />
                 </Columns>
                 <FooterStyle BackColor="Tan" />
                 <HeaderStyle BackColor="Orange" Font-Bold="True" />
                 <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                     HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                 <SortedAscendingCellStyle BackColor="#FAFAE7" />
                 <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                 <SortedDescendingCellStyle BackColor="#E1DB9C" />
                 <SortedDescendingHeaderStyle BackColor="#C2A47B" />
             </asp:GridView>
             <asp:SqlDataSource ID="sql_kategorie_admin" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 DeleteCommand="DELETE FROM Kategoria WHERE (KategoriaID = @KategoriaID)" 
                 SelectCommand="SELECT * FROM Kategoria" 
                 UpdateCommand="UPDATE Kategoria SET nazwa = @nazwa, opis = @opis, obraz = @obraz
                 WHERE (KategoriaID = @KategoriaID)">
                 <DeleteParameters>
                     <asp:Parameter Name="KategoriaID" />
                 </DeleteParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="nazwa" />
                     <asp:Parameter Name="opis" />
                     <asp:Parameter Name="obraz" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         <br />
        </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
 </div></div>

</asp:Content>
