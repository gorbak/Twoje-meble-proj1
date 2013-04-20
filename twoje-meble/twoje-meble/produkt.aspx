<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="produkt.aspx.cs" Inherits="komp.produkt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class=zawartosc>
        <div class='produkty'>
        <div class=label><label id="Label1" runat=server>Wszystkie produkty</label></div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="produktID" 
            DataSourceID="SqlDataSource1" RepeatColumns="5" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center" CellSpacing="6">
            <AlternatingItemStyle BackColor="Black" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="Black" BorderColor="Black" />
           <ItemTemplate >
           
            <div style='width:550px;height:100px;position:relative;' class='styl-1'>
            <!---\zdjecia\produkty\--->
            <div style='float:left;width:105px;height:100px;max-height:100px;text-align:center;' >
            <asp:Image ID="Image1" runat="server" style='max-height:100px;max-width:100px;' ImageUrl='<%# "zdjecia/produkty/"+Eval("nazwa")+Eval("produktID")+".jpg" %>' />
            </div> 
            <div style='float:left;color:#ff7700;' >
           
                

                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                <br />
               <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                <br />
                
               <asp:Label ID="Label2" runat="server"  Text='<%#  Convert.ToBoolean(Eval("dostepnosc")) ? "" : "brak produktu"%>' /></div>
                <br />
                <asp:Label ID="produktIDLabel" Visible=false runat="server" Text='<%# Eval("produktID") %>'></asp:Label>
                <br />
                 <div style='position:absolute;bottom:0px;left:105px;'>
                 <asp:Label ID="cenaLabel" runat="server" class='cena' Text='<%# Eval("cena") + " zł"%>' /></div>
                <br />
                <asp:Button ID="Koszyk_dodaj" runat="server" class=koszyk_dodaj
                    style='position:Absolute;bottom:0px;right:0px;' Text="Do koszyka" visible='<%# Convert.ToBoolean(Eval("dostepnosc")) %>'
                    onclick="Koszyk_dodaj_Click" />
                </div> 
              </div>
           
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            SelectCommand="SELECT * FROM [produkty] WHERE ([produktID] = @produktID)">
            <SelectParameters>
                <asp:RouteParameter Name="produktID" RouteKey="produkt" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            </div>
    </div>

</asp:Content>
