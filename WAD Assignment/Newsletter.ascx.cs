using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace WAD_Assignment
{
    public partial class Newsletter : System.Web.UI.UserControl
    {
        //Create Connection
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool emailExist = false;
            string selectedEmail = txtEmail.Text.ToString();
            con = new SqlConnection(strCon);
            con.Open();
            //Check email duplication
            string strSelect = "SELECT * FROM NewsletterMail WHERE regmail = '" + selectedEmail + "' ";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader drEmail = command.ExecuteReader();
            if (drEmail.HasRows)
            {
                emailExist = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Email address already exists";
                txtEmail.Text = "";
            }
            drEmail.Close();
            con.Close();

            if (emailExist == false)
            {
                con.Open();
                string strIns = "insert into[NewsletterMail](regmail)values('" + txtEmail.Text + "')";
                SqlCommand command2 = new SqlCommand(strIns, con);
                command2.ExecuteNonQuery();
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Your email registered with us!";
                txtEmail.Text = "";
                con.Close();
            }
        }
    }
}