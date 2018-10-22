<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="TruphoxGP.Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
                <h1>POST</h1>
            </div>
            <br />
            <div class="row content">
                <div class="leftcolumn">
                    <asp:Label ID="lblPostTitle" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="lblPostSubtitle" runat="server" Text=""></asp:Label>

                    <%-- Artwork --%>
                    <asp:Panel ID="pnlArtwork" runat="server" Visible="false">
                        <asp:Image ID="imgArtwork" runat="server" />
                    </asp:Panel>

                    <%-- Writing --%>
                    <asp:Panel ID="pnlWriting" runat="server" Visible="false">
                    </asp:Panel>

                    <%-- Photography --%>
                    <asp:Panel ID="pnlPhotography" runat="server" Visible="false">
                    </asp:Panel>

                    <%-- Video --%>
                    <asp:Panel ID="pnlVideo" runat="server" Visible="false">
                    </asp:Panel>

                    <div class="row">
                        <div class="col-sm-4">
                            <p></p>
                            <br>
                        </div>
                    </div>
                    <br>
                    <div style="padding: 30px">
                        <h3 class="text-center">COMMENTS</h3>
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">RECENT</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active">
                                <h2>COMMENT SYSTEM HERE</h2>
                                <p>COMMENT SYSTEM HERE</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h2>USERNAME</h2>
                <p>Clickable username to see their profile</p>
                <p>user info</p>
                <p>more user info</p>
                <asp:Button ID="btnFollow" runat="server" Text="Follow" CssClass="btn-info" />
            </div>
            <div class="well">
                <h3>MORE FROM USER</h3>
                <p>other post</p>
                <p>other posts</p>
                <p>other post</p>
            </div>
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>MORE POSTS.... IN A DATALIST</p>
            </div>
        </div>
    </div>
</asp:Content>
