<%@ Page Language="C#" MasterPageFile="~/LBS.master" AutoEventWireup="true" CodeFile="LBSprocess.aspx.cs" Inherits="LBSprocess" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
<style>
    .styled-grid {
        width: 100%;
        border-collapse: collapse;
        font-family: 'Segoe UI', sans-serif;
    }

    .grid-header {
        background-color: #8B0000; /* dark red */
        color: white;
        font-weight: bold;
        text-align: left;
        padding: 10px;
    }

    .grid-row {
        background-color: #f4f4f4;
        color: #333;
        padding: 8px;
    }

    .grid-alt-row {
        background-color: #e9e9e9;
        color: #333;
        padding: 8px;
    }

    .styled-grid td, .styled-grid th {
        padding: 10px;
        border: 1px solid #ccc;
    }

    .styled-grid input[type="submit"], .styled-grid input[type="button"] {
        background-color: #8B0000;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
    }

    .styled-grid input[type="submit"]:hover, .styled-grid input[type="button"]:hover {
        background-color: #a30000;
    }
</style>


</style>
  <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" BorderWidth="2px" Height="431px">
    <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="False" 
        OnRowCommand="GridViewRequests_RowCommand" CssClass="styled-grid" 
        HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row" 
        AlternatingRowStyle-CssClass="grid-alt-row">

        <Columns>
            <asp:BoundField DataField="RequestId" HeaderText="Request ID" />
            <asp:BoundField DataField="DoctorEmail" HeaderText="Doctor Email" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:ButtonField Text="Send Key" CommandName="SendKey" ButtonType="Button" />
        </Columns>
    </asp:GridView>
</asp:Panel>

</asp:Content>

