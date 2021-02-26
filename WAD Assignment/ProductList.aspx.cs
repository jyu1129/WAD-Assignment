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
    public partial class ProductList : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void OnClick_AddToCard(object sender, EventArgs e)
        {
            

            
        }

        protected void dtProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //not logged
            if (Session["user"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Log In !');window.location ='Login.aspx';", true);                
            
            }
            else //logged
            {
                if (e.CommandName == "viewdetail")
                {
                    Response.Redirect("ProductDetails.aspx?ArtId=" + e.CommandArgument.ToString());
                }

                if (e.CommandName == "AddToCart")
                {

                    //create database connection
                    con = new SqlConnection(strCon);
                    //open database
                    con.Open();
                    //get from
                    int CustomerId = 123;
                    //To Get Art Id from the of the item from datalist
                    Label ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                    int Quantity = 1;
                    //INSERT database record
                    string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity) VALUES(" + CustomerId + "," + ArtId.Text.ToString() + "," + Quantity + ")";
                    //create sqlcommand
                    SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                    //temporary store record retrived by command object
                    SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                    //display success
                    ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('CART ADDED!');</script>");
                    //close connection
                    con.Close();

                }

                else if (e.CommandName == "AddToWishlist")
                {
                    DateTime date = new DateTime();
                    string d = date.ToString();
                    //create database connection
                    con = new SqlConnection(strCon);
                    //open database
                    con.Open();
                    //get from
                    int CustomerId = 123;
                    //To Get Art Id from the of the item from datalist
                    Label ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                    //INSERT database record 
                    string strInsert2 = "INSERT INTO Wishlists(CustomerId, AddedDate, ArtId) VALUES(" + CustomerId + "," + "GETDATE()" + "," + ArtId.Text.ToString() + ")";
                    //create sqlcommand
                    SqlCommand cmdInsert2 = new SqlCommand(strInsert2, con);
                    //temporary store record retrived by command object
                    SqlDataReader dtrSelect = cmdInsert2.ExecuteReader();
                    //display success
                    ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('WISHLIST ADDED!');</script>");
                    //close connection
                    con.Close();
                }
            }

            

        }

        // NavigateUrl='<%#"ProductDetails.aspx?ArtId="+Eval("ArtId").ToString()%>'

    }
}