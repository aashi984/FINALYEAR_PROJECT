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

public partial class EditData : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string mailid = "servercloud56@gmail.com";
    string pwd = "krthbmqpcswtdeaz";
    string to, subject = "Secret Key", message, a;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPatientsData();
        }
    }
    private void BindPatientsData()
    {
        string query = "SELECT FullName, Email FROM PatientRegistration";  // Adjust based on your database
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridViewPatients.DataSource = dt;
        GridViewPatients.DataBind();
    }
    protected void GridViewPatients_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridViewPatients.Rows[index];
            string doctorEmail = Session["DoctorEmail"].ToString();

            string patientEmail = row.Cells[1].Text;  // Assuming PatientEmail is in the second column
            string patientName = row.Cells[0].Text;   // Assuming PatientName is in the first column
            string requestId = Guid.NewGuid().ToString(); // Unique ID for the request
            string key = "no";
            // Store the key in the database (add a Key column if necessary)
            using (SqlCommand cmd = new SqlCommand("INSERT INTO AccessRequests1 (RequestId, DoctorEmail,PatientEmail, [Key], Status) VALUES (@RequestId,@DoctorEmail, @PatientEmail, @Key, @Status)", con))
            {
                cmd.Parameters.AddWithValue("@RequestId", requestId);
                cmd.Parameters.AddWithValue("@PatientEmail", patientEmail);
                cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);
                cmd.Parameters.AddWithValue("@Key", key);
                cmd.Parameters.AddWithValue("@Status", "Key Request");

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Write("<script>alert('Request Send to Patient')</script>");
      
        }
    }
    
    

}