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

public partial class Patientdata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fileName = "PatientRecord_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
        string filePath = Server.MapPath("~/Records/" + fileName); // Ensure this folder exists

        // Collect patient info
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

        // Encrypt content
        string encryptedContent = EncryptText(sb.ToString(), "My$tr0ng@Key123");

        // Save to file
        File.WriteAllText(filePath, encryptedContent);

        // Upload to FTP
        ftpupload(filePath);

        // Read scan file
        byte[] imageBytes = null;
        if (fileScanImage.HasFile)
        {
            string ext = Path.GetExtension(fileScanImage.FileName).ToLower();
            Response.Write("Extension: " + ext + "<br/>");

            if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".pdf")
            {
                string fileName1 = "Scan_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ext;
                string serverPath = Server.MapPath("~/Scans/" + fileName1);

                fileScanImage.SaveAs(serverPath);

                if (File.Exists(serverPath))
                {
                    imageBytes = File.ReadAllBytes(serverPath);
                    Response.Write("File saved! Size = " + imageBytes.Length + " bytes<br/>");
                }
                else
                {
                    Response.Write("ERROR: File not saved on server!<br/>");
                }
            }
            else
            {
                Response.Write("ERROR: Unsupported file format<br/>");
            }
        }
        else
        {
            Response.Write("ERROR: No file uploaded!<br/>");
        }


        // Save data to DB
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@"
                    INSERT INTO PatientHealthRecords 
                    (PatientEmail, RecordDate, Symptoms, Diagnosis, Medications, Notes, Allergies, LabTests, FollowUpDate,
                     BloodPressure, HeartRate, Temperature, Weight, Height, BloodSugar, DoctorEmail, ScanImageData)
                    VALUES 
                    (@PatientEmail, @RecordDate, @Symptoms, @Diagnosis, @Medications, @Notes, @Allergies, @LabTests, @FollowUpDate,
                     @BloodPressure, @HeartRate, @Temperature, @Weight, @Height, @BloodSugar, @DoctorEmail, @ScanImageData)", con);

                cmd.Parameters.AddWithValue("@PatientEmail", txtPatientEmail.Text);
                cmd.Parameters.AddWithValue("@RecordDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@Symptoms", txtSymptoms.Text);
                cmd.Parameters.AddWithValue("@Diagnosis", txtDiagnosis.Text);
                cmd.Parameters.AddWithValue("@Medications", txtMedications.Text);
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
                cmd.Parameters.AddWithValue("@Allergies", txtAllergies.Text);
                cmd.Parameters.AddWithValue("@LabTests", txtLabTests.Text);
                cmd.Parameters.AddWithValue("@FollowUpDate", string.IsNullOrEmpty(txtFollowUp.Text) ? (object)DBNull.Value : DateTime.Parse(txtFollowUp.Text));
                cmd.Parameters.AddWithValue("@BloodPressure", txtBP.Text);
                cmd.Parameters.AddWithValue("@HeartRate", txtHR.Text);
                cmd.Parameters.AddWithValue("@Temperature", txtTemp.Text);
                cmd.Parameters.AddWithValue("@Weight", txtWeight.Text);
                cmd.Parameters.AddWithValue("@Height", txtHeight.Text);
                cmd.Parameters.AddWithValue("@BloodSugar", txtSugar.Text);
                cmd.Parameters.AddWithValue("@DoctorEmail", txtDoctorEmail.Text);

                if (imageBytes != null)
                {
                    cmd.Parameters.Add("@ScanImageData", SqlDbType.VarBinary, imageBytes.Length).Value = imageBytes;
                }
                else
                {
                    cmd.Parameters.Add("@ScanImageData", SqlDbType.VarBinary).Value = DBNull.Value;
                }

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("Inserted " + rows + " row(s) into database.<br/>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("Database error: " + ex.Message + "<br/>");
            return;
        }

        // Success message
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Encrypted record saved and uploaded successfully.');", true);

        // Clear all fields
        txtPatientEmail.Text = "";
        txtSymptoms.Text = "";
        txtDiagnosis.Text = "";
        txtMedications.Text = "";
        txtNotes.Text = "";
        txtAllergies.Text = "";
        txtLabTests.Text = "";
        txtFollowUp.Text = "";
        txtBP.Text = "";
        txtHR.Text = "";
        txtTemp.Text = "";
        txtWeight.Text = "";
        txtHeight.Text = "";
        txtSugar.Text = "";
        txtDoctorEmail.Text = "";
    }

    private void ftpupload(string fpath)
    {
        string[] remoteDirs = { "/aashika/", "/Gowri/" }; // Change to your actual folders

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
            request.Credentials = new NetworkCredential("aashikachellathurai984@gmail.com", "aashika@1234");
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

}