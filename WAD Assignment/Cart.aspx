<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script>
        document.getElementById("gallery").classList.remove("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.remove("active");
        document.getElementById("profile").classList.remove("active");
        document.getElementById("cart").classList.add("active");
    </script>
    <div>
        <div style="font-size: 40px; font-weight: bold; text-align: center">
            CART
        </div>
        <br />
        <br />

        <asp:GridView ID="gvCart" OnRowDeleted="gvCart_RowDeleted" OnRowDeleting="gvCart_RowDeleting" DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="CartId" Height="133px" Width="407px" GridLines="None" CellPadding="20" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="ArtUrl" HeaderText="Product" SortExpression="ArtUrl" ControlStyle-Height="100" ControlStyle-Width="100">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="ArtName" HeaderText="" SortExpression="ArtName" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Unit Price" SortExpression="Price" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataFormatString="{0:RM 0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>

                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Quantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" SortExpression="TotalPrice" ItemStyle-Wrap="False" FooterStyle-Wrap="False" HeaderStyle-Wrap="False" DataFormatString="{0:RM 0.00}">
                    <FooterStyle Wrap="False"></FooterStyle>

                    <HeaderStyle Wrap="False"></HeaderStyle>

                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>

                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <br />

    </div>

    <div>
        &nbsp;
        <table aria-selected="undefined" style="width:100%;">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">Merchandise Subtotal (<asp:Label ID="lblTotalItem" runat="server"></asp:Label>&nbsp;items) :
            <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                    &nbsp;&nbsp;</td>
                <td>&nbsp;<asp:Button ID="btnCheckOut" runat="server" BackColor="#FF6666" BorderColor="#000000" BorderWidth="0px" CausesValidation="False" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="White" Height="29px" Text="Check Out" Width="111px" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <br />
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM Cart WHERE CartId = @CartId
"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.ArtId, A.ArtName, A.ArtUrl, A.Price, C.Quantity, A.Stock, C.Quantity * A.Price AS TotalPrice, C.CustomerId, C.CartId FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE (C.CustomerId = @CustomerId)">
        <DeleteParameters>
            <asp:Parameter Name="CartId" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CustomerId" SessionField="userID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 1059px;
        }
        .auto-style2 {
            width: 491px;
        }
        .auto-style3 {
            width: 758px;
        }
    </style>
</asp:Content>

