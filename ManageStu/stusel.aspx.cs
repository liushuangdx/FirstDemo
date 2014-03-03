using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class stusel : System.Web.UI.Page
{
    public int aaa = 1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void studentselect_Click(object sender, EventArgs e)
    {
        Session["selectstudentxh"] = Convert.ToInt32(studentselectcontent.Text.Trim());
        string sql = "select * from vi_student where xh ='" + Session["selectstudentxh"] + "'";
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
        Session["selectstudentresultinfo"] = null;
        if (stu.Read())
        {
            Session["selectstudentresultinfo"] += "学生信息：<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号：" + stu["xh"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：" + stu["xm"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：" + stu["xb"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄：" + stu["nl"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院系：" + stu["dept"] + "<br /><br />";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.selectstudent_panel, this.GetType(), "updateScript", "alert('没有这个学生！')", true);
            return;
        }
        DBCon.CloseAll(conn, com);

        SqlDataSource6.SelectParameters["kcdh"].DefaultValue = Session["selectstudentxh"].ToString();

        string sql2 = "select * from vi_study where xh ='" + Session["selectstudentxh"] + "'";
        SqlConnection conn2 = DBCon.getConnection();
        SqlCommand com2 = new SqlCommand(sql2, conn2);
        SqlDataReader stu2 = null;
        try
        {
            conn2.Open();
            stu2 = com2.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        int sum = 0;
        int count = 0; ;
        int max = 0;
        int min = 100;

        while (stu2.Read())
        {
            if (stu2["cj"] != System.DBNull.Value)
            {
                sum += Convert.ToInt32(stu2["cj"]);
                count++;
                if (max < Convert.ToInt32(stu2["cj"]))
                {
                    max = Convert.ToInt32(stu2["cj"]);
                }
                if (min > Convert.ToInt32(stu2["cj"]))
                {
                    min = Convert.ToInt32(stu2["cj"]);
                }
            }
        }

        DBCon.CloseAll(conn2, com2);
        if (sum != 0)
        {
            Session["selectstudentresultinfo"] += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最高分：" + max + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最低分：" + min + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均分：" + sum / count + "<br /><br />";
        }
        else
        {
            Session["selectstudentresultinfo"] += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无成绩<br /><br />";
        }
        Session["selectstudentresultinfo"] += "<br /><br />详细成绩单：<br />";
        SelectStudentListView.DataSource = null;
        SelectStudentListView.DataBind();
        selectstudentresult_panel.Visible = true;
    }

}