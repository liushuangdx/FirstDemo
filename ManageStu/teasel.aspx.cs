using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class teasel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void teacherselect_Click(object sender, EventArgs e)
    {
        Session["selectteachergh"] = Convert.ToInt32(teacherselectcontent.Text.Trim());
        string sql = "select * from vi_teacher where gh ='" + Session["selectteachergh"] + "'";
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
        Session["selectteacherresultinfo"] = null;
        if (tea.Read())
        {
            Session["selectteacherresultinfo"] += "教师信息：<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工号：" + tea["gh"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：" + tea["xm"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：" + tea["xb"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称：" + tea["zc"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工龄：" + tea["gl"] + "<br /><br />";
            Session["selectteacherresultinfo"] += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出生年月：" + tea["csrq"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本工资：" + tea["jbgz"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所在学院：" + tea["dept"] + "<br /><br />";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.selectteacher_panel, this.GetType(), "updateScript", "alert('没有这个教师！')", true);
            return;
        }
        DBCon.CloseAll(conn, com);

        Session["selectteacherresultinfo"] += "<br /><br />所教课程：<br />";
        SelectTeacherListView.DataSource = null;
        SelectTeacherListView.DataBind();
        selectteacherresult_panel.Visible = true;
    }
}