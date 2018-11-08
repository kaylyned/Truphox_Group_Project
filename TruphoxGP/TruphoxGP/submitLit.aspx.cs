using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class submitLit : System.Web.UI.Page
    {
        DAL myDal;
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

                }
            }
        }

        protected void btnSubmitLit_Click(object sender, EventArgs e)
        {
            Security sec = new Security();
            myDal = new DAL("spCreateWriting");
            myDal.addParm("username", sec.username);

            myDal.addParm("rating", rblMature.SelectedValue);
            myDal.addParm("postTitle", txtTitle.Text);
            myDal.addParm("postSubTitle", txtSubtitle.Text);
            myDal.addParm("writingText", txtWriting.Text);

            myDal.execNonQuery();

            int postID = Convert.ToInt32(myDal.execScalar());

            Response.Redirect("Post.aspx?postID=" + postID + "&postType=writing");
        }
    }
}