<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=chkBoxAccept.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>

    <style type="text/css">
        .auto-style7 {
            height: 21px;
        }

        .auto-style22 {
            width: 100%;
        }

        .auto-style26 {
            width: 144px;
            height: 50px;
        }

        .auto-style29 {
            height: 50px;
        }

        .auto-style31 {
            width: 406px;
            height: 50px;
        }

        .auto-style32 {
            width: 535px;
            height: 50px;
        }
    </style>


    <table class="auto-style22">
        <tr>
            <td>
                <div style="align-items: center; text-align: center; font-size: 40px; font-weight: bold;">
                    REGISTER A NEW USER ACCOUNT
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <table class="auto-style22">
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">First Name</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtFirstName" runat="server" required="required" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">Last Name</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtLastName" runat="server" required="required" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">Email</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtEmail" runat="server" Width="200px" required="required" type="email"></asp:TextBox>
                            &nbsp;<asp:Label ID="lblEmailExist" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">Password</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtPw" runat="server" required="required" TextMode="Password" Width="200px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Minimum password length is 8" ControlToValidate="txtPw" ValidationExpression=".{8}.*" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">Confirm Password</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtConfirmPw" runat="server" required="required" TextMode="Password" Width="200px"></asp:TextBox>
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPw" ControlToValidate="txtConfirmPw" ErrorMessage="Not Matched" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">User Type</td>
                        <td class="auto-style32">
                            <asp:DropDownList ID="ddlUserType" runat="server" Height="18px" Width="200px">
                                <asp:ListItem Text="Please Select" Selected="True"></asp:ListItem>
                                <asp:ListItem>Artist</asp:ListItem>
                                <asp:ListItem>Customer</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="ddlUserType" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style29" colspan="2">
                            <asp:CheckBox ID="chkBoxAccept" runat="server" Text="I accept to the" required="required" />
                            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Terms &amp; Conditions</asp:HyperLink>
                            &nbsp;of this site<br />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="You must accept to the Terms & Conditions to register an account" ClientValidationFunction="ValidateCheckBox" ForeColor="Red"></asp:CustomValidator>
                            <br />
                        </td>
                    </tr>
                </table>
                <div style="align-items: center; text-align: center;">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" OnClientClick="javascript:alert('Your account has successfully registered!')" />
                </div>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style7" style="align-items: center; text-align: center;">&nbsp;</td>
        </tr>
    </table>

</asp:Content>


