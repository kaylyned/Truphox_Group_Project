﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="TruphoxGP.Art" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="band" class="container text-center">
        <h3>&nbsp;&nbsp;&nbsp; ARTWORK</h3>
        <hr />           
        <asp:DataList ID="dlArtTrending" runat="server" Width="791px" RepeatDirection="Horizontal" OnItemCommand="dlArtTrending_ItemCommand" RepeatColumns="3" CssClass="dlATrend" DataKeyField="postID">
            <ItemTemplate>
               <asp:Label ID="lblpostID" runat="server" Text='<%#Eval("postID") %>' ></asp:Label>
                <br />
                <asp:ImageButton ID="imgATrend" runat="server" ImageUrl='<%#Eval("artLink") %>' CssClass="ATrendImages"/>
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <hr />
        <asp:DataList ID="dlArtRecent" runat="server" Width="791px" RepeatDirection="Horizontal" RepeatColumns="3">
               <ItemTemplate>
                 <asp:Label ID="lblpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                <br />
                <asp:ImageButton ID="imgARecent" runat="server" ImageUrl='<%#Eval("artLink") %>' CssClass="ATrendImages" />
                <br />
                <asp:Label ID="lblARecent" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
        <hr />
        <asp:DataList ID="dlArtFav" runat="server" Width="791px" RepeatDirection="Horizontal" RepeatColumns="3">
               <ItemTemplate>
                <asp:Label ID="lblpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                <br />
              <asp:ImageButton ID="imgAFav" runat="server" ImageUrl='<%#Eval("artLink") %>' CssClass="ATrendImages" />
                <br />
                <asp:Label ID="lblAFav" runat="server" Text='<%#Eval("artTitle") %>'></asp:Label>
               </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
