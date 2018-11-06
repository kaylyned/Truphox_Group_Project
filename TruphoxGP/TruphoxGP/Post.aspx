<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="TruphoxGP.Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
                <h1><asp:label id="lblPostName" runat="server" text=""></asp:label></h1>
            </div>
            <br />
            <div class="row content">
                <div class="leftcolumn">
                    <asp:Label ID="lblPostTitle" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="lblPostSubtitle" runat="server" Text=""></asp:Label>

                    <%-- Artwork --%>
                    <asp:Panel ID="pnlArtwork" runat="server" Visible="false">
                        <asp:Image ID="imgArtwork" runat="server" CssClass="PostImage" />
                    </asp:Panel>

                    <%-- Writing --%>
                    <asp:Panel ID="pnlWriting" runat="server" Visible="false">
                        <p>
                            <asp:Label ID="lblWriting" runat="server" Text=""></asp:Label>
                        </p>
                    </asp:Panel>

                    <%-- Photography --%>
                    <asp:Panel ID="pnlPhotography" runat="server" Visible="false">
                        <asp:Image ID="imgPhotography" runat="server" />
                    </asp:Panel>

                    <%-- Video --%>
                    <asp:Panel ID="pnlVideo" runat="server" Visible="false">
                        <video id="postVideo" controls="controls">
                        </video>
                    </asp:Panel>

                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblLikes" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Button ID="btnLike" runat="server" Text="Like" OnClick="btnLike_Click" />
                            <p></p>
                            <br>
                        </div>
                    </div>
                    <br />
                    <div style="padding: 30px">
                        <h3 class="text-center">COMMENTS</h3>
                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="commentTextBox"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnComment" runat="server" Text="Comment" />
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">RECENT</a></li>
                        </ul>

                        <div class="container-fluid text-center">
                            <%-- Div created for grabElementByID in Javascript section. Comments will be loaded here --%>
                            <div class="row content">
                                <div class="leftcolumn">
                                    <div class='row'>
                                        <div id="comments" class="col-sm-4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />         
                                    <div id="commentText" class="col-sm-8">
                                    </div>              
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="col-sm-4">
            <div class="well">
                <h2>
                    <asp:HyperLink ID="hlUsername" runat="server"></asp:HyperLink></h2>
                <p>
                    <asp:TextBox ID="txtBio" ReadOnly="true" runat="server" TextMode="MultiLine" CssClass="profileBio"></asp:TextBox>
                </p>
                <asp:Button ID="btnFollow" runat="server" Text="Follow" CssClass="btn-info" OnClick="btnFollow_Click" />
            </div>
            <div class="well">
                <h3>MORE FROM USER</h3>
                <p>
                    <asp:DataList ID="dlMoreUser" runat="server"></asp:DataList>
                </p>
            </div>
            <div class="well">
                <h3>MORE FROM TRUPHOX</h3>
                <p>
                    <asp:DataList ID="dlMoreTruphox" runat="server"></asp:DataList>
                </p>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var postID = getUrlParameter('postID');
            getComments(postID);
        });

        function getComments(postID) {
            $.ajax({
                type: "POST",
                url: "readComment.ashx",//handler
                cache: false,
                data: { "postID": postID },
                success: function (data) {
                    comments(data);
                },
                err: function (error) {
                    alert("error");
                }
            });
        }

        function comments(data) {
            //Get comment section created that will be used to append comment HTML created
            var sectionComments = document.getElementById("comments");
            var commentText = document.getElementById("commentText");
            var comment = JSON.parse(data);

            //loop through each comment for the post and create required elements for a comment
            for (i in comment.Table) {
                c = comment.Table[i];
                var divComments = document.createElement("div");
                divComments.setAttribute('id', 'c' + i);
                divComments.innerHTML = (
                    "<img src='./Images/" + c.profileImage + "' class='commentPic'/>" +
                    "<br />" + "<a href=''>" + c.username + "</a><br />"
                    //+ "<div class='col-sm-8'" + "<div class='well'>" +
                    //c.commentText
                    //+ "</div></div>" + "<br />"
                )
                //getCommentReplies(c.parentCommentID, i);
                sectionComments.appendChild(divComments);
            }

            for (i in comment.Table) {
                c = comment.Table[i];
                var divComments = document.createElement("div");
                divComments.setAttribute('id', 'ct' + i);
                divComments.innerHTML = (
                    "<div class='well'>" + c.commentText + "</div><br />"
                )
                //getCommentReplies(c.parentCommentID, i);
                commentText.appendChild(divComments);
            }
        }

        function getCommentReplies(parentCommentID, i) {
            $.ajax({
                type: "POST",
                url: "readCommentReply.ashx", //handler
                cache: false,
                data: { "parentCommentID": parentCommentID },
                success: function (data) {
                    commentReplies(data, i, parentCommentID);
                },
                err: function (error) {
                    alert("error");
                }
            });
        }

        function commentReplies(data, i, parentCommentID) {
            if (data != null) {
                //Get created reply div from comments method using i to find associated comment for replies
                var parentComment = document.getElementById('r', i);
                var commentReply = JSON.parse(data);

                //loop through each comment reply for the post and create required elements for a comment
                for (a in commentReply.Table) {
                    cr = commentReply.Table[a];
                    var divCommentReplies = document.createElement("div");
                    divCommentReplies.setAttribute('id', 'cr' + a);
                    //comment class setattribute here
                    //comment reply requirements

                    parentComment.appendChild(divCommentReplies);
                }
            }
        }

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        };

    </script>
</asp:Content>
