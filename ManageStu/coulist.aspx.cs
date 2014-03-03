using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class coulist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void courseedit_Click(object sender, EventArgs e)
    {

        managecourse_panel.Visible = false;
        editcourse_panel.Visible = true;
        int kcdh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "select * from tb_course where kcdh ='" + kcdh + "'";
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
        if (course.Read())
        {
            courseeditnum.Text = course["kcdh"].ToString();
            courseeditname.Text = course["kcm"].ToString();
            courseeditcount.Text = course["kss"].ToString();
            if (course["bxk"].ToString() == "True")
            {
                courseeditisneed.ClearSelection();
                courseeditisneed.Items[0].Selected = true;
            }
            else
            {
                courseeditisneed.ClearSelection();
                courseeditisneed.Items[1].Selected = true;
            }
            courseeditcredit.ClearSelection();
            courseeditcredit.Items[Convert.ToInt32(course["xf"].ToString()) - 1].Selected = true;

            string sql_tea = "select * from tb_teacher";
            SqlConnection conn_tea = DBCon.getConnection();
            SqlCommand com_tea = new SqlCommand(sql_tea, conn_tea);
            SqlDataReader tea = null;
            try
            {
                conn_tea.Open();
                tea = com_tea.ExecuteReader();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            this.courseeditteacher.Items.Clear();
            int i = 0;
            while (tea.Read())
            {
                this.courseeditteacher.Items.Add(tea["xm"].ToString());
                this.courseeditteacher.Items[i].Value = tea["gh"].ToString();
                if (tea["gh"].ToString() == course["gh"].ToString())
                    this.courseeditteacher.Items[i].Selected = true;
                i++;
            }
            DBCon.CloseAll(conn_tea, com_tea);
        }
        DBCon.CloseAll(conn, com);
    }
    protected void courseeditsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(courseeditname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('课程名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(courseeditcount.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('课时数不能为空！')", true);
        }
        int kcdh = 0;
        string kcm = null;
        int kss = 0;
        int bxk = 0;
        int xf = 0;
        int gh = 0;
        try
        {
            kcdh = Convert.ToInt32(courseeditnum.Text.Trim());
            kcm = courseeditname.Text.Trim();
            kss = Convert.ToInt32(courseeditcount.Text.Trim());
            bxk = Convert.ToInt32(courseeditisneed.SelectedValue);
            xf = Convert.ToInt32(courseeditcredit.SelectedValue);
            gh = Convert.ToInt32(courseeditteacher.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('请在课时数中输入数字！')", true);
        }
        string sql = "update tb_course set kcm='" + kcm + "',kss='" + kss + "',bxk='" + bxk + "' ,xf='" + xf + "',gh='" + gh + "' where kcdh ='" + kcdh + "'";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('编辑成功')", true);

            managecourse_panel.Visible = true;
            editcourse_panel.Visible = false;
           
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('编辑失败')", true);
        }
    }

    protected void coursedelete_Click(object sender, EventArgs e)
    {
        int kcdh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "delete from tb_course where kcdh  ='" + kcdh + "'";
        try
        {
            if (DBControl.delete(sql) > 0)
            {
               
                ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('删除成功')", true);
            }
            else
            {
                
                ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('该课程不存在')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.course_panel, this.GetType(), "updateScript", "alert('系统异常')", true);
        }
    }

}