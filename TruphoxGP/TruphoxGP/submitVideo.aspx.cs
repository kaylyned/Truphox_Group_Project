using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class submitVideo : System.Web.UI.Page
    {
        DAL myDal;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitVideo_Click(object sender, EventArgs e)
        {
            Security sec = new Security();
            myDal = new DAL("spCreateVideo");
            myDal.addParm("username", sec.username);

            myDal.addParm("rating", rblMature.SelectedValue);
            myDal.addParm("postTitle", txtTitle.Text);
            myDal.addParm("postSubTitle", txtSubtitle.Text);
            myDal.addParm("photoLink", fuVideo.FileName);

            string videoLink = Server.MapPath(".") + "\\Images\\";
            string fileName = fuVideo.FileName;
            string pathAfile = videoLink + fileName;
            fuVideo.PostedFile.SaveAs(pathAfile);

            DataSet ds = myDal.getDataSet();

            Response.Redirect("Post.aspx");
        }
    }
}