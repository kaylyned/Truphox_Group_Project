using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class Post : System.Web.UI.Page
    {
        DAL mydal;

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
                }

                if (postType == "writing")
                {
                    //make artwork panel visible
                    pnlWriting.Visible = true;
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
        }

        private void loadPost(int postID)
        {
            //load post
            mydal = new DAL("")


        }
    }
}