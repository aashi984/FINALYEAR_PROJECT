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
using System.IO;
using System.Text;
using System.Security.Cryptography;
public partial class Editloc : System.Web.UI.Page
{
    String a, b, c;
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
            string poi1 = row.Cells[3].Text;
            string poi2 = row.Cells[4].Text;
            string poi3 = row.Cells[5].Text;
            string poi4 = row.Cells[6].Text;
            string speed = row.Cells[7].Text;

            Session["LocID"] = locid;
            Session["City"] = city;
            Session["Place"] = place;
            Session["Speed"] = speed;

           

            Response.Redirect("Edit.aspx");
        }
    }
}
