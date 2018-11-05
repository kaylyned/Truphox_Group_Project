<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TruphoxGP.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <%--  Slide show of some trending art--%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
           <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="abstract.jpg" alt="Art" width="1200" height="700">
        <div class="carousel-caption">
          <h3>ART</h3>
          <p>Share your creative adventures here!</p>
        </div>      
      </div>
        <div class="item">
        <img src="sample2.jpg" alt="Videos" width="1200" height="700">
        <div class="carousel-caption">
          <h3>VIDEO</h3>
          <p>You did something stupid? Post it here!</p>
        </div>      
      </div>
              <div class="item">
        <img src="sample.jpg" alt="Writting" width="1200" height="700">
        <div class="carousel-caption">
          <h3>WRITTING</h3>
          <p>What inspired you to write that book? Post it here!</p>
        </div>      
      </div>
    </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    <div id="band" class="container text-center">
        <h3>WELCOME TO TRUPHOX!</h3>
        <p>A website for even the most novice of artists, videographers and poets. Post your creavity, like and share other ones and join the community that will accept you where ever you are.</p>
    </div>
</asp:Content>
