<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Patientaccess.aspx.cs" Inherits="Patientaccess" Title="Untitled Page" %>

<h2>Generate Patient Access Key</h2>
<asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label><br />

<label>Patient Email:</label>
<asp:TextBox ID="txtPatientEmail" runat="server" CssClass="form-input" />
<br /><br />

<asp:Button ID="btnGenerateKey" runat="server" Text="Generate Key" CssClass="submit-btn" OnClick="btnGenerateKey_Click" />
