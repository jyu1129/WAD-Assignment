using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WAD_Assignment
{
    public partial class CheckOut : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            getTotalPayment();
        }

        protected void getTotalPayment()
        {
            double totalPayment = 0;

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                totalPayment += Convert.ToDouble(GridView2.Rows[i].Cells[5].Text);
            }


            lblSubTotal.Text = totalPayment.ToString();
            lblTotalItem.Text = GridView2.Rows.Count.ToString();
            lblTotalPayment.Text = totalPayment.ToString();

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {


            if (String.IsNullOrEmpty(txtAddress.Text) || String.IsNullOrEmpty(txtCity.Text) || String.IsNullOrEmpty(txtCountry.Text) || String.IsNullOrEmpty(txtName.Text) || String.IsNullOrEmpty(txtPostal.Text) || String.IsNullOrEmpty(txtState.Text))
            {
                Response.Write("Please fill in all the details");
            }
            else
            {
                DateTime dateTime = DateTime.Now;
                int year = Convert.ToInt32(dateTime.Year.ToString());
                int month = Convert.ToInt32(dateTime.Month.ToString());
                int day = Convert.ToInt32(dateTime.Day.ToString());
                int hour = Convert.ToInt32(dateTime.Hour.ToString());
                int min = Convert.ToInt32(dateTime.Minute.ToString());
                int sec = Convert.ToInt32(dateTime.Second.ToString());

                con = new SqlConnection(strCon);
                con.Open();

                int userID = Convert.ToInt32(Session["userID"]);

                string strInsertOrders = "INSERT INTO Orders(CustomerId, OrderDate, ShipName, ShipAddress, ShipCity, ShipState, ShipPostalCode, ShipCountry)" +
                    "VALUES(@CustomerId,@OrderDate,@ShipName,@ShipAddress,@ShipCity,@ShipState,@ShipPostalCode,@ShipCountry)";
                SqlCommand cmdSelect1 = new SqlCommand(strInsertOrders, con);
                cmdSelect1.Parameters.AddWithValue("@CustomerId", userID.ToString());
                cmdSelect1.Parameters.AddWithValue("@OrderDate", dateTime.ToString());
                cmdSelect1.Parameters.AddWithValue("@ShipName", txtName.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipAddress", txtAddress.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipCity", txtCity.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipState", txtState.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipPostalCode", txtPostal.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipCountry", txtCountry.Text);

                cmdSelect1.ExecuteNonQuery();

                //SELECT OrderId from customerID  --> get order id           
                string strSelectOrderId = "SELECT O.OrderId FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerId = O.CustomerId WHERE(C.CustomerId = " + userID.ToString() + ") AND(YEAR(O.OrderDate) = " + year.ToString() + ") AND(MONTH(O.OrderDate) = " + month.ToString() + ") AND(DAY(O.OrderDate) = " + day.ToString() + ") AND({ fn HOUR(O.OrderDate) } = " + hour.ToString() + ") AND({ fn MINUTE(O.OrderDate) } = " + min.ToString() + ") AND({fn SECOND(O.OrderDate)} = " + sec.ToString() + ")";
                SqlCommand cmdSelect2 = new SqlCommand(strSelectOrderId, con);
                int orderId = (int)cmdSelect2.ExecuteScalar();

                //GET ART ID, QUANTITY FROM CART & ART PRICE (current date of purchase)
                string strSelectCart = "SELECT ArtId, Quantity, CartId FROM Cart WHERE(CustomerId = " + userID.ToString() + ")";
                SqlCommand cmdSelect3 = new SqlCommand(strSelectCart, con);
                SqlDataReader dtrSelect3 = cmdSelect3.ExecuteReader();

                if (dtrSelect3.HasRows)
                {
                    while (dtrSelect3.Read())
                    {
                        string cartId = dtrSelect3["CartId"].ToString();
                        string artId = dtrSelect3["ArtId"].ToString();
                        string quantity = dtrSelect3["Quantity"].ToString();
                        dtrSelect3.Close();

                        //reason why price needs to be searched again from art is becuz prices are not constant <-- means can be chg by artist
                        string strSelectArt = "SELECT Price FROM Arts WHERE ArtId = " + artId;
                        SqlCommand cmdSelectArt = new SqlCommand(strSelectArt, con);
                        SqlDataReader dtrSelectArt = cmdSelectArt.ExecuteReader();
                        dtrSelectArt.Read();
                        string price = dtrSelectArt["Price"].ToString();
                        dtrSelectArt.Close();

                        //insert cart row into order detail
                        string strInsertOD = "INSERT INTO OrderDetails (OrderId, ArtId, UnitPrice, Quantity) " +
                        "VALUES(" + orderId.ToString() + "," + artId + "," + price + "," + quantity + ")";
                        SqlCommand cmdInsertOD = new SqlCommand(strInsertOD, con);
                        SqlDataReader dtrInsertOD = cmdInsertOD.ExecuteReader();
                        dtrInsertOD.Close();

                        //Delete cart row after the insert
                        string strDeleteCart = "DELETE FROM Cart WHERE CartId = " + cartId;
                        SqlCommand cmdDeleteCart = new SqlCommand(strDeleteCart, con);
                        SqlDataReader dtrDeleteCart = cmdDeleteCart.ExecuteReader();
                        dtrDeleteCart.Close();

                        //Update stock
                        string UpdateStock = "UPDATE Arts SET Stock = Stock - " + quantity + " WHERE(ArtId = " + artId + ")";
                        SqlCommand cmdUpdateStock = new SqlCommand(UpdateStock, con);
                        SqlDataReader dtrUpdateStock = cmdUpdateStock.ExecuteReader();
                        dtrUpdateStock.Close();

                        //reopen connection until no row
                        dtrSelect3 = cmdSelect3.ExecuteReader();

                    }
                }

                dtrSelect3.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Succesfully Placed! Your item will be shipped to you soon!');window.location ='Homepage.aspx';", true);
                con.Close();

                Response.Redirect("TransactionSummary.aspx?OrderId=" + orderId.ToString());
            }
        }
    }
}