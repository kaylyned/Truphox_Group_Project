using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;


namespace TruphoxGP
{
    public partial class Register : System.Web.UI.Page
    {
        DAL myDal;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtPassword.Text == txtpswRepeat.Text)
            {
                myDal = new DAL("spCreateAccount");
                myDal.addParm("username", txtUsername.Text);
                myDal.addParm("userPassword", txtPassword.Text);
                myDal.addParm("email", txtEmail.Text);
                myDal.addParm("firstName", txtFirst.Text);
                myDal.addParm("lastName", txtLast.Text);
                myDal.addParm("dob", txtDOB.Text);
                DataSet ds = myDal.getDataSet();
                               

            }
   
            else
            {
                lblMessage.Text = "Password do not match. Please recheck your password.";
            }             
        }       
    }
}