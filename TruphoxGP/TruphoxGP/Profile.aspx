<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TruphoxGP.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <h1>PROFILE</h1>
        <p>Some kinds of info.... bla bla bla.... </p>

    </div>
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
                <h2>SOME TITLE</h2>
                <h5>SOME DESCRIPTION, 2018</h5>
                <div class="row">
                    <div class="col-sm-4">
                        <p class="text-center"><strong>Name</strong></p>
                        <br>
                        <a href="#demo" data-toggle="collapse">
                            <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo" class="collapse">
                            <p><input id="Text1" type="text" /></p>
                            <p><input id="Text2" type="text" /></p>
                            <p><input id="Text3" type="text" /></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <p class="text-center"><strong>Name</strong></p>
                        <br>
                        <a href="#demo2" data-toggle="collapse">
                            <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo2" class="collapse">
                            <p><input id="Text4" type="text" /></p>
                            <p><input id="Text5" type="text" /></p>
                            <p><input id="Text6" type="text" /></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <p class="text-center"><strong>Name</strong></p>
                        <br>
                        <a href="#demo3" data-toggle="collapse">
                            <img src="Images/profilePict.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
                        </a>
                        <div id="demo3" class="collapse">
                            <p><input id="Text7" type="text" /></p>
                            <p><input id="Text8" type="text" /></p>
                            <p><input id="Text9" type="text" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <br />
           <h3 class="text-center">From The Blog</h3>  
            <p>a whole wack of more text this is so much fun... </p>
        </div>
    </div>
    <div class="rightcolumn">
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
    </div>
</asp:Content>
