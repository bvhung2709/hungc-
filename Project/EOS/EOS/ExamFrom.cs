using EOS.dao;
using EOS.model;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;


namespace EOS
{
    public partial class ExamFrom : Form
    {
        
        Login login;
        Exam e;
        int TimeSec;
        int indexBT;
        List<Question> listQuestion;
      public  List<Button> listButtonsQuestion = new List<Button>();
        List<QuestionFrom> listQuestionForms = new List<QuestionFrom>();
        //disable window key
        
        public ExamFrom(Login login)
        {

            Disible d = new Disible();
            InitializeComponent();
            
            //full screen
              this.TopMost = true;
              this.FormBorderStyle = FormBorderStyle.None;
              this.WindowState = FormWindowState.Maximized;
            this.login = login;
            QuestionDAO qDao = new QuestionDAO();
            listQuestion = qDao.getAllQuestion(login.ExamCode);
            ExamDAO edao = new ExamDAO();
             e = edao.getExam(login.ExamCode);
            //show information
            showInformation();
            //show button to from 
            Showbuton();
            display(listQuestionForms[0]);

           
        }
      
        //show 

        public void showInformation()
        {
            lblDuration.Text = e.Time + " minutes";
            lblStudent.Text = login.user;
            lblExemCode.Text = e.ExamCode;
            lblTotal.Text = listQuestion.Count + "";
            //get value Time 
            int timeMin = e.Time;
            TimeSec = 60 * 60;
            addValueTime();
            Timer.Enabled = true;
            lblSucess.Text = "";

        }

        public  void Showbuton()
        {
            for (int i = 0; i < listQuestion.Count; i++)
            {
                //show text button 
                Button bt = new Button();
                bt.Text = (i + 1).ToString();
                //add button to list
                listButtonsQuestion.Add(bt);
                //add button to panel
                pnButton.Controls.Add(bt);
                //add event when click button
                bt.Click += Bt_Click;
                //ad question from to list
                QuestionFrom qs = new QuestionFrom(listQuestion[i], this, listQuestionForms,i);
            
                listQuestionForms.Add(qs);



            }
        }
        public void display(QuestionFrom s)
        {
            pnQuestion.Controls.Clear();
            pnQuestion.Controls.Add(s);
        }
        //event
        //click 
        private void Bt_Click(object sender, EventArgs e)
        {
            
            // assign value of button by click
            Button bt = (Button)sender;
            for (int i = 0; i < listQuestion.Count; i++)
            {
                //search button
                if (listButtonsQuestion[i] == bt)
                {
                    display(listQuestionForms[i]);
                    return;
                }

            }
        }
        public void changeColer(Question s, bool isSelect)
        {
            for (int i = 0; i < listQuestion.Count; i++)
            {
                //get index of question button want change
                if (listQuestion[i] == s)
                {
                    if (isSelect == true)
                    {
                        listButtonsQuestion[i].BackColor = Color.GreenYellow;

                    }
                    else
                    {
                        listButtonsQuestion[i].BackColor = Color.White;
                    }
                }
            }

        }
        //finish and exit
        private void btFinish_Click(object sender, EventArgs e)
        {
            if (ckFinish.Checked)
            {
                FinishFrom();
                //  InsertData();
                //set size
                this.TopMost = false;
                this.FormBorderStyle = FormBorderStyle.FixedDialog;
                this.WindowState = FormWindowState.Normal;
                this.Size = new Size(1134, 658);

            }
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            TimeSec--;
            addValueTime();
            if (TimeSec <= 0)
            {
                FinishFrom();
                ckFinish.Checked = true;
                InsertData();
                //set size
                this.TopMost = false;
                this.FormBorderStyle = FormBorderStyle.FixedDialog;
                this.WindowState = FormWindowState.Normal;
                this.Size = new Size(1134, 658);

            }
        }

        private void ckFinish_CheckedChanged(object sender, EventArgs e)
        {
            if (btFinish.Enabled == true)
            {
                btFinish.Enabled = false;
            }
            else
            {
                btFinish.Enabled = true;
            }

        }
        private void btExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public void FinishFrom()
        {

            pnQuestion.Controls.Clear();
            pnButton.Controls.Clear();
            lblMultiple.Text = "";
            btFinish.Enabled = false;
            btExit.Enabled = true;
            Timer.Enabled = false;
            lblSucess.Text = "Exam Finished successfully";
            
        }
        public void InsertData()
        {
            StudentExamDAO dao = new StudentExamDAO();
            dao.insertValue(login);
            setAnswerChecker();
            int id = dao.getIdOfStudentExam(login);
            dao.insertDetail(listQuestion,id);
            
        }
        public void setAnswerChecker()
        {
            //set check for answer
            for(int i = 0; i< listQuestionForms.Count; i++)
            {
                for(int j = 0; j < listQuestionForms[i].question.listAnswers.Count; j++)
                {
                    if (listQuestionForms[i].listCk[j].Checked)
                    {
                        listQuestionForms[i].question.listAnswers[j].isSelect = true;
                    }
                }
            }
        }

        public void addValueTime()
        {
            int min = (TimeSec % 3600) / 60;
            int sec = (TimeSec % 3600) % 60;
            if (sec.ToString().Length > 1)
            {
                lblTime.Text = min + ":" + sec;
            }
            else
            {
                lblTime.Text = min + ":0" + sec;
            }


        }

        private void numbericUpDown_ValueChanged(object sender, EventArgs e)
        {

            int size = int.Parse(numbericUpDown.Value.ToString());
            // pnQuestion.Font = new System.Drawing.Font(pnQuestion.Font.FontFamily, size, pnQuestion.Font.Style);
            for (int i = 0; i < listQuestionForms.Count; i++)
            {
                listQuestionForms[i].lblChoose.Font = new System.Drawing.Font(pnQuestion.Font.FontFamily, size, pnQuestion.Font.Style);
                listQuestionForms[i].lblquestion.Font = new System.Drawing.Font(pnQuestion.Font.FontFamily, size, pnQuestion.Font.Style);
                for (int j = 0; j < listQuestionForms[i].listLabelAnswer.Count; j++)
                {
                   // listQuestionForms[i].listLabelAnswer[j].Height = size+10;
                    listQuestionForms[i].listLabelAnswer[j].Font = new System.Drawing.Font(pnQuestion.Font.FontFamily, size, pnQuestion.Font.Style);
                }
            }

        }

       



        
       
       

      
    }
}
