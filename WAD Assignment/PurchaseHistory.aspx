<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="WAD_Assignment.PurchaseHistory1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Bahnschrift;
            font-weight: bold;
            font-size: 30px;
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="text-align: center" class="auto-style1">
                PURCHASE HISTORY</div>
            <div style="font-family: Bahnschrift">
                <br />
                You have bought
            <asp:Label ID="lblPurchaseCount" runat="server" Font-Bold="True"></asp:Label>
                item(s).</div>
            <br />
            <br />
            <asp:GridView ID="gvWishlist" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="SqlDataSource1" BorderStyle="Solid" PageSize="5">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField HeaderText="OrderId" DataField="OrderId" SortExpression="OrderId" >
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                    <asp:BoundField DataField="ArtName" HeaderText="ArtName" SortExpression="ArtName" />
                    <asp:BoundField DataField="ArtUrl" HeaderText="ArtUrl" SortExpression="ArtUrl" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order Details].OrderId, [Order Details].UnitPrice, [Order Details].Quantity, Orders.OrderDate, Arts.ArtName, Arts.ArtUrl FROM Orders INNER JOIN [Order Details] ON Orders.OrderId = [Order Details].OrderId INNER JOIN Customers ON Orders.CustomerId = Customers.CustomerId INNER JOIN Arts ON Orders.ArtId = Arts.ArtId AND [Order Details].ArtId = Arts.ArtId"></asp:SqlDataSource>
            <br />
            </div>
    </form>
</body>
</html>
