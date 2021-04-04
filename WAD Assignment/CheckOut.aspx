<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" MasterPageFile="~/Page.Master" Inherits="WAD_Assignment.CheckOut" Culture="en-US" UICulture="en-US" ResponseEncoding="utf-8"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <div style="font-size: 40px; font-weight: bold; text-align: center">
        CHECK OUT
    </div>
    </br>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" Height="72px" Width="1008px" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <EmptyDataTemplate>
                    Name
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FirstName, LastName, Phone, Address, Country, Email FROM Customers WHERE (CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CartId" DataSourceID="SqlDataSource2" GridLines="None" Height="181px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="1009px" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="ArtUrl" SortExpression="ArtUrl" ControlStyle-Width="100" ControlStyle-Height="100" ></asp:ImageField>
                    <asp:BoundField DataField="ArtName" HeaderText="Art Name" SortExpression="ArtName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="ItemSubtotal" HeaderText="Item Subtotal" ReadOnly="True" SortExpression="ItemSubtotal" />
                </Columns>
            </asp:GridView>
            <div class="d-flex justify-content-center">
                <div>
                    Merchandise Subtotal (<asp:Label ID="lblTotalItem" runat="server"></asp:Label>&nbsp;items) :
                <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                </div>                
            </div>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT C.CartId, A.ArtUrl, A.ArtName, A.Price, C.Quantity, A.Price * C.Quantity AS ItemSubtotal FROM Cart AS C INNER JOIN Arts AS A ON C.ArtId = A.ArtId WHERE (C.CustomerId = @CustomerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="CustomerId" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <table class="auto-style8">
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">Fill in delivery details:</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style4">Name:</td>
                    <td class="auto-style7" colspan="2">
                        <asp:TextBox ID="txtName" runat="server" Width="581px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtName" runat="server" ControlToValidate="txtName" ErrorMessage="Invalid Name, Please enter 1 to 50 letter(s) only" ForeColor="Red" ValidationExpression="^[A-Za-z\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">Address:</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAddress" runat="server" Height="58px" Width="582px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV2" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Invalid Address, Please enter 15 to 100 characters only" ForeColor="Red" ValidationExpression="^[A-Za-z\s\d\W]{15,150}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style4">City:</td>
                    <td class="auto-style7" colspan="2">
                        <asp:TextBox ID="txtCity" runat="server" Width="581px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV3" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Invalid City, Please enter 5 to 50 characters only" ForeColor="Red" ValidationExpression="^[A-Za-z\s\d\W]{5,50}$">*</asp:RegularExpressionValidator>

                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">Postal:</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPostal" runat="server" Width="581px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV4" runat="server" ControlToValidate="txtPostal" ErrorMessage="Postal is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtPostal" runat="server" ControlToValidate="txtPostal" ErrorMessage="Invalid Postal Code, Please enter 5 to 10 digits only" ForeColor="Red" ValidationExpression="^\d{5,10}$">*</asp:RegularExpressionValidator>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3">Country:</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlCountryList" runat="server" Width="582px">
                            <asp:ListItem Value="-1">Select Country</asp:ListItem>
                            <asp:ListItem Value="Afghanistan">Afghanistan</asp:ListItem>
                            <asp:ListItem Value="Albania">Albania</asp:ListItem>
                            <asp:ListItem Value="Algeria">Algeria</asp:ListItem>
                            <asp:ListItem Value="American Samoa">American Samoa</asp:ListItem>
                            <asp:ListItem Value="Andorra">Andorra</asp:ListItem>
                            <asp:ListItem Value="Angola">Angola</asp:ListItem>
                            <asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
                            <asp:ListItem Value="Antarctica">Antarctica</asp:ListItem>
                            <asp:ListItem Value="Antigua And Barbuda">Antigua And Barbuda</asp:ListItem>
                            <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                            <asp:ListItem Value="Armenia">Armenia</asp:ListItem>
                            <asp:ListItem Value="Aruba">Aruba</asp:ListItem>
                            <asp:ListItem Value="Australia">Australia</asp:ListItem>
                            <asp:ListItem Value="Austria">Austria</asp:ListItem>
                            <asp:ListItem Value="Azerbaijan">Azerbaijan</asp:ListItem>
                            <asp:ListItem Value="Bahamas">Bahamas</asp:ListItem>
                            <asp:ListItem Value="Bahrain">Bahrain</asp:ListItem>
                            <asp:ListItem Value="Bangladesh">Bangladesh</asp:ListItem>
                            <asp:ListItem Value="Barbados">Barbados</asp:ListItem>
                            <asp:ListItem Value="Belarus">Belarus</asp:ListItem>
                            <asp:ListItem Value="Belgium">Belgium</asp:ListItem>
                            <asp:ListItem Value="Belize">Belize</asp:ListItem>
                            <asp:ListItem Value="BBeninJ">Benin</asp:ListItem>
                            <asp:ListItem Value="Bermuda">Bermuda</asp:ListItem>
                            <asp:ListItem Value="Bhutan">Bhutan</asp:ListItem>
                            <asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
                            <asp:ListItem Value="Bosnia And Herzegowina">Bosnia And Herzegowina</asp:ListItem>
                            <asp:ListItem Value="Botswana">Botswana</asp:ListItem>
                            <asp:ListItem Value="Bouvet Island">Bouvet Island</asp:ListItem>
                            <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                            <asp:ListItem Value="British Indian Ocean Territory">British Indian Ocean Territory</asp:ListItem>
                            <asp:ListItem Value="Brunei Darussalam">Brunei Darussalam</asp:ListItem>
                            <asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
                            <asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
                            <asp:ListItem Value="Burundi">Burundi</asp:ListItem>
                            <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
                            <asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
                            <asp:ListItem Value="Canada">Canada</asp:ListItem>
                            <asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
                            <asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
                            <asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
                            <asp:ListItem Value="Chad">Chad</asp:ListItem>
                            <asp:ListItem Value="Chile">Chile</asp:ListItem>
                            <asp:ListItem Value="China">China</asp:ListItem>
                            <asp:ListItem Value="Christmas Island">Christmas Island</asp:ListItem>
                            <asp:ListItem Value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</asp:ListItem>
                            <asp:ListItem Value="Colombia">Colombia</asp:ListItem>
                            <asp:ListItem Value="Comoros">Comoros</asp:ListItem>
                            <asp:ListItem Value="Congo">Congo</asp:ListItem>
                            <asp:ListItem Value="Cook Islands">Cook Islands</asp:ListItem>
                            <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                            <asp:ListItem Value="Cote D'Ivoire">Cote D'Ivoire</asp:ListItem>
                            <asp:ListItem Value="Croatia (Local Name: Hrvatska">Croatia (Local Name: Hrvatska)</asp:ListItem>
                            <asp:ListItem Value="Cuba">Cuba</asp:ListItem>
                            <asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
                            <asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
                            <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                            <asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
                            <asp:ListItem Value="Dominica">Dominica</asp:ListItem>
                            <asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
                            <asp:ListItem Value="East Timor">East Timor</asp:ListItem>
                            <asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
                            <asp:ListItem Value="Egypt">Egypt</asp:ListItem>
                            <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                            <asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
                            <asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
                            <asp:ListItem Value="Estonia">Estonia</asp:ListItem>
                            <asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
                            <asp:ListItem Value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</asp:ListItem>
                            <asp:ListItem Value="Faroe Islands">Faroe Islands</asp:ListItem>
                            <asp:ListItem Value="Fiji">Fiji</asp:ListItem>
                            <asp:ListItem Value="Finland">Finland</asp:ListItem>
                            <asp:ListItem Value="France">France</asp:ListItem>
                            <asp:ListItem Value="French Guiana">French Guiana</asp:ListItem>
                            <asp:ListItem Value="French Polynesia">French Polynesia</asp:ListItem>
                            <asp:ListItem Value="French Southern Territories">French Southern Territories</asp:ListItem>
                            <asp:ListItem Value="Gabon">Gabon</asp:ListItem>
                            <asp:ListItem Value="Gambia">Gambia</asp:ListItem>
                            <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                            <asp:ListItem Value="Ghana">Ghana</asp:ListItem>
                            <asp:ListItem Value="Gibraltar">Gibraltar</asp:ListItem>
                            <asp:ListItem Value="Greece">Greece</asp:ListItem>
                            <asp:ListItem Value="GGreenlandL">Greenland</asp:ListItem>
                            <asp:ListItem Value="Grenada">Grenada</asp:ListItem>
                            <asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
                            <asp:ListItem Value="Guam">Guam</asp:ListItem>
                            <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                            <asp:ListItem Value="Guinea">Guinea</asp:ListItem>
                            <asp:ListItem Value="Guinea-Bissau">Guinea-Bissau</asp:ListItem>
                            <asp:ListItem Value="Guyana">Guyana</asp:ListItem>
                            <asp:ListItem Value="Haiti">Haiti</asp:ListItem>
                            <asp:ListItem Value="Heard And McDonald Islands">Heard And McDonald Islands</asp:ListItem>
                            <asp:ListItem Value="Holy See (Vatican City State)">Holy See (Vatican City State)</asp:ListItem>
                            <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                            <asp:ListItem Value="Hong Kong">Hong Kong</asp:ListItem>
                            <asp:ListItem Value="Hungary">Hungary</asp:ListItem>
                            <asp:ListItem Value="Ice Land">Ice Land</asp:ListItem>
                            <asp:ListItem Value="India">India</asp:ListItem>
                            <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
                            <asp:ListItem Value="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</asp:ListItem>
                            <asp:ListItem Value="Iraq">Iraq</asp:ListItem>
                            <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                            <asp:ListItem Value="Israel">Israel</asp:ListItem>
                            <asp:ListItem Value="Italy">Italy</asp:ListItem>
                            <asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
                            <asp:ListItem Value="Japan">Japan</asp:ListItem>
                            <asp:ListItem Value="Jordan">Jordan</asp:ListItem>
                            <asp:ListItem Value="Jordan">Kazakhstan</asp:ListItem>
                            <asp:ListItem Value="Kenya">Kenya</asp:ListItem>
                            <asp:ListItem Value="Kiribati">Kiribati</asp:ListItem>
                            <asp:ListItem Value="Korea, Dem. People's Republic">Korea, Dem. People's Republic</asp:ListItem>
                            <asp:ListItem Value="Korea">Korea</asp:ListItem>
                            <asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
                            <asp:ListItem Value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
                            <asp:ListItem Value="Lao People's Dem. Republic">Lao People's Dem. Republic</asp:ListItem>
                            <asp:ListItem Value="Latvia">Latvia</asp:ListItem>
                            <asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
                            <asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
                            <asp:ListItem Value="Liberia">Liberia</asp:ListItem>
                            <asp:ListItem Value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</asp:ListItem>
                            <asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
                            <asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
                            <asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
                            <asp:ListItem Value="Macau">Macau</asp:ListItem>
                            <asp:ListItem Value="Macedonia">Macedonia</asp:ListItem>
                            <asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
                            <asp:ListItem Value="Malawi">Malawi</asp:ListItem>
                            <asp:ListItem Value="Malaysia" Selected="True">Malaysia</asp:ListItem>
                            <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                            <asp:ListItem Value="Mali">Mali</asp:ListItem>
                            <asp:ListItem Value="Malta">Malta</asp:ListItem>
                            <asp:ListItem Value="Marshall Islands">Marshall Islands</asp:ListItem>
                            <asp:ListItem Value="Martinique">Martinique</asp:ListItem>
                            <asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
                            <asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
                            <asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
                            <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                            <asp:ListItem Value="Micronesia, Federated States">Micronesia, Federated States</asp:ListItem>
                            <asp:ListItem Value="Moldova">Moldova</asp:ListItem>
                            <asp:ListItem Value="Monaco">Monaco</asp:ListItem>
                            <asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
                            <asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
                            <asp:ListItem Value="Morocco">Morocco</asp:ListItem>
                            <asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
                            <asp:ListItem Value="Myanmar">Myanmar</asp:ListItem>
                            <asp:ListItem Value="Namibia">Namibia</asp:ListItem>
                            <asp:ListItem Value="Nauru">Nauru</asp:ListItem>
                            <asp:ListItem Value="Nepal">Nepal</asp:ListItem>
                            <asp:ListItem Value="Netherlands">Netherlands</asp:ListItem>
                            <asp:ListItem Value="Netherlands Ant Illes">Netherlands Ant Illes</asp:ListItem>
                            <asp:ListItem Value="New Caledonia">New Caledonia</asp:ListItem>
                            <asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
                            <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                            <asp:ListItem Value="Niger">Niger</asp:ListItem>
                            <asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
                            <asp:ListItem Value="Niue">Niue</asp:ListItem>
                            <asp:ListItem Value="Norfolk Island">Norfolk Island</asp:ListItem>
                            <asp:ListItem Value="Northern Mariana Islands">Northern Mariana Islands</asp:ListItem>
                            <asp:ListItem Value="Norway">Norway</asp:ListItem>
                            <asp:ListItem Value="Oman">Oman</asp:ListItem>
                            <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                            <asp:ListItem Value="Palau">Palau</asp:ListItem>
                            <asp:ListItem Value="Panama">Panama</asp:ListItem>
                            <asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
                            <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                            <asp:ListItem Value="Peru">Peru</asp:ListItem>
                            <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
                            <asp:ListItem Value="Pitcairn">Pitcairn</asp:ListItem>
                            <asp:ListItem Value="Poland">Poland</asp:ListItem>
                            <asp:ListItem Value="Portugal">Portugal</asp:ListItem>
                            <asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
                            <asp:ListItem Value="Qatar">Qatar</asp:ListItem>
                            <asp:ListItem Value="Reunion">Reunion</asp:ListItem>
                            <asp:ListItem Value="Romania">Romania</asp:ListItem>
                            <asp:ListItem Value="Russian Federation">Russian Federation</asp:ListItem>
                            <asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
                            <asp:ListItem Value="Saint Kitts And Nevis">Saint Kitts And Nevis</asp:ListItem>
                            <asp:ListItem Value="Saint Lucia">Saint Lucia</asp:ListItem>
                            <asp:ListItem Value="Saint Vincent, The Grenadines">Saint Vincent, The Grenadines</asp:ListItem>
                            <asp:ListItem Value="Samoa">Samoa</asp:ListItem>
                            <asp:ListItem Value="San Marino">San Marino</asp:ListItem>
                            <asp:ListItem Value="Sao Tome And Principe">Sao Tome And Principe</asp:ListItem>
                            <asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
                            <asp:ListItem Value="Senegal">Senegal</asp:ListItem>
                            <asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
                            <asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
                            <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                            <asp:ListItem Value="Slovakia (Slovak Republic)">Slovakia (Slovak Republic)</asp:ListItem>
                            <asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
                            <asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
                            <asp:ListItem Value="Somalia">Somalia</asp:ListItem>
                            <asp:ListItem Value="South Africa">South Africa</asp:ListItem>
                            <asp:ListItem Value="South Georgia , S Sandwich Is.">South Georgia , S Sandwich Is.</asp:ListItem>
                            <asp:ListItem Value="Spain">Spain</asp:ListItem>
                            <asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
                            <asp:ListItem Value="St. Helena">St. Helena</asp:ListItem>
                            <asp:ListItem Value="St. Pierre And Miquelon">St. Pierre And Miquelon</asp:ListItem>
                            <asp:ListItem Value="Sudan">Sudan</asp:ListItem>
                            <asp:ListItem Value="Suriname">Suriname</asp:ListItem>
                            <asp:ListItem Value="Svalbard, Jan Mayen Islands">Svalbard, Jan Mayen Islands</asp:ListItem>
                            <asp:ListItem Value="Swaziland">Swaziland</asp:ListItem>
                            <asp:ListItem Value="Sweden">Sweden</asp:ListItem>
                            <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                            <asp:ListItem Value="Syrian Arab Republic">Syrian Arab Republic</asp:ListItem>
                            <asp:ListItem Value="Taiwan">Taiwan</asp:ListItem>
                            <asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
                            <asp:ListItem Value="Tanzania, United Republic Of">Tanzania, United Republic Of</asp:ListItem>
                            <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
                            <asp:ListItem Value="Togo">Togo</asp:ListItem>
                            <asp:ListItem Value="Tokelau">Tokelau</asp:ListItem>
                            <asp:ListItem Value="Tonga">Tonga</asp:ListItem>
                            <asp:ListItem Value="Trinidad And Tobago">Trinidad And Tobago</asp:ListItem>
                            <asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
                            <asp:ListItem Value="Turkey">Turkey</asp:ListItem>
                            <asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
                            <asp:ListItem Value="Turks And Caicos Islands">Turks And Caicos Islands</asp:ListItem>
                            <asp:ListItem Value="Tuvalu">Tuvalu</asp:ListItem>
                            <asp:ListItem Value="Uganda">Uganda</asp:ListItem>
                            <asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
                            <asp:ListItem Value="United Arab Emirates">United Arab Emirates</asp:ListItem>
                            <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                            <asp:ListItem Value="United States">United States</asp:ListItem>
                            <asp:ListItem Value="United States Minor Is.">United States Minor Is.</asp:ListItem>
                            <asp:ListItem Value="Uruguay">Uruguay</asp:ListItem>
                            <asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
                            <asp:ListItem Value="Vanuatu">Vanuatu</asp:ListItem>
                            <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                            <asp:ListItem Value="Viet Nam">Viet Nam</asp:ListItem>
                            <asp:ListItem Value="Virgin Islands (British)">Virgin Islands (British)</asp:ListItem>
                            <asp:ListItem Value="Virgin Islands (U.S.)">Virgin Islands (U.S.)</asp:ListItem>
                            <asp:ListItem Value="Wallis And Futuna Islands">Wallis And Futuna Islands</asp:ListItem>
                            <asp:ListItem Value="Western Sahara">Western Sahara</asp:ListItem>
                            <asp:ListItem Value="Yemen">Yemen</asp:ListItem>
                            <asp:ListItem Value="Yugoslavia">Yugoslavia</asp:ListItem>
                            <asp:ListItem Value="Zaire">Zaire</asp:ListItem>
                            <asp:ListItem Value="Zambia">Zambia</asp:ListItem>
                            <asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>
</asp:DropDownList>
                    </td>
                    <td class="auto-style3"><asp:RequiredFieldValidator ID="RFV5" runat="server" ControlToValidate="txtState" ErrorMessage="State is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtState" runat="server" ControlToValidate="txtState" ErrorMessage="Invalid State, Please enter 5 to 50 characters only" ForeColor="Red" ValidationExpression="^[A-Za-z\s\d\W]{5,50}$">*</asp:RegularExpressionValidator>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style6">State:</td>
                    <td class="auto-style7" colspan="2">
                        <asp:TextBox ID="txtState" runat="server" Width="581px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV9" runat="server" ControlToValidate="txtState" ErrorMessage="State is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_txtState0" runat="server" ControlToValidate="txtState" ErrorMessage="Invalid State, Please enter 5 to 50 characters only" ForeColor="Red" ValidationExpression="^[A-Za-z\s\d\W]{5,50}$">*</asp:RegularExpressionValidator>

                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style6">Payment Method:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Width="245px" OnSelectedIndexChanged="ddlPaymentMethod_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>Cash On Delivery</asp:ListItem>
                            <asp:ListItem>Credit Card</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style5">
                        </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style16"></td>
                    <td class="auto-style17">
                        <asp:Label ID="lblBtnCardType" runat="server" Text="Credit Card Type:"></asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:RadioButtonList ID="radBtnCardType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radBtnCardType_SelectedIndexChanged" RepeatDirection="Horizontal" Width="130px">
                            <asp:ListItem Selected="True">Visa</asp:ListItem>
                            <asp:ListItem>Master</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style19"></td>
                    <td class="auto-style20">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12">
                        <asp:Label ID="lblCardNo" runat="server" Text="Credit Card Number:"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtCardNo" runat="server" TextMode="Number" Width="245px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFV6" runat="server" ControlToValidate="txtCardNo" ErrorMessage="Card Number is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorVisa" runat="server" ControlToValidate="txtCardNo" ErrorMessage="Invalid Credit Card Number, Enter 13-16 digits without dash(-) or space" ForeColor="Red" ValidationExpression="^4(\d{12}|\d{15})$">*</asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorMaster" runat="server" ControlToValidate="txtCardNo" ErrorMessage="Invalid Credit Card Number, Enter 16 digits without dash(-) or space" ForeColor="Red" ValidationExpression="^5\d{15}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12">
                        <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date (MMYY):"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtExpiryDate" runat="server" Width="245px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFV7" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="Expiry Date is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorVisa0" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="Invalid Expiry Date, Enter date in MMYY format" ForeColor="Red" ValidationExpression="^(0[1-9]|1[0-2])(2[1-9]|[3456789][0-9])$">*</asp:RegularExpressionValidator>
                    &nbsp;</td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12">
                        <asp:Label ID="lblCVV" runat="server" Text="CVV:"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtCVV" runat="server" TextMode="Number" Width="245px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFV8" runat="server" ControlToValidate="txtCVV" ErrorMessage="CVV is required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorVisa1" runat="server" ControlToValidate="txtCVV" ErrorMessage="Invalid CVV, Enter 3-4 digits without special character" ForeColor="Red" ValidationExpression="^\d{3,4}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style15" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="The following problems have been encountered" ShowMessageBox="true" Width="798px" />
                    </td>
                    <td class="auto-style15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">Total Payment (RM) :</td>
                    <td>
                        <asp:Label ID="lblTotalPayment" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" OnClick="btnClear_Click" Text="Clear" />
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT O.OrderId, Cart.ArtId, Arts.Price, Cart.Quantity FROM Orders AS O INNER JOIN OrderDetails AS OD ON O.OrderId = OD.OrderId INNER JOIN Customers AS Cust ON O.CustomerId = Cust.CustomerId INNER JOIN Cart ON Cust.CustomerId = Cart.CustomerId INNER JOIN Arts ON OD.ArtId = Arts.ArtId AND Cart.ArtId = Arts.ArtId"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </div>
   
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 422px;
        }

        .auto-style2 {
            width: 209px;
        }

        .auto-style3 {
            width: 173px;
        }

        .auto-style4 {
            width: 209px;
            height: 27px;
        }

        .auto-style5 {
            width: 422px;
            height: 27px;
        }

        .auto-style6 {
            width: 173px;
            height: 27px;
        }

        .auto-style7 {
            height: 27px;
        }

        .auto-style8 {
            width: 100%;
            height: 366px;
        }
        .auto-style9 {
            width: 171px;
        }
        .auto-style10 {
            width: 171px;
            height: 27px;
        }
        .auto-style11 {
            width: 171px;
            height: 26px;
        }
        .auto-style12 {
            width: 209px;
            height: 26px;
        }
        .auto-style13 {
            width: 422px;
            height: 26px;
        }
        .auto-style14 {
            width: 173px;
            height: 26px;
        }
        .auto-style15 {
            height: 26px;
        }
        .auto-style16 {
            width: 171px;
            height: 28px;
        }
        .auto-style17 {
            width: 209px;
            height: 28px;
        }
        .auto-style18 {
            width: 422px;
            height: 28px;
        }
        .auto-style19 {
            width: 173px;
            height: 28px;
        }
        .auto-style20 {
            height: 28px;
        }
    </style>
    <script type = "text/javascript">
        function DisableButton() {
            document.getElementById("<%=btnPlaceOrder.ClientID%>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>
</asp:Content>
