<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="WAD_Assignment.SellArt" MasterPageFile="~/Page.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div>
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit Mode" Visible="False"/>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:FileUpload ID="imgUpload" runat="server" accept=".jpg, .jpeg" />
                &nbsp;<asp:Button ID="btnImgUpload" runat="server" OnClick="btnImgUpload_Click" Text="Upload" />
                <br />
                <br />
                <asp:Image ID="uploadedImg" runat="server" Height="500px" Width="550px" />
                <strong>
                <asp:RequiredFieldValidator ID="validImage" runat="server" ControlToValidate="imgUpload" Display="Dynamic" ErrorMessage="Image is required." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
                </strong>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnImgUpload" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <br />
        <strong>Artwork Title</strong><br />
        <asp:TextBox ID="txtArtTitle" runat="server" Width="500px" OnTextChanged="txtArtTitle_TextChanged"></asp:TextBox>
        <strong>
                <asp:RequiredFieldValidator ID="validTxtTitle" runat="server" ControlToValidate="txtArtTitle" Display="Dynamic" ErrorMessage="Title is required." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        </strong>
        <br />
        <br />
        <strong>Description<br />
            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Width="500px" runat="server"></asp:TextBox>
        <br />
            <br />
            Category<br />
            <asp:TextBox ID="txtArtCat" runat="server" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtArtCat" runat="server" ControlToValidate="txtArtCat" Display="Dynamic" ErrorMessage="Category is required." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
        <br />
        Price<br />
        $
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtPrice" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price is required." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price must be in the format of $.$ ($ = 0 - 9)" ValidationExpression="^\d{0,8}(\.\d{1,2})?$" ValidationGroup="AllValidators">Invalid format!</asp:RegularExpressionValidator>
        <br />
        <br />
        Stock<br />
        <asp:TextBox ID="txtStock" runat="server" Width="100px" type ="number" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="validTxtStock" runat="server" ControlToValidate="txtStock" Display="Dynamic" ErrorMessage="Price is required." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" ValidationGroup="AllValidators" />
            &nbsp;<asp:Button ID="btnCancelArt" runat="server" Text="Cancel" OnClick="btnCancelArt_Click" PostBackUrl="~/Gallery.aspx" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AllValidators" />
        </strong>
    </div>
</asp:Content>
