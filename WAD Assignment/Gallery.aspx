<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WAD_Assignment.Gallery" MasterPageFile="Page.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
    <script>
        document.getElementById("gallery").classList.add("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.remove("active");
        document.getElementById("profile").classList.remove("active");
        document.getElementById("cart").classList.remove("active");
    </script>
    <div>
        <br />
        &nbsp;Welcome to your gallery!<br />
        <br />
        &nbsp;There are a total of
        <asp:Label ID="lblGalleryTotal" runat="server"></asp:Label>
&nbsp;art(s) in your gallery.<br />
        &nbsp;You&#39;ve sold
        <asp:Label ID="lblTotalArtSold" runat="server"></asp:Label>
&nbsp;art(s) for a total amount of RM<asp:Label ID="lblTotalProfit" runat="server"></asp:Label>
        .&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <hr />
        &nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="White" BorderStyle="Dotted" Font-Bold="True" Height="250px" OnClick="Button1_Click" Text="Publish your art!" Width="250px" />
        <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="White" BorderStyle="Solid" BorderWidth="3px" CellPadding="10" CellSpacing="50" CssClass="auto-style1" DataKeyField="ArtId" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="5" RepeatDirection="Horizontal">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" />
            <ItemTemplate>
                <div class="card">
                    <asp:ImageButton class="card-img-top" ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ArtId") %>' Height="250px" ImageUrl='<%# Eval("ArtUrl") %>' OnClick="ImageButton1_Click" Width="300px" />
                    <div class="card-body"> <%# Eval("ArtName") %> </div>
                </div>
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ArtUrl, ArtName, ArtId, ArtistId FROM Arts WHERE (ArtistId = @ArtistId)" OnSelecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="ArtistId" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>