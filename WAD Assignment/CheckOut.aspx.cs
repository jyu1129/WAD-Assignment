using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            double TotalPayment = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                TotalPayment += Convert.ToDouble(GridView2.Rows[i].Cells[5].Text);
            }

            lblSubTotal.Text = TotalPayment.ToString();
            lblTotalItem.Text = GridView2.Rows.Count.ToString();
        }

    }
}