<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true"  CodeFile="Validatekey.aspx.cs" Inherits="Validatekey" %>

<h2>Enter Access Key to Add Report</h2>
<asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />

<label>Patient Email:</label>
<asp:TextBox ID="txtPatient" runat="server" /><br /><br />

<label>Access Key:</label>
<asp:TextBox ID="txtAccessKey" runat="server" /><br /><br />

<asp:Button ID="btnValidate" runat="server" Text="Validate & Continue" OnClick="btnValidate_Click" />
