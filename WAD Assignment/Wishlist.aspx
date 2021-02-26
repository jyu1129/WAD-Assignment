﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WAD_Assignment.Wishlist" MasterPageFile="~/Page.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
        <div>
            <div style="font-weight: bold; font-size: 30px; font-family: Bahnschrift; color: #000000; text-align: center">
                WISHLIST
            </div>
            <div style="font-family: Bahnschrift">
                <br />
                There are
            <asp:Label ID="lblWishCount" runat="server" Font-Bold="true"></asp:Label>
                item(s) in your wishlist.
            </div>
            <br />
            <asp:GridView ID="gvWishlist" runat="server" AutoGenerateColumns="False" DataKeyNames="WishListid" PageSize="5" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="955px">
                <Columns>
                    <asp:BoundField DataField="ArtId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ArtId" >
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AddedDate" HeaderText="Added Date" SortExpression="AddedDate" DataFormatString="{0:dd-MM-yyyy}" >
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" >
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift"/>
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="ArtUrl" HeaderText="Art" SortExpression="ArtUrl">
                        <ControlStyle Height="120px" Width="150px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="Name" SortExpression="ArtName" >
                    <ItemStyle Font-Names="Bahnschrift" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:RM 0.00}" >
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" >
                    <ItemStyle HorizontalAlign="Center" Font-Names="Bahnschrift"/>
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="https://image.flaticon.com/icons/png/512/61/61848.png" >
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
                <HeaderStyle Font-Names="Bahnschrift" />
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
