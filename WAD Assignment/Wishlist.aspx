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
                WISHLIST</div>
            <div style="font-family: Bahnschrift">
                <br />
            There are
            <asp:Label ID="lblWishCount" runat="server" Font-Bold="true"></asp:Label>
                item(s) in your wishlist.</div>
            <br />
            <br />
            <asp:GridView ID="gvWishlist" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="SqlDataSource1" BorderStyle="Solid" PageSize="5">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ArtId" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center"  />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Name" DataField="ArtName" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="Category">
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField HeaderText="Image" DataImageUrlField="ArtUrl">
                        <ControlStyle Height="100px" Width="100px" />
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField HeaderText="Price" DataField="Price" >
                    <ItemStyle Font-Names="Bahnschrift" Font-Underline="False" HorizontalAlign="Center"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock" HeaderText="Stock">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AddedDate" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Added Date" SortExpression="AddedDate">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" >
                    <ItemStyle Font-Names="Bahnschrift" Font-Overline="False" />
                    </asp:CommandField>
                    <asp:ButtonField ButtonType="Button" Text="Add to Cart">
                    <ItemStyle Font-Names="Bahnschrift" />
                    </asp:ButtonField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Bahnschrift" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Arts.ArtName, Arts.Price, Arts.Stock, Arts.Category, Arts.ArtUrl, Wishlists.AddedDate, Arts.ArtId FROM Arts INNER JOIN Wishlists ON Arts.ArtId = Wishlists.ArtId"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
