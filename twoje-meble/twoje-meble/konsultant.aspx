<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="konsultant.aspx.cs" Inherits="komp.konsultant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
textarea
{
    resize:none;
    overflow:hidden;
    height:100px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=zawartosc>
        <div class='formularz'>


            <table style="width: 100%">
                <tr>
                    <td style="height: 18px">
                    </td>
                    <td style="height: 18px">
                    </td>
                </tr>
                <tr>
                    <td>
                        Twój E-mail:</td>
                    <td>
                        <asp:TextBox ID="T_imie" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Temat</td>
                    <td>
                        <asp:TextBox ID="T_temat" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Wiadomość:</td>
                    <td>
                        <asp:TextBox ID="T_tresc" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="B_wyslij" runat="server" Text="Wyślij" OnClick='Wyslij' />
                    </td>
                </tr>
            </table>
            <asp:Label ID=displaymessage runat=server Visible=false Text=''></asp:Label>

        </div>
    </div>
</asp:Content>
