using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class PhoxFourms : System.Web.UI.Page
    {
        DAL myDal;
        protected void Page_Load(object sender, EventArgs e)
        {
            Security sec = new Security();
            if (!sec.isLoggedIn)
            {
                pnlLoginDiv.Visible = true;
                btnCreate.Visible = false;
            }
            else
            {
                if (!IsPostBack)
                {
                    pnlLoginDiv.Visible = false;
                    loadgvForum();
                }
            }
        }

        private void loadgvForum()
        {
            myDal = new DAL("loadForums");


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void rblMature_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblMature.SelectedIndex.ToString() == "Yes" )
            {
                lblMature.Visible = true;
            }
            else
            {
                lblMature.Visible = false;
            }
        }

        protected void btnSubmitForum_Click(object sender, EventArgs e)
        {
            createForum();
            pnlcreateForum.Visible = false;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            pnlcreateForum.Visible = true;
        }

        private void createForum()
        {
            Security sec = new Security();
            myDal = new DAL("spForums");
            myDal.addParm("username", sec.username);
            myDal.addParm("rating", rblMature.SelectedValue);
            myDal.addParm("forumTitle", txtforumTitle.Text);
            myDal.addParm("forumText", txtForumText.Text);

            int forumID = Convert.ToInt32(myDal.execScalar());
        }
    }
}