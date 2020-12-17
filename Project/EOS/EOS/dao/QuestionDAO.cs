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
   public class QuestionDAO : DBContext
    {

        public List<Question> getAllQuestion(String code)
        {
            List<Question> list = new List<Question>();
            String sqlQ = "select * from Question ,Answer where Question.QuestionId = Answer.QuestionID and ExamCode ='"+code+"'";
            try
            {
                SqlCommand commandQ = new SqlCommand(sqlQ, connection);
                connection.Open();
                SqlDataReader readerQ = commandQ.ExecuteReader();
                Question q = new Question() { id=-1};
                while (readerQ.Read())
                {
                    int qid = readerQ.GetInt32(0);
                    if(qid != q.id)
                    {
                        q = new Question();
                        list.Add(q);
                    }
                    q.id = qid;
                    q.content = readerQ.GetString(1);
                    q.Point = readerQ.GetDouble(2);
                    //process list answer
                    Answer a = new Answer();
                    a.id = readerQ.GetInt32(4);
                    a.content = readerQ.GetString(5);
                    a.isTrue = readerQ.GetBoolean(6);
                    a.question = q;
                    q.listAnswers.Add(a);


                }

            }catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return list;

        }
    }
}
