<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionSummary.aspx.cs" Inherits="WAD_Assignment.TransactionSummary" MasterPageFile="~/Page.Master"  %>

 <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server" >>

         <div style="font-size: 40px; font-weight: bold; text-align: center">
             PURCHASE SUMMARY
         </div>
        <div style="font-size: 20px; font-weight: bold; text-align: center">
             ORDER ID <asp:Label ID="lblOrderId" runat="server"></asp:Label>
     </div>
         <br />
&nbsp;<br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" Height="72px" Width="1280" HorizontalAlign="Center">
                <HeaderStyle Font-Bold="True" />
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
     <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" GridLines="None" Height="72px" Width="1280" HorizontalAlign="Center">
         <HeaderStyle Font-Bold="True" />
         <Columns>
             <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
             <asp:BoundField DataField="ShipName" HeaderText="Name" SortExpression="ShipName" />
             <asp:BoundField DataField="ShipAddress" HeaderText="Address" SortExpression="ShipAddress" />
             <asp:BoundField DataField="ShipPostalCode" HeaderText="Postal Code" SortExpression="ShipPostalCode" />
             <asp:BoundField DataField="ShipCountry" HeaderText="Country" SortExpression="ShipCountry" />
         </Columns>
         </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        OrderDate, ShipName, ShipAddress, ShipCity, ShipState, ShipPostalCode, ShipCountry
FROM            Orders
WHERE        (OrderId = @OrderId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" />
                </SelectParameters>
         </asp:SqlDataSource>
         <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" GridLines="None" Height="181px" Width="1280" HorizontalAlign="Center">
                <HeaderStyle Font-Bold="True" />
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ArtName" HeaderText="ArtName" SortExpression="ArtName" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="ItemSubtotal" HeaderText="ItemSubtotal" ReadOnly="True" SortExpression="ItemSubtotal" />
                </Columns>
            </asp:GridView>

            <div class="d-flex justify-content-center">
                <div>
                    Order Total (<asp:Label ID="lblTotalItem" runat="server"></asp:Label>&nbsp;items) :
                <asp:Label ID="lblOrderTotal" runat="server"></asp:Label>
                </div>                
            </div>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.ArtUrl, A.ArtName, OD.UnitPrice, OD.Quantity, OD.UnitPrice * OD.Quantity AS ItemSubtotal FROM OrderDetails AS OD INNER JOIN Arts AS A ON OD.ArtId = A.ArtId WHERE (OD.OrderId = @OrderId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" />
                </SelectParameters>
            </asp:SqlDataSource>

         <br />
        <table aria-selected="undefined" class="w-100">
            <tr>
                <td class="auto-style1" >&nbsp;</td>
                <td>&nbsp;<asp:Button ID="btnPrintPDF" runat="server" Text="Print PDF" OnClick="btnPrintPDF_Click"  />
            
                &nbsp;&nbsp;
                    <asp:Button runat="server" Text="Button" />
            
                </td>
            </tr>
        </table>

         <br />


         <br />
                                    
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 311px;
        }
    </style>
</asp:Content>


