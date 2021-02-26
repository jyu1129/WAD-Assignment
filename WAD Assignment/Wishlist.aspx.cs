using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment
{
    public partial class Wishlist : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblWishCount.Text = gvWishlist.Rows.Count.ToString();
        }
        protected void CartClick(object sender, ImageClickEventArgs e)
        {

            //create database connection
            con = new SqlConnection(strCon);
            //open database
            con.Open();
            //To Get Art Id from the of the item from gridview
            ImageButton ib = sender as ImageButton;
            object commandArg = ib.CommandArgument;
            string ArtId = commandArg.ToString();

            int Quantity = 1;
            //INSERT database record
            string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity) VALUES(" + Session["userID"]  + "," + ArtId + "," + Quantity + ")";
            //create sqlcommand
            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            //temporary store record retrived by command object
            SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
            //display success
            ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Wishlist item successfully added to Cart!');</script>");
            //close connection
            con.Close();

        }

        protected void ArtClick(object sender, ImageClickEventArgs e)
        {
            ImageButton ib = sender as ImageButton;
            object commandArg = ib.CommandArgument;
            string ArtId = commandArg.ToString();

            Response.Redirect("ProductDetails.aspx?ArtId=" + ArtId);
        }
    }
}