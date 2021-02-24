<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temporary.aspx.cs" Inherits="WAD_Assignment.temporary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvWishlist" runat="server"  CellPadding="4" ForeColor="#333333" OnItemCommand="deleteItem" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="SqlDataSource1" BorderStyle="Solid" PageSize="5" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" BorderStyle="Solid" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ArtId">
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Name" DataField="ArtName">
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="Category">
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField HeaderText="Image" DataImageUrlField="ArtUrl">
                        <ControlStyle Height="100px" Width="100px" />
                        <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField HeaderText="Price" DataField="Price" DataFormatString="{0:RM 0.00}">
                        <ItemStyle Font-Names="Bahnschrift" Font-Underline="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock" HeaderText="Stock">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AddedDate" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Added Date" SortExpression="AddedDate">
                        <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                    </asp:BoundField>
               
      
               
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="deleteButton" runat="server" Text="Delete" ImageUrl="https://image.flaticon.com/icons/png/512/61/61848.png"
                                Height="40px" Width="40px" OnClientClick="return confirm('Are you sure you want to delete this item from your wishlist?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Image" Text="Add to Cart" ImageUrl="https://banner2.cleanpng.com/20180711/qrb/kisspng-computer-icons-shopping-cart-clip-art-add-to-cart-5b45e8502bae06.3190623015313081121789.jpg">
                        <ControlStyle Height="40px" Width="40px" />
                        <ItemStyle Font-Names="Bahnschrift" />
                    </asp:ButtonField>
                    <asp:CommandField ShowDeleteButton="True" />
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
        </div>
    </form>
</body>
</html>
