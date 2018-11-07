﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="submitPhotography.aspx.cs" Inherits="TruphoxGP.submitPhotography" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid text-center">
        <h3>PHOTOGRAPHY</h3>
        <div style="padding: 30px">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Photography</a></li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h2>PHOTOGRAPHY</h2>
                     <asp:Label ID="lblFU" runat="server" Text="Choose a file to upload "></asp:Label>
                    <br />
                       <asp:FileUpload ID="fuPhotography" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblTitle" runat="server" Text="Photography Title"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtTitle" runat="server" Width="240px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblSub" runat="server" Text="Photography Subtitle"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtSubtitle" runat="server" Width="242px"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" Text="Does your image contain mature content?"></asp:Label>
                    <asp:RadioButtonList ID="rblMature" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Yes </asp:ListItem>
                        <asp:ListItem Value="2"> No</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblMature" runat="server" Text="This post has mature content and will only be viewed by people over 16." Visible="false"></asp:Label>
                    <br />
                    <asp:Button ID="btnSubmitPhotography" runat="server" Text="Submit Thread" OnClick="btnSubmitPhotography_Click" />
                </div>
            </div>
        </div>



    </div>
</asp:Content>
