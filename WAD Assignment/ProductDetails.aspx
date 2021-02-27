<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div>
        <div style="font-size: 40px; font-weight: bold; text-align: center">
            PRODUCT DETAILS
        </div>
        <br />
        <br />
        <asp:DataList ID="dtProductDetail" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" OnItemCommand="dtProductDetail_ItemCommand" OnSelectedIndexChanged="dtProductDetail_SelectedIndexChanged" HorizontalAlign="Center">
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td rowspan="14">
                            <asp:Image ID="Image1" runat="server" Height="563px" ImageUrl='<%# Eval("ArtUrl") %>' weight="500" Width="596px" />
                        </td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:Label ID="ArtNameLabel" runat="server" Text='<%# Eval("ArtName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>ID:
                            <asp:Label ID="ArtIdLabel" runat="server" Text='<%# Eval("ArtId") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Category:
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Stock:
                            <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>By:
                            <asp:Label ID="LastNameLabel0" runat="server" Text='<%# Eval("LastName") %>' />
                            <asp:Label ID="FirstNameLabel0" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Artist ID:
                            <asp:Label ID="ArtistIdLabel0" runat="server" Text='<%# Eval("ArtistId") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Email:
                            <asp:Label ID="EmailLabel0" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Price: RM
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Height="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" Text="Add To Cart" Width="40px" />
                            &nbsp;
                            <asp:ImageButton ID="Button2" runat="server" CommandName="AddToWishlist" Height="40px" ImageUrl="https://icons-for-free.com/iconfiles/png/512/heart-131965017458786724.png" Text="Add To WishList" Width="40px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                    </tr>
                </table>
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
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>

