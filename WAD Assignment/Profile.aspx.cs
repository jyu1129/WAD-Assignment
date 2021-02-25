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
    public partial class Profile : System.Web.UI.Page
    {
        //Create Connection 1
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //Create Connection 2
        SqlConnection con2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();

            con2 = new SqlConnection(strCon2);
            con2.Open();


            showData();
        }

        public void showData()
        {

            string firstName="", lastName = "", email = "", phoneNum = "", address = "", country = "", currentPw = "";

            string strSelectArt = "SELECT * FROM Artists WHERE Email = '" + Session["user"] + "'";
            string strSelectCust = "SELECT * FROM Customers WHERE Email = '" + Session["user"] + "'";
            SqlCommand command = new SqlCommand(strSelectArt, con);
            SqlDataReader dr = command.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    firstName = dr["FirstName"].ToString();
                    lastName = dr["lastName"].ToString();
                    email = dr["Email"].ToString();
                    phoneNum = dr["Phone"].ToString();
                    address = dr["Address"].ToString();
                    country = dr["Country"].ToString();
                    currentPw = dr["Password"].ToString();
                }
            }
            dr.Close();
            con.Close();


            SqlCommand command2 = new SqlCommand(strSelectCust, con2);
            SqlDataReader dr2 = command2.ExecuteReader();
            if (dr2.HasRows)
            {
                while (dr2.Read())
                {
                    firstName = dr2["FirstName"].ToString();
                    lastName = dr2["lastName"].ToString();
                    email = dr2["Email"].ToString();
                    phoneNum = dr2["Phone"].ToString();
                    address = dr2["Address"].ToString();
                    country = dr2["Country"].ToString();
                    currentPw = dr2["Password"].ToString();

                }
            }
            dr2.Close();
            con2.Close();

            //Set Profile Details
            txtFirstName.Text = firstName;
            txtLastName.Text = lastName;
            txtEmail.Text = email;
            txtPhone.Text = phoneNum;
            txtAddress.Text = address;
            ddlCountry.SelectedValue = ddlCountry.Items.FindByText(country).Value;

            txtFirstName.Enabled = false;
            txtLastName.Enabled = false;
            txtEmail.Enabled = false;
            txtPhone.Enabled = false;
            txtAddress.Enabled = false;
            ddlCountry.Enabled = false;


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btnName = sender as Button;
            switch (btnName.Text)
            {
                case "Save":
                    //code
                    saveChanges();
                    btnUpdate.Text = "Update";
                    break;

                case "Update":
                    //code
                    txtFirstName.Enabled = true;
                    txtLastName.Enabled = true;
                    txtEmail.Enabled = true;
                    txtPhone.Enabled = true;
                    txtAddress.Enabled = true;
                    ddlCountry.Enabled = true;

                    btnUpdate.Text = "Save";
                    break;
            }


        }

        public void saveChanges()
        {
            //New changes edit by user
            string firstName, lastName, email, phoneNum, address, country;

            firstName = txtFirstName.Text.ToString();
            lastName = txtLastName.Text.ToString();
            email = txtEmail.Text.ToString();
            phoneNum = txtPhone.Text.ToString();
            address = txtAddress.Text.ToString();
            country = ddlCountry.SelectedValue.ToString();

            //Check Email
            con.Open();
            bool emailExist = false;
            string strSelect = "SELECT * FROM(SELECT Email FROM Artists UNION SELECT Email FROM Customers) AS E WHERE E.Email = '" + email + "' ";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader drEmail = command.ExecuteReader();
            if (drEmail.HasRows)
            {
                emailExist = true;
                //lblEmailExist.Text = "Email address already exists";
            }
            drEmail.Close();
            con.Close();

            //Check Phone
            con2.Open();
            bool phoneExist = false;
            string strSelect2 = "SELECT * FROM(SELECT Phone FROM Artists UNION SELECT Phone FROM Customers) AS P WHERE P.Phone = '" + phoneNum + "' ";
            SqlCommand command2 = new SqlCommand(strSelect2, con2);
            SqlDataReader drPhone = command2.ExecuteReader();
            if (drPhone.HasRows)
            {
                phoneExist = true;
                //lblEmailExist.Text = "Email address already exists";
            }
            drPhone.Close();
            con2.Close();

            if(emailExist == true && phoneExist == true)
            {
                lblError.Text = "Email address and Phone Number already exist";
            }
            else if(emailExist == true && phoneExist == false)
            {
                lblError.Text = "Email address already exists";
            }
            else if(emailExist == false && phoneExist == true)
            {
                lblError.Text = "Phone Number already exists";
            }
            else
            {
                con.Open();
                //Update details into database
                string strUpdate = "UPDATE Artists SET FirstName = '" + firstName + "', LastName = '" + lastName + "', Email = '" + email + "', Phone = '" + phoneNum + "', Address = '" + address + "', Country = '" + country + "' " +
                                   "WHERE Email = '" + Session["user"] + "'";
                SqlCommand command3 = new SqlCommand(strUpdate, con);
                command3.ExecuteReader();
                con.Close();
                lblError.Text = "Updated successfully!";
            }

        }
    }


}