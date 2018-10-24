using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace TruphoxGP
{

    public class comment
    { 
        public int postID { get; set; }
        public string commentText { get; set; }
        public DateTime commentDate { get; set; }
        public int postCommentNumber { get; set; }

        public comment(int PostID, string CommentText, DateTime CommentDate, int PostCommentNumber)
        {
            this.postID = PostID;
            this.commentText = CommentText;
            this.commentDate = CommentDate;
            this.postCommentNumber = PostCommentNumber;
        }

        public comment()
        {
           
        }      

    }
}