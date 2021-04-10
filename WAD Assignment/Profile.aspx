<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WAD_Assignment.Profile" %>


<%@ Register src="Newsletter.ascx" tagname="Newsletter" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 100%;
        }

        .auto-style7 {
            width: 154px;
            height: 30px;
        }

        .auto-style8 {
            width: 343px;
            height: 30px;
        }

        .auto-style9 {
            height: 30px;
        }

        .auto-style10 {
            width: 225px;
            height: 30px;
        }

        .auto-style13 {
            width: 154px;
            height: 50px;
        }

        .auto-style14 {
            width: 343px;
            height: 50px;
        }

        .auto-style15 {
            width: 225px;
            height: 50px;
        }

        .auto-style16 {
            height: 50px;
        }

        .auto-style17 {
            width: 154px;
            height: 100px;
        }

        .auto-style18 {
            width: 343px;
            height: 100px;
        }

        .auto-style19 {
            width: 225px;
            height: 100px;
        }

        .auto-style20 {
            height: 100px;
        }

        .auto-style21 {
            width: 300px;
            height: 50px;
        }

        .auto-style22 {
            width: 300px;
            height: 100px;
        }

        .auto-style23 {
            width: 300px;
            height: 30px;
        }

        .button {
            display: inline-block;
            padding: 0.5em 3em;
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
    </style>
    <script>
        document.getElementById("gallery").classList.remove("active");
        document.getElementById("home").classList.remove("active");
        document.getElementById("products").classList.remove("active");
        document.getElementById("profile").classList.add("active");
        document.getElementById("cart").classList.remove("active");
    </script>

    <div>
        <div>
            <asp:Button ID="btnProfile" runat="server" Text="My Profile" CssClass="button" Style="margin-left: 20px" PostBackUrl="~/Profile.aspx" />
            <asp:Button ID="btnWishlist" runat="server" Text="Wishlist" CssClass="button" PostBackUrl="~/Wishlist.aspx" />
            <asp:Button ID="btnPurchaseHistory" runat="server" Text="Purchase History" Width="232px" CssClass="button" PostBackUrl="~/PurchaseHistory.aspx" />
        </div>
        <table class="auto-style6">
            <tr>
                <td>
                    <div style="text-align: center; font-size: 40px; font-weight: bold;">
                        MY PROFILE
                    </div>
                    <br />
                    <br />
                    <table class="auto-style6">
                        <tr>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style13">First Name</td>
                            <td class="auto-style14">
                                <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="No numeric &amp; special characters e.g. @!#%.”" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style15">Change Password</td>
                            <td class="auto-style16">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style13">Last Name</td>
                            <td class="auto-style14">
                                <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="No numeric &amp; special characters e.g. @!#%.”" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style15">Current Password</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="txtPw" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style13">Email:</td>
                            <td class="auto-style14">
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px" type="email"></asp:TextBox>
                                <br />
                                <asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style15">New Password</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="txtNewPw" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPw" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Minimum password length is 8" ControlToValidate="txtNewPw" ValidationExpression=".{8}.*" ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style13">Phone</td>
                            <td class="auto-style14">
                                <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                                <br />
                            </td>
                            <td class="auto-style15">Confirm New Password</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="txtConfirmNewPw" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirmNewPw" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not Matched" ControlToCompare="txtNewPw" ControlToValidate="txtConfirmNewPw" ForeColor="Red"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style22"></td>
                            <td class="auto-style17">Address</td>
                            <td class="auto-style18">
                                <asp:TextBox ID="txtAddress" runat="server" Height="71px" Width="216px" TextMode="MultiLine"></asp:TextBox>
                                <br />
                            </td>
                            <td class="auto-style19">&nbsp;</td>
                            <td class="auto-style20"></td>
                        </tr>
                        <tr>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style13">Country</td>
                            <td class="auto-style14">
                                <asp:DropDownList ID="ddlCountry" runat="server" Width="158px">
                                    <asp:ListItem Selected="true">Select Country</asp:ListItem>
                                    <asp:ListItem>United States</asp:ListItem>
                                    <asp:ListItem>Afghanistan</asp:ListItem>
                                    <asp:ListItem>Albania</asp:ListItem>
                                    <asp:ListItem>Algeria</asp:ListItem>
                                    <asp:ListItem>American Samoa</asp:ListItem>
                                    <asp:ListItem>Andorra</asp:ListItem>
                                    <asp:ListItem>Angola</asp:ListItem>
                                    <asp:ListItem>Anguilla</asp:ListItem>
                                    <asp:ListItem>Antarctica</asp:ListItem>
                                    <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                                    <asp:ListItem>Argentina</asp:ListItem>
                                    <asp:ListItem>Armenia</asp:ListItem>
                                    <asp:ListItem>Aruba</asp:ListItem>
                                    <asp:ListItem>Australia</asp:ListItem>
                                    <asp:ListItem>Austria</asp:ListItem>
                                    <asp:ListItem>Azerbaijan</asp:ListItem>
                                    <asp:ListItem>Bahamas</asp:ListItem>
                                    <asp:ListItem>Bahrain</asp:ListItem>
                                    <asp:ListItem>Bangladesh</asp:ListItem>
                                    <asp:ListItem>Barbados</asp:ListItem>
                                    <asp:ListItem>Belarus</asp:ListItem>
                                    <asp:ListItem>Belgium</asp:ListItem>
                                    <asp:ListItem>Belize</asp:ListItem>
                                    <asp:ListItem>Benin</asp:ListItem>
                                    <asp:ListItem>Bermuda</asp:ListItem>
                                    <asp:ListItem>Bhutan</asp:ListItem>
                                    <asp:ListItem>Bolivia</asp:ListItem>
                                    <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                                    <asp:ListItem>Botswana</asp:ListItem>
                                    <asp:ListItem>Bouvet Island</asp:ListItem>
                                    <asp:ListItem>Brazil</asp:ListItem>
                                    <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                                    <asp:ListItem>Brunei Darussalam</asp:ListItem>
                                    <asp:ListItem>Bulgaria</asp:ListItem>
                                    <asp:ListItem>Burkina Faso</asp:ListItem>
                                    <asp:ListItem>Burundi</asp:ListItem>
                                    <asp:ListItem>Cambodia</asp:ListItem>
                                    <asp:ListItem>Cameroon</asp:ListItem>
                                    <asp:ListItem>Canada</asp:ListItem>
                                    <asp:ListItem>Cape Verde</asp:ListItem>
                                    <asp:ListItem>Cayman Islands</asp:ListItem>
                                    <asp:ListItem>Central African Republic</asp:ListItem>
                                    <asp:ListItem>Chad</asp:ListItem>
                                    <asp:ListItem>Chile</asp:ListItem>
                                    <asp:ListItem>China</asp:ListItem>
                                    <asp:ListItem>Christmas Island</asp:ListItem>
                                    <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                                    <asp:ListItem>Colombia</asp:ListItem>
                                    <asp:ListItem>Comoros</asp:ListItem>
                                    <asp:ListItem>Congo</asp:ListItem>
                                    <asp:ListItem>Cook Islands</asp:ListItem>
                                    <asp:ListItem>Costa Rica</asp:ListItem>
                                    <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                                    <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                                    <asp:ListItem>Cuba</asp:ListItem>
                                    <asp:ListItem>Cyprus</asp:ListItem>
                                    <asp:ListItem>Czech Republic</asp:ListItem>
                                    <asp:ListItem>Denmark</asp:ListItem>
                                    <asp:ListItem>Djibouti</asp:ListItem>
                                    <asp:ListItem>Dominica</asp:ListItem>
                                    <asp:ListItem>Dominican Republic</asp:ListItem>
                                    <asp:ListItem>East Timor</asp:ListItem>
                                    <asp:ListItem>Ecuador</asp:ListItem>
                                    <asp:ListItem>Egypt</asp:ListItem>
                                    <asp:ListItem>El Salvador</asp:ListItem>
                                    <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                    <asp:ListItem>Eritrea</asp:ListItem>
                                    <asp:ListItem>Estonia</asp:ListItem>
                                    <asp:ListItem>Ethiopia</asp:ListItem>
                                    <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                                    <asp:ListItem>Faroe Islands</asp:ListItem>
                                    <asp:ListItem>Fiji</asp:ListItem>
                                    <asp:ListItem>Finland</asp:ListItem>
                                    <asp:ListItem>France</asp:ListItem>
                                    <asp:ListItem>French Guiana</asp:ListItem>
                                    <asp:ListItem>French Polynesia</asp:ListItem>
                                    <asp:ListItem>French Southern Territories</asp:ListItem>
                                    <asp:ListItem>Gabon</asp:ListItem>
                                    <asp:ListItem>Gambia</asp:ListItem>
                                    <asp:ListItem>Georgia</asp:ListItem>
                                    <asp:ListItem>Germany</asp:ListItem>
                                    <asp:ListItem>Ghana</asp:ListItem>
                                    <asp:ListItem>Gibraltar</asp:ListItem>
                                    <asp:ListItem>Greece</asp:ListItem>
                                    <asp:ListItem>Greenland</asp:ListItem>
                                    <asp:ListItem>Grenada</asp:ListItem>
                                    <asp:ListItem>Guadeloupe</asp:ListItem>
                                    <asp:ListItem>Guam</asp:ListItem>
                                    <asp:ListItem>Guatemala</asp:ListItem>
                                    <asp:ListItem>Guinea</asp:ListItem>
                                    <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                    <asp:ListItem>Guyana</asp:ListItem>
                                    <asp:ListItem>Haiti</asp:ListItem>
                                    <asp:ListItem>Honduras</asp:ListItem>
                                    <asp:ListItem>Hong Kong</asp:ListItem>
                                    <asp:ListItem>Hungary</asp:ListItem>
                                    <asp:ListItem>Icel And</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>Indonesia</asp:ListItem>
                                    <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                                    <asp:ListItem>Iraq</asp:ListItem>
                                    <asp:ListItem>Ireland</asp:ListItem>
                                    <asp:ListItem>Israel</asp:ListItem>
                                    <asp:ListItem>Italy</asp:ListItem>
                                    <asp:ListItem>Jamaica</asp:ListItem>
                                    <asp:ListItem>Japan</asp:ListItem>
                                    <asp:ListItem>Jordan</asp:ListItem>
                                    <asp:ListItem>Kazakhstan</asp:ListItem>
                                    <asp:ListItem>Kenya</asp:ListItem>
                                    <asp:ListItem>Kiribati</asp:ListItem>
                                    <asp:ListItem>Korea</asp:ListItem>
                                    <asp:ListItem>Kuwait</asp:ListItem>
                                    <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                    <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                                    <asp:ListItem>Latvia</asp:ListItem>
                                    <asp:ListItem>Lebanon</asp:ListItem>
                                    <asp:ListItem>Lesotho</asp:ListItem>
                                    <asp:ListItem>Liberia</asp:ListItem>
                                    <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                                    <asp:ListItem>Liechtenstein</asp:ListItem>
                                    <asp:ListItem>Lithuania</asp:ListItem>
                                    <asp:ListItem>Luxembourg</asp:ListItem>
                                    <asp:ListItem>Macau</asp:ListItem>
                                    <asp:ListItem>Macedonia</asp:ListItem>
                                    <asp:ListItem>Madagascar</asp:ListItem>
                                    <asp:ListItem>Malawi</asp:ListItem>
                                    <asp:ListItem>Malaysia</asp:ListItem>
                                    <asp:ListItem>Maldives</asp:ListItem>
                                    <asp:ListItem>Mali</asp:ListItem>
                                    <asp:ListItem>Malta</asp:ListItem>
                                    <asp:ListItem>Marshall Islands</asp:ListItem>
                                    <asp:ListItem>Martinique</asp:ListItem>
                                    <asp:ListItem>Mauritania</asp:ListItem>
                                    <asp:ListItem>Mauritius</asp:ListItem>
                                    <asp:ListItem>Mayotte</asp:ListItem>
                                    <asp:ListItem>Mexico</asp:ListItem>
                                    <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                                    <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                                    <asp:ListItem>Monaco</asp:ListItem>
                                    <asp:ListItem>Mongolia</asp:ListItem>
                                    <asp:ListItem>Montserrat</asp:ListItem>
                                    <asp:ListItem>Morocco</asp:ListItem>
                                    <asp:ListItem>Mozambique</asp:ListItem>
                                    <asp:ListItem>Myanmar</asp:ListItem>
                                    <asp:ListItem>Namibia</asp:ListItem>
                                    <asp:ListItem>Nauru</asp:ListItem>
                                    <asp:ListItem>Nepal</asp:ListItem>
                                    <asp:ListItem>Netherlands</asp:ListItem>
                                    <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                                    <asp:ListItem>New Caledonia</asp:ListItem>
                                    <asp:ListItem>New Zealand</asp:ListItem>
                                    <asp:ListItem>Nicaragua</asp:ListItem>
                                    <asp:ListItem>Niger</asp:ListItem>
                                    <asp:ListItem>Nigeria</asp:ListItem>
                                    <asp:ListItem>Niue</asp:ListItem>
                                    <asp:ListItem>Norfolk Island</asp:ListItem>
                                    <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                    <asp:ListItem>Norway</asp:ListItem>
                                    <asp:ListItem>Oman</asp:ListItem>
                                    <asp:ListItem>Pakistan</asp:ListItem>
                                    <asp:ListItem>Palau</asp:ListItem>
                                    <asp:ListItem>Panama</asp:ListItem>
                                    <asp:ListItem>Papua New Guinea</asp:ListItem>
                                    <asp:ListItem>Paraguay</asp:ListItem>
                                    <asp:ListItem>Peru</asp:ListItem>
                                    <asp:ListItem>Philippines</asp:ListItem>
                                    <asp:ListItem>Pitcairn</asp:ListItem>
                                    <asp:ListItem>Poland</asp:ListItem>
                                    <asp:ListItem>Portugal</asp:ListItem>
                                    <asp:ListItem>Puerto Rico</asp:ListItem>
                                    <asp:ListItem>Qatar</asp:ListItem>
                                    <asp:ListItem>Reunion</asp:ListItem>
                                    <asp:ListItem>Romania</asp:ListItem>
                                    <asp:ListItem>Russian Federation</asp:ListItem>
                                    <asp:ListItem>Rwanda</asp:ListItem>
                                    <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                                    <asp:ListItem>Saint Lucia</asp:ListItem>
                                    <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                                    <asp:ListItem>Samoa</asp:ListItem>
                                    <asp:ListItem>San Marino</asp:ListItem>
                                    <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                                    <asp:ListItem>Senegal</asp:ListItem>
                                    <asp:ListItem>Seychelles</asp:ListItem>
                                    <asp:ListItem>Sierra Leone</asp:ListItem>
                                    <asp:ListItem>Singapore</asp:ListItem>
                                    <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                                    <asp:ListItem>Slovenia</asp:ListItem>
                                    <asp:ListItem>Solomon Islands</asp:ListItem>
                                    <asp:ListItem>Somalia</asp:ListItem>
                                    <asp:ListItem>South Africa</asp:ListItem>
                                    <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                                    <asp:ListItem>Spain</asp:ListItem>
                                    <asp:ListItem>Sri Lanka</asp:ListItem>
                                    <asp:ListItem>St. Helena</asp:ListItem>
                                    <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                                    <asp:ListItem>Sudan</asp:ListItem>
                                    <asp:ListItem>Suriname</asp:ListItem>
                                    <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                                    <asp:ListItem>Sw Aziland</asp:ListItem>
                                    <asp:ListItem>Sweden</asp:ListItem>
                                    <asp:ListItem>Switzerland</asp:ListItem>
                                    <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                                    <asp:ListItem>Taiwan</asp:ListItem>
                                    <asp:ListItem>Tajikistan</asp:ListItem>
                                    <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                                    <asp:ListItem>Thailand</asp:ListItem>
                                    <asp:ListItem>Togo</asp:ListItem>
                                    <asp:ListItem>Tokelau</asp:ListItem>
                                    <asp:ListItem>Tonga</asp:ListItem>
                                    <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                                    <asp:ListItem>Tunisia</asp:ListItem>
                                    <asp:ListItem>Turkey</asp:ListItem>
                                    <asp:ListItem>Turkmenistan</asp:ListItem>
                                    <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                                    <asp:ListItem>Tuvalu</asp:ListItem>
                                    <asp:ListItem>Uganda</asp:ListItem>
                                    <asp:ListItem>Ukraine</asp:ListItem>
                                    <asp:ListItem>United Arab Emirates</asp:ListItem>
                                    <asp:ListItem>United Kingdom</asp:ListItem>
                                    <asp:ListItem>United States</asp:ListItem>
                                    <asp:ListItem>United States Minor Is.</asp:ListItem>
                                    <asp:ListItem>Uruguay</asp:ListItem>
                                    <asp:ListItem>Uzbekistan</asp:ListItem>
                                    <asp:ListItem>Vanuatu</asp:ListItem>
                                    <asp:ListItem>Venezuela</asp:ListItem>
                                    <asp:ListItem>Viet Nam</asp:ListItem>
                                    <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                                    <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                                    <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                                    <asp:ListItem>Western Sahara</asp:ListItem>
                                    <asp:ListItem>Yemen</asp:ListItem>
                                    <asp:ListItem>Yugoslavia</asp:ListItem>
                                    <asp:ListItem>Zaire</asp:ListItem>
                                    <asp:ListItem>Zambia</asp:ListItem>
                                    <asp:ListItem>Zimbabwe</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style15"></td>
                            <td class="auto-style16"></td>
                        </tr>
                        <tr>
                            <td class="auto-style23">&nbsp;</td>
                            <td class="auto-style7"></td>
                            <td class="auto-style8">
                                <asp:Button ID="btnUpdate" runat="server" Cssclass="button" Text="Update" OnClick="btnUpdate_Click"  />
                                <br />
                                <asp:Label ID="lblUpdate" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style10"></td>
                            <td class="auto-style9">
                                <asp:Button ID="btnChange" runat="server" Cssclass="button" Text="Change" OnClick="btnChange_Click" />
                                <br />
                                <asp:Label ID="lblChange" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9" colspan="5" align="center">
                                <uc1:Newsletter ID="Newsletter1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>


</asp:Content>

