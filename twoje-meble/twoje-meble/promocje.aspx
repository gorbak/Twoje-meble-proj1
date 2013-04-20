<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="promocje.aspx.cs" Inherits="komp.promocje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=zawartosc>
            <div class='produkty szeroko'>
                    <div class=label><label id="Label1" runat=server>Ostatnie Promocje</label></div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="produktID" 
            DataSourceID="sql_ds_1" RepeatColumns="3" CellPadding="4" 
            ForeColor="#333333" ondeletecommand="DataList1_DeleteCommand" HorizontalAlign="Center" 
                        CellSpacing="6" >
<AlternatingItemStyle BackColor="White" Wrap="True" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White"  />
             <ItemTemplate >
             <a class='produkt_link' href='<%# "produkt/" + Eval("produktID") %>'>
            <div style='width:250px;height:100px;position:relative;'>
            <!---\zdjecia\produkty\--->
            <div style='float:left;width:105px;height:100px;max-height:100px;text-align:center;'>
            <asp:Image ID="Image1" runat="server" style='max-height:100px;max-width:100px;' ImageUrl='<%# "zdjecia/produkty/"+Eval("nazwa")+Eval("produktID")+".jpg" %>' />
            </div> 
            <div style='float:left;'>
           
                
                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                <br />
               <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                <br />
                 <div style='position:absolute;bottom:0px;left:105px;'>
                 <asp:Label ID="cenaLabel" runat="server" class='cena' Text='<%# Eval("cena") + " zł"%>' /></div>
              <!---  <asp:Button ID="Koszyk_dodaj" runat="server" 
                    style='position:Absolute;top:128px;right:0px;' Text="Do koszyka" 
                    onclick="Koszyk_dodaj_Click" />--->
                <br />
                </div> 
              </div>
              </a>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SeparatorStyle BackColor="Black" BorderColor="Black" BorderWidth="2px" />
        </asp:DataList>
        <asp:SqlDataSource ID="sql_ds_1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            SelectCommand="SELECT TOP 5 * from produkty ORDER BY produktID DESC" 
            DeleteCommand="DELETE FROM uzytkownicy WHERE (userID = @userID)">
            <DeleteParameters>
                <asp:Parameter Name="userID" />
            </DeleteParameters>
        </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
