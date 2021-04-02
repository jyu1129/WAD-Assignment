using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace WAD_Assignment
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        //Create Connection
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();

            //Get Email 
            string toEmail = txtEmail.Text.ToString();

            //Get Email & Password from Database
            string strSelect = "SELECT * " +
                               "FROM(SELECT FirstName, LastName, Email, Password FROM Artists " +
                               "UNION SELECT FirstName, LastName, Email, Password FROM Customers) AS E " +
                               "WHERE E.Email = '" + toEmail + "' ";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                string firstName = dr["FirstName"].ToString();
                string lastName = dr["LastName"].ToString();
                string userEmail = dr["Email"].ToString();
                string password = dr["Password"].ToString();

                string to = userEmail; //To user email address
                string from = "my.mochiartgallery@gmail.com"; //From address  
                
                //email
                MailMessage message = new MailMessage(from, to);
                message.Subject = "Password Recovery";
                message.Body = string.Format("Hi {0} {1},<br /><br />Your password is {2}.<br /><br />Thank You", firstName,lastName, password);
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "my.mochiartgallery@gmail.com";
                nc.Password = "mmag1234";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(message);
                lblMessage.Text = "Your Password has been sent to " + userEmail;
                lblMessage.ForeColor = Color.Green;
            }
            else
            {
                lblMessage.Text = "The email is not exists!";
                lblMessage.ForeColor = Color.Red;
            }
            dr.Close();
            con.Close();

        }
    }
}