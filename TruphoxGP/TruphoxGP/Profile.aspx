<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TruphoxGP.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <h1>PROFILE</h1>
        <span class="glyphicon glyphicon-off"> Logout</span><br />
            <span class="glyphicon glyphicon-pencil">Edit </span><br />
        <asp:Button ID="btnFolow" runat="server" Text="Follow" CssClass="glyphicon-user" />
    </div>
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
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
                                <input id="Text1" type="text" /></p>
                            <p>
                                <input id="Text2" type="text" /></p>
                            <p>
                                <input id="Text3" type="text" /></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <br>
                        <a href="#demo2" data-toggle="collapse">
                            <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo2" class="collapse">
                            <p>
                                <input id="Text4" type="text" /></p>
                            <p>
                                <input id="Text5" type="text" /></p>
                            <p>
                                <input id="Text6" type="text" /></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <br>
                        <a href="#demo3" data-toggle="collapse">
                            <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo3" class="collapse">
                            <p>
                                <input id="Text7" type="text" /></p>
                            <p>
                                <input id="Text8" type="text" /></p>
                            <p>
                                <input id="Text9" type="text" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <br>
                 <div style="padding:30px">
            <h3 class="text-center">POSTS</h3>
              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">ART</a></li>
    <li><a data-toggle="tab" href="#menu1">PHOTOGRAPHY</a></li>
    <li><a data-toggle="tab" href="#menu2">VIDEO</a></li>
    <li><a data-toggle="tab" href="#menu3">WRITTING</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>ART</h2>
      <p>Man, we've been on the road for some time now. Looking forward to lorem ipsum.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>PHOTOGRAPHY</h2>
      <p>Always a pleasure people! Hope you enjoyed it as much as I did. Could I BE.. any more pleased?</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>VIDEOS</h2>
      <p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
    </div>
       <div id="menu3" class="tab-pane fade">
      <h2>WRITTING</h2>
      <p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
    </div>
  </div>
</div>
            </div>
        </div>
    <div class="col-sm-2 sidenav">
        <div class="well">
            <p>WORDS</p>
        </div>
         <div class="well">
            <p>WORDS</p>
        </div>
    </div> 
   <%-- <div class="rightcolumn">
        <div class="card">
            <h2>TITLE</h2>
            <div class="fakeimg" style="height: 100px;">Image</div>
            <p>some info bla bla bla</p>
        </div>
        <div class="card">
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
        <div class="card">
            <h3>TITLE</h3>
            <p>MORE TEXT....</p>
        </div>
    </div>--%>
</asp:Content>
