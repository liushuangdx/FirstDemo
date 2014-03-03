using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class cousel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void courseselect_Click(object sender, EventArgs e)
    {
        Session["selectcoursekcdh"] = Convert.ToInt32(courseselectcontent.Text.Trim());
        string sql = "select * from vi_course where kcdh ='" + Session["selectcoursekcdh"] + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader course = null;
        try
        {
            conn.Open();
            course = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        Session["selectcourseresultinfo"] = null;
        if (course.Read())
        {
            string bxk = null;
            if (course["bxk"].ToString() == "True")
                bxk = "是";
            else
                bxk = "否";
            Session["selectcourseresultinfo"] += "课程信息：<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程代号：" + course["kcdh"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程名：" + course["kcm"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课时数：" + course["kss"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;必修课：" + bxk + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学分：" + course["xf"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;授课教师：" + course["xm"] + "<br /><br />";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.selectcourse_panel, this.GetType(), "updateScript", "alert('没有这个课程！')", true);
            return;
        }
        DBCon.CloseAll(conn, com);

        Session["selectcourseresultinfo"] += "<br /><br />选修学生：<br />";
        SelectCourseListView.DataSource = null;
        SelectCourseListView.DataBind();
        selectcourseresult_panel.Visible = true;
    }

}