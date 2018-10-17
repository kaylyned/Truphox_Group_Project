<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="TruphoxGP.Art" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="band" class="container text-center">
        <h3>ARTWORK</h3>
        <asp:DataList ID="dlArtTrending" runat="server">
            <ItemTemplate></ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlArtRecent" runat="server">
               <ItemTemplate></ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlArtFav" runat="server">
               <ItemTemplate></ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
