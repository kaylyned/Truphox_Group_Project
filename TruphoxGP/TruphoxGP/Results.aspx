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
              <asp:DataList ID="dlSearchResult" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="dlATrend" DataKeyField="postID" OnItemCommand="dlSearchResult_ItemCommand">
                  <ItemTemplate>
                   <asp:Label ID="lblpostID" runat="server" Text='<%#Eval("postID") %>' ></asp:Label>
                     <br />
                      <asp:ImageButton ID="imgSearch" CommandName="Select" runat="server" ImageUrl='<%#Eval("image") %>' />
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
                <h3>MORE FROM TRUPHOX</h3>
                <p>MORE POSTS.... IN A DATALIST</p>
            </div>
        </div>
    </div>
</asp:Content>
