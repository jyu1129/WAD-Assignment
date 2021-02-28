﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        double subTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            getSubTotal();

        }

        protected void gvCart_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvCart_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            getSubTotal();
        }

        protected void getSubTotal()
        {


            gvCart.DataBind();
            con = new SqlConnection(strCon);
            con.Open();

            int rowCount = gvCart.Rows.Count;

            if (rowCount > 0)
            {

                string strSelect = "SELECT SUM(C.Quantity * A.Price) AS SubTotal FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE C.CustomerId = " + Session["userID"];

                //create set command
                SqlCommand cmdSelect2 = new SqlCommand(strSelect, con);

                //because OrderIDSales is double
                subTotal = Convert.ToDouble(cmdSelect2.ExecuteScalar());

                lblSubTotal.Text = subTotal.ToString();
                lblTotalItem.Text = gvCart.Rows.Count.ToString();

                btnCheckOut.Visible = true;

            }
            else
            {
                //checkout button unavailable if no cart
                btnCheckOut.Visible = false;

                subTotal = 0;
                lblSubTotal.Text = subTotal.ToString();
                lblTotalItem.Text = gvCart.Rows.Count.ToString();
            }

            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //not logged
            if (Session["user"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Log In !');window.location ='Login.aspx';", true);
            }
            else //logged
            {

                Response.Redirect("CheckOut.aspx");
            }
        }

        protected void gvCart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvCart.DataBind();
            con = new SqlConnection(strCon);
            con.Open();

            int index = Convert.ToInt32(e.CommandArgument.ToString());
            int qty = Convert.ToInt32(gvCart.Rows[index].Cells[6].Text.ToString());
            int cartId = Convert.ToInt32(gvCart.DataKeys[index].Value.ToString());

            if (e.CommandName.Equals("MinusQty"))
            {            
                //qty will never be -1
                if(qty > 0)
                {
                    string strUpdateCartQty = "UPDATE Cart SET Quantity = Quantity - 1 WHERE CartId = " + cartId.ToString();
                    SqlCommand cmdUpdateCartQty = new SqlCommand(strUpdateCartQty, con);
                    SqlDataReader dtrUpdateCartQty = cmdUpdateCartQty.ExecuteReader();
                    dtrUpdateCartQty.Close();
                }
                   
            }
            if (e.CommandName.Equals("AddQty"))
            {
                //qty will never be >5 (means one user can only buy maximum 5 qty)
                if (qty < 5)
                {
                    string strUpdateCartQty = "UPDATE Cart SET Quantity = Quantity + 1 WHERE CartId = " + cartId.ToString();
                    SqlCommand cmdUpdateCartQty = new SqlCommand(strUpdateCartQty, con);
                    SqlDataReader dtrUpdateCartQty = cmdUpdateCartQty.ExecuteReader();
                    dtrUpdateCartQty.Close();
                }

            }


            con.Close();
            gvCart.DataBind();
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }
    }
}