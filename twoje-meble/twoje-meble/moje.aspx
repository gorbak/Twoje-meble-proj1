<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="moje.aspx.cs" Inherits="komp.moje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class=zawartosc>
  <div class=formularz>
  <div style='width:500px;margin:Auto;margin-top:5px;margin-bottom:5px;'>
    Edycja konta
      <asp:SqlDataSource ID="moje_konto" runat="server" 
          ConnectionString="<%$ ConnectionStrings:CS %>" 
          SelectCommand='SELECT        *
FROM            uzytkownicy
WHERE        login = @login' UpdateCommand="UPDATE uzytkownicy SET imie =@imie, mail =@mail , nazwisko =@nazwisko , login =@login, haslo =@haslo
WHERE login = @login">
          <SelectParameters>
              <asp:SessionParameter Name="login" SessionField="login" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="imie" />
              <asp:Parameter Name="mail" />
              <asp:Parameter Name="nazwisko" />
              <asp:Parameter Name="login" />
              <asp:Parameter Name="haslo" />
          </UpdateParameters>
      </asp:SqlDataSource>

      <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
          DataKeyNames="userID" DataSourceID="moje_konto" ForeColor="#333333" 
          onitemupdated="FormView1_ItemUpdated" onitemupdating="FormView1_ItemUpdating">
          <EditItemTemplate>
              imie:
              <asp:TextBox ID="imieTextBox" runat="server" Text='<%# Bind("imie") %>' />
              <br />
              nazwisko:
              <asp:TextBox ID="nazwiskoTextBox" runat="server" 
                  Text='<%# Bind("nazwisko") %>' />
              <br />
              mail:
              <asp:TextBox ID="mailTextBox" runat="server" Text='<%# Bind("mail") %>' />
              <br />
              login:
              <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
              <br />
              haslo:
              <asp:TextBox ID="hasloTextBox" runat="server" Text='<%# Bind("haslo") %>' />
              <br />
              <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                  CommandName="Update" Text="Zapisz" />
              &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Przerwij" />
          </EditItemTemplate>
          <EditRowStyle BackColor="#CCCCCC" />
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <InsertItemTemplate>
              imie:
              <asp:TextBox ID="imieTextBox" runat="server" Text='<%# Bind("imie") %>' />
              <br />
              nazwisko:
              <asp:TextBox ID="nazwiskoTextBox" runat="server" 
                  Text='<%# Bind("nazwisko") %>' />
              <br />
              mail:
              <asp:TextBox ID="mailTextBox" runat="server" Text='<%# Bind("mail") %>' />
              <br />
              login:
              <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
              <br />
              haslo:
              <asp:TextBox ID="hasloTextBox" runat="server" Text='<%# Bind("haslo") %>' />
              <br />
              uprawnienia:
              <asp:TextBox ID="uprawnieniaTextBox" runat="server" 
                  Text='<%# Bind("uprawnienia") %>' />
              <br />
              <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                  CommandName="Insert" Text="Insert" />
              &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
          </InsertItemTemplate>
          <ItemTemplate>
          <div >
              Login:
              <asp:Label ID="loginLabel" runat="server" Text='<%# Bind("login") %>' />
              <br />
              Imie:
              <asp:Label ID="imieLabel" runat="server" Text='<%# Bind("imie") %>' />
              <br />
              Nazwisko:
              <asp:Label ID="nazwiskoLabel" runat="server" Text='<%# Bind("nazwisko") %>' />
              <br />
              E-mail:
              <asp:Label ID="mailLabel" runat="server" Text='<%# Bind("mail") %>' />
              <br />
              haslo:
              <asp:Label ID="hasloLabel" runat="server" Text='<%# Bind("haslo") %>' />
              <br />
              <asp:Button ID="EdytujButton" runat="server" Text="Edytuj Dane" 
                  CommandName="Edit" />

              </div>
          </ItemTemplate>
          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#FF9900" />
      </asp:FormView>
      </div>
      </div>
 </div>

</asp:Content>
