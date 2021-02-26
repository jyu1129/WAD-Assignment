<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="WAD_Assignment.PurchaseHistory1" MasterPageFile="~/Page.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
        <div>
            <div style="font-weight: bold; font-size: 40px; font-family: Bahnschrift; color: #000000; text-align: center">
                <br />
                PURCHASE HISTORY
            </div>
            <div style="font-family: Bahnschrift; text-align: center;">
                </div>
            <br />
            <br />
            <asp:GridView ID="gvPurchaseHistory" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="SqlDataSource1" PageSize="5" AllowSorting="True" HorizontalAlign="Center" Width="879px">
                <Columns>
                    <asp:BoundField HeaderText="Order ID" DataField="OrderId" SortExpression="OrderId" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" DataFormatString="{0:dd-MM-yyyy}" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="ArtUrl" HeaderText="Art">
                        <ControlStyle Height="120px" Width="150px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="Name" SortExpression="ArtName" >
                    <ControlStyle Font-Names="Bahnschrift" />
                    <ItemStyle Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:RM 0.00}" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
                    <ItemStyle Font-Names="Bahnschrift" HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle Font-Names="Bahnschrift" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderDetails.OrderId, OrderDetails.UnitPrice, OrderDetails.Quantity, Arts.ArtName, Arts.ArtUrl, Orders.OrderDate FROM OrderDetails INNER JOIN Arts ON OrderDetails.ArtId = Arts.ArtId INNER JOIN Orders ON OrderDetails.OrderId = Orders.OrderId WHERE (Orders.CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="userID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>

