using EOS.connect;
using EOS.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace EOS.dao
{
   public class StudentExamDAO :DBContext
    {
        public void insertValue(Login login)
        {
            String sql = "insert StudentExam values(@loginID,@ExamCode)";
            try
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(new SqlParameter("@loginID", login.LoginId));
                command.Parameters.Add(new SqlParameter("@ExamCode", login.ExamCode));
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

        }

        public int getIdOfStudentExam(Login login)
        {
            int id = 0;
            String sql = "select * from StudentExam where [Login id] =@loginID and ExamCode =@ExamCode";
            try
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(new SqlParameter("@loginID", login.LoginId));
                command.Parameters.Add(new SqlParameter("@ExamCode", login.ExamCode));
                connection.Open();
               SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    id = reader.GetInt32(0);
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
            return id;

        }

        public void insertDetail(List<Question> questions,int id)
        {
            
            try
            {
               
                connection.Open();
                for (int i = 0; i < questions.Count; i++)
                {
                    for(int j = 0; j < questions[i].listAnswers.Count; j++)
                    {
                        if (questions[i].listAnswers[j].isSelect == true)
                        {
                            String sql = "insert StudentExamDetail values (@id,@questionId,@answerId,@istrue)";
                            SqlCommand command = new SqlCommand(sql, connection);
                            command.Parameters.Add(new SqlParameter("@id", id));
                            command.Parameters.Add(new SqlParameter("@questionId", questions[i].id));
                            command.Parameters.Add(new SqlParameter("@answerId", questions[i].listAnswers[j].id));
                            command.Parameters.Add(new SqlParameter("@istrue", questions[i].listAnswers[j].isTrue));
                           
                            command.ExecuteNonQuery();
                        }
                    }
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

        }





    }
}
