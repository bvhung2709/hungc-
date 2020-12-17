using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace EOS.connect
{
    public class DBContext
    {
        protected SqlConnection connection;
        public DBContext()
        {
            connection = new SqlConnection(
                ConfigurationManager.ConnectionStrings["strCon"].ToString()
                );
        }
    }
}
