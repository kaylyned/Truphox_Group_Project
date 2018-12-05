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
            context.Response.ContentType = "text/plain";
            Security sec = new Security();

            string result;
            if (sec.isLoggedIn == true)
            {
                result = "true";
            }
            else
            {
                result = "false";
            }            
            context.Response.Write(result);
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