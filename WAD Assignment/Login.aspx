<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 

    <script>
        document.getElementById("gallery").classList.add("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.remove("active");
        document.getElementById("profile").classList.remove("active");
        document.getElementById("cart").classList.remove("active");
    </script>

    <style type="text/css">
        .auto-style9 {
            height: 40px;
        }
        .auto-style10 {
            height: 50px;
        }
        .auto-style11 {
            height: 49px;
        }
        .auto-style12 {
            height: 30px;
        }
    </style>

        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <table style="width:100%; text-align:center;">
                <tr>
                    <td class="auto-style9">LOG IN</td>
                </tr>
                <tr>
                    <td class="auto-style10">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmail" runat="server" required="required" type="email" Width="200px" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPassword" runat="server" required="required" TextMode="Password" Height="24px" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Smaller" NavigateUrl="~/Login.aspx">Forgot your password?</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
            <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" Width="70px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">Don&#39;t have an account? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Now</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>

</asp:Content>