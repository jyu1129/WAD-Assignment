using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class TransactionSummary : System.Web.UI.Page
    {

        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Session["PurchaseSummaryToken"].Equals(true)) //if has token access
                {
                    lblOrderId.Text = Request.QueryString["OrderId"];
                    getTotalPayment();
                    GeneratePDF();
                    EmailReceipt();
                    Session["PurchaseSummaryToken"] = false; //dont allow user to revisit page again (back button/refresh)
                    Response.Cache.SetCacheability(HttpCacheability.NoCache); //dont save cache
                    Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
                }
                else {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You have not purchased anything, kindly an place order :)');window.location ='ProductList.aspx';", true);
                }


            }

        }

        protected void EmailReceipt()
        {

            string to = Session["user"].ToString(); //To user email address
            string from = "my.mochiartgallery@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            //attachment
            string file = Server.MapPath("~/PDF/OrderID_" + Request.QueryString["OrderId"] +".pdf");
            Attachment data = new Attachment(file, MediaTypeNames.Application.Octet);

            message.Attachments.Add(data);

            //email
            string mailbody = "Hey!" +
                " Thank you for your purchase at Mochi Art Gallery, kindly refer below attachment for your invoice reference. Have a nice day! :)";
            message.Subject = "Yay! Your order id #" + Request.QueryString["OrderId"] + " is confirmed";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("my.mochiartgallery@gmail.com", "mmag1234");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnPrintPDF_Click(object sender, EventArgs e)
        {
            String OrderId = Request.QueryString["OrderId"];
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=MAGInvoice_"+OrderId+".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);


            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            string logoUrl = Server.MapPath("~/arts/mochiLogo.jpg");

            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoUrl);
            logo.ScalePercent(50);            
            logo.Alignment = iTextSharp.text.Image.ALIGN_CENTER;

            //for Parse(sr)
            hw.Write("______________________________________________________________________________________");
            hw.Write("CUSTOMER INFORMATION");

            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");
            hw.Write("DELIVERY ADDRESS");

            GridView3.AllowPaging = false;
            GridView3.DataBind();
            GridView3.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");
            hw.Write("ITEMS");

            GridView2.AllowPaging = false;
            GridView2.DataBind();
            GridView2.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");



            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 20f, 10f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.Add(logo);

            pdfDoc.Add(new Paragraph("\n\n\n\n"));
            pdfDoc.Add(new Paragraph("ORDER ID #" + Request.QueryString["OrderId"].ToString()));
            htmlparser.Parse(sr);
            pdfDoc.Add(new Paragraph("\n"));
            pdfDoc.Add(new Paragraph("TOTAL PAYMENT :" + lblOrderTotal.Text.ToString()));
            pdfDoc.Add(new Paragraph("TOTAL ITEM(S) :" + lblTotalItem.Text.ToString()));
            pdfDoc.Add(new Paragraph("\n\n\n"));
            pdfDoc.Add(new Paragraph("Thank You for choosing Mochi Art Gallery, your art will be shipped to you soon, stay tuned!\n"));
            pdfDoc.Add(new Paragraph("If you have any inquiry please do not hesitate to contact my.mochiartgallery@gmail.com\n"));
            pdfDoc.Add(new Paragraph("© 2021 Mochi Art Gallery.All Rights Reserved.\n"));

            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();

        }

        protected void GeneratePDF()
        {
            var pdfDoc = new Document(PageSize.A4);
            
            //use a variable to let code fit across the page...
            string path = Server.MapPath("~/PDF");
            PdfWriter.GetInstance(pdfDoc, new FileStream(path + "/" + "OrderID_" + Request.QueryString["OrderId"] + ".pdf", FileMode.Create));
            pdfDoc.SetMargins(10f, 10f, 20f, 10f);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            string logoUrl = Server.MapPath("~/arts/mochiLogo.jpg");

            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoUrl);
            logo.ScalePercent(50);
            logo.Alignment = iTextSharp.text.Image.ALIGN_CENTER;

            //for Parse(sr)
            hw.Write("______________________________________________________________________________________");
            hw.Write("CUSTOMER INFORMATION");

            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");
            hw.Write("DELIVERY ADDRESS");

            GridView3.AllowPaging = false;
            GridView3.DataBind();
            GridView3.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");
            hw.Write("ITEMS");

            GridView2.AllowPaging = false;
            GridView2.DataBind();
            GridView2.RenderControl(hw);

            hw.Write("______________________________________________________________________________________");



            StringReader sr = new StringReader(sw.ToString());
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.Add(logo);

            pdfDoc.Add(new Paragraph("\n\n\n\n"));
            pdfDoc.Add(new Paragraph("ORDER ID #" + Request.QueryString["OrderId"]));
            htmlparser.Parse(sr);
            pdfDoc.Add(new Paragraph("\n"));
            pdfDoc.Add(new Paragraph("TOTAL PAYMENT :" + lblOrderTotal.Text.ToString()));
            pdfDoc.Add(new Paragraph("TOTAL ITEM(S) :" + lblTotalItem.Text.ToString()));
            pdfDoc.Add(new Paragraph("\n\n\n"));
            pdfDoc.Add(new Paragraph("Thank You for choosing Mochi Art Gallery, your art will be shipped to you soon, stay tuned!\n"));
            pdfDoc.Add(new Paragraph("If you have any inquiry please do not hesitate to contact my.mochiartgallery@gmail.com\n"));
            pdfDoc.Add(new Paragraph("© 2021 Mochi Art Gallery.All Rights Reserved.\n"));
            pdfDoc.Close();
            Response.Clear();


        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void getTotalPayment()
        {
            double totalPayment = 0;

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                totalPayment += Convert.ToDouble(GridView2.Rows[i].Cells[4].Text);
            }

            lblOrderTotal.Text = totalPayment.ToString();
            lblTotalItem.Text = GridView2.Rows.Count.ToString();

        }

        
    }




}