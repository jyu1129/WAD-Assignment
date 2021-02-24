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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void gvCart_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();

            int rowCount = gvCart.Rows.Count;
            lblTotalItem.Text = rowCount.ToString();

            string CustomerId = "123";
            String strSelect = "SELECT SUM(C.Quantity * A.Price) AS SubTotal FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE C.CustomerId = " + CustomerId;

            //create set command
            SqlCommand cmdSelect2 = new SqlCommand(strSelect, con);

            //because OrderIDSales is double
            double subTotal = Convert.ToDouble(cmdSelect2.ExecuteScalar());

            gvCart.DataBind();

            lblSubTotal.Text = subTotal.ToString();
            con.Close();

            
        }
    }
}