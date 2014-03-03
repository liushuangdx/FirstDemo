using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   
    protected void adminuseraddsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(adminuseraddname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('用户名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(adminuseraddpass.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('密码不能为空！')", true);
        }
        string check = "SELECT * FROM tb_adminuser WHERE username = '" + adminuseraddname.Text.Trim() + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('该用户名已经被使用！')", true);
            return;
        }
        string sql = "insert into tb_adminuser (username,password) values('" + adminuseraddname.Text.Trim() + "','" + adminuseraddpass.Text.Trim() + "')";
        try
        {
            DBControl.Insert(sql);
           
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('插入成功')", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('插入失败')", true);
        }
    }
}