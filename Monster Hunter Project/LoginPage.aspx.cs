using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monster_Hunter_Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Users myuser = new Users();
            string username = usernameBox.Text;
            string password = passwordBox.Text;
            Label1.Text = password;
            Label1.Visible = true;
            int Count = myuser.checkUserPwd(username, password);
            if (Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "error";
            }
            if (Count== 1)
            {
                Response.Redirect("TestForm.aspx", false);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            string password = txtPassword.Text;
            string username = txtUsername.Text;

            Users myuser = new Users();
            myuser.insertUser(  username, password);

        }
    }
}