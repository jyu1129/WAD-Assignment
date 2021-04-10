<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Newsletter.ascx.cs" Inherits="WAD_Assignment.Newsletter" %>
<style type="text/css">
    .auto-style1 {
        width: 30%;
        height: 91px;
    }
    .auto-style2 {
        height: 23px;
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
    .auto-style3 {
        height: 55px;
    }
    </style>

<table class="auto-style1">
    <tr>
        <td class="auto-style2" style="text-align: center">Subscribe our email newsletter!</td>
    </tr>
    <tr>
        <td class="auto-style3" style="text-align: center">Email&nbsp;&nbsp;
            <asp:TextBox ID="txtEmail" runat="server" type="email" Height="22px" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style3" style="text-align: center"><asp:Button ID="btnSubscribe" runat="server" Cssclass="button" Height="37px" Text="Subscribe" OnClick="btnSubmit_Click" Width="150px" />
        </td>
    </tr>
</table>

