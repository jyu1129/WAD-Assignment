using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Xml.Linq;

namespace WAD_Assignment
{
    public partial class SellArt : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnImgUpload_Click(object sender, EventArgs e)
        {
            if (imgUpload.HasFile)
            {
                imgUpload.SaveAs(MapPath("~/tempImg/" + imgUpload.FileName));
                uploadedImg.ImageUrl = "~/tempImg/" + imgUpload.FileName;
            }
        }

        protected void btnSubmitArt_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();
            imgUpload.SaveAs(MapPath(uploadedImg.ImageUrl));
            string artName = txtArtTitle.Text.ToString();
            string artDescription = txtDescription.Text.ToString();
            string artCategory = txtArtCat.Text.ToString();
            decimal artPrice = Convert.ToDecimal(txtPrice.Text.ToString());
            int artStock = int.Parse(txtStock.Text.ToString());
            string insert = "INSERT INTO ARTS (ArtUrl, Category, ArtName, Price, Stock, Description, ArtistId) VALUES (@ArtUrl, " +
                "@Category, @ArtName, @Price, @Stock, @Description, @ArtistId)";
            SqlCommand cmdAdd = new SqlCommand(insert, con);
            cmdAdd.Parameters.AddWithValue("@ArtUrl", uploadedImg.ImageUrl);
            cmdAdd.Parameters.AddWithValue("@Category", artCategory);
            cmdAdd.Parameters.AddWithValue("@ArtName", artName);
            cmdAdd.Parameters.AddWithValue("@Price", artPrice);
            cmdAdd.Parameters.AddWithValue("@Stock", artStock);
            cmdAdd.Parameters.AddWithValue("@Description", artDescription);
            cmdAdd.Parameters.AddWithValue("@ArtistId", 81);
         
            if(cmdAdd.ExecuteNonQuery() > 0)
            {
                Response.Write("Record is Added!");
            }
            else
            {
                Response.Write("Error! Record not added!");
            }
            con.Close();
        }
    }
}