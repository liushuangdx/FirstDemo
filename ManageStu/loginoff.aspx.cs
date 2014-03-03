using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginoff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("admin");
        Session.Remove("student");
        Session.Remove("teacher");
        Response.Write("<script>alert('注销成功！');location.href='Login.aspx';</script>");
    }
}