<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 134px;
        }
        .auto-style3 {
            height: 23px;
        }
    </style>
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
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Email&nbsp;&nbsp;&nbsp;</td>
                    <td>:
            <asp:TextBox ID="txtEmail" runat="server" required="required" type="email" Width="135px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Password&nbsp;&nbsp;&nbsp; </td>
                    <td>:
            <asp:TextBox ID="txtPassword" runat="server" required="required" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Smaller" NavigateUrl="~/Login.aspx">Forgot your password?</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
            <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">Don&#39;t have an account? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Now</asp:HyperLink>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
            </table>
            <br />
            <br />
        </div>
    </form>
</body>
</html>