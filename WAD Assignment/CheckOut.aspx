<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <div style="font-size: 40px; font-weight: bold; text-align: center">
        CHECK OUT
    </div>
    </br>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" Height="72px" Width="1008px">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <EmptyDataTemplate>
                    Name
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FirstName, LastName, Phone, Address, Country, Email FROM Customers WHERE (CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CartId" DataSourceID="SqlDataSource2" GridLines="None" Height="181px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="1009px">
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="ArtUrl" SortExpression="ArtUrl" ControlStyle-Width="100" ControlStyle-Height="100" ></asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="Art Name" SortExpression="ArtName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="ItemSubtotal" HeaderText="Item Subtotal" ReadOnly="True" SortExpression="ItemSubtotal" />
                </Columns>
            </asp:GridView>
            Merchandise Subtotal (<asp:Label ID="lblTotalItem" runat="server"></asp:Label>&nbsp;items) :
            <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT C.CartId, A.ArtUrl, A.ArtName, A.Price, C.Quantity, A.Price * C.Quantity AS ItemSubtotal FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE (C.CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <table class="auto-style8">
                <tr>
                    <td class="auto-style2">Fill in delivery details:</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Name:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtName" runat="server" Width="442px"></asp:TextBox>
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Address:</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAddress" runat="server" Height="58px" Width="445px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">City:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Postal:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPostal" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Country:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">State:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">Payment Method:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Width="188px">
                            <asp:ListItem>Cash On Delivery</asp:ListItem>
                            <asp:ListItem>QR code</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">Total Payment (RM) :</td>
                    <td>
                        <asp:Label ID="lblTotalPayment" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT O.OrderId, Cart.ArtId, Arts.Price, Cart.Quantity FROM Orders AS O INNER JOIN OrderDetails AS OD ON O.OrderId = OD.OrderId INNER JOIN Customers AS Cust ON O.CustomerId = Cust.CustomerId INNER JOIN Cart ON Cust.CustomerId = Cart.CustomerId INNER JOIN Arts ON OD.ArtId = Arts.ArtId AND Cart.ArtId = Arts.ArtId"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </div>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 422px;
        }

        .auto-style2 {
            width: 209px;
        }

        .auto-style3 {
            width: 173px;
        }

        .auto-style4 {
            width: 209px;
            height: 27px;
        }

        .auto-style5 {
            width: 422px;
            height: 27px;
        }

        .auto-style6 {
            width: 173px;
            height: 27px;
        }

        .auto-style7 {
            height: 27px;
        }

        .auto-style8 {
            width: 100%;
            height: 366px;
        }
    </style>
</asp:Content>
