<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Patientdata.aspx.cs" Inherits="Patientdata" Title="Untitled Page" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" CssClass="form-container"
       >
    
<style>
    .form-container {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        background: #ffffff;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        font-family: 'Segoe UI', sans-serif;
    }

    .form-container h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 2fr;
        gap: 15px 25px;
    }

    .form-input {
        width: 100%;
        padding: 8px 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }

    .submit-btn {
        padding: 12px 30px;
        font-size: 16px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .submit-btn:hover {
        background-color: #218838;
    }

    label {
        font-weight: 600;
        color: #444;
        align-self: center;
    }
</style>


       <h2>Patient Health Record Entry</h2>
    <div class="form-grid">
        <label>Patient Email:</label>
        <asp:TextBox ID="txtPatientEmail" runat="server" CssClass="form-input" />

        <label>Symptoms:</label>
        <asp:TextBox ID="txtSymptoms" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-input" />

        <label>Diagnosis:</label>
        <asp:TextBox ID="txtDiagnosis" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-input" />

        <label>Medications:</label>
        <asp:TextBox ID="txtMedications" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-input" />

        <label>Notes:</label>
        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-input" />

        <label>Allergies:</label>
        <asp:TextBox ID="txtAllergies" runat="server" CssClass="form-input" />

        <label>Lab Tests:</label>
        <asp:TextBox ID="txtLabTests" runat="server" CssClass="form-input" />

        <label>Follow-Up Date:</label>
        <asp:TextBox ID="txtFollowUp" runat="server" TextMode="Date" CssClass="form-input" />

        <label>Blood Pressure:</label>
        <asp:TextBox ID="txtBP" runat="server" CssClass="form-input" />

        <label>Heart Rate:</label>
        <asp:TextBox ID="txtHR" runat="server" CssClass="form-input" />

        <label>Temperature:</label>
        <asp:TextBox ID="txtTemp" runat="server" CssClass="form-input" />

        <label>Weight:</label>
        <asp:TextBox ID="txtWeight" runat="server" CssClass="form-input" />

        <label>Height:</label>
        <asp:TextBox ID="txtHeight" runat="server" CssClass="form-input" />

        <label>Blood Sugar:</label>
        <asp:TextBox ID="txtSugar" runat="server" CssClass="form-input" />

        <label>Doctor Email:</label>
        <asp:TextBox ID="txtDoctorEmail" runat="server" CssClass="form-input" />
        <label>Upload Scan/Image:</label>
<asp:FileUpload ID="fileScanImage" runat="server" CssClass="form-input" />

    </div>

    <div style="text-align: center; margin-top: 20px;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Record" CssClass="submit-btn" OnClick="Button1_Click" />
    </div>

    </asp:Panel>
</asp:Content>

