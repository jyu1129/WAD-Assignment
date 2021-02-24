<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WAD_Assignment.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            CART<br />
            <br />
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="CartId" DataSourceID="SqlDataSource1" Height="133px" Width="407px" >
                <Columns>
                    
                   
                    
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                    <asp:BoundField DataField="ArtName" HeaderText="ArtName" SortExpression="ArtName" />
                    <asp:BoundField DataField="ArtUrl" HeaderText="ArtUrl" SortExpression="ArtUrl" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
                    <asp:CommandField ShowDeleteButton="True" />

                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM Cart WHERE CartId = @CartId
" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Arts.ArtId AS Expr1, Arts.ArtName, Arts.ArtUrl, Arts.Price, Cart.Quantity, Cart.TotalPrice, Cart.CustomerId, Cart.CartId FROM Cart INNER JOIN Arts ON Cart.ArtId = Arts.ArtId">
                <DeleteParameters>
                    <asp:Parameter Name="CartId" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
