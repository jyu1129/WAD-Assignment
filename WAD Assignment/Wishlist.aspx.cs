using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WAD_Assignment
{
    public partial class Wishlist : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            gvWishlist.DataBind();
            lblWishCount.Text = gvWishlist.Rows.Count.ToString();
        }

        protected void GridView1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {

                ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('do something here!');</script>");

            }

        }


        //protected void deleteItem(object sender, GridViewCommandEventArgs e)
        //{
        //    string commandName = e.CommandName;
        //    object commandArg = e.CommandArgument;

        //    if (commandName == "deleteItem")
        //    {

        //        con = new SqlConnection(strCon);
        //        con.Open();

        //        string query = "DELETE FROM Wishlists WHERE 
        //        SqlCommand cmdSelect = new SqlCommand(query, con);
        //        SqlDataReader dtrOrderYear = cmdSelect.ExecuteReader();
        //        dtrOrderYear.Close();
        //        con.Close();
        //    }
        //}
    }
}