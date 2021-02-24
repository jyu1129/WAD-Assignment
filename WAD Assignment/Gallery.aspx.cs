using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            con.Open();
            string strSelect = "SELECT ArtUrl FROM Arts";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtrArtUrls = cmdSelect.ExecuteReader();
            List<string> urlList = new List<string>();
            while (dtrArtUrls.Read())
            {
                urlList.Add(dtrArtUrls[0].ToString());
            }

            string[] urlsArray = urlList.ToArray();
            dtrArtUrls.Close();

            for (int i = 0; i < urlsArray.Length; i++)
            {
                if (urlsArray[i].StartsWith("~"))
                {
                    urlsArray[i] = MapPath(urlsArray[i]);
                }
              /*  if (ib != null)
                {
                    // Change the URL
                    ib.ImageUrl = urlsArray[i];
                }*/
            }

            con.Close();
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}