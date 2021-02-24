﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type = "text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=chkBoxAccept.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>

    <style type="text/css">
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 21px;
        }
        .auto-style9 {
            width: 135px;
            height: 23px;
        }
        .auto-style12 {
            width: 135px;
            height: 22px;
        }
        .auto-style14 {
            height: 22px;
        }
        .auto-style18 {
            height: 22px;
            width: 436px;
        }
        .auto-style19 {
            height: 23px;
            width: 436px;
        }
        .auto-style20 {
            width: 135px;
            height: 21px;
        }
        .auto-style21 {
            height: 21px;
            width: 436px;
        }
        .auto-style22 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style22">
            <tr>
                <td>SHOP NAME</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style7">REGISTER A NEW USER ACCOUNT</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <table class="auto-style22">
                        <tr>
                            <td class="auto-style12">First Name</td>
                            <td class="auto-style18">:
                    <asp:TextBox ID="txtFirstName" runat="server" required="required"></asp:TextBox>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Last Name</td>
                            <td class="auto-style19">:
                    <asp:TextBox ID="txtLastName" runat="server" required="required"></asp:TextBox>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Email</td>
                            <td class="auto-style19">: <asp:TextBox ID="txtEmail" runat="server" Width="170px" required="required" type="email"></asp:TextBox>
                            &nbsp;<asp:Label ID="lblEmailExist" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style6">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Password</td>
                            <td class="auto-style19">: <asp:TextBox ID="txtPw" runat="server" required="required" TextMode="Password"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Minimum password length is 8" ControlToValidate="txtPw"  ValidationExpression=".{8}.*" ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style20">Confirm Password</td>
                            <td class="auto-style21">:
                    <asp:TextBox ID="txtConfirmPw" runat="server" required="required" TextMode="Password" ></asp:TextBox>
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPw" ControlToValidate="txtConfirmPw" ErrorMessage="Not Matched" ForeColor="Red"></asp:CompareValidator>
                            </td>
                            <td class="auto-style20">&nbsp;</td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">User Type</td>
                            <td class="auto-style19">:
                    <asp:DropDownList ID="ddlUserType" runat="server" Height="17px" Width="128px">
                        <asp:ListItem Text="Please Select" Selected="True"></asp:ListItem>
                        <asp:ListItem>Artist</asp:ListItem>
                        <asp:ListItem>Customer</asp:ListItem>
                    </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="ddlUserType" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:CheckBox ID="chkBoxAccept" runat="server" Text="I accept to the" required="required" />
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Terms &amp; Conditions</asp:HyperLink>
&nbsp;of this site<br />
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="You must accept to the Terms & Conditions to register an account" ClientValidationFunction = "ValidateCheckBox" ForeColor="Red"></asp:CustomValidator>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>

