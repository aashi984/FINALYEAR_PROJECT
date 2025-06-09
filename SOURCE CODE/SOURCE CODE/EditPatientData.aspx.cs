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
public partial class EditPatientData : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["AccessGrantedEmail"] != null)
            {
                string email = Session["AccessGrantedEmail"].ToString();
                txtPatientEmail.Text = email;
                txtPatientEmail.ReadOnly = true;
                LoadPatientData(email);
            }
            else
            {
                Response.Redirect("VerifyKey.aspx"); // Or wherever the key is checked
            }
        }
    }
    private void LoadPatientData(string email)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM PatientHealthRecords WHERE PatientEmail = @PatientEmail", con);
        cmd.Parameters.AddWithValue("@PatientEmail", email);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtSymptoms.Text = dr["Symptoms"].ToString();
            txtDiagnosis.Text = dr["Diagnosis"].ToString();
            txtMedications.Text = dr["Medications"].ToString();
            txtNotes.Text = dr["Notes"].ToString();
            txtAllergies.Text = dr["Allergies"].ToString();
            txtLabTests.Text = dr["LabTests"].ToString();
            txtFollowUp.Text = dr["FollowUpDate"].ToString();
            txtBP.Text = dr["BloodPressure"].ToString();
            txtHR.Text = dr["HeartRate"].ToString();
            txtTemp.Text = dr["Temperature"].ToString();
            txtWeight.Text = dr["Weight"].ToString();
            txtHeight.Text = dr["Height"].ToString();
            txtSugar.Text = dr["BloodSugar"].ToString();
            txtDoctorEmail.Text = dr["DoctorEmail"].ToString();
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string email = txtPatientEmail.Text;
        //string fileName = "PatientRecord_" + email + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
        string fileName = "PatientRecord_" + email + ".txt";

        string filePath = Server.MapPath("~/Records/" + fileName);
        DeleteOldFileOnFTP(email);
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Patient Email: " + txtPatientEmail.Text);
        sb.AppendLine("Symptoms: " + txtSymptoms.Text);
        sb.AppendLine("Diagnosis: " + txtDiagnosis.Text);
        sb.AppendLine("Medications: " + txtMedications.Text);
        sb.AppendLine("Notes: " + txtNotes.Text);
        sb.AppendLine("Allergies: " + txtAllergies.Text);
        sb.AppendLine("Lab Tests: " + txtLabTests.Text);
        sb.AppendLine("Follow-Up Date: " + txtFollowUp.Text);
        sb.AppendLine("Blood Pressure: " + txtBP.Text);
        sb.AppendLine("Heart Rate: " + txtHR.Text);
        sb.AppendLine("Temperature: " + txtTemp.Text);
        sb.AppendLine("Weight: " + txtWeight.Text);
        sb.AppendLine("Height: " + txtHeight.Text);
        sb.AppendLine("Blood Sugar: " + txtSugar.Text);
        sb.AppendLine("Doctor Email: " + txtDoctorEmail.Text);

        // Encrypt
        string encryptedContent = EncryptText(sb.ToString(), "My$tr0ng@Key123");

        // Save locally
        File.WriteAllText(filePath, encryptedContent);

        // Upload to cloud
        ftpupload(filePath); // same logic as your current upload

        // Update DB
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(@"
            UPDATE PatientHealthRecords SET 
                Symptoms = @Symptoms,
                Diagnosis = @Diagnosis,
                Medications = @Medications,
                Notes = @Notes,
                Allergies = @Allergies,
                LabTests = @LabTests,
                FollowUpDate = @FollowUpDate,
                BloodPressure = @BP,
                HeartRate = @HR,
                Temperature = @Temp,
                Weight = @Weight,
                Height = @Height,
                BloodSugar = @Sugar,
                DoctorEmail = @DoctorEmail
            WHERE PatientEmail = @PatientEmail", con);

            cmd.Parameters.AddWithValue("@Symptoms", txtSymptoms.Text.Trim());
            cmd.Parameters.AddWithValue("@Diagnosis", txtDiagnosis.Text.Trim());
            cmd.Parameters.AddWithValue("@Medications", txtMedications.Text.Trim());
            cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());
            cmd.Parameters.AddWithValue("@Allergies", txtAllergies.Text.Trim());
            cmd.Parameters.AddWithValue("@LabTests", txtLabTests.Text.Trim());
            cmd.Parameters.AddWithValue("@FollowUpDate", string.IsNullOrEmpty(txtFollowUp.Text) ? (object)DBNull.Value : DateTime.Parse(txtFollowUp.Text));
            cmd.Parameters.AddWithValue("@BP", txtBP.Text.Trim());
            cmd.Parameters.AddWithValue("@HR", txtHR.Text.Trim());
            cmd.Parameters.AddWithValue("@Temp", txtTemp.Text.Trim());
            cmd.Parameters.AddWithValue("@Weight", txtWeight.Text.Trim());
            cmd.Parameters.AddWithValue("@Height", txtHeight.Text.Trim());
            cmd.Parameters.AddWithValue("@Sugar", txtSugar.Text.Trim());
            cmd.Parameters.AddWithValue("@DoctorEmail", txtDoctorEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@PatientEmail", email);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Patient record updated and re-uploaded.');", true);
    }
    private void DeleteOldFileOnFTP(string email)
    {
        string fileName = "PatientRecord_" + email + ".txt"; // File with the same name as before
        string[] remoteDirs = { "/pavithra/", "/pavi/" }; // Your actual directories

        foreach (string dir in remoteDirs)
        {
            string remotePath = "ftp://ftp.drivehq.com" + dir + fileName;

            FtpWebRequest deleteRequest = (FtpWebRequest)WebRequest.Create(new Uri(remotePath));
            deleteRequest.Method = WebRequestMethods.Ftp.DeleteFile;
            deleteRequest.Credentials = new NetworkCredential("p.pavithra313@gmail.com", "pavi313");

            try
            {
                using (FtpWebResponse deleteResponse = (FtpWebResponse)deleteRequest.GetResponse())
                {
                    // Optionally log the status
                    Console.WriteLine(deleteResponse.StatusDescription);
                }
            }
            catch (Exception ex)
            {
                // Handle case where file does not exist or FTP error occurs
                Console.WriteLine("Error deleting old file: " + ex.Message);
            }
        }
    }
    private string EncryptText(string plainText, string key)
    {
        byte[] iv = new byte[16];
        byte[] array;

        using (Aes aes = Aes.Create())
        {
            aes.Key = Encoding.UTF8.GetBytes(key.PadRight(32).Substring(0, 32)); // AES-256 requires 32-byte key
            aes.IV = iv;

            ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                using (StreamWriter streamWriter = new StreamWriter(cryptoStream))
                {
                    streamWriter.Write(plainText);
                }

                array = memoryStream.ToArray();
            }
        }

        return Convert.ToBase64String(array);
    }
    private void ftpupload(string fpath)
    {
        string[] remoteDirs = { "/pavithra/", "/pavi/" }; // Change to your actual folders

        FileInfo toup = new FileInfo(fpath);
        byte[] fileContents;

        // Read file content once to use for both uploads
        using (FileStream fs = toup.OpenRead())
        {
            fileContents = new byte[fs.Length];
            fs.Read(fileContents, 0, fileContents.Length);
        }

        foreach (string dir in remoteDirs)
        {
            string remotePath = "ftp://ftp.drivehq.com" + dir + toup.Name;

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(new Uri(remotePath));
            request.Method = WebRequestMethods.Ftp.UploadFile;
            request.Credentials = new NetworkCredential("p.pavithra313@gmail.com", "pavi313");
            request.ContentLength = fileContents.Length;

            using (Stream requestStream = request.GetRequestStream())
            {
                requestStream.Write(fileContents, 0, fileContents.Length);
            }

            using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
            {
                // Optionally log response.StatusDescription
            }
        }
    }

}