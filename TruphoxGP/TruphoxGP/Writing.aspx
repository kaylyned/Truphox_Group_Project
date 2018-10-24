<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Writing.aspx.cs" Inherits="TruphoxGP.Writing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="band" class="container text-center">
        <h3>PHOX FORMS</h3>
        <asp:DataList ID="dlWriteTrending" runat="server">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%#Eval("writingTitle") %>'></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%#Eval("writingSubTitle") %>'></asp:Label>
                <br />
                <asp:Label ID="lblATrend" runat="server" Text='<%#Eval("writingText") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlWriteRecent" runat="server">
            <ItemTemplate></ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlWriteFav" runat="server">
            <ItemTemplate></ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
