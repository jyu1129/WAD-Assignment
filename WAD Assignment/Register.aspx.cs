using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Register : System.Web.UI.Page
    {
        //Create Connection
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();



            //Store registration details into database
            if (ddlUserType.SelectedValue.Equals("Artist"))
            {
                string strIns = "Insert into [Artists](FirstName, LastName, Email, Password) values('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + txtEmail.Text + "', '" + txtPw.Text + "')";
                SqlCommand cmdIns = new SqlCommand(strIns, con);
                cmdIns.ExecuteNonQuery();
                con.Close();
            }
            else if(ddlUserType.SelectedValue.Equals("Customer"))
            {
                string strIns = "Insert into [Customers](FirstName, LastName, Email, Password) values('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + txtEmail.Text + "', '" + txtPw.Text + "')";
                SqlCommand cmdIns = new SqlCommand(strIns, con);
                cmdIns.ExecuteNonQuery();
                con.Close();
            }
        }

        
    }
}