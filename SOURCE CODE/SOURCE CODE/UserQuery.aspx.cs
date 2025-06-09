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

public partial class UserQuery : System.Web.UI.Page
{
    string a, b,Ta;
    String na, em, na1, em1,em2;
    string ID;
    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kNNCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Label9.Text = Session["uname"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        BindData();

        BindData1();
    }

   

    protected void BindData()
    {
        a = TextBox1.Text;
        b = TextBox2.Text;

        SqlCommand cmdzs = new SqlCommand("SELECT Min (Speed) FROM Location where City = '" + a + "' and Place = '" + b + "' ", con);
        cmdzs.CommandType = CommandType.Text;
        cmdzs.Connection.Open();
        SqlDataReader dr = cmdzs.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {

                Ta = dr[0].ToString();

            }
        }
        cmdzs.Connection.Close();

        DataSet ds = new DataSet();
        DataTable FromTable = new DataTable();
        con.Open();
        string cmdstr = "select * from Location where City = '" + a + "' and Place = '" + b + "' and Speed = '" + Ta + "'";
        SqlCommand cmd = new SqlCommand(cmdstr, con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        con.Close();
    }

    protected void BindData1()
    {
        a = TextBox1.Text;
        b = TextBox2.Text;

       
        DataSet ds1 = new DataSet();
        DataTable FromTable = new DataTable();
        con.Open();
        string cmdstr1 = "select * from Location where City = '" + a + "' and Place = '" + b + "' ";
        SqlCommand cmd1 = new SqlCommand(cmdstr1, con);
        SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
        adp1.Fill(ds1);
        GridView2.DataSource = ds1.Tables[0];
        GridView2.DataBind();
        con.Close();
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
            string speed = row.Cells[3].Text;
             Session["City"] = city;
             Session["Speed"] = speed;
             con.Open();
             SqlDataAdapter sql = new SqlDataAdapter("Select *from Location where City ='" + city + "' and Place ='" + place + "' and speed ='" + speed +"'", con);
             DataSet ds = new DataSet();
             sql.Fill(ds);
             if (ds.Tables[0].Rows.Count > 0)
             {
                 na = ds.Tables[0].Rows[0]["poi1"].ToString();
                 em = ds.Tables[0].Rows[0]["poi2"].ToString();
                 na1 = ds.Tables[0].Rows[0]["poi3"].ToString();
                 em1 = ds.Tables[0].Rows[0]["poi4"].ToString();
                 em2 = ds.Tables[0].Rows[0]["Speed"].ToString();

                 Session["poi1"] = na;
                 Session["poi2"] = em;
                 Session["poi3"] = na1;
                 Session["poi4"] = em1;
                
                 con.Close();
               
             }
            con.Open();
            SqlCommand cmd = new SqlCommand("select Status from UserQuery where LocID = '" + locid + "' and Username = '" + Label9.Text + "'", con);
            SqlCommand cmd0 = new SqlCommand("select Email from Register where Username = '" + Label9.Text + "'", con);
            string sts = Convert.ToString(cmd.ExecuteScalar());
            string email = Convert.ToString(cmd0.ExecuteScalar());
            con.Close();
            if (sts == "")
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into UserQuery values('" + locid + "','" + city + "','" + place + "','" + Label9.Text + "','" + email + "','NO','BS','" + speed + "')", con);
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Query Sent to BS')</script>");

            }
            else if (sts == "Processed")
            {
                Response.Redirect("UserViewLocation.aspx?id=" + locid + "&place=" + place);

               
            }
            else
            {
                Response.Write("<script>alert('Request Processing...')</script>");
            }
        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[x];

            string locid = row.Cells[0].Text;
            string city = row.Cells[1].Text;
            string place = row.Cells[2].Text;
            string speed = row.Cells[3].Text;
            Session["City"] = city;
            Session["Speed"] = speed;
            con.Open();
            SqlDataAdapter sql = new SqlDataAdapter("Select *from Location where City ='" + city + "' and Place ='" + place + "' and speed ='" + speed + "'", con);
            DataSet ds = new DataSet();
            sql.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                na = ds.Tables[0].Rows[0]["poi1"].ToString();
                em = ds.Tables[0].Rows[0]["poi2"].ToString();
                na1 = ds.Tables[0].Rows[0]["poi3"].ToString();
                em1 = ds.Tables[0].Rows[0]["poi4"].ToString();
                em2 = ds.Tables[0].Rows[0]["Speed"].ToString();

                Session["poi1"] = na;
                Session["poi2"] = em;
                Session["poi3"] = na1;
                Session["poi4"] = em1;

                con.Close();

            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select Status from UserQuery where LocID = '" + locid + "' and Username = '" + Label9.Text + "'", con);
            SqlCommand cmd0 = new SqlCommand("select Email from Register where Username = '" + Label9.Text + "'", con);
            string sts = Convert.ToString(cmd.ExecuteScalar());
            string email = Convert.ToString(cmd0.ExecuteScalar());
            con.Close();
            if (sts == "")
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into UserQuery values('" + locid + "','" + city + "','" + place + "','" + Label9.Text + "','" + email + "','NO','BS','" + speed + "')", con);
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Query Sent to BS')</script>");

            }
            else if (sts == "Processed")
            {
                Response.Redirect("UserViewLocation.aspx?id=" + locid + "&place=" + place);


            }
            else
            {
                Response.Write("<script>alert('Request Processing...')</script>");
            }
        }

    }
}
