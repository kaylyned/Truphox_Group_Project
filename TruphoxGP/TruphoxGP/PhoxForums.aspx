<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="PhoxForums.aspx.cs" Inherits="TruphoxGP.PhoxFourms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <div class="header">
                <h1>PHOX FORUMS</h1>
            </div>
            <asp:Button ID="btnCreate" runat="server" CssClass="btn-info" Text="New Forum" OnClick="btnCreate_Click" />
            <asp:Panel ID="pnlLoginDiv" runat="server" Visible="false">
                <div class="well">
                    <h3>PLEASE LOGIN TO VIEW FORMS</h3>
                  <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-block" OnClick="btnLogin_Click"  Width="500px"/>
                </div>
            </asp:Panel>
            <div class="well">
                <asp:GridView ID="gvForum" runat="server">
                    <Columns>
                        <asp:ButtonField ButtonType="Image" CommandName="user" />
                      <asp:BoundField DataField="date" HeaderText="DatePublished" />
                        <asp:BoundField DataField="Replies" HeaderText="Replies" />
                        <asp:ButtonField ButtonType="Button"  Text="" CommandName="Reply" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Panel runat="server" ID="pnlcreateForum" Visible="false">
                <div class="row content">
                    <div class="leftcolumn">
                        <br>
                        <div style="padding: 30px">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">FORUMS</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="home" class="tab-pane fade in active">
                                    <h2>Title: </h2>
                                    <asp:TextBox ID="txtforumTitle" runat="server"></asp:TextBox>
                                    <h2>Text: </h2>
                                    <asp:TextBox ID="txtForumText" runat="server" Height="100px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                    <br />
                                    Does your forum contain mature content?
                                    <asp:RadioButtonList ID="rblMature" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblMature_SelectedIndexChanged">
                                        <asp:ListItem Value="1">Yes </asp:ListItem>
                                        <asp:ListItem Value="2"> No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblMature" runat="server" Text="This post has mature content and will only be viewed by people over 16." Visible="false"></asp:Label>
                                    <br />
                                    <asp:Button ID="btnSubmitForum" runat="server" Text="Submit Thread" OnClick="btnSubmitForum_Click" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>FORUM #1</p>
                <p>FORUM #2</p>
                <p>FORUM #3</p>
            </div>
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>MORE POSTS.... IN A DATALIST</p>
            </div>
        </div>
    </div>
</asp:Content>
