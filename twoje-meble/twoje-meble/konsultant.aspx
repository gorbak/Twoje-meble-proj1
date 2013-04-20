<%@ Page Title="" Language="C#" MasterPageFile="~/tlo.Master" AutoEventWireup="true" CodeBehind="konsultant.aspx.cs" Inherits="komp.konsultant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        Napisz wiadomość:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Wyślij" />
                    </td>
                </tr>
            </table>


        </div>
    </div>
</asp:Content>
