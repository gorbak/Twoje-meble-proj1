<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="szukaj.aspx.cs" Inherits="komp.szukaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class=zawartosc>
        <div runat=server id=produkty class='produkty'>

1`        
        <div class=label><label id="Label155" runat=server></label></div>
        <div id="div_labelxx" runat=server><br /><div id="div_labelxyx" class='label info'  ><label id="Labelxx" runat=server></label></div></div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="produktID" 
            DataSourceID="SqlDataSource12" RepeatColumns="5" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center" CellSpacing="16">
            <AlternatingItemStyle BackColor="Black" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="Black" BorderColor="Black" />
          <ItemTemplate >
  <a class='produkt_link' href='<%# "/produkt/" + Eval("produktID") %>'>
            <div class='produkty-lista' style='width:230px;height:100px;position:relative;'>
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
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            
                SelectCommand="SELECT * FROM [produkty] WHERE (([nazwa] LIKE '%' + @nazwa + '%') OR ([model] LIKE '%' + @model + '%'))">
            <SelectParameters>
                <asp:QueryStringParameter Name="nazwa" QueryStringField="q" Type="String" />
                <asp:QueryStringParameter Name="model" QueryStringField="q" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>

         
            </div>
    </div>

</asp:Content>