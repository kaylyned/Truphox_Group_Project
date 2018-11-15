using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class submitArt : System.Web.UI.Page
    {
        DAL mydal;
        public int postID { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Security sec = new Security();
            if (!sec.isLoggedIn)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    postID = Convert.ToInt32(Request.QueryString["postID"].ToString());
                    if (Request.QueryString == null)
                    {
                        pnlNewArt.Visible = true;
                    }
                    else
                    {
                        pnlUpdateArt.Visible = true;
                        loadArt(postID);
                    }
                }
            }
        }

        private void loadArt(int PostID)
        {
            Security sec = new Security();
            mydal = new DAL("spReadArt");
            mydal.addParm("postID", PostID.ToString());
            DataSet ds = mydal.getDataSet();

            lblPostID.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            txtUTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            txtUSubtitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            imgPrevArtwork.ImageUrl = ds.Tables[0].Rows[0]["artLink"].ToString();                 
        }

        protected void btnSubmitArt_Click(object sender, EventArgs e)
        {
            Security sec = new Security();
            mydal = new DAL("spCreateArt");
            mydal.addParm("username", sec.username);

            mydal.addParm("rating", rblMature.SelectedValue);
            mydal.addParm("postTitle", txtTitle.Text);
            mydal.addParm("postSubTitle", txtSubtitle.Text);
            mydal.addParm("artLink", fuArt.FileName);

            string artLink = Server.MapPath(".") + "\\Images\\";
            string fileName = fuArt.FileName;
            string pathAfile = artLink + fileName;
            fuArt.PostedFile.SaveAs(pathAfile);

            int postID = Convert.ToInt32(mydal.execScalar());

            Response.Redirect("Post.aspx?postID=" + postID + "&postType=artwork");
        }

        protected void btnUpdateArt_Click(object sender, EventArgs e)
        {
            int PostID = postID;
            mydal = new DAL("spUpdateArt");
            mydal.addParm("postID", PostID.ToString());

            mydal.addParm("rating", rblUMature.SelectedValue);
            mydal.addParm("postTitle", txtUTitle.Text);
            mydal.addParm("postSubTitle", lblUSubtitle.Text);
            mydal.addParm("artLink", imgPrevArtwork.ImageUrl);

            Response.Redirect("Post.aspx?postID=" + PostID + "&postType=artwork");
        }
    }
}