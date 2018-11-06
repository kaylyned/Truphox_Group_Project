<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="submitArt.aspx.cs" Inherits="TruphoxGP.submitArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h3>ARTWORK</h3>
        <div style="padding: 30px">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">ART</a></li>
                <li><a data-toggle="tab" href="#menu2">VIDEO</a></li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h2>ARTWORK</h2>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblFU" runat="server" Text="Choose a file to upload"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="fuArt" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTitle" runat="server" Text="Art Title"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSub" runat="server" Text="Art Subtitle"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubtitle" runat="server" Width="242px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Does your forum contain mature content?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rblMature" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblMature_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Yes </asp:ListItem>
                                    <asp:ListItem Value="2"> No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblMature" runat="server" Text="This post has mature content and will only be viewed by people over 16." Visible="false"></asp:Label>
                    <br />
                    <asp:Button ID="btnSubmitArt" runat="server" Text="Submit Thread" OnClick="btnSubmitArt_Click" />
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h2>STUFF</h2>
                    <asp:DataList ID="dlVideos" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" DataKeyField="postID" CssClass="profileDL">
                    </asp:DataList>
                </div>
            </div>
        </div>



    </div>
</asp:Content>
