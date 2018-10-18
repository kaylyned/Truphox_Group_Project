<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="TruphoxGP.Art" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="band" class="container text-center">
        <h3>ARTWORK</h3>
        <hr />        
        <asp:DataList ID="dlArtTrending" runat="server" Width="788px">
            <ItemTemplate>
               <asp:Label ID="lblpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                <asp:ImageButton ID="imgATrend" runat="server" ImageUrl='<%#Eval("artLink") %>' />
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <hr />
        <asp:DataList ID="dlArtRecent" runat="server" Width="791px">
               <ItemTemplate>
                <asp:ImageButton ID="imgARecent" runat="server" ImageUrl='<%#Eval("artLink") %>' />
                <br />
                <asp:Label ID="lblARecent" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
        <hr />
        <asp:DataList ID="dlArtFav" runat="server" Width="787px">
               <ItemTemplate>
              <asp:ImageButton ID="imgAFav" runat="server" ImageUrl='<%#Eval("artLink") %>' />
                <br />
                <asp:Label ID="lblAFav" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
