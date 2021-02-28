using System;
using System.Configuration;
using System.Data.SqlClient;
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
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            con = new SqlConnection(strCon);
            con.Open();

            con2 = new SqlConnection(strCon2);
            con2.Open();

            if (!Page.IsPostBack)
            {
                showData();
            }

            if (Session["role"] == "Artists")
            {
                //Hide Wishlist & Purchase History 
                btnWishlist.Visible = false;
                btnPurchaseHistory.Visible = false;

            }
            else
            {
                btnWishlist.Visible = true;
                btnPurchaseHistory.Visible = true;
            }

        }

        public void showData()
        {
            string firstName = "", lastName = "", email = "", phoneNum = "", address = "", country = "", currentPw = "";

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
            if (country != "")
            {
                ddlCountry.SelectedValue = ddlCountry.Items.FindByText(country).Value;
            }
            txtPw.Text = currentPw;


            txtFirstName.Enabled = false;
            txtLastName.Enabled = false;
            txtEmail.Enabled = false;
            txtPhone.Enabled = false;
            txtAddress.Enabled = false;
            ddlCountry.Enabled = false;
            txtPw.Enabled = false;
            txtNewPw.Enabled = false;
            txtConfirmNewPw.Enabled = false;


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
                    txtFirstName.Enabled = false;
                    txtLastName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtPhone.Enabled = false;
                    txtAddress.Enabled = false;
                    ddlCountry.Enabled = false;
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
                    lblUpdate.Text = "";
                    lblEmail.Text = "";
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
            string strSelect = "SELECT * FROM(SELECT Email FROM Artists UNION SELECT Email FROM Customers) AS E WHERE E.Email = '" + email + "' ";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader drEmail = command.ExecuteReader();
            if (drEmail.HasRows)
            {
                if (email == (string)Session["user"])
                {
                    //Email Remains Unchanged
                    email = (string)Session["user"];
                }
                else
                {
                    //Email Remains Unchanged
                    email = (string)Session["user"];
                    lblEmail.ForeColor = System.Drawing.Color.Red;
                    lblEmail.Text = "Email not updated as it is already exist";
                }
                txtEmail.Text = email;

            }
            drEmail.Close();
            con.Close();

            con.Open();
            //Update details into database
            string strUpdate = "UPDATE " + Session["role"] + " SET FirstName = '" + firstName + "', LastName = '" + lastName + "', Email = '" + email + "', Phone = '" + phoneNum + "', Address = '" + address + "', Country = '" + country + "' " +
                               "WHERE Email = '" + Session["user"] + "'";
            SqlCommand command3 = new SqlCommand(strUpdate, con);
            command3.ExecuteNonQuery();
            con.Close();
            lblUpdate.ForeColor = System.Drawing.Color.Black;
            lblUpdate.Text = "Updated successfully!";

            //Update email in Session
            Session["user"] = email;


        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            Button btnName = sender as Button;
            switch (btnName.Text)
            {
                case "Save":
                    //code
                    saveChanges_Pw();
                    txtPw.Text = "";
                    txtNewPw.Text = "";
                    txtConfirmNewPw.Text = "";
                    txtPw.Enabled = false;
                    txtNewPw.Enabled = false;
                    txtConfirmNewPw.Enabled = false;
                    btnChange.Text = "Change";
                    break;

                case "Change":
                    //code
                    txtPw.Enabled = true;
                    txtNewPw.Enabled = true;
                    txtConfirmNewPw.Enabled = true;
                    btnChange.Text = "Save";
                    lblChange.Text = "";
                    break;
            }
        }

        public void saveChanges_Pw()
        {
            //New changes edit by user
            string currentPw, newPw, confirmNewPw;

            currentPw = txtPw.Text.ToString();
            newPw = txtNewPw.Text.ToString();
            confirmNewPw = txtConfirmNewPw.Text.ToString();

            //Check Current Password Match
            string strSelect = "SELECT * " +
                               "FROM(SELECT Password, Email FROM Artists UNION SELECT Password, Email FROM Customers) AS P " +
                               "WHERE P.Password = '" + currentPw + "' AND P.Email = '" + Session["user"] + "'";
            SqlCommand command = new SqlCommand(strSelect, con);
            SqlDataReader drPassword = command.ExecuteReader();
            if (drPassword.HasRows)
            {
                //Password Match
                //Update New Password to database
                string strUpdate2 = "UPDATE " + Session["role"] + " SET Password = '" + newPw + "' " +
                                    "WHERE Email = '" + Session["user"] + "'";
                SqlCommand command2 = new SqlCommand(strUpdate2, con2);
                command2.ExecuteNonQuery();
                con2.Close();
                lblChange.ForeColor = System.Drawing.Color.Black;
                lblChange.Text = "Updated successfully!";

            }
            else
            {
                lblChange.ForeColor = System.Drawing.Color.Red;
                lblChange.Text = "Current Password is incorrect";
            }
            drPassword.Close();
            con.Close();
        }
    }


}