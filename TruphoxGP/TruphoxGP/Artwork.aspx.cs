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
                loadARecent();
                loadAFav();

            }
        }
        private void loadATrending()
        {
            mydal = new DAL("spReadArt");
            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[1];

            dlArtTrending.DataSource = dtA; 
            dlArtTrending.DataBind();
        }

        private void loadARecent()
        {
            mydal = new DAL("spReadArt");
            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[1];

            dlArtTrending.DataSource = dtA;
            dlArtTrending.DataBind();
        }

        private void loadAFav()
        {
            mydal = new DAL("spReadArt");
            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[1];

            dlArtTrending.DataSource = dtA;
            dlArtTrending.DataBind();
        }

        protected void dlArtTrending_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlArtTrending.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                string postDet = ("Post.aspx?postID=" + itemID.ToString());               
                Response.Redirect(postDet);
            }      
        }
    }
}