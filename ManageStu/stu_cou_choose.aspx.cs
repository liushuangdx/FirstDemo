using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class stu_cou_choose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void choosecoursesub_Click(object sender, EventArgs e)
    {
        int kcdh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string check = "select * from tb_study,tb_course where tb_study.xh ='" + Session["student"] + "' and tb_study.kcdh = tb_course.kcdh and tb_study.pass='False'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(check, conn);
        SqlDataReader result = null;
        try
        {
            conn.Open();
            result = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        int xfsum = 0;
        while (result.Read())
        {

            if (Convert.ToInt32(result["kcdh"]) == kcdh)
            {
                ScriptManager.RegisterStartupScript(this.choosecourse_panel, this.GetType(), "updateScript", "alert('你已经选修了该课程，不能再选！')", true);
                return;
            }
            xfsum += Convert.ToInt32(result["xf"]);
        }
        DBCon.CloseAll(conn, com);
        if (xfsum > 20)
        {
            Response.Write(xfsum);
            ScriptManager.RegisterStartupScript(this.choosecourse_panel, this.GetType(), "updateScript", "alert('你已经选修够20学分，不能再选课！')", true);
            return;
        }

        string sql = "insert into tb_study (xh,kcdh) values('" + Session["student"] + "','" + kcdh + "')";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.choosecourse_panel, this.GetType(), "updateScript", "alert('选课成功！')", true);
            CourseListView.DataSource = null;
            CourseListView.DataBind();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.choosecourse_panel, this.GetType(), "updateScript", "alert('选课失败！')", true);
        }
    }


}