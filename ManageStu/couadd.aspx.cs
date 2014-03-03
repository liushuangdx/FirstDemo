using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class couadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.courseaddteacher.Items.Clear();
            this.courseaddteacher.Items.Add("请选择");
            this.courseaddteacher.Items[0].Value = "0";

            string sql = "select * from tb_teacher";
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
            int i = 1;
            while (tea.Read())
            {
                this.courseaddteacher.Items.Add(tea["xm"].ToString());
                this.courseaddteacher.Items[i].Value = tea["gh"].ToString();
                i++;
            }
            DBCon.CloseAll(conn, com);
        }
    }
    protected void courseaddsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(courseaddnum.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('课程代号不能为空！')", true);
        }
        if (string.IsNullOrEmpty(courseaddname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('课程名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(courseaddcount.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('课时数不能为空！')", true);
        }
        if (Convert.ToInt32(courseaddteacher.SelectedValue) == 0)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('请选择授课老师！')", true);
        }
        int kcdh = 0;
        string kcm = null;
        int kss = 0;
        int bxk = 0;
        int xf = 0;
        int gh = 0;
        try
        {
            kcdh = Convert.ToInt32(courseaddnum.Text.Trim());
            kcm = courseaddname.Text.Trim();
            kss = Convert.ToInt32(courseaddcount.Text.Trim());
            bxk = Convert.ToInt32(courseaddisneed.SelectedValue);
            xf = Convert.ToInt32(courseaddcredit.SelectedValue);
            gh = Convert.ToInt32(courseaddteacher.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('请在学号和年龄中输入数字！')", true);
        }
        string check = "SELECT * FROM tb_course WHERE kcdh = '" + courseaddnum.Text.Trim() + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('该课程代号已经被使用！')", true);
            return;
        }
        string sql = "insert into tb_course (kcdh,kcm,kss,bxk,xf,gh) values('" + kcdh + "','" + kcm + "','" + kss + "','" + bxk + "','" + xf + "','" + gh + "')";
        try
        {
            DBControl.Insert(sql);
         
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('插入成功')", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('插入失败')", true);
        }
    }

}