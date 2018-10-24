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
            lblDateJoined.Text= Convert.ToDateTime(ds.Tables[0].Rows[0]["joinDate"]).ToString();

        }
    }
}