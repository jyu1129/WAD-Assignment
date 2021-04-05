<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="WAD_Assignment.ForgetPassword" %>

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

        .auto-style4 {
            width: 50px;
        }
        .auto-style5 {
            height: 26px;
            width: 50px;
        }
        .auto-style9 {
            width: 239px;
        }
        .auto-style10 {
            height: 26px;
            width: 239px;
        }
        .auto-style16 {
            height: 20px;
            width: 239px;
        }
        .auto-style17 {
            height: 20px;
            width: 50px;
        }
        .auto-style18 {
            height: 20px;
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


    <div style="align-items: center; text-align: center; font-size: 40px; font-weight: bold;">FORGET PASSWORD</div>
    <div>
        <table style="width: 100%;">

            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style4">Email&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style14"><asp:TextBox ID="txtEmail" runat="server" type="email" Width="290px" Height="24px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style5">&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style15">
                    <asp:Button ID="btnGet" runat="server" Cssclass="button" Text="Get Password" OnClick="btnGet_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style5">
                    </td>
                <td class="auto-style1">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    </td>
                <td class="auto-style17">
                    </td>
                <td class="auto-style18">
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Back to Login</asp:HyperLink>
                </td>
            </tr>
            </table>
        <br />
        <br />
    </div>

</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        </style>
</asp:Content>


