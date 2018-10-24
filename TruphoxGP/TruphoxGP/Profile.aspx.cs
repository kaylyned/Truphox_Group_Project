using System;
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
            if (!IsPostBack)
            {
                loadUser();
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
            myDal = new DAL("spReadArt");
           // myDal.addParm("postID", postID);
            DataSet ds = myDal.getDataSet();

            imgRecent.ImageUrl = ds.Tables[0].Rows[0][""].ToString();

            lblpostID.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            lblTitle.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblSubTitle.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            lblDateCreated.Text = ds.Tables[0].Rows[0]["postDate"].ToString();

            imgRecent2.ImageUrl = ds.Tables[0].Rows[0]["lastName"].ToString();

            lblpostID2.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            lblTitle2.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblSubTitle2.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            lblDateCreated2.Text = ds.Tables[0].Rows[0]["postDate"].ToString();

            lblpostID3.Text = ds.Tables[0].Rows[0]["postID"].ToString();
            imgRecent3.ImageUrl = ds.Tables[0].Rows[0]["lastName"].ToString();
            lblTitle3.Text = ds.Tables[0].Rows[0]["postTitle"].ToString();
            lblSubTitle3.Text = ds.Tables[0].Rows[0]["postSubTitle"].ToString();
            lblDateCreated3.Text = ds.Tables[0].Rows[0]["postDate"].ToString();
        }
    }
}