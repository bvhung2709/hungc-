using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EOS.model
{
   public class Answer

    {
        public int id { get; set; }

        public String content { get; set; }

        public Boolean isTrue { get; set; }

        public Question question { get; set; }

        public Boolean isSelect { get; set; }
        
    }
}
