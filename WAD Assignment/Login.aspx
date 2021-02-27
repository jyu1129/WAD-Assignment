<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 

    <style type="text/css">
        .auto-style10 {
            height: 50px;
        }

        .auto-style11 {
            height: 49px;
        }

        .auto-style12 {
            height: 30px;
        }

        .auto-style14 {
            height: 50px;
            width: 122px;
        }

        .auto-style15 {
            height: 30px;
            width: 122px;
        }

        .auto-style16 {
            height: 49px;
            width: 122px;
        }

        .auto-style18 {
            height: 50px;
            width: 800px;
        }

        .auto-style19 {
            height: 30px;
            width: 800px;
        }

        .auto-style20 {
            height: 49px;
            width: 800px;
        }

        .auto-style21 {
            height: 26px;
        }
    </style>

        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <table style="width:100%";>
                <tr>
                    <td class="auto-style10" colspan="3">
                        <div style="align-items:center; text-align:center; font-size:40px; font-weight: bold;">
                            LOG IN</div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style14">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="auto-style10"><asp:TextBox ID="txtEmail" runat="server" required="required" type="email" Width="200px" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18"></td>
                    <td class="auto-style14">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="auto-style10"><asp:TextBox ID="txtPassword" runat="server" required="required" TextMode="Password" Height="24px" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style12"> <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Smaller" NavigateUrl="~/Login.aspx">Forgot your password?</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        &nbsp;</td>
                    <td class="auto-style16">
                        &nbsp;</td>
                    <td class="auto-style11">
            <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" Width="70px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        </td>
                    <td class="auto-style12" colspan="2">
                        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style10" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Don&#39;t have an account? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Now</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>

</asp:Content>