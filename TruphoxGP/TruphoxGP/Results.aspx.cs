using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TruphoxGP
{
    public partial class Results : System.Web.UI.Page
    {
        DAL mydal;
        string searchResult;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["result"] != null)
                {
                    searchResult = Request.QueryString["result"].ToString();
                    loadResults();
                }
            }
        }
        private void loadResults()
        {

        }
        protected void dlSearchResult_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(dlSearchResult.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }
    }
}