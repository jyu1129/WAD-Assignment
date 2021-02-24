<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WAD_Assignment.ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    SHOP NAME<br />
            <br />
            <asp:HyperLink ID="hlBuyArt" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>\
            <br />
            <asp:HyperLink ID="hlCart" runat="server" NavigateUrl="~/Cart.aspx">Cart</asp:HyperLink>

    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="dtProduct" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellPadding="15" CellSpacing="15" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                ArtName:
                                <asp:Label ID="ArtNameLabel" runat="server" Text='<%# Eval("ArtName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="ArtUrlLabel" runat="server" height="100" Width="100" ImageUrl='<%# Eval("ArtUrl") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Category:
                                 <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                Price:
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            </td>
                        </tr>      
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Add To Cart" OnClick="OnClick_AddToCard" />
                            </td>
                        </tr>  
                        <tr>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Add To WishList"  />
                            </td>
                        </tr>  
                    </table>
                                   
<br />
                </ItemTemplate>
            </asp:DataList>



            <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
