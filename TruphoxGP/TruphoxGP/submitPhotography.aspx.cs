using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {

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

            DataSet ds = myDal.getDataSet();
            myDal.execNonQuery();

            Response.Redirect("Post.aspx");
        }
    }
}