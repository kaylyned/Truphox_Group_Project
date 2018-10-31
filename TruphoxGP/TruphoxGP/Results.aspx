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
              <asp:DataList ID="dlSearchResult" runat="server">
                  <ItemTemplate>
                      <asp:ImageButton ID="imgSearch" runat="server" ImageUrl='<%#Eval("image") %>' />
                  </ItemTemplate>
              </asp:DataList>
                    <br>
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
