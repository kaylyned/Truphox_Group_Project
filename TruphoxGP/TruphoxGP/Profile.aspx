<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TruphoxGP.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
                <h1>
                    <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label></h1>
                <div class="btn-group" role="group">
                    <asp:Button ID="btnEdit" CssClass="btn btn-secondary" runat="server" Text="Edit" Width="184px" />
                </div>
            </div>
            <br />
            <div class="row content">
                <div class="leftcolumn">
                    <div class="well">
                        <h2>Recently Added</h2>
                        <div class="row">
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo" data-toggle="collapse">
                                    <asp:Image ID="imgRecent" runat="server" src="" class="img-circle person" Width="255" Height="255" />
                                </a>
                                <div id="demo" class="collapse">
                                    <p><asp:Label ID="lblpostID" runat="server" Text=""></asp:Label></p>
                                    <p>
                                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblSubTitle" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo2" data-toggle="collapse">
                                    <asp:Image ID="imgRecent2" runat="server" src="" class="img-circle person" Width="255" Height="255" />
                                </a>
                                <div id="demo2" class="collapse">
                                        <p><asp:Label ID="lblpostID2" runat="server" Text=""></asp:Label></p>
                                    <p>
                                        <asp:Label ID="lblTitle2" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblSubTitle2" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblDateCreated2" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <br>
                                <a href="#demo3" data-toggle="collapse">
                                    <asp:Image ID="imgRecent3" runat="server" src="" class="img-circle person" Width="255" Height="255" />
                                </a>
                                <div id="demo3" class="collapse">
                                        <p><asp:Label ID="lblpostID3" runat="server" Text=""></asp:Label></p>
                                    <p>
                                        <asp:Label ID="lblTitle3" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblSubTitle3" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblDateCreated3" runat="server" Text=""></asp:Label>
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
                            <li><a data-toggle="tab" href="#menu3">LITERATURE</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active">
                                <h2>ARTWORK</h2>
                                <asp:DataList ID="dlArt" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                                        <br />
                                        <asp:ImageButton ID="ibArt" runat="server" ImageUrl='<%#Eval("artLink") %>' CssClass="ATrendImages" />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h2>PHOTOGRAPHY</h2>
                                <asp:DataList ID="dlPhotots" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                                        <br />
                                        <asp:ImageButton ID="ibPhotography" runat="server" ImageUrl='<%#Eval("photoLink") %>' CssClass="ATrendImages" />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h2>VIDEOS</h2>
                                <asp:DataList ID="dlVideos" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                                        <br />
                                        <asp:ImageButton ID="ibVideos" runat="server" ImageUrl='<%#Eval("videoLink") %>' CssClass="ATrendImages" />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div id="menu3" class="tab-pane fade">
                                <h2>LITERATURE</h2>
                                <asp:DataList ID="dlWritting" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWpostID" runat="server" Text='<%#Eval("postID") %>'></asp:Label>
                                        <br />
                                        <asp:ImageButton ID="ibWritting" runat="server" ImageUrl='<%#Eval("writingText") %>' CssClass="ATrendImages" />
                                        <br />
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
                <p><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></p>
                <p><asp:TextBox ID="txtBio" ReadOnly="true" runat="server" style="height: 100px;" TextMode="MultiLine"></asp:TextBox> </p>
                <p><asp:Label ID="lblDOB" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="lblDateJoined" runat="server" Text=""></asp:Label></p>
            </div>
            <div class="well">
                <h3>FOLLOWING</h3>
                <div class="fakeimg">
                    <asp:Image ID="imgFollow" runat="server" />
                    <p><asp:HyperLink ID="hlFollow" runat="server"><asp:Label ID="lblFollow" runat="server" Text=""></asp:Label></asp:HyperLink></p>
                </div>
                <div class="fakeimg">
                      <asp:Image ID="imgFollow2" runat="server" />
                    <p><asp:HyperLink ID="hlFollow2" runat="server"><asp:Label ID="lblFollow2" runat="server" Text=""></asp:Label></asp:HyperLink></p>
                </div>
                <div class="fakeimg">
                     <asp:Image ID="imgFollow3" runat="server" />
                    <p><asp:HyperLink ID="hlFollow3" runat="server"><asp:Label ID="lblFollow3" runat="server" Text=""></asp:Label></asp:HyperLink></p>
                </div>
                <asp:Button ID="btnMore" runat="server" Text="More..." CssClass="btn btn-link" />
            </div>
            <div class="well">
                <h3>OTHER</h3>
                <p>MORE TEXT....</p>
            </div>
        </div>
    </div>
</asp:Content>
