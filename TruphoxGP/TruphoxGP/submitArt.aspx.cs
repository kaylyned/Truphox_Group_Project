using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class submitArt : System.Web.UI.Page
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

        protected void btnSubmitArt_Click(object sender, EventArgs e)
        {

        }
    }
}