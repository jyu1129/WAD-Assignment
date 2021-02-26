using System;
using System.Configuration;
using System.Data.SqlClient;

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
            double subTotal = 0;
            double shippingFees = 0;
            double totalPayment = 0;

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                subTotal += Convert.ToDouble(GridView2.Rows[i].Cells[5].Text);
            }

            switch (ddlCourier.SelectedIndex)
            {
                //J&T
                case 0:
                    shippingFees = 5.66;
                    break;

                //Pos
                case 1:
                    shippingFees = 4.85;
                    break;

                //DHL
                case 2:
                    shippingFees = 3.59;
                    break;

            }

            totalPayment = subTotal + shippingFees;

            lblSubTotal.Text = subTotal.ToString();
            lblSubTotal2.Text = subTotal.ToString();
            lblTotalItem.Text = GridView2.Rows.Count.ToString();
            lblShippingTotal.Text = shippingFees.ToString();
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

                ////GET CURRENT DATETIME
                //string strSelectDate = "GETDATE()";
                //SqlCommand cmdGetDate = new SqlCommand(strSelectDate, con);
                //string dateTimeNow = (string)cmdGetDate.ExecuteScalar();
                //To Place an order

                int userID = Convert.ToInt32(Session["userID"]);

                string strInsertOrders = "INSERT INTO Orders(CustomerId, OrderDate, Courier, ShipName, ShipAddress, ShipCity, ShipState, ShipPostalCode, ShipCountry)" +
                    "VALUES(@CustomerId,@OrderDate,@Courier,@ShipName,@ShipAddress,@ShipCity,@ShipState,@ShipPostalCode,@ShipCountry)";
                SqlCommand cmdSelect1 = new SqlCommand(strInsertOrders, con);
                cmdSelect1.Parameters.AddWithValue("@CustomerId", userID.ToString());
                cmdSelect1.Parameters.AddWithValue("@OrderDate", dateTime.ToString());
                cmdSelect1.Parameters.AddWithValue("@Courier", ddlCourier.SelectedItem.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipName", txtName.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipAddress", txtAddress.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipCity",txtCity.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipState",txtState.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipPostalCode", txtPostal.Text);
                cmdSelect1.Parameters.AddWithValue("@ShipCountry", txtCountry.Text);

                cmdSelect1.ExecuteNonQuery();

                //SELECT OrderId from customerID  --> get order id           
                string strSelectOrderId = "SELECT O.OrderId FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerId = O.CustomerId WHERE(C.CustomerId = " + userID.ToString() + ") AND(YEAR(O.OrderDate) = " + year.ToString() + ") AND(MONTH(O.OrderDate) = " + month.ToString() + ") AND(DAY(O.OrderDate) = " + day.ToString() + ") AND({ fn HOUR(O.OrderDate) } = " + hour.ToString() + ") AND({ fn MINUTE(O.OrderDate) } = " + min.ToString() + ") AND({fn SECOND(O.OrderDate)} = " + sec.ToString() + ")";
                SqlCommand cmdSelect2 = new SqlCommand(strSelectOrderId, con);
                int orderId = (int)cmdSelect2.ExecuteScalar();


                ////SAVE RECORDS INTO ORDER DETAIL
                //for (int i =0; i< GridView2.Rows.Count; i++)
                //{

                //    int artId = 

                //    string strInsertOD = "INSERT INTO OrderDetails (OrderId, ArtId, UnitPrice, Quantity) " +
                //    "VALUES(" + orderId.ToString() + "," + "," + "," + ")";
                //}

                



                con.Close();                
            }
        }
    }

    //String strSelect = "SELECT SUM(C.Quantity * A.Price) AS SubTotal FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE C.CustomerId = " + Session["userID"];

    //create set command
    //SqlCommand cmdSelect2 = new SqlCommand(strSelect, con);

    //because OrderIDSales is double
    //subTotal = Convert.ToDouble(cmdSelect2.ExecuteScalar());

    //lblSubTotal.Text = subTotal.ToString();
    //            lblTotalItem.Text = gvCart.Rows.Count.ToString();
}