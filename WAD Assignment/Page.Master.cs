using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Page : System.Web.UI.MasterPage
    {
        //Create Connection 1
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Create Connection 2
        SqlConnection con2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] == null)
            {
                lblName.Text = "Guest";
                btnLog.Text = "Log in";
                btnProfile.Visible = false;

            }
            else
            {
                con = new SqlConnection(strCon);
                con.Open();

                con2 = new SqlConnection(strCon2);
                con2.Open();

                showData();
                btnLog.Text = "Log out";
                btnProfile.Visible = true;

            }
        }

        public void showData()
        {
            string firstName="", lastName="";
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

                }
            }
            dr2.Close();
            con2.Close();

            lblName.Text = $" {firstName} {lastName}";


        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");

            }
            else
            {
                Session.RemoveAll();
                Response.Redirect("Homepage.aspx");


            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}