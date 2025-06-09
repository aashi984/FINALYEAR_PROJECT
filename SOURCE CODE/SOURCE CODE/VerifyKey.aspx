<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master" CodeFile="VerifyKey.aspx.cs" Inherits="VerifyKey" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
.verify-form {
    max-width: 400px;
    margin: 40px auto;
    padding: 30px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.form-heading {
    text-align: center;
    margin-bottom: 20px;
    color: #004d66;
}

.form-group {
    margin-bottom: 15px;
}

.form-label {
    display: block;
    margin-bottom: 6px;
    font-weight: bold;
    color: #333;
}

.form-input {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.btn-submit {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
}

.btn-submit:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    font-size: 14px;
    display: block;
    margin-bottom: 10px;
}

</style>
   <asp:Panel ID="Panel1" runat="server" CssClass="form-container">
    <div class="verify-form">
        <h2 class="form-heading">Enter Key to Edit Patient Data</h2>
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label><br />

        <div class="form-group">
            <asp:Label ID="lblRequestId" runat="server" Text="Patient Email:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtRequestId" runat="server" CssClass="form-input" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblKey" runat="server" Text="Key:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtKey" runat="server" CssClass="form-input" />
        </div>

        <asp:Button ID="btnVerify" runat="server" Text="Verify Key" OnClick="btnVerify_Click" CssClass="btn-submit" />
    </div>
</asp:Panel>

</asp:Content>