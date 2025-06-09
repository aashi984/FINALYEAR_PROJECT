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

public partial class UserLogin : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select Username,Email from Register where Username = '"+TextBox1.Text+"' AND Password = '"+TextBox2.Text+"'",con);
        string uname = Convert.ToString(cmd.ExecuteScalar());
     

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
              dr.Read(); 
            args.IsValid = true;
            Session["uname"] = TextBox1.Text;
            Session["DoctorEmail"] = dr["Email"].ToString();
            Response.Redirect("Userhome.aspx");
        }
        else
        {
            args.IsValid = false;
        }
        con.Close();
    }
}
