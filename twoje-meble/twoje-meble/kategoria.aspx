<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="kategoria.aspx.cs" Inherits="komp.kategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>
   

        <div class='produkty'>
        <div class=label><label id="Labelglowny" runat=server></label></div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="produktID" 
            DataSourceID="SqlDataSource1" RepeatColumns="3" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center"  CellSpacing="16">
            <AlternatingItemStyle />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle  BorderColor="Black" />
            <ItemTemplate>
               <a class='produkt_link' href='<%# "/produkt/" + Eval("produktID") %>'>
            <div class='produkty-lista' style='width:230px;height:160px;position:relative;'>
            <!---\zdjecia\produkty\--->
            <div style='margin:auto;width:105px;min-height:105px;max-height:105px;text-align:center;top:5px;'>
            <asp:Image ID="Image1" runat="server" style='max-height:100px;max-width:100px;' ImageUrl='<%# "zdjecia/produkty/"+Eval("nazwa")+Eval("produktID")+".jpg" %>' />
            </div> 
            <div class='wstazka' style='float:left;'>
           
              
                <asp:Label ID="nazwaLabel" class='nazwa-lista' runat="server" Text='<%# Eval("nazwa") %>' />
           
               <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
             
                     <div style='top:12px;float:right;padding-right:18px;'>
                 <asp:Label ID="cenaLabel" runat="server" class='cena' Text='<%# Eval("cena") + " zł"%>' /></div>


                </div> 
                <br />
              </div>
              </a>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            SelectCommand="SELECT * FROM produkty WHERE (KategoriaID = @KategoriaID)">
            <SelectParameters>
                 <asp:RouteParameter Name="KategoriaID" RouteKey="kategoria" 
                    Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>

            </div>
    </div>


</asp:Content>
