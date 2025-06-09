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
public partial class PatientRegister : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string mailid = "servercloud56@gmail.com";
    string pwd = "krthbmqpcswtdeaz";
    string to, subject = "Login OTP", message; 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
        int otp = rnd.Next(100000, 999999); // Generates 6-digit OTP

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO PatientRegistration (FullName, Password, Email, Mobile, DOB, BloodGroup, Address, OTP) VALUES (@FullName, @Password, @Email, @Mobile, @DOB, @BloodGroup, @Address, @OTP)", con);
        cmd.Parameters.AddWithValue("@FullName", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
        cmd.Parameters.AddWithValue("@Mobile", TextBox4.Text);
        cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(TextBox5.Text));
        cmd.Parameters.AddWithValue("@BloodGroup", TextBox6.Text);
        cmd.Parameters.AddWithValue("@Address", TextBox7.Text);
        cmd.Parameters.AddWithValue("@OTP", otp.ToString());
        cmd.ExecuteNonQuery();

        con.Close();
        to = TextBox3.Text;
        sendmail(to, otp.ToString());
        
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        Response.Write("<script>alert('Patient Registered Successfully! OTP has been sent to your Email.')</script>");
    }
    private void sendmail(string to, string secki)
    {
        try
        {
            message = "<hr><br>" + "Your Secret Part Key is :" + secki + "<br><br>";
            NetworkCredential loginInformation = new NetworkCredential(mailid, pwd);
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(mailid);
            msg.To.Add(new MailAddress(to));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInformation;
            client.Send(msg);
        }
        catch { }
    }
   
}
