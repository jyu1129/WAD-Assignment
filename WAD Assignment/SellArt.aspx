<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="WAD_Assignment.SellArt" MasterPageFile="~/Page.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div>
        <div class="d-flex justify-content-end">
            <div>
                <asp:Button class="btn btn-outline-secondary" ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit Mode" Visible="False" />
            </div>
        </div>
        <br />
        <br />
        &nbsp;&nbsp;
        <div visible="false" runat="server" id="spinner">
            <div class="spinner-border" role="status">
                <span class="sr-only">Editing...</span>
            </div>
            &nbsp;Editing...
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-8">
                        <div class="custom-file">
                            &nbsp;&nbsp;<asp:FileUpload class="custom-file-input" ID="imgUpload" runat="server" accept=".jpg, .jpeg, .png" OnClick="imageUrlChange" />
                            <label class="custom-file-label" for="imgUpload">Choose file</label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div>
                            &nbsp;<asp:Button class="btn btn-outline-secondary" ID="btnImgUpload" runat="server" OnClick="btnImgUpload_Click" Text="Upload" />
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="d-flex justify-content-center">
                    <div>
                        <asp:Image ID="uploadedImg" runat="server" Height="500px" Width="550px" />
                        <asp:TextBox ID="txtArtUrl" runat="server" Visible="False"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="validImage" runat="server" ControlToValidate="txtArtUrl" Display="Dynamic" ErrorMessage="Image is required" ForeColor="Red" ValidationGroup="AllValidators">* Image is required</asp:RequiredFieldValidator>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnImgUpload" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <br />
        <div class="d-flex justify-content-center">
            <div class="form-group">
                <label for="txtArtTitle">
                    Artwork Title<br />
                </label>
                <asp:TextBox class="form-control" ID="txtArtTitle" runat="server" Width="500px" OnTextChanged="txtArtTitle_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtTitle" runat="server" ControlToValidate="txtArtTitle" Display="Dynamic" ErrorMessage="Title is required" ForeColor="Red" ValidationGroup="AllValidators">* Title is required</asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="d-flex justify-content-center">
            <div class="form-group">
                <label for="txtDescription">
                    Description<br />
                </label>
                <asp:TextBox class="form-control" ID="txtDescription" TextMode="MultiLine" Width="500px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtDescription" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Description is required" ForeColor="Red" ValidationGroup="AllValidators">* Description is required</asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="d-flex justify-content-center">
            <div class="form-group">
                <label for="txtArtCat">
                    Category<br />
                </label>
                <asp:DropDownList class="form-control" ID="txtArtCat" runat="server" Width="500px">
                    <asp:ListItem>Self portrait</asp:ListItem>
                    <asp:ListItem>Renaissance</asp:ListItem>
                    <asp:ListItem>Contemporary</asp:ListItem>
                    <asp:ListItem>Drawings</asp:ListItem>
                    <asp:ListItem>Realism</asp:ListItem>
                    <asp:ListItem>Wildstyle</asp:ListItem>
                    <asp:ListItem>Digital Art</asp:ListItem>
                    <asp:ListItem>Photography</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="validTxtArtCat" runat="server" ControlToValidate="txtArtCat" Display="Dynamic" ErrorMessage="Category is required" ForeColor="Red" ValidationGroup="AllValidators">* Category is required</asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="d-flex justify-content-center">
            <div class="form-group">
                <label for="txtPrice">
                    Price<br />
                </label>
                RM
                    <asp:TextBox class="form-control" ID="txtPrice" runat="server" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtPrice" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price is required" ForeColor="#CC0000" ValidationGroup="AllValidators">* Price is required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price must be in the format of $.$ ($ = 0 - 9)" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,2})?$" ValidationGroup="AllValidators">Invalid format!</asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="d-flex justify-content-center">
            <div class="form-group">
                <label for="txtStock">
                    Stock<br />
                </label>
                <asp:TextBox class="form-control" ID="txtStock" runat="server" Width="100px" type="number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtStock" runat="server" ControlToValidate="txtStock" Display="Dynamic" ErrorMessage="Stock is required" ForeColor="Red" ValidationGroup="AllValidators">* Stock is required</asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <br />
        <div class="d-flex justify-content-center">
            &nbsp;<asp:Button class="btn btn-outline-secondary" ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" ValidationGroup="AllValidators" />
            &nbsp;<asp:Button class="btn btn-outline-secondary" ID="btnCancelArt" runat="server" Text="Cancel" OnClick="btnCancelArt_Click" PostBackUrl="~/Gallery.aspx" />
        </div>
    </div>
</asp:Content>
