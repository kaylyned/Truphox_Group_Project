using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TruphoxGP
{
    public class Security
    {
        public string username { get; set; }
        public string userPassword { get; set; }
        public int accessLevel { get; set; }
        public bool isLoggedIn { get; set; }

        public Security()
        {
            if(HttpContext.Current.Session["username"] !=null)
            {
                username = (string)HttpContext.Current.Session["username"];
                userPassword = (string)HttpContext.Current.Session["userPassword"];
                accessLevel = (int)HttpContext.Current.Session["accessLevel"];
                isLoggedIn = true;
            }
            else
            {
                username ="";
                userPassword = "";
                accessLevel = -1;
                isLoggedIn = false;
            }
        }
        public Security(string Username, string UserPassword)
        {
            username = Username;
            userPassword = UserPassword;
            SqlConnection conn = new SqlConnection("data source= localhost; Initial Catalog= dbTruphox; Integrated Security=SSPI");

            //Need a proc that loggs a person in 
            SqlDataAdapter cmd = new SqlDataAdapter("", conn);
            cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            cmd.SelectCommand.Parameters.AddWithValue("username", username);
            cmd.SelectCommand.Parameters.AddWithValue("userPassword", userPassword);
            DataSet ds = new DataSet();

            conn.Open();
            cmd.Fill(ds);
            conn.Close();

            string message = ds.Tables[0].Rows[0]["message"].ToString();
            accessLevel = Convert.ToInt32(ds.Tables[0].Rows[0]["accessLevel"]);
           username = ds.Tables[0].Rows[0]["username"].ToString();

            if(message != "-1")
            {
                isLoggedIn = true;
                HttpContext.Current.Session["username"] = username;
                HttpContext.Current.Session["userPassword"] = userPassword;
                HttpContext.Current.Session["isLoggedIn"] = isLoggedIn;
                HttpContext.Current.Session["accessLevel"] = accessLevel;

            }
            else
            {
                isLoggedIn = false;
            }
        }
    }
}