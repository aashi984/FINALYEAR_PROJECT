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

public partial class Patientaccess : System.Web.UI.Page
{
    string mailid = "cloudserver91@gmail.com";
    string pwd = "servercloud91.";
    string to, subject = "Secret Key", message, a;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGenerateKey_Click(object sender, EventArgs e)
    {
        string patientEmail = txtPatientEmail.Text.Trim();
        string doctorEmail = Session["DoctorEmail"].ToString(); // assuming doctor login session
        string key = Guid.NewGuid().ToString().Substring(0, 8); // 8-character key

        string connStr = ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "INSERT INTO AccessKeys (PatientEmail, DoctorEmail, AccessKey) VALUES (@PatientEmail, @DoctorEmail, @AccessKey)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@PatientEmail", patientEmail);
            cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);
            cmd.Parameters.AddWithValue("@AccessKey", key);
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Access Key: " + key + " (Share this with the patient)";
    }

}