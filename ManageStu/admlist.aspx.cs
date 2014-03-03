using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void adminuseredit_Click(object sender, EventArgs e)
    {
        adminuser_panel.Visible = true;
    
        manageadminuser_panel.Visible = false;
        editadminuser_panel.Visible = true;

        int id = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "select * from tb_adminuser where id ='" + id + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader user = null;
        try
        {
            conn.Open();
            user = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        if (user.Read())
        {
            adminusereditname.Text = user["username"].ToString();
            adminusereditpass.Text = user["password"].ToString();
            adminusereditsub.CommandArgument = user["id"].ToString();
        }
        DBCon.CloseAll(conn, com);
    }
    protected void adminusereditsub_Click(object sender, EventArgs e)
    {
        int id = Int32.Parse((sender as Button).CommandArgument.ToString());
        if (string.IsNullOrEmpty(adminusereditname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('用户名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(adminusereditpass.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('密码不能为空！')", true);
        }
        string check = "SELECT * FROM tb_adminuser WHERE username = '" + adminusereditname.Text.Trim() + "' and id <>'" + id + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('该用户名已经被使用！')", true);
            return;
        }
        string sql = "update tb_adminuser set username='" + adminusereditname.Text.Trim() + "',password='" + adminusereditpass.Text.Trim() + "' where id ='" + id + "'";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('编辑成功')", true);
            AdminUserListView.DataSource = null;
            AdminUserListView.DataBind();

            manageadminuser_panel.Visible = true;
            editadminuser_panel.Visible = false;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('编辑失败')", true);
        }
    }

    protected void adminuserdelete_Click(object sender, EventArgs e)
    {
        int id = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "delete from tb_adminuser where id ='" + id + "'";
        try
        {
            if (DBControl.delete(sql) > 0)
            {
                AdminUserListView.DataSource = null;
                AdminUserListView.DataBind();
                ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('删除成功')", true);
            }
            else
            {
                AdminUserListView.DataSource = null;
                AdminUserListView.DataBind();
                ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('该用户不存在')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.adminuser_panel, this.GetType(), "updateScript", "alert('系统异常')", true);
        }
    }
}

