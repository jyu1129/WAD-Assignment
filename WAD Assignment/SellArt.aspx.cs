using System;

namespace WAD_Assignment
{
    public partial class SellArt : System.Web.UI.Page
    {
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
    }
}