<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSupreme.Master" AutoEventWireup="true" CodeBehind="Post2.aspx.cs" Inherits="TruphoxGP.Post2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="col-sm-8 text-left">
            <br />
            <div class="header">
                <h1>
                    <asp:Label ID="lblPostTitle" runat="server" Text=""></asp:Label></h1>
                <h3>
                    <asp:Label ID="lblPostSubtitle" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="row content">
                <div class="leftcolumn">
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
                        <asp:Image ID="imgPhotography" runat="server" CssClass="PostImage" />
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
                            <asp:Panel ID="pnlLike" runat="server" Visible="false">
                                <asp:Button ID="btnLike" runat="server" Text="Like" OnClick="btnLike_Click" />
                            </asp:Panel>
                            <p></p>
                            <br>
                        </div>
                    </div>
                    <div style="padding: 30px">
                        <h3 class="text-center">COMMENTS</h3>
                        <asp:Panel ID="pnlComments" runat="server" Visible="false">
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="commentTextBox"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnComment" runat="server" Text="Comment" />
                        </asp:Panel>
                        <br />
                        <br />
                        <br />
                        <div>
                            <%-- Div created for grabElementByID in Javascript section. Comments will be loaded here --%>
                            <div id="comments">
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
                <h1>
                    <asp:LinkButton ID="lnkBtnUsername" runat="server" OnClick="lnkBtnUsername_Click">
                        <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                    </asp:LinkButton></h1>
            </div>
            <asp:Panel ID="pnlEditPost" runat="server" Visible="false">
                <div class="well">
                    <asp:Button ID="btnEditPost" runat="server" Text="Edit" OnClick="btnEditPost_Click" />
                    <asp:Button ID="btnDeletePost" runat="server" Text="Delete" OnClick="btnDeletePost_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                <div class="well">
                    <table>
                        <tr>

                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <div class="well">
                <h3>MORE FROM USER</h3>
                <p>
                    <asp:DataList ID="dlMoreUser" runat="server" DataKeyField="postID" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlMoreUser_ItemCommand">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ImageUrl='<%#Eval("Images") %>' CssClass="img-circle" Height="100px" max-width="100px" CommandName="post" />
                            <asp:Label ID="lblType" runat="server" Text='<%#Eval("type") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:DataList>
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
                    alert(error);
                }
            });
        };

        function comments(data) {
            //Get comment section created that will be used to append comment HTML created
            var sectionComments = document.getElementById("comments");
            var comment = JSON.parse(data);

            //loop through each comment for the post and create required elements for a comment
            for (i in comment.Table) {
                c = comment.Table[i];
                var divComments = document.createElement("div");
                divComments.setAttribute('id', 'c' + i);
                divComments.innerHTML = (
                    "<div class='well well-sm'>" + "<div class='w3-row'>" + "<hr>" + " <div class='w3-col l2 m3'>"
                    + "<img src='./Images/" + c.profileImage + "' class='img-circle commentPic'/>"
                    + "<br/>" + "</div>" + " <div class='w3-col l10 m9'>"
                    + "<a href=''>" + c.username + "</a><br />" + "<span class='w3-opacity w3-medium'>" + c.commentDate
                    + "</span>" + "<br />" + "<br />"
                    + "<div class='usercomment'>" + c.commentText + "</div>" + "</div></div></div>" + "<br />"

                
                ////reply btn
                //+ "<p class='w3-right'>" + "<button class='w3-button w3-black' onclick='return replyComment()' id='myBtn'>" + "<b>Reply" + "</b>"
                //+ "<span class='w3-tag w3-white'>" + "</span>" + "</button>" + "</p>"

                //like btn
                + "<p class='w3-right'>" + "<button class='w3-button w3-white w3-border' onclick='return likeComment(" + c.commentID + ")'>" + "<b>" + "<i class='fa fa-thumbs-up'>"
                + "</i> Like" + "<span class='w3-tag w3-white'>1" + "</span>" + "</b >" + "</button >" + "</p >"
                + "</div>" + "</div>");

                //+ "<div id='r" + i + "'>" + "</div>");
                sectionComments.appendChild(divComments);
            };

        };

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        };

        function likeComment(commentID) {
            $.ajax({
                type: "POST",
                url: "likeComment.ashx", //handler
                cache: false,
                data: { "commentID": commentID },
                success: function () {
                    readCommentLikes()
                },
                err: function (error) {
                    alert("error");
                }
            });
            return false;
        };

        function replyComment() {
            var postID = getUrlParameter('postID');
            var commentText = getElementById("txtComment");

            $.ajax({
                type: "POST",
                url: "replyComment.ashx", //handler
                cache: false,
                data: { postID, commentText },
                success: function () {
                },
                err: function (error) {
                    alert(error);
                }
            });
            return false;
        };

        //$(document).ready(function () {            
        //    var postID = getUrlParameter('postID');
        //    getComments(postID);           
        //    checkLoggedIn(postID);

        //});

        //function checkLoggedIn(postID) {         
        //    $.ajax({
        //        type: "POST",
        //        url: "checkLoggedIn.ashx",
        //        cache: false,
        //        data: {},
        //        success: function (data) {   

        //            getComments(postID, data);       
        //        },
        //        err: function (error) {
        //            alert("error");
        //        }
        //    });          
        //    alert(data);
        //    alert("failure"); // dies here 
        //}

        //function getComments(postID, loggedIn) {
        //    $.ajax({
        //        type: "POST",
        //        url: "readComment.ashx",//handler
        //        cache: false,
        //        data: { "postID": postID },
        //        success: function (data) {
        //            comments(data, loggedIn);
        //        },
        //        err: function (error) {
        //            alert("error");
        //        }
        //    });
        //}

        //function comments(data, loggedIn) {
        //    //Get comment section created that will be used to append comment HTML created
        //    var sectionComments = document.getElementById("comments");
        //    var comment = JSON.parse(data);
        //    var loggedIn = loggedIn;

        //    //loop through each comment for the post and create required elements for a comment
        //    for (i in comment.Table) {
        //        c = comment.Table[i];
        //        var divComments = document.createElement("div");
        //        divComments.setAttribute('id', 'c' + i);

        //        if (loggedIn == "true")
        //         {
        //        //        divComments.innerHTML = (
        //        //        "<div class='well well-sm'>" + "<div class='w3-row'>" + "<hr>" + " <div class='w3-col l2 m3'>" + "<img src='./Images/" + c.profileImage + "' class='img-circle commentPic'/>"
        //        //        + "<br/>" + "</div>" + " <div class='w3-col l10 m9'>"
        //        //        + "<a href=''>" + c.username + "</a><br />" + "<span class='w3-opacity w3-medium'>" + c.commentDate + "</span>" + "<br />" + "<br />"
        //        //        + "<div class='usercomment'>" + c.commentText + "</div>" + "<br />"

        //        //        //reply btn
        //        //        + "<p class='w3-right'>" + "<button class='w3-button w3-black' onclick='return replyComment(" + c.parentCommentID + ")' id='myBtn'>" + "<b>Reply" + "</b>"
        //        //        + "<span class='w3-tag w3-white'>" + "</span>" + "</button>" + "</p>"

        //        //        //like btn
        //        //        + "<p class='w3-right'>" + "<button class='w3-button w3-white w3-border' onclick='return likeComment(" + c.commentID + ")'>" + "<b>" + "<i class='fa fa-thumbs-up'>" +
        //        //        "</i> Like" + "<span class='w3-tag w3-white'>1" + "</span>" + "</b >" + "</button >" + "</p >"
        //        //        + "</div>" + "</div>" + "<div id='r" + i + "'>" + "</div>"

        //        //        //sub comments
        //        //        + "<div id='pnlComment' style='visibility:hidden'>" + "<div class='nest'>" + "<div class='well-sm'>" + "<div class='w3-row'>" + "<hr>"
        //        //        + "<div class='w3-col l2 m3'>" + "<img src='./Images/" + c.profileImage + "' class='img-circle commentPic'/>" + "<br />" + "</div>"
        //        //        + " <div class='w3-col l10 m9'>" + "<a href=''>" + c.username + "</a><br />" + "<br />"
        //        //        + "<div class='usercomment'>" + "<input id='Text1' type='text' width='300px' />" + "</div>" + "<br />"

        //        //        //submit reply btn
        //        //        + "<p class='w3-right'>" + "<button class='w3-button w3-black' onclick='return replyComment()' id='btnSubmit'>" + "<b>Submit Reply" + "</b>"
        //        //        + "<span class='w3-tag w3-white'>" + "</span>" + "</button>" + "</p>"
        //        //        + "</div>" + "</div>" + "</div>" + "</div>" + "</div>" + "</div>")
        //          }
        //      else
        //          {
        //        //        divComments.innerHTML = (
        //        //        "<div class='well well-sm'>" + "<div class='w3-row'>" + "<hr>" + " <div class='w3-col l2 m3'>" + "<img src='./Images/" + c.profileImage + "' class='img-circle commentPic'/>"
        //        //        + "<br/>" + "</div>" + " <div class='w3-col l10 m9'>"
        //        //        + "<a href=''>" + c.username + "</a><br />" + "<span class='w3-opacity w3-medium'>" + c.commentDate + "</span>" + "<br />" + "<br />"
        //        //        + "<div class='usercomment'>" + c.commentText + "</div>" + "<br />"

        //        //        //sub comments
        //        //        + "<div id='pnlComment' style='visibility:hidden'>" + "<div class='nest'>" + "<div class='well-sm'>" + "<div class='w3-row'>" + "<hr>"
        //        //        + "<div class='w3-col l2 m3'>" + "<img src='./Images/" + c.profileImage + "' class='img-circle commentPic'/>" + "<br />" + "</div>"
        //        //        + " <div class='w3-col l10 m9'>" + "<a href=''>" + c.username + "</a><br />" + "<br />"
        //        //        + "<div class='usercomment'>" + "<input id='Text1' type='text' width='300px' />" + "</div>" + "<br />")
        //       };         

        //        //);
        //        //getCommentReplies(c.parentCommentID, c.postID, i);
        //        sectionComments.appendChild(divComments);
        //    }
        //}

        //function getCommentReplies(parentCommentID, postID, i) {
        //    $.ajax({
        //        type: "POST",
        //        url: "readCommentReply.ashx", //handler
        //        cache: false,
        //        data: { "parentCommentID": parentCommentID, "postID": postID },
        //        success: function (data) {
        //            commentReplies(data, i, parentCommentID);
        //        },
        //        err: function (error) {
        //            alert("error");
        //        }
        //    });
        //}

        //function commentReplies(data, i, parentCommentID) {
        //    //Get created reply div from comments method using i to find associated comment for replies
        //    var parentComment = document.getElementById('r' + i);
        //    var commentReply = JSON.parse(data);

        //    //loop through each comment reply for the post and create required elements for a comment
        //    for (a in commentReply.Table) {
        //        cr = commentReply.Table[a];
        //        var divCommentReplies = document.createElement("div");
        //        divCommentReplies.setAttribute('id', 'cr' + a);
        //        divCommentReplies.innerHTML = (
        //            "<div class='indentComments'>" + "<div class='well-sm'>" + "<div class='w3-row'>" + "<hr>" + " <div class='w3-col l2 m3'>" + "<img src='./Images/" + cr.profileImage + "' class='img-circle commentPic'/>"
        //            + "<br />" + "</div>" + " <div class='w3-col l10 m9'>"
        //            + "<a href=''>" + cr.username + "</a><br />" + "<span class='w3-opacity w3-medium'>" + cr.commentDate + "</span>" + "<br />" + "<br />"
        //            + "<div class='usercomment'>" + cr.commentText + "</div>" + "<br/>"

        //            ////reply btn
        //            + "<p class='w3-right'>" + "<button class='w3-button w3-black' onclick='return replyComment(" + parentCommentID + ")' id='myBtn'>" + "<b>Reply" + "</b>"
        //            + "<span class='w3-tag w3-white'>" + "</span>" + "</button>" + "</p>"

        //            //////like btn
        //            //+ "<p class='w3-right'>" + "<button class='w3-button w3-white w3-border' onclick='return likeComment(" + cr.commentID + ")'>" + "<b>" + "<i class='fa fa-thumbs-up'>" +
        //            //"</i> Like" + "<span class='w3-tag w3-white'>" + "data-count='0'" + "</span>" + "</b >" + "</button >" + "</p >"

        //            //+ "</div>" + "</div>" + "</div>"

        //            ////sub comments
        //            + "<div id='pnlComment' style='visibility:hidden'>" + "<div class='nest'>" + "<div class='well-sm'>" + "<div class='w3-row'>" + "<hr>"
        //            + " <div class='w3-col l2 m3'>" + "<img src='./Images/" + cr.profileImage + "' class='img-circle commentPic'/>"
        //            + "<br/>" + "</div>" + " <div class='w3-col l10 m9'>"
        //            + "<a href=''>" + cr.username + "</a><br />" + "</br>"
        //            + "<div class='usercomment'>" + "<input id='Text1' type='text' width='300px' />" + "</div>" + "<br/>"

        //            //////reply btn
        //            + "<p class='w3-right'>" + "<button class='w3-button w3-black' onclick='return replyComment()' id='btnSubmit'>" + "<b>Submit Reply" + "</b>"
        //            + "<span class='w3-tag w3-white'>" + "</span>" + "</button>" + "</p>"
        //            + "</div>" + "</div>" + "</div>" + "</div>" + "</div>" + "</div>"
        //        );
        //        parentComment.appendChild(divCommentReplies);
        //    }
        //}        
    </script>
</asp:Content>
