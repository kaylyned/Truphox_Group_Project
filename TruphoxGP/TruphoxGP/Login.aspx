<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TruphoxGP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h2 class="loginHeader">Login</h2>
    <table class="LoginTable">
        <tr>
            <td>
                Username:
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    <br />
    <asp:CheckBox ID="chkRememberMe" runat="server" />
    <br />
    <asp:Label ID="lblRegister" runat="server" Text="Don't have an account? Register!"></asp:Label>
    <br />
    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <br />
    <asp:Label ID="lblRecover" runat="server" Text="Forgot your username or password? Recover your password by clicking the button below."></asp:Label>
    <br />
    <asp:Button ID="btnRecover" runat="server" Text="Recover Username/Password" OnClick="btnRecover_Click" />
</asp:Content>
