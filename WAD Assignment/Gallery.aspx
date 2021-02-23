<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WAD_Assignment.Listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            SHOP NAME<br />
            <br />
            <asp:HyperLink ID="hlBuyArt0" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt0" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders0" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery0" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="lblGallery0" runat="server" Font-Bold="True" Font-Size="Larger" Text="Gallery"></asp:Label>
            &nbsp;<asp:Button ID="btnEditGalleryName0" runat="server" Text="Edit" />
            <br />
            <br />
            <asp:ListView ID="ListView2" runat="server">
            </asp:ListView>

        </div>
    </form>
    </body>
</html>
