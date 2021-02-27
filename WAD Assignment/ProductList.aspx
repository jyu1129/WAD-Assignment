<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script>
        document.getElementById("gallery").classList.remove("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.add("active");
        document.getElementById("profile").classList.remove("active");
        document.getElementById("cart").classList.remove("active");
    </script>

    <div>
        <asp:Label ID="lblAddToCartMsg" runat="server"></asp:Label>
        <div style="font-size: 40px; font-weight: bold; text-align: center">
            PRODUCT LIST
        </div>
        <asp:DataList ID="dtProduct" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellPadding="15" CellSpacing="15" OnItemCommand="dtProduct_ItemCommand" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" SelectedItemStyle-Wrap="False" AlternatingItemStyle-Wrap="False">
            <AlternatingItemStyle Wrap="False"></AlternatingItemStyle>

            <HeaderStyle Wrap="False"></HeaderStyle>

            <ItemStyle Wrap="False"></ItemStyle>
            <ItemTemplate>
                <table>
                    <asp:Label ID="ArtIdLabel" runat="server" Text='<%# Eval("ArtId") %>' Visible="false" />
                    <tr>
                        <td>
                            <asp:ImageButton ID="ArtUrlLabel" CommandArgument='<% #Eval("ArtId") %>' CommandName="viewdetail" runat="server" Height="120px" Width="150px" ImageUrl='<%# Eval("ArtUrl") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<% #Eval("ArtId") %>' CommandName="viewdetail"><%# Eval("ArtName") %></asp:LinkButton>

                        </td>
                    </tr>
                    <tr>
                        <td>Category:
                                 <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Price: RM
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:0.00}")%>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="Add To Cart" Height="40px" Width="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />

                            <asp:ImageButton ID="Button2" runat="server" CommandName="AddToWishlist" Text="Add To WishList" Height="40px" Width="40px" ImageUrl="https://icons-for-free.com/iconfiles/png/512/heart-131965017458786724.png" />
                        </td>
                    </tr>
                </table>

                <br />
            </ItemTemplate>

            <SelectedItemStyle Wrap="False"></SelectedItemStyle>
        </asp:DataList>



        <br />



        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts]"></asp:SqlDataSource>
    </div>
</asp:Content>
