using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WAD_Assignment
{
    public partial class SellArt : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();
            //(bool)Session["edit"]
            if (!(bool)Session["edit"] && !(bool)Session["create"])
            {
                string artId = Session["artId"].ToString();
                string strSelect = "SELECT * FROM Arts WHERE ArtId = " + artId;
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader dtr = cmdSelect.ExecuteReader();
                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        uploadedImg.ImageUrl = dtr["ArtUrl"].ToString();
                        txtArtTitle.Text = dtr["ArtName"].ToString();
                        txtDescription.Text = dtr["Description"].ToString();
                        txtPrice.Text = dtr["Price"].ToString();
                        txtArtCat.Text = dtr["Category"].ToString();
                        txtStock.Text = dtr["Stock"].ToString();
                    }
                }
                dtr.Close();

                btnImgUpload.Enabled = false;
                txtArtTitle.Attributes.Add("readonly", "readonly");
                txtDescription.Attributes.Add("readonly", "readonly");
                txtPrice.Attributes.Add("readonly", "readonly");
                txtArtCat.Attributes.Add("readonly", "readonly");
                txtStock.Attributes.Add("readonly", "readonly");
                Button1.Enabled = false;
                if (Session["role"].Equals("Artists"))
                {
                    btnEdit.Visible = true;
                }
            }
            else
            {
                ;
            }
            con.Close();
        }

        protected void btnImgUpload_Click(object sender, EventArgs e)
        {
            if (imgUpload.HasFile)
            {
                imgUpload.SaveAs(MapPath("~/arts/" + imgUpload.FileName));
                uploadedImg.ImageUrl = "~/arts/" + imgUpload.FileName;
            }
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

        protected void btnCancelArt_Click(object sender, EventArgs e)
        {
            uploadedImg.ImageUrl = "";
            txtArtTitle.Text = "";
            txtArtTitle.Attributes.Remove("placeholder");
            txtDescription.Text = "";
            txtDescription.Attributes.Remove("placeholder");
            txtArtCat.Text = "";
            txtArtCat.Attributes.Remove("placeholder");
            txtPrice.Text = "";
            txtPrice.Attributes.Remove("placeholder");
            txtStock.Text = "";
            txtStock.Attributes.Remove("placeholder");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate("AllValidators");
            if (Page.IsValid)
            {
                con = new SqlConnection(strCon);
                con.Open();
                string artId = Session["artId"].ToString();
                string artName, artDescription, artCategory;
                decimal artPrice;
                int artStock;
                int artistId = (int)Session["userID"];

                if (string.IsNullOrEmpty(txtArtTitle.Text.ToString()))
                {
                    artName = txtArtTitle.Attributes["placeholder"];
                }
                else
                {
                    artName = txtArtTitle.Text.ToString();
                }

                if (string.IsNullOrEmpty(txtDescription.Text.ToString()))
                {
                    artDescription = txtDescription.Attributes["placeholder"];
                }
                else
                {
                    artDescription = txtDescription.Text.ToString();
                }

                if (string.IsNullOrEmpty(txtArtCat.Text.ToString()))
                {
                    artCategory = txtArtCat.Attributes["placeholder"];
                }
                else
                {
                    artCategory = txtArtCat.Text.ToString();
                }

                if (string.IsNullOrEmpty(txtPrice.Text.ToString()))
                {
                    artPrice = Convert.ToDecimal(txtPrice.Attributes["placeholder"]);
                }
                else
                {
                    artPrice = Convert.ToDecimal(txtPrice.Text.ToString());
                }

                if (string.IsNullOrEmpty(txtStock.Text.ToString()))
                {
                    artStock = int.Parse(txtStock.Attributes["placeholder"]);
                }
                else
                {
                    artStock = int.Parse(txtStock.Text.ToString());
                }

                string insert;
                if ((bool)Session["edit"])
                {
                    insert = "UPDATE ARTS SET ArtUrl = @ArtUrl, Category = @Category, ArtName = @ArtName, Price = @Price, Stock = @Stock, " +
                    "Description = @Description, ArtistId = @ArtistId WHERE (ArtId = @ArtId)";
                }
                else
                {
                    insert = "INSERT INTO ARTS (ArtUrl, Category, ArtName, Price, Stock, Description, ArtistId) VALUES (@ArtUrl, " +
                    "@Category, @ArtName, @Price, @Stock, @Description, @ArtistId)";
                }
                SqlCommand cmdAdd = new SqlCommand(insert, con);
                if ((bool)Session["edit"])
                {
                    cmdAdd.Parameters.AddWithValue("@ArtId", artId);
                }

                cmdAdd.Parameters.AddWithValue("@ArtUrl", uploadedImg.ImageUrl);
                cmdAdd.Parameters.AddWithValue("@Category", artCategory);
                cmdAdd.Parameters.AddWithValue("@ArtName", artName);
                cmdAdd.Parameters.AddWithValue("@Price", artPrice);
                cmdAdd.Parameters.AddWithValue("@Stock", artStock);
                cmdAdd.Parameters.AddWithValue("@Description", artDescription);
                cmdAdd.Parameters.AddWithValue("@ArtistId", artistId);

                if (cmdAdd.ExecuteNonQuery() > 0)
                {
                    if ((bool)Session["edit"])
                    {
                        Response.Write("Record is Updated!");
                        Session["edit"] = false;
                        uploadedImg.ImageUrl = "";
                        txtArtTitle.Text = "";
                        txtArtTitle.Attributes.Remove("placeholder");
                        txtDescription.Text = "";
                        txtDescription.Attributes.Remove("placeholder");
                        txtArtCat.Text = "";
                        txtArtCat.Attributes.Remove("placeholder");
                        txtPrice.Text = "";
                        txtPrice.Attributes.Remove("placeholder");
                        txtStock.Text = "";
                        txtStock.Attributes.Remove("placeholder");
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirect", "alert('Record is Updated!');location.href='../Gallery.aspx'", true);
                    }
                    else
                    {
                        Response.Write("Record is Added!");
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirect", "alert('Record is Added!');location.href='../../Gallery.aspx'", true);
                    }
                }
                else
                {
                    if ((bool)Session["edit"])
                    {
                        Response.Write("Error! Record not Updated!");
                        Session["edit"] = false;
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirect", "alert('Record is Added!');location.href='../../Gallery.aspx'", true);
                    }
                    else
                    {
                        Response.Write("Error! Record not added!");
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirect", "alert('Record is Added!');location.href='../../Gallery.aspx'", true);
                    }
                }
                con.Close();
            }
        }

        protected void txtArtTitle_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();
            string artId = Session["artId"].ToString();
            string strSelect = "SELECT * FROM Arts WHERE ArtId = " + artId;
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtr = cmdSelect.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    uploadedImg.ImageUrl = dtr["ArtUrl"].ToString();
                    txtArtTitle.Text = "";
                    txtArtTitle.Attributes.Add("placeholder", dtr["ArtName"].ToString());
                    txtDescription.Text = "";
                    txtDescription.Attributes.Add("placeholder", dtr["Description"].ToString());
                    txtPrice.Text = "";
                    txtPrice.Attributes.Add("placeholder", dtr["Price"].ToString());
                    txtArtCat.Text = "";
                    txtArtCat.Attributes.Add("placeholder", dtr["Category"].ToString());
                    txtStock.Text = "";
                    txtStock.Attributes.Add("placeholder", dtr["Stock"].ToString());
                }
            }
            dtr.Close();

            btnImgUpload.Enabled = true;
            txtArtTitle.Attributes.Remove("readonly");
            txtDescription.Attributes.Remove("readonly");
            txtPrice.Attributes.Remove("readonly");
            txtArtCat.Attributes.Remove("readonly");
            txtStock.Attributes.Remove("readonly");
            Button1.Enabled = true;
            validImage.Enabled = false;
            validTxtArtCat.Enabled = false;
            validTxtPrice.Enabled = false;
            validTxtStock.Enabled = false;
            validTxtTitle.Enabled = false;
            Session["edit"] = true;
            con.Close();
            //Server.Transfer("SellArt.aspx", true);
        }
    }
}