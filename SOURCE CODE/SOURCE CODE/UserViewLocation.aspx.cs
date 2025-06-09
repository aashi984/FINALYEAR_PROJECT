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
using System.Security.Cryptography;

public partial class UserViewLocation : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    string locid,a,b,c,d,i,s;
    const int keySize = 512;
    string imgname;
    protected void Page_Load(object sender, EventArgs e)
    {
        a = Session["City"].ToString();

        b = Session["poi1"].ToString();

        c = Session["poi2"].ToString();

        d = Session["poi3"].ToString();

        i = Session["poi4"].ToString();
        s= Session["Speed"].ToString();
           
        Label15.Text = Session["uname"].ToString();
        locid = Request.QueryString["id"].ToString();
        TextBox7.Text = Request.QueryString["place"].ToString();
        TextBox7.Text = TextBox7.Text.Replace(' ', '+');
        TextBox1.Text = a;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox3.Text = b;
        TextBox4.Text = c;
        TextBox8.Text = d;
        TextBox9.Text = i;
        con.Open();
     
        SqlCommand cmd = new SqlCommand("select SecretKey from UserQuery where LocID = '"+locid+"' AND Username = '"+Label15.Text+"'",con);
        SqlCommand cmdkey = new SqlCommand("select PublicandPrivateKey from Location where LocID = '"+locid+"'",con);
        string seckey = Convert.ToString(cmd.ExecuteScalar());
        string pubkey = Convert.ToString(cmdkey.ExecuteScalar());
        con.Close();

        if (seckey == TextBox2.Text)
        {
            Panel3.Visible = true;
                      
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from Location where LocID = '" + locid + "'", con);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
               
            }
            dr.Close();
            con.Close();


           
        }
        else
        {
            Panel3.Visible = true;
            TextBox3.Text = "-34.397";
            TextBox4.Text = "150.644";
           

        }
    }
   
}
