using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TruphoxGP
{
    public class DAL
    {
        string _connnectionString { get; set; }
        string _command { get; set; }

        SqlConnection _Connection;

        struct parms
        {
            public string _p;
            public string _v;
        }

        List<parms> _parms = new List<parms>();

        public DAL(string command)
        {
            _command = command;
            _connnectionString = ConfigurationManager.ConnectionStrings["dal"].ConnectionString;
            _Connection = new SqlConnection(_connnectionString);
        }

        public void addParm(string p, string v)
        {
            parms myParms = new parms();
            myParms._p = p;
            myParms._v = p;
            _parms.Add(myParms);
        }

        public void execNonQuery()
        {

        }

    }
}