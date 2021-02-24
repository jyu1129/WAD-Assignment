<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WAD_Assignment.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 154px;
        }
        .auto-style2 {
            width: 226px;
        }
        .auto-style3 {
            width: 154px;
            height: 23px;
        }
        .auto-style4 {
            width: 226px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            width: 154px;
            height: 30px;
        }
        .auto-style8 {
            width: 226px;
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style10 {
            width: 225px;
            height: 30px;
        }
        .auto-style11 {
            width: 225px;
            height: 23px;
        }
        .auto-style12 {
            width: 225px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>My Profile<br />
                        <br />
                        <table class="auto-style6">
                            <tr>
                                <td class="auto-style7">First Name</td>
                                <td class="auto-style8">:
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style10">Login Credentials</td>
                                <td class="auto-style9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Last Name</td>
                                <td class="auto-style4">:
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style11">Current Password</td>
                                <td class="auto-style5">:
                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Email:</td>
                                <td class="auto-style2">:
                                    <asp:TextBox ID="TextBox3" runat="server" Width="176px"></asp:TextBox>
                                </td>
                                <td class="auto-style12">New Password</td>
                                <td>:
                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Phone</td>
                                <td class="auto-style2">:
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style12">Confirm New Password</td>
                                <td>:
                                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Address</td>
                                <td class="auto-style2">:
                                    <asp:TextBox ID="TextBox5" runat="server" Height="71px" Width="216px"></asp:TextBox>
                                </td>
                                <td class="auto-style12">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Country</td>
                                <td class="auto-style2">:
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="158px">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style12">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">&nbsp;</td>
                                <td class="auto-style2">
                                    <asp:Button ID="Button1" runat="server" Text="Button" />
                                </td>
                                <td class="auto-style12">&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Button" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
