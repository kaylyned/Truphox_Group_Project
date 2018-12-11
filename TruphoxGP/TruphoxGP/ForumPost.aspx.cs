using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TruphoxGP
{
    public partial class ForumPost : System.Web.UI.Page
    {
        DAL mydal;
        public int forumID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Security sec = new Security();
            if (sec.isLoggedIn)
            {
                if (!IsPostBack)
                {
                    forumID = Convert.ToInt32(Request.QueryString["forumID"].ToString());
                    loadForum(forumID);
                }
            }
        }
        private void loadForum(int forumID)
        {
            //load post
            mydal = new DAL("spReadForums");
            mydal.addParm("forumID", forumID.ToString());
            DataSet ds = mydal.getDataSet();

            lblTitle.Text = ds.Tables[0].Rows[0]["forumTitle"].ToString();
            lblForums.Text = ds.Tables[0].Rows[0]["forumText"].ToString();
        }
    }
}