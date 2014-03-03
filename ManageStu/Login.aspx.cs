using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        String sql = null;
        if (Convert.ToInt32(usertype.SelectedValue) == 1)
        {
            sql = "SELECT * FROM tb_student WHERE xh = '" + username.Text.Trim() + "' and pass ='"+ password.Text.Trim() +"'";
            if (Convert.ToInt32(DBControl.findOne(sql)) > 0)
            {
                Session["student"] = username.Text.Trim();
                Response.Redirect("STU.aspx");
            }
        }
        else if (Convert.ToInt32(usertype.SelectedValue) == 2)
        {
            sql = "SELECT * FROM tb_teacher WHERE gh = '" + username.Text.Trim() + "' and pass ='" + password.Text.Trim() + "'";
            if (Convert.ToInt32(DBControl.findOne(sql)) > 0)
            {
                Session["teacher"] = username.Text.Trim();
                Response.Redirect("TEA.aspx");
            }
        }
        else
        {
            sql = "SELECT * FROM tb_adminuser WHERE username = '" + username.Text.Trim() + "' and password ='" + password.Text.Trim() + "'";
            if (Convert.ToInt32(DBControl.findOne(sql)) > 0)
            {
                Session["admin"] = username.Text.Trim();
                Response.Redirect("Default.aspx");
            }
        }
        Response.Write("<script>alert('用户名或密码错误，请重新输入！');location.href='Login.aspx';</script>");

    }
}