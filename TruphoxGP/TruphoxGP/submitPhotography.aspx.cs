﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class submitPhotography : System.Web.UI.Page
    {
        DAL myDal;
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
                        pnlSubmit.Visible = true;
                    }
                    else
                    {
                        pnlUpdate.Visible = true;
                        loadPhotography(postID);
                    }
                }
            }
        }
        private void loadPhotography(int PostID)
        {
            Security sec = new Security();
            myDal = new DAL("spReadArt");
            myDal.addParm("postID", PostID.ToString());
            DataSet ds = myDal.getDataSet();

            lblPostID.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            txtUTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            txtUSubtitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            imgPrevPhotography.ImageUrl = ds.Tables[0].Rows[0]["photoLink"].ToString();
        }

        protected void btnSubmitPhotography_Click(object sender, EventArgs e)
        {
            Security sec = new Security();
            myDal = new DAL("spCreatePhotography");
            myDal.addParm("username", sec.username);

            myDal.addParm("rating", rblMature.SelectedValue);
            myDal.addParm("postTitle", txtTitle.Text);
            myDal.addParm("postSubTitle", txtSubtitle.Text);
            myDal.addParm("photoLink", fuPhotography.FileName);

            string photoLink = Server.MapPath(".") + "\\Images\\";
            string fileName = fuPhotography.FileName;
            string pathAfile = photoLink + fileName;
            fuPhotography.PostedFile.SaveAs(pathAfile);

            int postID = Convert.ToInt32(myDal.execScalar());

            Response.Redirect("Post.aspx?postID=" + postID + "&postType=photography");
        }

        protected void btnUpdatePhotography_Click(object sender, EventArgs e)
        {
            int PostID = postID;
            myDal = new DAL("spUpdatePhotography");
            myDal.addParm("postID", PostID.ToString());

            myDal.addParm("rating", rblUMature.SelectedValue);
            myDal.addParm("postTitle", txtUTitle.Text);
            myDal.addParm("postSubTitle", lblUSubtitle.Text);
            myDal.addParm("photoLink", imgPrevPhotography.ImageUrl);

            Response.Redirect("Post.aspx?postID=" + PostID + "&postType=photography");
        }
    }
}