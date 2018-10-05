<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TruphoxGP.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="header">
        <h1>PROFILE</h1>
        <div class="btn-group" role="group">
            <asp:Button ID="btnLogoutt" runat="server" Text="Logout" CssClass="btn btn-secondary" Height="44px" />
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-secondary" Height="44px" />
           <asp:Panel runat="server" Visible="false" >
               <asp:Button ID="btnFollow" runat="server" Text="Follow" CssClass="btn btn-secondary" Height="44px" />
           </asp:Panel>
        </div>
    </div>
    <div class="container-fluid text-center">
        <div class="row">
            <div class="col-sm-8 text-left">
                <h2>SOME TITLE</h2>
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
                            <p>Share your creative adventures here!</p>
                            <div class="col-sm-2 sidenav">
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <h2>PHOTOGRAPHY</h2>
                            <p>Did you really take that photo? Or did you steel it from Google images like the rest of us?</p>
                            <div class="col-sm-2 sidenav">
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                            </div>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <h2>VIDEOS</h2>
                            <p>You did something stupid? Post it here!</p>
                            <div class="col-sm-2 sidenav">
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                            </div>
                        </div>
                        <div id="menu3" class="tab-pane fade">
                            <h2>WRITTING</h2>
                            <p>What inspired you to write that book? Post it here!</p>
                            <div class="col-sm-2 sidenav">
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                                <div class="well">
                                    <p>WORDS</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightcolumn">
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

    </div>
    <div class="container-fluid">
        <div class="col-lg-">
            <div class="well">
                <p>WORDS</p>
            </div>
            <div class="well">
                <p>WORDS</p>
            </div>
        </div>
    </div>
</asp:Content>
