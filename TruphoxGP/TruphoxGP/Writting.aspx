<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Writting.aspx.cs" Inherits="TruphoxGP.Writting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="band" class="container text-center">
        <h3>Phox Forms</h3>
        <asp:DataList ID="dlWriteTrending" runat="server">
            <ItemTemplate></ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlWriteRecent" runat="server">
               <ItemTemplate></ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlWriteFav" runat="server">
               <ItemTemplate></ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
