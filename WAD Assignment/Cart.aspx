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
            <asp:HyperLink ID="hlBuyArt" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>\
            <br />
            <asp:HyperLink ID="hlCart" runat="server" NavigateUrl="~/Cart.aspx">Cart</asp:HyperLink>
            <br />
            <br />
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="CartId" DataSourceID="SqlDataSource1" Height="133px" Width="407px" GridLines="None" CellPadding="20" >
                <Columns>                                 
                    
                    <asp:BoundField DataField="Expr1" HeaderText="" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                    <asp:ImageField DataImageUrlField="ArtUrl" HeaderText="Product" SortExpression="ArtUrl" ControlStyle-Height="100" ControlStyle-Width="100"></asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="" SortExpression="ArtName" ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="Price" HeaderText="Unit Price" SortExpression="Price" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" SortExpression="TotalPrice" ItemStyle-Wrap="False" FooterStyle-Wrap="False" HeaderStyle-Wrap="False" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" />
                    <asp:CommandField HeaderText="Action" ShowDeleteButton="True" />

                </Columns>
            </asp:GridView>
            <br />
            
        </div>

        <div>
            Merchandise Subtotal (<asp:Label ID="lblTotalItem" runat="server"></asp:Label>&nbsp;items) :
            <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
        &nbsp;<br />
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="#FF6666" BorderColor="#000000" BorderWidth="0px" CausesValidation="False" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="White" Height="29px" Text="Check Out" Width="111px" />
            <br />
        </div>

        
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM Cart WHERE CartId = @CartId
" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Arts.ArtId AS Expr1, Arts.ArtName, Arts.ArtUrl, Arts.Price, Cart.Quantity, Cart.TotalPrice, Cart.CustomerId, Cart.CartId FROM Cart INNER JOIN Arts ON Cart.ArtId = Arts.ArtId">
                <DeleteParameters>
                    <asp:Parameter Name="CartId" />
                </DeleteParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
