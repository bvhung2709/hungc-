using EOS.connect;
using EOS.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace EOS.dao
{
    public class ExamDAO :DBContext
    {
        public Exam getExam(String code)
        {
            Exam e = new Exam();
            String sql = "select * from Exam where ExamCode =@code";
            try
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(new SqlParameter("@code", code));
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {

                    e.ExamCode = reader.GetString(0);
                    e.name = reader.GetString(1);
                    e.Time = reader.GetInt32(2);
                    e.date = reader.GetDateTime(3);
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
            return e;

        }

    }
}
