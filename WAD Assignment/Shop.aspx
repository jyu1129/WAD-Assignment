<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="WAD_Assignment.Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="300px" ImageUrl="~/tempImg/880433.jpg" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="300px" ImageUrl="~/tempImg/880433.jpg" />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add To Cart" Width="105px" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Cart]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" Height="300px" ImageUrl="~/tempImg/880433.jpg" />
&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" Height="300px" ImageUrl="~/tempImg/880433.jpg" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [img] FROM [images]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
