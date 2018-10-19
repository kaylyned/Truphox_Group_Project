<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TruphoxGP.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
                <h1>PROFILE</h1>
                <div class="btn-group" role="group">
                    <asp:Button ID="btnLogout" CssClass="btn btn-secondary" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                    <asp:Button ID="btnEdit" CssClass="btn btn-secondary" runat="server" Text="Edit" />
                    <asp:Panel runat="server" Visible="false">
                        <asp:Button ID="btnFollow" CssClass="btn btn-secondary" runat="server" Text="Follow" />
                    </asp:Panel>
                </div>
            </div>
            <br />
            <div class="row content">
                <div class="leftcolumn">
                    <div class="well">
                        <h2>Recently Added</h2>
                        <h5>SOME DESCRIPTION, 2018</h5>
                        <div class="row">
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo" data-toggle="collapse">
                                    <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                                </a>
                                <div id="demo" class="collapse">
                                    <p>
                                        <input id="Text1" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text2" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text3" type="text" />
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo2" data-toggle="collapse">
                                    <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                                </a>
                                <div id="demo2" class="collapse">
                                    <p>
                                        <input id="Text4" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text5" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text6" type="text" />
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo3" data-toggle="collapse">
                                    <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                                </a>
                                <div id="demo3" class="collapse">
                                    <p>
                                        <input id="Text7" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text8" type="text" />
                                    </p>
                                    <p>
                                        <input id="Text9" type="text" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div style="padding: 30px">
                        <h3 class="text-center">POSTS</h3>
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">ART</a></li>
                            <li><a data-toggle="tab" href="#menu1">PHOTOGRAPHY</a></li>
                            <li><a data-toggle="tab" href="#menu2">VIDEO</a></li>
                            <li><a data-toggle="tab" href="#menu3">WRITTING</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active">
                                <h2>ARTWORK</h2>
                                <p>Your creative adventures are here!</p>
                                <asp:DataList ID="dlArt" runat="server">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibArt" runat="server" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h2>PHOTOGRAPHY</h2>
                                <p>Are you sure you didn't just grab this from Google images like the rest of us?</p>
                                <asp:DataList ID="dlPhotots" runat="server">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibPhotography" runat="server" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h2>VIDEOS</h2>
                                <p>You did something stupid? It's posted here!</p>
                                <asp:DataList ID="dlVideos" runat="server">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibVideos" runat="server" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu3" class="tab-pane fade">
                                <h2>WRITTING</h2>
                                <p>What inspired you to write that book? Post it here!</p>
                                <asp:DataList ID="dlWritting" runat="server">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibWrite" runat="server" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-10">
                <div class="well">
                    <p>WORDS</p>
                </div>
                <div class="well">
                    <p>WORDS</p>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h2>TITLE</h2>
                <div class="fakeimg" style="height: 100px;">Image</div>
                <p>some info bla bla bla</p>
            </div>
            <div class="well">
                <h3>TITLE</h3>
                <div class="fakeimg">
                    <p>Image</p>
                </div>
                <div class="fakeimg">
                    <p>Image</p>
                </div>
                <div class="fakeimg">
                    <p>Image</p>
                </div>
            </div>
            <div class="well">
                <h3>TITLE</h3>
                <p>MORE TEXT....</p>
            </div>
        </div>
    </div>
</asp:Content>
