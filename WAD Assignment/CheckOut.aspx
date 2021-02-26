<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 

    <title></title>

        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />

                    <asp:ButtonField CommandName="Edit" Text="Change" />

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FirstName, LastName, Phone, Address, Country, Email FROM Customers WHERE (CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CartId" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ArtUrl" HeaderText="ArtUrl" SortExpression="ArtUrl" />
                    <asp:BoundField DataField="ArtName" HeaderText="ArtName" SortExpression="ArtName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="ItemSubtotal" HeaderText="ItemSubtotal" ReadOnly="True" SortExpression="ItemSubtotal" />
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
            <asp:FormView ID="FormView1" runat="server">
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </div>

</asp:Content>