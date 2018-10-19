using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TruphoxGP;

namespace TruphoxGP
{ 
    public partial class Art : System.Web.UI.Page
    {
        DAL mydal; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadATrending();
            }
        }
        private void loadATrending()
        {
            mydal = new DAL("spReadArt");
            DataSet ds = mydal.getDataSet();
            DataTable dt = ds.Tables[0];


            dlArtTrending.DataSource = dt;
            dlArtTrending.DataBind();
        }
    }
}