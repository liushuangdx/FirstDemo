using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class tea_psd_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void resetpasssub_Click(object sender, EventArgs e)
    {
        if (newpass.Text.Trim().ToString() != newpass2.Text.Trim().ToString())
        {
            ScriptManager.RegisterStartupScript(this.resetpass_panel, this.GetType(), "updateScript", "alert('两次输入的密码不一致！')", true);
            return;
        }
        string sql = "select * from tb_teacher where gh ='" + Session["teacher"] + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader tea = null;
        try
        {
            conn.Open();
            tea = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        if (tea.Read())
        {
            if (tea["pass"].ToString().Trim() != oldpass.Text.ToString().Trim())
            {
                ScriptManager.RegisterStartupScript(this.resetpass_panel, this.GetType(), "updateScript", "alert('旧密码错误！')", true);
                return;
            }
        }
        DBCon.CloseAll(conn, com);

        string reset = "update tb_teacher set pass='" + newpass.Text.Trim().ToString() + "' where gh ='" + Session["teacher"] + "'";
        try
        {
            DBControl.update(reset);
            ScriptManager.RegisterStartupScript(this.resetpass_panel, this.GetType(), "updateScript", "alert('编辑成功！')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.resetpass_panel, this.GetType(), "updateScript", "alert('编辑失败！')", true);
        }

    }
}