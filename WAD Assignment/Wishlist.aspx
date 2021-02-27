<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WAD_Assignment.Wishlist" MasterPageFile="~/Page.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script>
        document.getElementById("gallery").classList.remove("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.remove("active");
        document.getElementById("profile").classList.remove("active");
        document.getElementById("cart").classList.remove("active");
        document.getElementById("purchasehistory").classList.remove("active");
        document.getElementById("wishlist").classList.add("active");
    </script>

    <style>
        .button {
            display: inline-block;
            padding: 0.5em 3em;
            background-color: transparent;
            border: 0.1em solid #000000;
            border-radius: 3px;
            margin: 0 0.3em 0.3em 0;
            box-sizing: border-box;
            text-decoration: none;
            color: grey;
            text-align: center;
            transition: all 0.15s;
            margin-left: 10px;
            margin-top: 10px;
        }

            .button:hover {
                background-color: rgb(108,117,125);
                color: white;
            }
    </style>

    <div>
        <div>
            <asp:Button ID="btnProfile" runat="server" Text="My Profile" CssClass="button" Style="margin-left: 20px" PostBackUrl="~/Profile.aspx" />
            <asp:Button ID="btnWishlist" runat="server" Text="Wishlist" CssClass="button" PostBackUrl="~/Wishlist.aspx" />
            <asp:Button ID="btnPurchaseHistory" runat="server" Text="Purchase History" Width="232px" CssClass="button" PostBackUrl="~/PurchaseHistory.aspx" />
        </div>
        <div style="font-weight: bold; font-size: 40px; font-family: Bahnschrift; color: #000000; text-align: center">
            <br />
            WISHLIST
        </div>
        <div style="font-family: Bahnschrift; text-align: center;">
            <br />
            There are
            <asp:Label ID="lblWishCount" runat="server" Font-Bold="true"></asp:Label>
            item(s) in your wishlist.
            <br />
        </div>

        <br />
        <asp:GridView ID="gvWishlist" runat="server" AutoGenerateColumns="False" DataKeyNames="WishListid" PageSize="5" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="955px" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="ArtId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ArtId">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:BoundField DataField="AddedDate" HeaderText="Added Date" SortExpression="AddedDate" DataFormatString="{0:dd-MM-yyyy}">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Art">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ArtUrl") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton OnClick="ArtClick" ID="btnArt" runat="server" CommandName="ArtDetails" CommandArgument='<%#Eval("ArtId") %>' ImageUrl='<%# Eval("ArtUrl") %>' />
                    </ItemTemplate>
                    <ControlStyle Height="120px" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="ArtName" HeaderText="Name" SortExpression="ArtName">
                    <ItemStyle Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:RM 0.00}">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock">
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="https://image.flaticon.com/icons/png/512/61/61848.png">
                    <ControlStyle Height="40px" Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton OnClick="CartClick" ID="Button1" runat="server" CommandName="AddToCart" CommandArgument='<%#Eval("ArtId") %>' Text="AddToCart" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                    </ItemTemplate>
                    <ControlStyle Height="40px" Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle Font-Names="Bahnschrift" BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM WishLists WHERE WishListid = @WishListid" SelectCommand="SELECT Wishlists.WishListid, Wishlists.AddedDate, Arts.ArtName, Arts.Price, Arts.ArtUrl, Wishlists.ArtId, Arts.Category, Arts.Stock FROM Wishlists INNER JOIN Arts ON Wishlists.ArtId = Arts.ArtId WHERE (Wishlists.CustomerId = @CustomerId)">
            <DeleteParameters>
                <asp:Parameter Name="WishListid" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="CustomerId" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
