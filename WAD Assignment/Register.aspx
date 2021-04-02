<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 500px;
            height: 600px;
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
                        <td class="auto-style26">First Name<br />
                        </td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="No special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="[a-zA-Z0-9]*[^!@%~?:#$%^&amp;*()0']"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style26">Last Name<br />
                        </td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="No special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="[a-zA-Z0-9]*[^!@%~?:#$%^&amp;*()0']"></asp:RegularExpressionValidator>
                            <br />
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
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlUserType" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style31"></td>
                        <td class="auto-style29" colspan="2">
                            <asp:CheckBox ID="chkBoxAccept" runat="server" Text="I accept to the" required="required" />
                            &nbsp;
                            <asp:LinkButton ID="linkBtnTNC" runat="server" >Terms &amp; Conditions</asp:LinkButton>
                            &nbsp;of this site<br />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>

                            <!-- ModalPopupExtender -->
                            <ajaxToolkit:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="linkBtnTNC"
                                CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                            </ajaxToolkit:ModalPopupExtender>
                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                Mochi Art Gallery: Terms & Conditions<br /><br />
                                <p style="text-align:justify; margin:20px;">
                                    Please read these Terms of Service ("Terms") carefully. They contain the legal terms and conditions that govern your use of services provided to you by Mochi Art, including information, text, images, graphics, data or other materials ("Content") and products and services provided through www.mochiart.com , shop.mochiart.com and other Mochi Art mobile applications as well as all elements, software, programs and code forming or incorporated in to www.MochiArt.com (the "Service"). This Service is operated by Mochi Art, Inc. ("MochiArt"). MochiArt is also referred to in these Terms as "we", "our", and "us".
                                    <br /><br />
                                    By using our Service, you agree to be bound by ("General Terms"), which contains provisions applicable to all users of our Service, including visitors to the MochiArt website (the "Site"). If you choose to register as a member of our Service or purchase products from the MochiArt Shop, you will be asked to check a box indicating that you have read, and agree to be bound by the terms.
                                </p>
                                <asp:Button ID="btnClose" CssClass="button" runat="server" CausesValidation="False" Text="Close" />
                            </asp:Panel>


                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="You must accept to the Terms & Conditions to register an account" ClientValidationFunction="ValidateCheckBox" ForeColor="Red"></asp:CustomValidator>
                            <br />
                        </td>
                    </tr>
                </table>
                <div style="align-items: center; text-align: center;">
                    <asp:Button ID="btnRegister" CssClass="button" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </div>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style7" style="align-items: center; text-align: center;">&nbsp;</td>
        </tr>
    </table>

</asp:Content>


