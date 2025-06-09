using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Net;
using System.Net.Mail;

public partial class VerifyKey : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        string requestId = txtRequestId.Text.Trim();
        string enteredKey = txtKey.Text.Trim();

        SqlCommand cmd = new SqlCommand("SELECT PatientEmail FROM AccessRequests1 WHERE PatientEmail = @PatientEmail AND [Key] = @Key AND Status = 'Key Sent'", con);
        cmd.Parameters.AddWithValue("@PatientEmail", requestId);
        cmd.Parameters.AddWithValue("@Key", enteredKey);

        con.Open();
        object result = cmd.ExecuteScalar();
        con.Close();

        if (result != null)
        {
            // Key is valid - allow edit
            string patientEmail = result.ToString();
            Session["AccessGrantedEmail"] = patientEmail;  // store patient email for editing
            Response.Redirect("EditPatientData.aspx");     // Redirect to edit page
        }
        else
        {
            lblMessage.Text = "Invalid key or request ID. Please try again.";
        }
    }
}