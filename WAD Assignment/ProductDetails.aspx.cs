﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["user"] != null && (bool)Session["show"] == true)
            //{
            //    //wishlist heart
            //    con = new SqlConnection(strCon);
            //    con.Open();
            //    string strSelect = "SELECT * FROM Wishlists WHERE CustomerId = " + Session["userID"];
            //    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            //    SqlDataReader drSelect = cmdSelect.ExecuteReader();
            //    while (drSelect.Read())
            //    {
            //       if (drSelect["ArtId"].ToString().Equals(Request.QueryString["ArtId"].ToString()))
            //       {

            //          ((ImageButton)dtProductDetail.Items[0].FindControl("Button2")).ImageUrl = "https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/red_webpict35_1484337167-1.png";

            //       }
            //    }

            //    drSelect.Close();
            //    con.Close();
            //    Session["show"] = false;
            //    Response.Redirect("ProductDetails.aspx?ArtId=" + Request.QueryString["ArtId"].ToString());

            //}



        }

        protected void dtProductDetail_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //not logged
            if (Session["user"] == null)
            {
                if (e.CommandName == "viewdetail")
                {
                    Response.Redirect("ProductDetails.aspx?ArtId=" + e.CommandArgument.ToString());
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Log In !');window.location ='Login.aspx';", true);

            }
            else //logged
            {
                if (e.CommandName == "viewdetail")
                {
                    Response.Redirect("ProductDetails.aspx?ArtId=" + e.CommandArgument.ToString());
                }

                else if (e.CommandName == "AddToCart")
                {
                    bool itemExisted = false;
                    con = new SqlConnection(strCon);
                    con.Open();
                    string strSelect = "SELECT * FROM Cart WHERE CustomerId=" + Session["userID"];
                    SqlCommand cmdInsert4 = new SqlCommand(strSelect, con);
                    SqlDataReader drArtId = cmdInsert4.ExecuteReader();
                    Label ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                    while (drArtId.Read())
                    {
                        if (drArtId["ArtId"].ToString().Equals(ArtId.Text.ToString()))
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
                        ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                        int Quantity = 1;
                        //INSERT database record
                        string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity) VALUES(" + Session["userID"] + "," + ArtId.Text.ToString() + "," + Quantity + ")";
                        //create sqlcommand
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        //temporary store record retrived by command object
                        SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                        //display success
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item successfully added to cart!');</script>");
                        //close connection
                        con.Close();
                    }
                    else
                    {
                        int Quantity = 0;
                        ArtId = e.Item.FindControl("ArtIdLabel") as Label;

                        con = new SqlConnection(strCon);
                        con.Open();
                        string strSelect2 = "SELECT Quantity FROM Cart WHERE CustomerId = " + Session["userID"] + " AND ArtId = " + ArtId.Text.ToString();
                        SqlCommand cmdInsert5 = new SqlCommand(strSelect2, con);

                        Quantity = int.Parse(cmdInsert5.ExecuteScalar().ToString()) + 1;
                        con.Close();

                        //create database connection
                        con = new SqlConnection(strCon);
                        //open database
                        con.Open();
                        //To Get Art Id from the of the item from datalist                  

                        //INSERT database record
                        string strInsert = "UPDATE Cart SET Quantity = " + Quantity + " WHERE CustomerId = " + Session["userID"] + "AND ArtId = " + ArtId.Text.ToString();
                        //create sqlcommand
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        //temporary store record retrived by command object
                        SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                        //display success
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item +1 successfully added to cart!');</script>");
                        //close connection
                        con.Close();
                    }


                }

                else if (e.CommandName == "AddToWishlist")
                {
                    bool itemExisted = false;
                    con = new SqlConnection(strCon);
                    con.Open();
                    string strSelect = "SELECT * FROM Wishlists WHERE CustomerId=" + Session["userID"];
                    SqlCommand cmdInsert3 = new SqlCommand(strSelect, con);
                    SqlDataReader drArtId = cmdInsert3.ExecuteReader();
                    Label ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                    while (drArtId.Read())
                    {
                        if (drArtId["ArtId"].ToString().Equals(ArtId.Text.ToString()))
                        {
                            itemExisted = true;
                        }
                    }
                    con.Close();

                    ImageButton btn = e.Item.FindControl("Button2") as ImageButton;

                    if (!itemExisted)
                    {
                        //create database connection
                        con = new SqlConnection(strCon);
                        //open database
                        con.Open();
                        //To Get Art Id from the of the item from datalist
                        ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                        //INSERT database record 
                        string strInsert2 = "INSERT INTO Wishlists(CustomerId, AddedDate, ArtId) VALUES(" + Session["userID"] + "," + "GETDATE()" + "," + ArtId.Text.ToString() + ")";
                        //create sqlcommand
                        SqlCommand cmdInsert2 = new SqlCommand(strInsert2, con);
                        //temporary store record retrived by command object
                        SqlDataReader dtrSelect = cmdInsert2.ExecuteReader();
                        //display success
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item successfully added to wishlist!');</script>");
                        //close connection
                        con.Close();
                        btn.ImageUrl = "https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/red_webpict35_1484337167-1.png";
                    }
                    else
                    {

                        btn.ImageUrl = "https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/red_webpict35_1484337167-1.png";
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('This item is already in wishlist!');</script>");
                    }
                }
            }
        }

        protected void dtProductDetail_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}