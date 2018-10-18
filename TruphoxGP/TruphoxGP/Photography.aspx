<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Photography.aspx.cs" Inherits="TruphoxGP.Photography" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="band" class="container text-center">
        <h3>PHOTOGRAPHY</h3>
        <asp:DataList ID="dlPhotoTrending" runat="server">
            <ItemTemplate>
                  <asp:ImageButton ID="imgATrend" runat="server" ImageUrl='<%#Eval("photoLink") %>' />
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("photoTitle") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlPhotoRecent" runat="server">
               <ItemTemplate>
                 <asp:ImageButton ID="imgATrend" runat="server" ImageUrl='<%#Eval("photoLink") %>' />
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("photoTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlPhotoFav" runat="server">
               <ItemTemplate>
                 <asp:ImageButton ID="imgATrend" runat="server" ImageUrl='<%#Eval("photoLink") %>' />
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("photoTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
