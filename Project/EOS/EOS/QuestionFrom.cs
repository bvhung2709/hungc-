using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using EOS.model;

namespace EOS
{
    public partial class QuestionFrom : UserControl
    {
       public Question question;
        public List<Label> listLabelAnswer = new List<Label>() ;
        List<QuestionFrom> listQuestionForms;
       public List<CheckBox> listCk = new List<CheckBox>();
        ExamFrom exfrom;
        public int indexQ;
        public QuestionFrom(Question s,ExamFrom exfrom, List<QuestionFrom> listQuestionForms,int indexQ)
        {
            InitializeComponent();
            this.question = s;
            this.exfrom = exfrom;
            this.listQuestionForms = listQuestionForms;
            lblquestion.Text = question.content;
            //process Answer
            this.indexQ = indexQ;
            showAnswer();


        }
        private void showAnswer()
        {
            lblChoose.AutoSize = true;
            lblquestion.AutoSize = true;
            lblCount.Text = ""+(indexQ+1)+"/60";
            if (question.isMultipleChoice)
            {
                lblChoose.Text = "(Choose more answer)";
            }
            else
            {
                lblChoose.Text = "(Choose 1 answer)";
            }
            foreach (Answer a in question.listAnswers)
            {
                Label lb = new Label();
                lb.AutoSize = true;
                lb.Text = a.content;
                lb.Click += Lb_Click;
                listLabelAnswer.Add(lb);
                pnAnswer.Controls.Add(lb);
                //show Answer checkbox
                CheckBox ck = new CheckBox();
                String ckS = a.content.Substring(0, 1);
                ck.Text = ckS;
                listCk.Add(ck);
                pnAnswerCk.Controls.Add(ck);
                ck.CheckedChanged += Ck_CheckedChanged;

            }

        }

        private void Lb_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void Ck_CheckedChanged(object sender, EventArgs e)
        {
            bool isCheck = false;
            foreach (CheckBox ck in listCk)
            {
                if (ck.Checked)
                {
                    isCheck = true;
                    break;
                }
            }
            exfrom.changeColer(question, isCheck);
        }

        private void btNext_Click(object sender, EventArgs e)
        {
            
            int index = 0 ;
            for(int i = 0; i < listQuestionForms.Count; i++)
            {
                if (listQuestionForms[i] == this)
                {
                    if(i == listQuestionForms.Count-1)
                    {
                        index = 0;
                        
                    }
                    else
                    {
                        index = i + 1;
                    }
                }
            }
            exfrom.display(listQuestionForms[index]);
            exfrom.listButtonsQuestion[index].Select();
        }
        //Fix mouse
        private void panel1_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void pnAnswer_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void panel2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

       

        private void pnAnswerCk_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void label2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void label1_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void lblCount_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void lblChoose_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void lblquestion_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }

        private void lblquestion_MouseClick(object sender, MouseEventArgs e)
        {
            System.Windows.Forms.Cursor.Position = new Point(20, 35);
        }
    }
}
