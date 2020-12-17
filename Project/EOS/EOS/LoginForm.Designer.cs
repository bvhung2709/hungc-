namespace EOS
{
    partial class LoginForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtExamCode = new System.Windows.Forms.TextBox();
            this.txtPass = new System.Windows.Forms.TextBox();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.txtLogin = new System.Windows.Forms.Button();
            this.txtExit = new System.Windows.Forms.Button();
            this.txtDomain = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.lblSound = new System.Windows.Forms.Label();
            this.lblFont = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(12, 59);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Exam Code:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(21, 163);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(82, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Password:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(12, 111);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(93, 20);
            this.label3.TabIndex = 2;
            this.label3.Text = "User Name:";
            // 
            // txtExamCode
            // 
            this.txtExamCode.Location = new System.Drawing.Point(121, 61);
            this.txtExamCode.Name = "txtExamCode";
            this.txtExamCode.Size = new System.Drawing.Size(281, 20);
            this.txtExamCode.TabIndex = 3;
            // 
            // txtPass
            // 
            this.txtPass.Location = new System.Drawing.Point(121, 165);
            this.txtPass.Name = "txtPass";
            this.txtPass.Size = new System.Drawing.Size(281, 20);
            this.txtPass.TabIndex = 4;
            this.txtPass.UseSystemPasswordChar = true;
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(121, 111);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(281, 20);
            this.txtUser.TabIndex = 5;
            // 
            // txtLogin
            // 
            this.txtLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.txtLogin.Location = new System.Drawing.Point(120, 245);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(91, 25);
            this.txtLogin.TabIndex = 6;
            this.txtLogin.Text = "Login";
            this.txtLogin.UseVisualStyleBackColor = true;
            this.txtLogin.Click += new System.EventHandler(this.txtLogin_Click);
            // 
            // txtExit
            // 
            this.txtExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.txtExit.Location = new System.Drawing.Point(251, 245);
            this.txtExit.Name = "txtExit";
            this.txtExit.Size = new System.Drawing.Size(87, 25);
            this.txtExit.TabIndex = 7;
            this.txtExit.Text = "Exit";
            this.txtExit.UseVisualStyleBackColor = true;
            this.txtExit.Click += new System.EventHandler(this.txtExit_Click);
            // 
            // txtDomain
            // 
            this.txtDomain.Location = new System.Drawing.Point(121, 210);
            this.txtDomain.Name = "txtDomain";
            this.txtDomain.ReadOnly = true;
            this.txtDomain.Size = new System.Drawing.Size(281, 20);
            this.txtDomain.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.Location = new System.Drawing.Point(27, 208);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 20);
            this.label4.TabIndex = 8;
            this.label4.Text = "Domain:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label5.ForeColor = System.Drawing.Color.Red;
            this.label5.Location = new System.Drawing.Point(68, 322);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(339, 20);
            this.label5.TabIndex = 10;
            this.label5.Text = "Register the exem may  take time ,please wait !";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label6.ForeColor = System.Drawing.Color.Red;
            this.label6.Location = new System.Drawing.Point(376, 26);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(31, 20);
            this.label6.TabIndex = 11;
            this.label6.Text = "1.0";
            // 
            // lblSound
            // 
            this.lblSound.AutoSize = true;
            this.lblSound.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lblSound.ForeColor = System.Drawing.Color.Blue;
            this.lblSound.Location = new System.Drawing.Point(117, 291);
            this.lblSound.Name = "lblSound";
            this.lblSound.Size = new System.Drawing.Size(107, 13);
            this.lblSound.TabIndex = 12;
            this.lblSound.Text = "Check sound(7 secs)";
            this.lblSound.Click += new System.EventHandler(this.lblSound_Click);
            // 
            // lblFont
            // 
            this.lblFont.AutoSize = true;
            this.lblFont.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lblFont.ForeColor = System.Drawing.Color.Blue;
            this.lblFont.Location = new System.Drawing.Point(248, 291);
            this.lblFont.Name = "lblFont";
            this.lblFont.Size = new System.Drawing.Size(59, 13);
            this.lblFont.TabIndex = 13;
            this.lblFont.Text = "Check font";
            this.lblFont.Click += new System.EventHandler(this.lblFont_Click);
            // 
            // LoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(465, 358);
            this.Controls.Add(this.lblFont);
            this.Controls.Add(this.lblSound);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtDomain);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtExit);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.txtUser);
            this.Controls.Add(this.txtPass);
            this.Controls.Add(this.txtExamCode);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.Name = "LoginForm";
            this.Text = "EOS Login";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtExamCode;
        private System.Windows.Forms.TextBox txtPass;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.Button txtLogin;
        private System.Windows.Forms.Button txtExit;
        private System.Windows.Forms.TextBox txtDomain;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label lblSound;
        private System.Windows.Forms.Label lblFont;
    }
}

