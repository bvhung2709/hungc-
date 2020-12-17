using EOS.connect;
using EOS.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EOS.dao
{
   public class LoginDAO :DBContext
    {
        //check login
        public Login getUser(String user,String pass,String exam)
        {
            Login l = new Login();
            String sql = "select * from Login where [user]=@user and pass=@pass and ExamCode=@exam";
            try
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(new SqlParameter("@user", user));
                command.Parameters.Add(new SqlParameter("@pass", pass));
                command.Parameters.Add(new SqlParameter("@exam", exam));
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    
                    l.user = reader.GetString(0);
                    l.pass = reader.GetString(1);
                    l.LoginId = reader.GetInt32(2);
                    l.ExamCode = reader.GetString(3);
                }
               

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return l ;

        }

        public  Login getUser(String user, String pass)
        {
            Login l = new Login();
            String sql = "select * from Login where [user]=@user and pass=@pass ";
            try
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(new SqlParameter("@user", user));
                command.Parameters.Add(new SqlParameter("@pass", pass));
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {

                    l.user = reader.GetString(0);
                    l.pass = reader.GetString(1);
                    l.LoginId = reader.GetInt32(2);
                    l.ExamCode = reader.GetString(3);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return l;

        }








    }
}
