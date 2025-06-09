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
public partial class LBSprocess : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRequests();
        }
    }
    private void BindRequests()
{
    string patientEmail = Session["email"].ToString(); // assume this is set at login
    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM AccessRequests1 WHERE PatientEmail = @Email AND Status = 'Key Request'", con);
    da.SelectCommand.Parameters.AddWithValue("@Email", patientEmail);
    DataTable dt = new DataTable();
    da.Fill(dt);
    GridViewRequests.DataSource = dt;
    GridViewRequests.DataBind();
}

    protected void GridViewRequests_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SendKey")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridViewRequests.Rows[index];
            string requestId = row.Cells[0].Text;
            string doctorEmail = row.Cells[1].Text;

            string generatedKey = Guid.NewGuid().ToString().Substring(0, 8);

            using (SqlCommand cmd = new SqlCommand("UPDATE AccessRequests1 SET [Key] = @key, Status = 'Key Sent' WHERE RequestId = @id", con))
            {
                cmd.Parameters.AddWithValue("@key", generatedKey);
                cmd.Parameters.AddWithValue("@id", requestId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            SendEmail(doctorEmail, generatedKey);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Access key sent to doctor.');", true);
            BindRequests();
        }
    }
    private void SendEmail(string to, string key)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("servercloud56@gmail.com");
            mail.To.Add(to);
            mail.Subject = "Access Key for Editing";
            mail.Body = "Your access key is: " + key;
            mail.IsBodyHtml = false;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.Credentials = new NetworkCredential("servercloud56@gmail.com", "krthbmqpcswtdeaz");
            client.EnableSsl = true;
            client.Send(mail);
        }
        catch (Exception ex)
        {
            // Optional: log error or show message
        }
    }
}
