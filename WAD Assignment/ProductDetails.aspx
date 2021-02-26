<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WAD_Assignment.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong>Product Details</strong>
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    ArtId:
                    <asp:Label ID="ArtIdLabel" runat="server" Text='<%# Eval("ArtId") %>' />
                    <br />                 
                    <asp:Image ID="ArtUrlLabel" runat="server" height="100" Width="100" ImageUrl='<%# Eval("ArtUrl") %>' />
                    <br />
                    Category:
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    ArtName:
                    <asp:Label ID="ArtNameLabel" runat="server" Text='<%# Eval("ArtName") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    Stock:
                    <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    ArtistId:
                    <asp:Label ID="ArtistIdLabel" runat="server" Text='<%# Eval("ArtistId") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts] WHERE ([ArtId] = @ArtId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArtId" QueryStringField="ArtId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
