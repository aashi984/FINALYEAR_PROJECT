<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="EditPatientData.aspx.cs" Inherits="EditPatientData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .form-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background: #f9f9f9;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 15px 25px;
        }

        .form-grid label {
            font-weight: 600;
            color: #444;
            align-self: center;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border 0.3s;
        }

        .form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>

    <asp:Panel ID="Panel1" runat="server" CssClass="form-container">
        <h2>Edit Patient Data</h2>
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
            <asp:TextBox ID="txtFollowUp" runat="server" CssClass="form-input" />

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
        </div>

        <div style="text-align: center; margin-top: 30px;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Record" CssClass="submit-btn" OnClick="Button1_Click" />
        </div>
    </asp:Panel>
</asp:Content>
