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
              <asp:DataList ID="dlUnity" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="dlATrend" DataKeyField="postID" OnItemCommand="dlUnity_ItemCommand">
                  <ItemTemplate>
                   <asp:Label ID="lblPostID" runat="server" Text='<%#Eval("postID") %>' ></asp:Label>
                     <br />
                      <asp:ImageButton ID="imgSearch" CommandName="Select" runat="server" ImageUrl='<%#Eval("image") %>' />
                  </ItemTemplate>
              </asp:DataList>

              <asp:DataList ID="dlUserSearch" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="dlATrend" DataKeyField="username" OnItemCommand="dlUserSearch_ItemCommand">
                  <ItemTemplate>
                   <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("username") %>' ></asp:Label>
                     <br />
                      <asp:ImageButton ID="imgUser" CommandName="Select" runat="server" ImageUrl='<%#Eval("profileImage") %>' />
                  </ItemTemplate>
              </asp:DataList>
                    <br>
                    <asp:Label ID="lblNotFound" runat="server" Visible="false" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>MORE POSTS.... IN A DATALIST</p>
            </div>
        </div>
    </div>
</asp:Content>
