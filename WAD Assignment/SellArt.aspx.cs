using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Web.UI;
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
                imgUpload.SaveAs(MapPath("~/arts/" + imgUpload.FileName));
                uploadedImg.ImageUrl = "~/arts/" + imgUpload.FileName;
            }
        }

        protected void btnSubmitArt_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();
            if (Directory.Exists(MapPath("~/tempImg/" + imgUpload.FileName)))
            {
                DeleteDirectory(MapPath("~/tempImg/" + imgUpload.FileName));
            }
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record is Added!')", true);
            }
            else
            {
                Response.Write("Error! Record not added!");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error! Record not added!')", true);
            }
            con.Close();
        }

        public static void DeleteDirectory(string target_dir)
        {
            string[] files = Directory.GetFiles(target_dir);
            string[] dirs = Directory.GetDirectories(target_dir);

            foreach (string file in files)
            {
                File.SetAttributes(file, FileAttributes.Normal);
                File.Delete(file);
            }

            foreach (string dir in dirs)
            {
                DeleteDirectory(dir);
            }

            Directory.Delete(target_dir, false);
        }
    }
}