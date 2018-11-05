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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["result"] != null)
                {
                   string searchResult = Request.QueryString["result"].ToString();
                   loadUSearch(searchResult);
                }            
            }
        }
        private void loadUSearch(string SearchResult)
        {
            Security sec = new Security();
            mydal = new DAL("spUSearch");
            mydal.addParm("@input", SearchResult);

            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[0];

            if (ds.Tables[0].Rows.Count !=0)
            {
                dlUserSearch.DataSource = dtA;
                dlUserSearch.DataBind();
            }
          else
            {
                lblNotFound.Visible = true;
                lblNotFound.Text = SearchResult + "not found";
            }
        }

        protected void dlUserSearch_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string viewUser = dlUserSearch.DataKeys[e.Item.ItemIndex].ToString();

            if (e.CommandName == "Select")
            {
                Response.Redirect("viewProfile.aspx?followedUser=" + viewUser);
            }
        }

        protected void dlUnity_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //dlUnity.SelectedIndex = e.Item.ItemIndex;
            //DataListItem dli = dlUnity.SelectedItem;
            //Label lblType = (Label)dli.FindControl("type");

            int itemID = Convert.ToInt32(dlUnity.DataKeys[e.Item.ItemIndex]);

            if (e.CommandName == "Select")
            {
                //Response.Redirect("Post.aspx?postID=" + itemID.ToString() + "&postType=artwork");
            }
        }
    }
}