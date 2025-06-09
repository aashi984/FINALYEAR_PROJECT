<%@ Page Language="C#" MasterPageFile="~/User.master"  AutoEventWireup="true" CodeFile="AccessData.aspx.cs" Inherits="AccessData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" CssClass="form-container"
       >
          <div style="padding: 30px;">
        <h2>Access Patient Data</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>Patient Email:</td>
                <td><asp:TextBox ID="txtPatientEmail" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Access Key:</td>
                <td><asp:TextBox ID="txtAccessKey" runat="server" Width="150px"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
    </asp:Panel>
</asp:Content>
