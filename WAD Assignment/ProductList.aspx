<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WAD_Assignment.ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellPadding="15" CellSpacing="15">
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
                    </table>
                                   
<br />
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
