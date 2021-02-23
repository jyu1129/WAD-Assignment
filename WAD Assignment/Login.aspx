<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>SHOP NAME</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>LOG IN</td>
            </tr>
        </table>
        <div>
            Username&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            <br />
            Password&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Smaller" NavigateUrl="~/Login.aspx">Forgot your password?</asp:HyperLink>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogIn" runat="server" Text="Log In" />
            <br />
            <br />
&nbsp;Not a Member?
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Now</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>