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
            <asp:GridView ID="GridView1" runat="server" OnItemCommand="GridView1_ItemCommand" AutoGenerateColumns="False" DataKeyNames="WishListid" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="WishListid" HeaderText="WishListid" InsertVisible="False" ReadOnly="True" SortExpression="WishListid" />
                    <asp:BoundField DataField="AddedDate" HeaderText="AddedDate" SortExpression="AddedDate" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
                    <asp:BoundField DataField="ArtName" HeaderText="ArtName" SortExpression="ArtName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="ArtUrl" HeaderText="ArtUrl" SortExpression="ArtUrl" />
                    <asp:CommandField HeaderText="Action" ShowDeleteButton="True" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandName="AddToCart" Text="AddToCart" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> hmmm
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM WishLists WHERE WishListid = @WishListid" SelectCommand="SELECT Wishlists.WishListid, Wishlists.AddedDate, Wishlists.CustomerId, Arts.ArtName, Arts.Price, Arts.ArtUrl FROM Wishlists INNER JOIN Arts ON Wishlists.ArtId = Arts.ArtId">
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
