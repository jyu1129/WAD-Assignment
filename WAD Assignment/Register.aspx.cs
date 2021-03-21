using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WAD_Assignment
{
    public partial class Register : System.Web.UI.Page
    {
        //Create Connection1
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Create Connection2
        SqlConnection con2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();

            bool emailExist = false;
            string selectedEmail = txtEmail.Text.ToString();
            //Check email duplication
            string strSelect = "SELECT * FROM(SELECT Email FROM Artists UNION SELECT Email FROM Customers) AS E WHERE E.Email = '" + selectedEmail + "' ";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader drEmail = command.ExecuteReader();
            if (drEmail.HasRows)
            {
                emailExist = true;
                lblEmailExist.Text = "Email address already exists";
            }
            drEmail.Close();
            con.Close();

            if (emailExist == false)
            {
                con2 = new SqlConnection(strCon2);
                con2.Open();
                //Store registration details into database
                if (ddlUserType.SelectedValue.Equals("Artist"))
                {
                    string strIns = "Insert into [Artists](FirstName, LastName, Email, Password) values('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + txtEmail.Text + "', '" + txtPw.Text + "')";
                    SqlCommand command2 = new SqlCommand(strIns, con2);
                    command2.ExecuteNonQuery();
                    con2.Close();
                }
                else if (ddlUserType.SelectedValue.Equals("Customer"))
                {
                    string strIns = "Insert into [Customers](FirstName, LastName, Email, Password) values('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + txtEmail.Text + "', '" + txtPw.Text + "')";
                    SqlCommand command2 = new SqlCommand(strIns, con2);
                    command2.ExecuteNonQuery();
                    con2.Close();
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Your account has been successfully registered!'); window.location = '" + Page.ResolveUrl("~/Login.aspx") + "';", true);
            }



        }

        
    }
}