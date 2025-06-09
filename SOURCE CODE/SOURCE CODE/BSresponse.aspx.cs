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

public partial class BSresponse : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[x];

            string locid = row.Cells[0].Text;
            string city = row.Cells[1].Text;
            string place = row.Cells[2].Text;
            string uname = row.Cells[3].Text;

            con.Open();
            SqlCommand cmd = new SqlCommand("update UserQuery set Status = 'Processed' where LocID = '"+locid+"' AND Username = '"+uname+"'",con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Response Forwarded to User')</script>");
        }
    }
}
