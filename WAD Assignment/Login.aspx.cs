using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        //Create Connection
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] != null)
            //{
            //    Response.Redirect("Homepage.aspx");
            //}
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();

            string selectedEmail = txtEmail.Text.ToString();
            string selectedPw = txtPassword.Text.ToString();

            //Check Email & Password
            string strSelect = "SELECT count(*) " +
                                "FROM(SELECT Email, Password FROM Artists " +
                                "UNION SELECT Email, Password FROM Customers) AS E " +
                                "WHERE E.Email = '" + selectedEmail + "' AND E.Password = '" + selectedPw + "'";
            SqlCommand command = new SqlCommand(strSelect, con);
            int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
            con.Close();

            if (temp == 1)
            {
                Session["user"] = selectedEmail;
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                lblInvalid.Text = "Your Email & Password is invalid! Please try again.";
            }

            
        }
    }
}