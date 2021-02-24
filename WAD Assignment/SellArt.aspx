<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="WAD_Assignment.SellArt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
            SHOP NAME<br />
            <br />
            <asp:HyperLink ID="hlBuyArt" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:FileUpload ID="imgUpload" runat="server"  />
                    &nbsp;<asp:Button ID="btnImgUpload" runat="server" OnClick="btnImgUpload_Click" Text="Upload" />
                    <br />
                    <br />
                    <asp:Image ID="uploadedImg" runat="server" Height="500px" Width="550px" />
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnImgUpload" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <br />
            <strong>Artwork Title</strong><br />
            <asp:TextBox ID="txtArtTitle" runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            <strong>Description<br />
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Width="500px" runat="server"></asp:TextBox>
            <br />
                <br />
                Category<br />
                <asp:TextBox ID="txtArtCat" runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            Price<br />
            $
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <br />
            <br />
            Stock<br />
            <asp:TextBox ID="txtStock" runat="server" Width="100px" type ="number" ></asp:TextBox>
            <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <br />
                <asp:Button ID="btnSubmitArt" runat="server" Text="Submit" OnClick="btnSubmitArt_Click" />
                &nbsp;<asp:Button ID="btnCancelArt" runat="server" Text="Cancel" />
            </strong>
        </div>
    </form>

</body>
</html>
