using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Web.UI;

public partial class DownloadReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        string patientEmail = Session["email"].ToString();

        string query = "SELECT RecordDate, Symptoms, Diagnosis, Medications, Notes, Allergies, LabTests, FollowUpDate, " +
                       "BloodPressure, HeartRate, Temperature, Weight, Height, BloodSugar, DoctorEmail, ScanImageData " +
                       "FROM PatientHealthRecords WHERE PatientEmail = @PatientEmail";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@PatientEmail", patientEmail);

        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            string fileName = "PatientHealthRecords_" + patientEmail + ".html";
            string localDirectory = Server.MapPath("~/Downloads/");
            if (!Directory.Exists(localDirectory))
            {
                Directory.CreateDirectory(localDirectory);
            }
            string localPath = Path.Combine(localDirectory, fileName);

            StringBuilder sb = new StringBuilder();

            // Start HTML
            sb.AppendLine("<html><body>");
            sb.AppendLine("<h2 style='text-align:center;'>Patient Health Records</h2>");
            sb.AppendLine("<br/><img src='https://yourdomain.com/Images/logo.png' alt='Logo' style='width:200px;height:auto;'><br/><br/>");

            sb.AppendLine("<table border='1' cellpadding='5' cellspacing='0'>");
            sb.AppendLine("<tr>" +
                "<th>RecordDate</th><th>Symptoms</th><th>Diagnosis</th><th>Medications</th><th>Notes</th>" +
                "<th>Allergies</th><th>LabTests</th><th>FollowUpDate</th><th>BloodPressure</th>" +
                "<th>HeartRate</th><th>Temperature</th><th>Weight</th><th>Height</th><th>BloodSugar</th>" +
                "<th>DoctorEmail</th><th>Image</th></tr>");

            while (reader.Read())
            {
                string imagePath = reader["ScanImageData"].ToString();
                string imageHtml = !string.IsNullOrEmpty(imagePath)
                    ? "<img src='" + ResolveUrl(imagePath) + "' width='100' height='100'/>"
                    : "No Image";

                sb.AppendLine("<tr>" +
                    "<td>" + reader["RecordDate"].ToString() + "</td>" +
                    "<td>" + reader["Symptoms"].ToString() + "</td>" +
                    "<td>" + reader["Diagnosis"].ToString() + "</td>" +
                    "<td>" + reader["Medications"].ToString() + "</td>" +
                    "<td>" + reader["Notes"].ToString() + "</td>" +
                    "<td>" + reader["Allergies"].ToString() + "</td>" +
                    "<td>" + reader["LabTests"].ToString() + "</td>" +
                    "<td>" + reader["FollowUpDate"].ToString() + "</td>" +
                    "<td>" + reader["BloodPressure"].ToString() + "</td>" +
                    "<td>" + reader["HeartRate"].ToString() + "</td>" +
                    "<td>" + reader["Temperature"].ToString() + "</td>" +
                    "<td>" + reader["Weight"].ToString() + "</td>" +
                    "<td>" + reader["Height"].ToString() + "</td>" +
                    "<td>" + reader["BloodSugar"].ToString() + "</td>" +
                    "<td>" + reader["DoctorEmail"].ToString() + "</td>" +
                    "<td>" + imageHtml + "</td>" +
                    "</tr>");
            }


            sb.AppendLine("</table></body></html>");

            File.WriteAllText(localPath, sb.ToString());

            // Trigger browser download
            Response.Clear();
            Response.ContentType = "text/html";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.Write(sb.ToString());
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            con.Close();
        }
    }
}
