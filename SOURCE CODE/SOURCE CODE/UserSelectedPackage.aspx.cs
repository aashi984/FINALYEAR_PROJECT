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

public partial class UserSelectedPackage : System.Web.UI.Page
{
    string a, b, c, d;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
     
        a = Request.QueryString["poi1"].ToString();
        b = Request.QueryString["poi2"].ToString();
        c = Request.QueryString["poi3"].ToString();
       d = Request.QueryString["poi4"].ToString();  
      

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into UserPackage values('" + Label2.Text + "','" + Label17.Text
                         + "','" + Label19.Text + "','" + Label21.Text + "','" + Label22.Text + "','" + Label23.Text 
                         + "','" + Label24.Text + "','" + TextBox8.Text + "','" + Label25.Text
                         + "','" + Label26.Text + "','" + Label29.Text + "','" + 0 + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Payment.aspx");
        Response.Write("<script>alert('Tour Package Selected Successfully!')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("WriteReview.aspx?depart="+Label17.Text+"&dest="+Label19.Text+"&places="+Label21.Text+","+Label22.Text+","+Label23.Text+","+Label24.Text+"&season="+Label29.Text);
    }
}
