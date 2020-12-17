using EOS.dao;
using EOS.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EOS
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            txtDomain.Text = "Localhost:1433.Driver:MrD.Database.fpt.edu";
            txtDomain.Enabled = false;
        }

        private void txtLogin_Click(object sender, EventArgs e)
        {
            String examCode = txtExamCode.Text;
            String user = txtUser.Text;
            String pass = txtPass.Text;
            LoginDAO loginDAO = new LoginDAO();
            Login login = loginDAO.getUser(user, pass);
            if(login.pass ==null || login.user == null)
            {
                MessageBox.Show("User or pass incorrect");
                return;
            }
            login = loginDAO.getUser(user, pass, examCode);
            if (login.ExamCode == null)
            {
                MessageBox.Show("Exam Code incorrect");
                return;

            }

            ExamFrom exForm = new ExamFrom(login);
            exForm.Show();
        }

        private void lblFont_Click(object sender, EventArgs e)
        {
            Font f = new Font();
            f.Show();
        }

        private void lblSound_Click(object sender, EventArgs e)
        {
            System.Media.SoundPlayer player = new System.Media.SoundPlayer(@"F:\Study\Summer 2\C# .net\Project\bae1.wav");
            player.Play();
         
        }

        private void txtExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
