<%@ Page Language="C#" MasterPageFile="~/HOME1.master" AutoEventWireup="true" CodeFile="ForwardReq.aspx.cs" Inherits="ForwardReq" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Add CSS styles below or in a separate .css file -->
<style>
    /* Container */
    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    /* Header */
    .header {
        text-align: center;
        margin-bottom: 20px;
    }

    .header .title {
        font-family: 'Franklin Gothic Demi Cond', sans-serif;
        font-size: 32px;
        font-weight: bold;
        color: maroon;
    }

    /* Grid Panel */
    .grid-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    .grid-panel {
        width: 100%;
        max-width: 900px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    /* Grid View Styles */
    .data-grid {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
    }

    .data-grid th,
    .data-grid td {
        padding: 12px 15px;
        text-align: left;
    }

    .grid-header {
        background-color: #990000;
        color: #FFF;
        font-weight: bold;
    }

    .grid-footer {
        background-color: #FFFFCC;
        color: #330099;
    }

    .grid-pager {
        background-color: #FFFFCC;
        color: #330099;
    }

    .grid-selected-row {
        background-color: #FFCC66;
        font-weight: bold;
        color: #663399;
    }

    .grid-row:nth-child(odd) {
        background-color: #f9f9f9;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            padding: 10px;
        }

        .header .title {
            font-size: 24px;
        }

        .grid-panel {
            width: 100%;
            margin: 0;
        }

        .data-grid {
            font-size: 14px;
        }

        .data-grid th, .data-grid td {
            padding: 8px;
        }
    }
    /* Alternating row colors */


.data-grid tr:nth-child(even) {
    background-color: #ffffff; /* White for even rows */
}


</style>

    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h2 class="title">View Uploaded File Details!</h2>
        </div>

        <!-- Grid View Section -->
        <div class="grid-container">
            <asp:Panel ID="Panel2" runat="server" BorderStyle="None" Width="100%" CssClass="grid-panel">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1" CssClass="data-grid">
                    <RowStyle CssClass="grid-row" />
                    <HeaderStyle CssClass="grid-header" />
                    <FooterStyle CssClass="grid-footer" />
                    <PagerStyle CssClass="grid-pager" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="grid-selected-row" />
                    <Columns>
                        <asp:BoundField DataField="RecordID" HeaderText="Record ID" />
                        <asp:BoundField DataField="PatientEmail" HeaderText="Patient Email" />
                        <asp:BoundField DataField="RecordDate" HeaderText="Record Date" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                        <asp:BoundField DataField="BloodPressure" HeaderText="BP" />
                        <asp:BoundField DataField="HeartRate" HeaderText="Heart Rate" />
                        <asp:BoundField DataField="Temperature" HeaderText="Temp (°C)" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight (kg)" />
                        <asp:BoundField DataField="BloodSugar" HeaderText="Blood Sugar" />
                        <asp:BoundField DataField="DoctorEmail" HeaderText="Doctor Email" />
                        <asp:BoundField DataField="FollowUpDate" HeaderText="Follow-up" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:kNNCon %>"
                    SelectCommand="SELECT RecordID, PatientEmail, RecordDate, Diagnosis, BloodPressure, HeartRate, Temperature, Weight, BloodSugar, DoctorEmail, FollowUpDate FROM PatientHealthRecords">
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

