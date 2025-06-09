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

public partial class AccessData : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
     protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string patientEmail = txtPatientEmail.Text.Trim();
        string accessKey = txtAccessKey.Text.Trim();
        string doctorEmail = Session["DoctorEmail"].ToString();

        if (string.IsNullOrEmpty(doctorEmail))
        {
            lblMessage.Text = "Session expired. Please log in again.";
            return;
        }

        string query = "SELECT COUNT(*) FROM AccessRequests WHERE PatientEmail = @p AND DoctorEmail = @d AND AccessKey = @k";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@p", patientEmail);
            cmd.Parameters.AddWithValue("@d", doctorEmail);
            cmd.Parameters.AddWithValue("@k", accessKey);

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count > 0)
            {
                // Save to session and redirect
                Session["PatientEmail"] = patientEmail;
                Response.Redirect("PatientData.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid patient email or access key.";
            }
        }
    }
}