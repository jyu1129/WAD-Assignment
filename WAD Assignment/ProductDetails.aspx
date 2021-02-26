<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" MasterPageFile="~/Page.Master"  Inherits="WAD_Assignment.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
        <div>
            <strong>Product Details</strong>
            <br />
            <br />
            <asp:DataList ID="dtProductDetail" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" OnItemCommand="dtProductDetail_ItemCommand" OnSelectedIndexChanged="dtProductDetail_SelectedIndexChanged">
                <ItemTemplate>
                    ArtId:
                    <asp:Label ID="ArtIdLabel" runat="server" Text='<%# Eval("ArtId") %>' />
                    <br />                 
                    ArtUrl:
                    <asp:Label ID="ArtUrlLabel" runat="server" Text='<%# Eval("ArtUrl") %>' />
                    <br />
                    Category:
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    ArtName:
                    <asp:Label ID="ArtNameLabel" runat="server" Text='<%# Eval("ArtName") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    Stock:
                    <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    ArtistId:
                    <asp:Label ID="ArtistIdLabel" runat="server" Text='<%# Eval("ArtistId") %>' />
                    <br />
                    By:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' /><asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    <br />                                              
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    <br />
                    <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="Add To Cart" Height="40px" Width="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                    <asp:ImageButton ID="Button2" runat="server" CommandName="AddToWishlist" Text="Add To WishList"  Height="40px" Width="40px" ImageUrl="https://img.pngio.com/wish-list-best-wish-christmas-icon-png-and-vector-for-free-wish-icon-png-512_455.png"/>
                                              
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Arts.ArtId, Arts.ArtUrl, Arts.Category, Arts.ArtName, Arts.Price, Arts.Stock, Arts.Description, Arts.ArtistId, Artists.LastName, Artists.FirstName, Artists.Email FROM Arts INNER JOIN Artists ON Arts.ArtistId = Artists.ArtistId WHERE (Arts.ArtId = @ArtId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArtId" QueryStringField="ArtId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
     
</asp:Content>
