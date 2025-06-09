<%@ Page Language="C#"  MasterPageFile="~/User.master"  AutoEventWireup="true" CodeFile="EditData.aspx.cs" Inherits="EditData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
.styled-gridview {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 16px;
    font-family: Arial, sans-serif;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.styled-gridview th, .styled-gridview td {
    padding: 12px 20px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

.styled-gridview th {
    background-color: #004d66;
    color: white;
}

.styled-gridview tr:nth-child(even) {
    background-color: #f9f9f9;
}

.styled-gridview tr:hover {
    background-color: #f1f1f1;
}

.request-button {
    background-color: #007bff;
    color: white;
    padding: 6px 14px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.request-button:hover {
    background-color: #0056b3;
}

</style>
    <asp:Panel ID="Panel1" runat="server" CssClass="form-container"
       >
       <asp:GridView ID="GridViewPatients" runat="server" AutoGenerateColumns="False"
    OnRowCommand="GridViewPatients_RowCommand"
    CssClass="styled-gridview" BorderColor="Black" BorderWidth="1px" GridLines="None">
    <Columns>
        <asp:BoundField DataField="FullName" HeaderText="Patient Name" SortExpression="PatientName" />
        <asp:BoundField DataField="Email" HeaderText="Patient Email" SortExpression="PatientEmail" />
        <asp:ButtonField CommandName="Select" Text="Request Key" ButtonType="Button" ControlStyle-CssClass="request-button" />
    </Columns>
</asp:GridView>

         </asp:Panel>
</asp:Content>
