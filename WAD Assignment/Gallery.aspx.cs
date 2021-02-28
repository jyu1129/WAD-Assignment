using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["role"].Equals("Artists"))
            {
                Response.Redirect("Homepage.aspx");
            }
            lblGalleryTotal.Text = DataList1.Items.Count.ToString();
            string userId = Session["userID"].ToString();
            con = new SqlConnection(strCon);
            con.Open();
            string strSelect = "SELECT COUNT(OrderDetails.OrderDetailId) AS Expr1 FROM OrderDetails INNER JOIN" +
                        " Orders ON OrderDetails.OrderId = Orders.OrderId INNER JOIN Arts ON OrderDetails.ArtId = Arts.ArtId" +
                        " WHERE Arts.ArtistId = " + userId;
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            lblTotalArtSold.Text = cmdSelect.ExecuteScalar().ToString();
            con.Close();
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ib = sender as ImageButton;
            object commandArg = ib.CommandArgument;

            Session["artId"] = int.Parse(commandArg.ToString());
            Session["edit"] = false;
            Session["create"] = false;
            Response.Redirect("SellArt.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["artId"] = -1;
            Session["edit"] = false;
            Session["create"] = true;
            Response.Redirect("SellArt.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}