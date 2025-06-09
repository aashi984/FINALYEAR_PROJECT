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

public partial class LocationDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string locid;
    protected void Page_Load(object sender, EventArgs e)
    {
        locid = Request.QueryString["ID"].ToString();
    }  
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        string lat = Request.Form["Latitude"];
        string lng = Request.Form["Longitude"];
        con.Open();
        SqlCommand cmd = new SqlCommand("update Location set Latitude='"+lat+"',Longitude='"+lng+"' where LocID = '"+locid+"'",con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Location Details Added!')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("LocationDetails.aspx");
    }
}
