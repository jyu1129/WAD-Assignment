<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WAD_Assignment.Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 307px;
            height: 201px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            User ID<br />
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="White" BorderStyle="Dotted" Font-Bold="True" Height="250px" OnClick="Button1_Click" Text="Publish your art!" Width="250px" />
            <br />
            <hr />
            <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="10" CellSpacing="50" CssClass="auto-style1" DataKeyField="ArtId" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" GridLines="Both" HorizontalAlign="Center" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="5" RepeatDirection="Horizontal">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ArtId") %>' Height="250px" ImageUrl='<%# Eval("ArtUrl") %>' OnClick="ImageButton1_Click" Width="300px" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ArtUrl], [ArtId] FROM [Arts]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
