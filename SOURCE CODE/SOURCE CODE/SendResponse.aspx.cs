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
using System.Net;
using System.Net.Mail;

public partial class SendResponse : System.Web.UI.Page
{
    string mailid = "cloudserver91@gmail.com";
    string pwd = "servercloud91.";
    string to, subject = "Secret Key", message,a;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Text = Request.QueryString["id"].ToString();
        Label11.Text = Request.QueryString["city"].ToString();
        Label12.Text = Request.QueryString["place"].ToString();
        Label13.Text = Request.QueryString["uname"].ToString();
        Label16.Text = Request.QueryString["email"].ToString();

        con.Open();
        SqlCommand cmd = new SqlCommand("Select SecretKey from Location where LocID = '"+Label4.Text+"'", con);
        a = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sendmail();
        con.Open();
        SqlCommand cmd = new SqlCommand("update UserQuery set SecretKey = '"+a+"',Status='RLBS' where LocID = '"+Label4.Text+"' AND Username = '"+Label13.Text+"'",con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Response sent to BS')</script>");
    }
    private void sendmail()
    {
        try
        {
            to = Label16.Text;

            message = "<hr><br>" + "Your Secret Key is:" + a + "<br><br>";
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
