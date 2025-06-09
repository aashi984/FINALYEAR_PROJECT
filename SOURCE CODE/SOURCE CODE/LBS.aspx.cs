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

public partial class LBS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (TextBox1.Text.ToLower() == "cloud" && TextBox2.Text.ToLower() == "cloud")
        {
            args.IsValid = true;
            Response.Redirect("CloudHome.aspx");
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("LBS.aspx");
    }
}
