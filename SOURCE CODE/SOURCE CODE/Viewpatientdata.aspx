<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Viewpatientdata.aspx.cs" Inherits="Viewpatientdata" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .grid-container {
            margin: 20px auto;
            padding: 20px;
            max-width: 90%;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container table {
            width: 100% !important;
            border-collapse: collapse;
        }

        .form-container th, .form-container td {
            padding: 12px !important;
            text-align: center;
        }

        .form-container th {
            background-color: #A55129;
            color: white;
        }

        .form-container td {
            background-color: #FFF7E7;
            color: #8C4510;
        }

        .form-container .send-button {
            color: blue;
            font-weight: bold;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>

    <asp:Panel ID="Panel1" runat="server" CssClass="grid-container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            BorderStyle="None" BorderWidth="0"
            CellPadding="3" CellSpacing="1"
            Width="100%" OnRowCommand="GridView1_RowCommand">
            
            <Columns>
                <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:ButtonField CommandName="Select" HeaderText="Send Request" Text="Send" />
            </Columns>

            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </asp:Panel>
</asp:Content>

