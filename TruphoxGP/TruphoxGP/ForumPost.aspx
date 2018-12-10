<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="ForumPost.aspx.cs" Inherits="TruphoxGP.ForumPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <div class="header">
                <h1>PHOX FORUMS</h1>
            </div>
            <div class="well well-lg">

            </div>

            <div class="col-sm-4">
                <div class="well">
                    <h3>MORE FROM TRUPHOX</h3>
                    <p>FORUM #1</p>
                    <p>FORUM #2</p>
                    <p>FORUM #3</p>
                </div>
                <div class="well">
                    <h3>MORE FROM TRUPHOX</h3>
                    <p>
                        <%-- <asp:datalist id="dlUnion" runat="server" datakeyfield="postID" onitemcommand="dlUnion_ItemCommand" repeatcolumns="3" repeatdirection="Horizontal">
                        <ItemTemplate>                         
                            <asp:ImageButton runat="server" ImageUrl='<%#Eval("Images") %>' CssClass="img-circle" height="90px" max-width="90px"  CommandName="post" />
                             <asp:Label ID="lblType" runat="server" Text='<%#Eval("type") %>' visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:datalist>--%>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
