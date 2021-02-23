<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WAD_Assignment.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblWishlist" runat="server" Text="WISHLIST"></asp:Label>
            <br />
            <br />
            There are
            <asp:Label ID="lblWishCount" runat="server"></asp:Label>
&nbsp;item(s) in your wishlist.<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ArtId" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Name" DataField="ArtName" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="Category">
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField HeaderText="Image" DataImageUrlField="ArtUrl">
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField HeaderText="Price" DataField="Price" >
                    <ItemStyle Font-Names="Bahnschrift" Font-Underline="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock" HeaderText="Stock">
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" HeaderText="Delete?" >
                    <ItemStyle Font-Names="Bahnschrift" Font-Overline="False" HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:ButtonField ButtonType="Button" HeaderText="Add to Cart" Text="Add to Cart">
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:ButtonField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
