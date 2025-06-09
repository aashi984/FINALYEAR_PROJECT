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

public partial class Viewpatientdata : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
        string doctorEmail = Session["DoctorEmail"].ToString();

    }
    protected void BindData()
    {

        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM PatientRegistration", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            // handle exception or log it
        }
      
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[x];
            String key="no";
            string patientEmail = row.Cells[2].Text;
       // string patientEmail = GridView1.DataKeys[rowIndex]["Email"].ToString();
        string doctorEmail = Session["DoctorEmail"].ToString();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO AccessRequests (PatientEmail, DoctorEmail, Status,AccessKey) VALUES (@p, @d, 'Pending',@AccessKey)", con);
            cmd.Parameters.AddWithValue("@p", patientEmail);
            cmd.Parameters.AddWithValue("@d", doctorEmail);
            cmd.Parameters.AddWithValue("@AccessKey", key);
            cmd.ExecuteNonQuery();
        }

        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Request sent to patient.');", true);
    }
        }

    
}