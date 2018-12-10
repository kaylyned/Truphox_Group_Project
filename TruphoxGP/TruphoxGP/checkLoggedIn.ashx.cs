using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TruphoxGP
{
    /// <summary>
    /// Summary description for checkLoggedIn
    /// </summary>
    public class checkLoggedIn : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            Security sec = new Security();

            if (sec.isLoggedIn == true)
            {
                context.Response.ContentType = "text/plain";
                string result = "true";
                context.Response.Write(result);
            }
            else
            {
                context.Response.ContentType = "text/plain";
                string result = "false";
                context.Response.Write(result);
            }            
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}