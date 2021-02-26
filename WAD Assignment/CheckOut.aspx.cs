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
                string dateTimeNow = dateTime.ToString();
                String courier = ddlCourier.SelectedItem.Text.ToString();
                string shipName = txtName.Text;
                string ShipAddress = txtAddress.Text;
                string ShipCity = txtCity.Text;
                string ShipState = txtState.Text;
                string ShipPostalCode = txtPostal.Text;
                string ShipCountry = txtCountry.Text;
                string whatevever = "wjatever";
                object objUserid = Session["userID"];
                int userid = (int)objUserid;


                con = new SqlConnection(strCon);
                con.Open();

                ////GET CURRENT DATETIME
                //string strSelectDate = "GETDATE()";
                //SqlCommand cmdGetDate = new SqlCommand(strSelectDate, con);
                //string dateTimeNow = (string)cmdGetDate.ExecuteScalar();


                //To Place an order
                string strInsertOrders = "INSERT INTO Orders(CustomerId, OrderDate, Courier, ShipName, ShipAddress, ShipCity," +
                    " ShipState, ShipPostalCode, ShipCountry) " +
                    "VALUES(" + userid + "," + whatevever + "," + courier + "," + shipName + "," + ShipAddress + "," + ShipCity + "," + ShipState + "," + ShipPostalCode + "," + ShipCountry + ")";
                SqlCommand cmdSelect1 = new SqlCommand(strInsertOrders, con);
                //temporary store record retrived by command object
                SqlDataReader dtrSelect = cmdSelect1.ExecuteReader();

                //SELECT TOP 1 * FROM Table ORDER BY ID DESC

                //SELECT OrderId from customerID  --> get order id           
                string strSelectOrderId = "SELECT O.OrderId FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerId = O.CustomerId WHERE C.CustomerId = " + Session["userID"] + " AND O.OrderDate = " + dateTimeNow;
                SqlCommand cmdSelect2 = new SqlCommand(strSelectOrderId, con);
                string orderId = (string)cmdSelect2.ExecuteScalar();
                Response.Write(orderId);

                //SELECT ArtId from cart  --> get art id 
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