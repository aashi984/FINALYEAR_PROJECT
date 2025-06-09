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
public partial class Deleteloc : System.Web.UI.Page
{
    String a, b, c;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string mailid = "servercloud56@gmail.com";
    string pwd = "krthbmqpcswtdeaz";
    string to, subject = "SPK", message; 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            // Retrieve data from GridView row
            GridViewRow row = GridView1.Rows[index];
            string id = row.Cells[0].Text;
            string doctorEmail = row.Cells[2].Text;

            // Generate a random key (you can also use a GUID)
            string accessKey = Guid.NewGuid().ToString().Substring(0, 8);  // 8-character key

            // Update status and save key (assuming you have a 'Key' column; add one if not)
            using (SqlCommand cmd = new SqlCommand("UPDATE AccessRequests SET Status = @status, [AccessKey] = @AccessKey WHERE ID = @id", con))
            {
                cmd.Parameters.AddWithValue("@status", "Key Sent");
                cmd.Parameters.AddWithValue("@AccessKey", accessKey);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Send email to doctor
            sendmail(doctorEmail, accessKey);

            // Optional: show confirmation to user
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Key has been sent to the doctor.');", true);

        }
    }
    private void sendmail(string to, string secki)
    {
        try
    {
        string subject = "Secure Access Key";
        string message = "<hr><br>Your Secure Access Key is: <b>" + secki + "</b><br><br>Please use this to access patient data securely.<br><hr>";

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("servercloud56@gmail.com", "HealthCare System");
        msg.To.Add(new MailAddress(to));
        msg.Subject = subject;
        msg.Body = message;
        msg.IsBodyHtml = true;

        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new NetworkCredential("servercloud56@gmail.com", "krthbmqpcswtdeaz");  // Use secure app password

        client.Send(msg);
    }
    catch (Exception ex)
    {
        // Log or display error
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email failed: {ex.Message}');", true);
    }
    }
}
