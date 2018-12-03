<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="TruphoxGP.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
            </div>
            <br />
            <div class="row content">
                <div class="leftcolumn">
                    <asp:DataList ID="dlUnity" runat="server"  RepeatColumns="3" CssClass="" DataKeyField="postID" OnItemCommand="dlUnity_ItemCommand"  Width="791px">
                        <ItemTemplate>
                            <div class="header">
                            <asp:Label ID="lblPostID" runat="server" Text='<%#Eval("postID") %>' Visible="false"></asp:Label>
                            <h1><asp:Button ID="btnSelect" runat="server" Text='<%#Eval("postTitle") %>' CommandName="Select" CssClass="SearchHL" /></h1>
                          
<%--       <asp:ImageButton ID="imgSearch" CommandName="Select" runat="server" ImageUrl='<%#Eval("Images") %>' />--%>
                                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:DataList ID="dlUserSearch" runat="server" RepeatColumns="3" DataKeyField="username" OnItemCommand="dlUserSearch_ItemCommand" Width="791px">
                        <ItemTemplate>
                            <div class="header">
                                <asp:ImageButton ID="imgUser" CommandName="Select" runat="server" ImageUrl='<%#Eval("profileImage") %>' CssClass="img-circle person" Width="255" Height="255" />
                                <h1><asp:Label ID="lblUsername" runat="server" Text='<%#Eval("username") %>'></asp:Label></h1>
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <br>
                    <asp:Label ID="lblNotFound" runat="server" Visible="false" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
