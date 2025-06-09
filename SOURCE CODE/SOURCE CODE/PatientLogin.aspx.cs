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

public partial class PatientLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM PatientRegistration WHERE Email=@Email AND Password=@Password AND OTP=@OTP", con);
        cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
        cmd.Parameters.AddWithValue("@OTP", TextBox3.Text);

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (count == 1)
        {
            Session["email"] = TextBox1.Text;
            Response.Redirect("PatientHome.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid login. Please check Email, Password or OTP.')</script>");
        }
    }
}
