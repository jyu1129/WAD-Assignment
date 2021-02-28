using System;

namespace WAD_Assignment
{
    public partial class PurchaseHistory1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //gvPurchaseHistory.DataBind();
            //lblPurchaseCount.Text = gvPurchaseHistory.Rows.Count.ToString();

            if (Session["role"].Equals("Artists"))
            {
                //Hide Wishlist & Purchase History 
                btnWishlist.Visible = false;
                btnPurchaseHistory.Visible = false;

            }
            else
            {
                btnWishlist.Visible = true;
                btnPurchaseHistory.Visible = true;
            }
        }
    }
}