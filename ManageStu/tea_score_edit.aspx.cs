using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class tea_score_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            courseevaluate_panel.Visible = true;
            courseevaluatess_panel.Visible = true;

            coursechoosecontent.Items.Clear();
            string sql = "select * from tb_course where gh ='" + Session["teacher"] + "'";
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
            int i = 0;
            while (course.Read())
            {
                this.coursechoosecontent.Items.Add(course["kcm"].ToString());
                this.coursechoosecontent.Items[i].Value = course["kcdh"].ToString();
                i++;
            }
            DBCon.CloseAll(conn, com);
        }
    }


    protected void coursechoose_Click(object sender, EventArgs e)
    {
        Session["courseevaluatekcdh"] = Convert.ToInt32(coursechoosecontent.SelectedValue);
        string sql = "select * from vi_course where kcdh ='" + Session["courseevaluatekcdh"] + "'";
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
        Session["courseevaluateinfo"] = null;
        if (course.Read())
        {
            string bxk = null;
            if (course["bxk"].ToString() == "True")
                bxk = "是";
            else
                bxk = "否";
            Session["courseevaluateinfo"] += "课程信息：<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程代号：" + course["kcdh"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程名：" + course["kcm"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课时数：" + course["kss"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;必修课：" + bxk + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学分：" + course["xf"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;授课教师：" + course["xm"] + "<br /><br />";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.courseevaluate_panel, this.GetType(), "updateScript", "alert('没有这个课程！')", true);
            return;
        }
        DBCon.CloseAll(conn, com);

        Session["courseevaluateinfo"] += "<br /><br />选修学生：<br />";
        CourseEvaluateListView.DataSource = null;
        CourseEvaluateListView.DataBind();
        coursechooseresult_panel.Visible = true;
        coursescore_panel.Visible = false;
    }

    protected void coursescore_Click(object sender, EventArgs e)
    {
        int xh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "select * from vi_ccs where xh ='" + xh + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader stu = null;
        try
        {
            conn.Open();
            stu = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        if (stu.Read())
        {
            studentscorexh.Text = stu["xh"].ToString();
            studentscorexm.Text = stu["xm"].ToString();
        }
        DBCon.CloseAll(conn, com);
        coursechooseresult_panel.Visible = false;
        coursescore_panel.Visible = true;


    }


    protected void coursescoresub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(studentscorecj.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.coursescore_panel, this.GetType(), "updateScript", "alert('成绩不能为空！')", true);
            return;
        }
        int cj = 0;
        int bkcj = 0;
        try
        {
            cj = Convert.ToInt32(studentscorecj.Text.Trim());
            if (!string.IsNullOrEmpty(studentscorebkcj.Text.Trim()))
            {
                bkcj = Convert.ToInt32(studentscorebkcj.Text.Trim());
            }
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.coursescore_panel, this.GetType(), "updateScript", "alert('请在成绩或补考成绩中输入数字！')", true);
            return;
        }

        string sql = null;
        if (cj >= 60)
        {
            sql = "update tb_study set cj='" + cj + "',pass='1' ,bkcj = null  where xh ='" + Convert.ToInt32(studentscorexh.Text.Trim()) + "' and kcdh ='" + Session["courseevaluatekcdh"] + "'";
        }
        else if (bkcj >= 60)
        {
            sql = "update tb_study set cj='" + cj + "',pass='1',bkcj='" + bkcj + "' where xh ='" + Convert.ToInt32(studentscorexh.Text.Trim()) + "' and kcdh ='" + Session["courseevaluatekcdh"] + "'";
        }
        else
        {
            sql = "update tb_study set cj='" + cj + "',pass='0', bkcj='" + bkcj + "' where xh ='" + Convert.ToInt32(studentscorexh.Text.Trim()) + "' and kcdh ='" + Session["courseevaluatekcdh"] + "'";
        }
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.coursescore_panel, this.GetType(), "updateScript", "alert('打分成功')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.coursescore_panel, this.GetType(), "updateScript", "alert('打分失败')", true);
        }

        CourseEvaluateListView.DataSource = null;
        CourseEvaluateListView.DataBind();
        coursechooseresult_panel.Visible = true;
        coursescore_panel.Visible = false;
    }

}