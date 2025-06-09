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

public partial class Logout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string mailid = "servercloud56@gmail.com";
    string pwd = "krthbmqpcswtdeaz";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            string email = Session["email"].ToString();
            Random rnd = new Random();
            int otp = rnd.Next(100000, 999999);

            // Update OTP in DB
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PatientRegistration SET OTP = @OTP WHERE Email = @Email", con);
            cmd.Parameters.AddWithValue("@OTP", otp.ToString());
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.ExecuteNonQuery();
            con.Close();

            // Send OTP by email
            sendmail(email, otp.ToString());

            // Clear session
            Session.Clear();
            Response.Redirect("PatientLogin.aspx");
        }
    }

    private void sendmail(string to, string otp)
    {
        try
        {
            string subject = "New Login OTP";
            string body = string.Format("Your OTP is: {0}", otp);

            NetworkCredential loginInfo = new NetworkCredential(mailid, pwd);
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(mailid);
            msg.To.Add(new MailAddress(to));
            msg.Subject = subject;
            msg.Body = body;
            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);
        }
        catch
        {
            // Handle error if needed
        }
    }
}
