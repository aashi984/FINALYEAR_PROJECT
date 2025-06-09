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

public partial class Validatekey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        string patientEmail = txtPatient.Text.Trim();
        string accessKey = txtAccessKey.Text.Trim();
        string doctorEmail = Session["DoctorEmail"].ToString();

        string connStr = ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT COUNT(*) FROM AccessKeys WHERE PatientEmail=@p AND AccessKey=@k AND DoctorEmail=@d";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@p", patientEmail);
            cmd.Parameters.AddWithValue("@k", accessKey);
            cmd.Parameters.AddWithValue("@d", doctorEmail);
            conn.Open();
            int count = (int)cmd.ExecuteScalar();

            if (count > 0)
            {
                Session["PatientEmail"] = patientEmail;
                Response.Redirect("Patientdata.aspx"); // health record form
            }
            else
            {
                lblResult.Text = "Invalid key or patient email.";
            }
        }
    }

}