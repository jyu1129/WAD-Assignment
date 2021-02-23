<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 21px;
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
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style2">REGISTER A NEW USER ACCOUNT</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <br />
                    Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <asp:TextBox ID="txtPw" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Confirm Password&nbsp; :
                    <asp:TextBox ID="txtConfirmPw" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    User Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:DropDownList ID="ddlUserType" runat="server" Height="17px" Width="128px">
                        <asp:ListItem>Please Select</asp:ListItem>
                        <asp:ListItem>Artist</asp:ListItem>
                        <asp:ListItem>Buyer</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:CheckBox ID="chkBoxAccept" runat="server" Text="I accept the" />
&nbsp;<asp:HyperLink runat="server" NavigateUrl="~/Register.aspx">Terms of Use</asp:HyperLink>
&nbsp;&amp;
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Privacy Policy</asp:HyperLink>
                    .<br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRegister" runat="server" Text="Register" />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

