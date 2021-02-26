<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WAD_Assignment.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="font-weight: bold; font-size: 30px; font-family: Bahnschrift; color: #000000; text-align: center">
                WISHLIST
            </div>
            <div style="font-family: Bahnschrift">
                <br />
                There are
            <asp:Label ID="lblWishCount" runat="server" Font-Bold="true"></asp:Label>
                item(s) in your wishlist.
            </div>
            <br />
            <asp:GridView ID="gvWishlist" runat="server" OnItemCommand="GridView1_ItemCommand" AutoGenerateColumns="False" DataKeyNames="WishListid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="793px">
                <Columns>
                    <asp:BoundField DataField="ArtId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ArtId" />
                    <asp:BoundField DataField="AddedDate" HeaderText="Added Date" SortExpression="AddedDate" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:ImageField DataImageUrlField="ArtUrl" HeaderText="Art" SortExpression="ArtUrl">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="Name" SortExpression="ArtName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:RM 0.00}" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="https://image.flaticon.com/icons/png/512/61/61848.png" >
                    <ControlStyle Height="40px" Width="40px" />
                    </asp:CommandField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="AddToCart" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                        </ItemTemplate>
                        <ControlStyle Height="40px" Width="40px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> 
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM WishLists WHERE WishListid = @WishListid" SelectCommand="SELECT Wishlists.WishListid, Wishlists.AddedDate, Wishlists.CustomerId, Arts.ArtName, Arts.Price, Arts.ArtUrl, Wishlists.ArtId, Arts.Category, Arts.Stock FROM Wishlists INNER JOIN Arts ON Wishlists.ArtId = Arts.ArtId INNER JOIN Customers ON Wishlists.CustomerId = Customers.CustomerId AND Wishlists.CustomerId = 123">
                <DeleteParameters>
                    <asp:Parameter Name="WishListid" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
