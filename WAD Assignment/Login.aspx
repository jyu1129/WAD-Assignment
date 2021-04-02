<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <style type="text/css">
        
        .auto-style14 {
            height: 50px;
            width: 378px;
        }
        .auto-style15 {
            height: 30px;
            width: 378px;
        }
        .auto-style16 {
            height: 49px;
            width: 378px;
        }
        .auto-style21 {
            height: 50px;
            width: 19px;
        }
        .auto-style23 {
            height: 49px;
            width: 19px;
        }

        .button {
            display: inline-block;
            padding: 0.5em 2em;
            background-color: transparent;
            border: 0.1em solid #000000;
            border-radius: 3px;
            margin: 0 0.3em 0.3em 0;
            box-sizing: border-box;
            text-decoration: none;
            color: grey;
            text-align: center;
            transition: all 0.15s;
            margin-left: 10px;
            margin-top: 10px;
        }

            .button:hover {
                background-color: rgb(108,117,125);
                color: white;
            }

        .auto-style24 {
            height: 50px;
            width: 241px;
        }
        .auto-style25 {
            height: 30px;
            width: 241px;
        }
        .auto-style26 {
            height: 49px;
            width: 241px;
        }
        .auto-style27 {
            height: 30px;
            width: 19px;
        }
        .auto-style28 {
            height: 30px;
        }

    </style>

    <table style="width: 100%;">
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
    <div style="align-items: center; text-align: center; font-size: 40px; font-weight: bold;">LOG IN</div>
    <div>
        <table style="width: 100%;">

            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style21">Email&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style14"><asp:TextBox ID="txtEmail" runat="server" type="email" Width="200px" Height="24px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style21">Password&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style14"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="24px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style15">
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Smaller" NavigateUrl="~/ForgetPassword.aspx">Forgot your password?</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">
                    &nbsp;</td>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style16">
                    <asp:Button ID="btnLogIn" runat="server" Cssclass="button" Text="Log In" OnClick="btnLogIn_Click"  />
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style15">
                    <asp:Label ID="lblInvalid" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    Don&#39;t have an account?<br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Now</asp:HyperLink>
                </td>
            </tr>
            </table>
        <br />
        <br />
    </div>

</asp:Content>
