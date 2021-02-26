<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
    SHOP NAME<br />
            <br />
            <asp:HyperLink ID="hlBuyArt" runat="server" NavigateUrl="~/Shop.aspx">Buy Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlSellArt" runat="server" NavigateUrl="~/SellArt.aspx">Sell Art</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlMyOrders" runat="server">My Orders</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlGallery" runat="server" NavigateUrl="~/Gallery.aspx">Gallery</asp:HyperLink>
            <br />
            <asp:HyperLink ID="hlCart" runat="server" NavigateUrl="~/Cart.aspx">Cart</asp:HyperLink>

        <div>
            <asp:Label ID="lblAddToCartMsg" runat="server"></asp:Label>
            <asp:DataList ID="dtProduct" runat="server" DataKeyField="ArtId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellPadding="15" CellSpacing="15" OnItemCommand="dtProduct_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" SelectedItemStyle-Wrap="False" AlternatingItemStyle-Wrap="False">
<AlternatingItemStyle Wrap="False"></AlternatingItemStyle>

<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
                <ItemTemplate > 
                    <table>
                        <asp:Label ID="ArtIdLabel" runat="server" Text='<%# Eval("ArtId") %>' Visible="false"/>                         
                        <tr>
                            <td>
                                <asp:ImageButton ID="ArtUrlLabel" CommandArgument='<% #Eval("ArtId") %>' CommandName="viewdetail" runat="server" height="100" Width="100" ImageUrl='<%# Eval("ArtUrl") %>'/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<% #Eval("ArtId") %>' CommandName="viewdetail"><%# Eval("ArtName") %></asp:LinkButton>            
                           
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
                                Price: RM
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:0.00}")%>' />
                            </td>
                        </tr>      
                        <tr>
                            <td>
                                <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="Add To Cart" Height="40px" Width="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                            
                                <asp:ImageButton ID="Button2" runat="server" CommandName="AddToWishlist" Text="Add To WishList" Height="40px" Width="40px" ImageUrl="https://lh3.googleusercontent.com/proxy/wXaYDKheDDeoD9STg69ZBWbf5mXPFjHMzn-bv_es4OmNwRRCcymquD-Y33L5V42WQ0JxZ88AhEHnQLTm5f_1tDMnrrdEGlQyCvt71RwSW7xg8RMIPoHQEwBheuIRzmfxxGyQ0lxirKhF8HGvw1hOJxu_9chDv8V_fAdPmfS6t16vje1xBw" />
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
