using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TruphoxGP
{
    public partial class Post : System.Web.UI.Page
    {
        DAL mydal;
        public int postID { get; set; }        

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //retrieve info from query sting
                int postID = Convert.ToInt32(Request.QueryString["postID"].ToString());
                string postType = Request.QueryString["postType"].ToString();

                if (postType == "artwork")
                {
                    //make artwork panel visible
                    pnlArtwork.Visible = true;
                    loadArt(postID);
                }

                if (postType == "writing")
                {
                    //make artwork panel visible
                    pnlWriting.Visible = true;
                    loadWriting(postID);
                }

                if (postType == "photography")
                {
                    //make artwork panel visible
                    pnlPhotography.Visible = true;
                }

                if (postType == "video")
                {
                    //make artwork panel visible
                    pnlVideo.Visible = true;
                }               
            }
            loadComments(postID);
        }

        private void loadArt(int PostID)
        {          
            //load post
            mydal = new DAL("spReadArt");
            mydal.addParm("postID", PostID.ToString());
            DataSet ds = mydal.getDataSet();

            lblPostTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblPostSubtitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            imgArtwork.ImageUrl = ds.Tables[0].Rows[0]["artLink"].ToString();
        }

        private void loadWriting(int PostID)
        {
            //load post
            mydal = new DAL("spReadWriting");
            mydal.addParm("postID", PostID.ToString());
            DataSet ds = mydal.getDataSet();

            lblPostTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblPostSubtitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            lblWriting.Text = ds.Tables[0].Rows[0]["writingText"].ToString();           
        }

        private void loadComments(int postID)
        {
            post loadComments = new post();
            List<comment> comments;
            comments = loadComments.getComments(postID);

            Panel pnlComments = new Panel();
            divComments.Controls.Add(pnlComments);

            foreach (comment comment in comments)
            {
                Label commentLabel = new Label();
                commentLabel.Text = comment.commentText;
                pnlComments.Controls.Add(commentLabel);
                pnlComments.Controls.Add(new LiteralControl("<br />"));

                Label commentDate = new Label();
                commentDate.Text = (comment.commentDate).ToString();
                pnlComments.Controls.Add(commentDate);
                pnlComments.Controls.Add(new LiteralControl("<br />"));

                Button btnLike = new Button();
                btnLike.Text = "Like";
                pnlComments.Controls.Add(btnLike);
                pnlComments.Controls.Add(new LiteralControl("<br />"));
                pnlComments.Controls.Add(new LiteralControl("<br />"));
            }
        }

        private void loadLikes(int PostID)
        {
            mydal = new DAL("spReadLike");
            mydal.addParm("postID", postID.ToString());
            DataSet ds = mydal.getDataSet();



        }


        protected void btnLike_Click(object sender, EventArgs e)
        {
            Security mySecurity = new Security();

            if (mySecurity.isLoggedIn == true)
            {
                mydal = new DAL("spCreateLike");
                mydal.addParm("username", mySecurity.username);
                mydal.addParm("postID", postID.ToString());
                mydal.execNonQuery();
            }
            else
            {

            }

            loadComments(postID);          
        }
    }
}