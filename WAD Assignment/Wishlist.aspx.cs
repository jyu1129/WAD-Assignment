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

            bool itemExisted = false;
            con = new SqlConnection(strCon);
            con.Open();
            string strSelect = "SELECT * FROM Cart WHERE CustomerId=" + Session["userID"];
            SqlCommand cmdInsert4 = new SqlCommand(strSelect, con);
            SqlDataReader drArtId = cmdInsert4.ExecuteReader();
            ImageButton ib = sender as ImageButton;
            object commandArg = ib.CommandArgument;
            string ArtId = commandArg.ToString();
            while (drArtId.Read())
            {
                if (drArtId["ArtId"].ToString().Equals(ArtId))
                {
                    itemExisted = true;
                }
            }
            con.Close();

            if (!itemExisted)
            {
                //create database connection
                con = new SqlConnection(strCon);
                //open database
                con.Open();
                //To Get Art Id from the of the item from datalist
                ib = sender as ImageButton;
                int Quantity = 1;
                //INSERT database record
                string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity) VALUES(" + Session["userID"] + "," + ArtId + "," + Quantity + ")";
                //create sqlcommand
                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                //temporary store record retrived by command object
                SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                //display success
                ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Wishlist item successfully added to cart!');</script>");
                //close connection
                con.Close();
            }
            else
            {
                int Quantity = 0;

                con = new SqlConnection(strCon);
                con.Open();
                string strSelect2 = "SELECT * FROM Cart WHERE CustomerId=" + Session["userID"];
                SqlCommand cmdInsert5 = new SqlCommand(strSelect2, con);
                SqlDataReader drQty = cmdInsert5.ExecuteReader();
                while (drQty.Read())
                {
                    if (int.Parse(drQty["Quantity"].ToString()) >= 1)
                    {
                        Quantity = int.Parse(drQty["Quantity"].ToString()) + 1;
                    }
                }

                con.Close();

                //create database connection
                con = new SqlConnection(strCon);
                //open database
                con.Open();
                //To Get Art Id from the of the item from datalist
                ib = sender as ImageButton;

                //INSERT database record
                string strInsert = "UPDATE Cart SET Quantity = " + Quantity + " WHERE CustomerId = " + Session["userID"] + "AND ArtId = " + ArtId;
                //create sqlcommand
                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                //temporary store record retrived by command object
                SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                //display success
                ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Wishlist item +1 successfully added to cart!');</script>");
                //close connection
                con.Close();
            }

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