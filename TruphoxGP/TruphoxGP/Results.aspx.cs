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
                string search = Request.QueryString["result"].ToString();
                string type = Request.QueryString["filter"].ToString();

                if (type == "users")
                {
                    loadUSearch(search);
                }

                if (type == "posts")
                {
                    loadUnSearch(search);
                }

            }
        }
        private void loadUSearch(string Search)
        {
            Security sec = new Security();
            mydal = new DAL("spUSearch");
            mydal.addParm("@input", Search);

            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[0];

            if (ds.Tables[0].Rows.Count != 0)
            {
                dlUserSearch.DataSource = dtA;
                dlUserSearch.DataBind();
            }
            else
            {
                lblNotFound.Visible = true;
                lblNotFound.Text = Search + "not found";
            }
        }

        private void loadUnSearch(string Search)
        {
            Security sec = new Security();
            mydal = new DAL("spSearch");
            mydal.addParm("@input", Search);

            DataSet ds = mydal.getDataSet();
            DataTable dtA = ds.Tables[0];

            if (ds.Tables[0].Rows.Count != 0)
            {
                dlUnity.DataSource = dtA;
                dlUnity.DataBind();
            }
            else
            {
                lblNotFound.Visible = true;
                lblNotFound.Text = Search + "not found";
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