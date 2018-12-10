<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="ForumPost.aspx.cs" Inherits="TruphoxGP.ForumPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <div class="header">
                <h1>PHOX FORUMS</h1>
            </div>
            <div class="well well-lg">
                <h2><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("fourmTitle") %>'></asp:Label></h2>
                <p>
                    <asp:Label ID="lblForums" runat="server" Text='<%#Eval("forumText") %>'></asp:Label>
                </p>
            </div>
                    <div style="padding: 30px">
            <h3 class="text-center">COMMENTS</h3>
            <asp:Panel ID="pnlComments" runat="server" Visible="true">
            <p>This comment section should've been used properly but due to a sad looking database and a lack of enthousastic hard-core talent, it has failed. We are sorry to all of those who just wanted to use this as a way to express hurtful fucking thing and you should keep your oppinions to yourself or only on Twitter.
                If you were going to use this for all of those horrible ratings and/or political issues you just had to share with some random person over the internet, use the fucking twitter... Next time this will be used for better things. Until then....
            </p>
                <p><strong>--Truphox Admin</strong></p>
                <br />
                <asp:Button ID="btnComment" runat="server" Text="Comment" />
            </asp:Panel>
            <br />
            <br />
            <br />
            <div>
                <%-- Div created for grabElementByID in Javascript section. Comments will be loaded here --%>
                <div id="comments">
                </div>
            </div>
        </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>FORUM #1</p>
                <p>FORUM #2</p>
                <p>FORUM #3</p>
            </div>
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
            </div>
        </div>
    </div>
</asp:Content>
