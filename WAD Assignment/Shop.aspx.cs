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
    public partial class Shop : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //create database connection
            con = new SqlConnection(strCon);
            //open database
            con.Open();

            //get from
            int CustomerId = 123;
            int ArtId = 1;
            int Quantity = 1;

            
            int TotalPrice = 2500;


            //INSERT database record
            string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity, TotalPrice) VALUES("+CustomerId+","+ArtId+","+Quantity+","+TotalPrice+")";
            //create sqlcommand
            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            //temporary store record retrived by command object
            SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
            //close connection
            con.Close();
        }
    }
}