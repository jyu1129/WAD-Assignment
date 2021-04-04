using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
                btnCheckOut.Visible = true;

            }
            else
            {
                //checkout button unavailable if no cart
                btnCheckOut.Visible = false;

                subTotal = 0;
            }

            lblSubTotal.Text = subTotal.ToString();
            lblTotalItem.Text = gvCart.Rows.Count.ToString();

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
                bool enoughStock = true;
                int i = 0;

                con = new SqlConnection(strCon);
                con.Open();
                string strSelect = "SELECT * FROM Cart Where CustomerId = " + Session["userID"];
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader drSelect = cmdSelect.ExecuteReader();
                List<String> quantity = new List<String>();
                List<String> artId = new List<String>();
                while (drSelect.Read())
                {
                    quantity.Add(drSelect["Quantity"].ToString());
                    artId.Add(drSelect["ArtId"].ToString());
                    i++;
                }
                drSelect.Close();
                con.Close();

                string neStock = "";
                while (i > 0)
                {
                    con.Open();
                    strSelect = "SELECT Stock FROM Arts Where ArtId = " + artId[i - 1];
                    cmdSelect = new SqlCommand(strSelect, con);

                    if (int.Parse(cmdSelect.ExecuteScalar().ToString()) < int.Parse(quantity[i - 1]))
                    {
                        neStock += "\\nArt ID: " + artId[i - 1] + " has not enough stock!";
                        enoughStock = false;
                    }
                    i--;
                    con.Close();
                }
                if (enoughStock)
                {
                    Response.Redirect("CheckOut.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + neStock + "');", true);
                }
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
                if (qty > 1)
                {
                    string strUpdateCartQty = "UPDATE Cart SET Quantity = Quantity - 1 WHERE CartId = " + cartId.ToString();
                    SqlCommand cmdUpdateCartQty = new SqlCommand(strUpdateCartQty, con);
                    SqlDataReader dtrUpdateCartQty = cmdUpdateCartQty.ExecuteReader();
                    dtrUpdateCartQty.Close();
                }
                else //if qty = 0 , st8 away delete cart
                {
                    string strDeleteCart = "DELETE Cart WHERE CartId = " + cartId.ToString();
                    SqlCommand cmdDeleteCart = new SqlCommand(strDeleteCart, con);
                    SqlDataReader dtrDeleteCart = cmdDeleteCart.ExecuteReader();
                    dtrDeleteCart.Close();
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
            if (e.CommandName.Equals("DeleteProduct"))
            {
                //delete the product from cart
                string strDeleteCart = "DELETE Cart WHERE CartId = " + cartId.ToString();
                SqlCommand cmdDeleteCart = new SqlCommand(strDeleteCart, con);
                SqlDataReader dtrDeleteCart = cmdDeleteCart.ExecuteReader();
                dtrDeleteCart.Close();            
            }


            con.Close();
            gvCart.DataBind();
            Response.Redirect("Cart.aspx");
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }



    }
}