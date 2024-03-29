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
                        con = new SqlConnection(strCon);
                        con.Open();
                        ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                        int Quantity = 1;
                        string strInsert = "INSERT INTO Cart(CustomerId, ArtId, Quantity) VALUES(" + Session["userID"] + "," + ArtId.Text.ToString() + "," + Quantity + ")";
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item successfully added to cart!');</script>");
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

                        con = new SqlConnection(strCon);
                        con.Open();             

                        string strInsert = "UPDATE Cart SET Quantity = " + Quantity + " WHERE CustomerId = " + Session["userID"] + "AND ArtId = " + ArtId.Text.ToString();
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        SqlDataReader dtrSelect = cmdInsert.ExecuteReader();
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item +1 successfully added to cart!');</script>");
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
                        con = new SqlConnection(strCon);
                        con.Open();
                        ArtId = e.Item.FindControl("ArtIdLabel") as Label;
                        string strInsert2 = "INSERT INTO Wishlists(CustomerId, AddedDate, ArtId) VALUES(" + Session["userID"] + "," + "GETDATE()" + "," + ArtId.Text.ToString() + ")";
                        SqlCommand cmdInsert2 = new SqlCommand(strInsert2, con);
                        SqlDataReader dtrSelect = cmdInsert2.ExecuteReader();
                        ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('Item successfully added to wishlist!');</script>");
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