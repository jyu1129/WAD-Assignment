<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyArt.aspx.cs" Inherits="WAD_Assignment.BuyArt" %>

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
            <asp:HyperLink ID="hlBuyArt" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="148px" ImageUrl="~/tempImg/880433.jpg" Width="171px" />
            <br />
            <br />
            <asp:Label ID="lblArtTitle" runat="server" Text="Artwork Title"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblPrice" runat="server" Text="$ ??.??"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblArtDescription" runat="server" Text="Art Description"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblArtKeywords" runat="server" Text="Art Keywords"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" />
            &nbsp;<br />
            <asp:HyperLink ID="hlAddtoWishlist" runat="server" NavigateUrl="wishlist.aspx">Add To Wishlist</asp:HyperLink>
        </div>
    </form>
</body>
</html>
