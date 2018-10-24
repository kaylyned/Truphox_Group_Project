﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TruphoxGP;
using System.Data;
using System.Data.SqlClient;

namespace TruphoxGP
{
    public partial class Profile : System.Web.UI.Page
    {
        DAL myDal;
        protected void Page_Load(object sender, EventArgs e)
        {
            Security sec = new Security();
            if (!sec.isLoggedIn)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadUser();
                    loadRecentlyAdded();
                    loadArt();
                    loadPhotography();
                    loadWriting();
                    loadVideo();
                }
            }
        }
        private void loadUser()
        {
            Security sec = new Security();
            myDal = new DAL("spReadAccount");
            myDal.addParm("username", sec.username);
            DataSet ds = myDal.getDataSet();

            lblUsername.Text = HttpContext.Current.Session["username"].ToString();
            lblFirstName.Text = ds.Tables[0].Rows[0]["firstName"].ToString();
            lblLastName.Text = ds.Tables[0].Rows[0]["lastName"].ToString();
            txtBio.Text = ds.Tables[0].Rows[0]["bio"].ToString();
            lblDOB.Text = ds.Tables[0].Rows[0]["dob"].ToString();
            lblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            lblDateJoined.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["joinDate"]).ToString();

        }
        private void loadRecentlyAdded()
        {
            Security sec = new Security();

            myDal = new DAL("spRecentlyAdded");
            myDal.addParm("username", sec.username);

            DataSet ds = myDal.getDataSet();

            //imgRecent.ImageUrl = ds.Tables[0].Rows[0][""].ToString();

            lblpostID.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            lblTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblSubTitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            lblDateCreated.Text = ds.Tables[0].Rows[0]["postDate"].ToString();

            //imgRecent2.ImageUrl = ds.Tables[0].Rows[0][""].ToString();

            lblpostID2.Text = ds.Tables[0].Rows[1]["postID"].ToString();
            lblTitle2.Text = ds.Tables[0].Rows[1]["postTitle"].ToString();
            lblSubTitle2.Text = ds.Tables[0].Rows[1]["postSubTitle"].ToString();
            lblDateCreated2.Text = ds.Tables[0].Rows[1]["postDate"].ToString();

            // imgRecent3.ImageUrl = ds.Tables[0].Rows[0]["lastName"].ToString();

            lblpostID3.Text = ds.Tables[0].Rows[2]["postID"].ToString();
            lblTitle3.Text = ds.Tables[0].Rows[2]["postTitle"].ToString();
            lblSubTitle3.Text = ds.Tables[0].Rows[2]["postSubTitle"].ToString();
            lblDateCreated3.Text = ds.Tables[0].Rows[2]["postDate"].ToString();
        }

        private void loadArt()
        {
            Security sec = new Security();
            myDal = new DAL("spReadUserArt");
            myDal.addParm("username", sec.username);

            DataSet ds = myDal.getDataSet();
            DataTable dtA = ds.Tables[0];

            dlArt.DataSource = dtA;
            dlArt.DataBind();
        }

        private void loadPhotography()
        {
            Security sec = new Security();
            myDal = new DAL("spReadUserPhotography");
            myDal.addParm("username", sec.username);

            DataSet ds = myDal.getDataSet();
            DataTable dtA = ds.Tables[0];

            dlPhotots.DataSource = dtA;
            dlPhotots.DataBind();
        }
        private void loadVideo()
        {
            Security sec = new Security();
            myDal = new DAL("spReadUserVideo");
            myDal.addParm("username", sec.username);

            DataSet ds = myDal.getDataSet();
            DataTable dtA = ds.Tables[0];

            dlVideos.DataSource = dtA;
            dlVideos.DataBind();
        }

        private void loadWriting()
        {
            Security sec = new Security();
            myDal = new DAL("spReadUserWriting");
            myDal.addParm("username", sec.username);

            DataSet ds = myDal.getDataSet();
            DataTable dtA = ds.Tables[0];

            dlWriting.DataSource = dtA;
            dlWriting.DataBind();
        }

        protected void dlArt_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlArt.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //string postDet = ("Post.aspx?postID=" + itemID.ToString() + "postType=artwork");               
                Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }

        protected void dlPhotots_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlPhotots.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //string postDet = ("Post.aspx?postID=" + itemID.ToString() + "postType=artwork");               
                Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }

        protected void dlWriting_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlWriting.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //string postDet = ("Post.aspx?postID=" + itemID.ToString() + "postType=artwork");               
                Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }

        protected void dlVideos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlVideos.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //string postDet = ("Post.aspx?postID=" + itemID.ToString() + "postType=artwork");               
                Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }
    }
}