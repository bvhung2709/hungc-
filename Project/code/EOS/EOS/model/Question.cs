using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EOS.model
{
   public class Question
    {
        public int id { get; set; }

        public String content { get; set; }

        public double Point { get; set; }

        public List<Answer> listAnswers = new List<Answer>();

        public bool isMultipleChoice
        {
            get
            {
                int count = 0;
                foreach (Answer a in listAnswers)
                {
                    if (a.isTrue)
                        count++;
                }
                return count > 1;
            }
        }
    }
}
