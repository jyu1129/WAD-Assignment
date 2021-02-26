﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            Server.Transfer("SellArt.aspx", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["artId"] = -1;
            Session["edit"] = false;
            Session["create"] = true;
            Server.Transfer("SellArt.aspx", true);
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}