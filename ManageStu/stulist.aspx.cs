using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class stulist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void studentedit_Click(object sender, EventArgs e)
    {

        student_panel.Visible = true;
        managestudent_panel.Visible = false;
        editstudent_panel.Visible = true;
        int xh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "select * from tb_student where xh ='" + xh + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader stuedit = null;
        try
        {
            conn.Open();
            stuedit = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        if (stuedit.Read())
        {
            studentedituser.Text = stuedit["xh"].ToString();
            studenteditname.Text = stuedit["xm"].ToString();
            studenteditage.Text = stuedit["nl"].ToString();
            if (stuedit["xb"].ToString() == "女")
            {
                studenteditsex2.Checked = true;
            }
            string sql_dept = "select * from tb_department";
            SqlConnection conn_dept = DBCon.getConnection();
            SqlCommand com_dept = new SqlCommand(sql_dept, conn_dept);
            SqlDataReader dept = null;
            try
            {
                conn_dept.Open();
                dept = com_dept.ExecuteReader();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            this.studenteditdept.Items.Clear();
            int i = 0;
            while (dept.Read())
            {
                this.studenteditdept.Items.Add(dept["dna"].ToString());
                this.studenteditdept.Items[i].Value = dept["dno"].ToString();
                if (dept["dno"].ToString() == stuedit["dno"].ToString())
                    this.studenteditdept.Items[i].Selected = true;
                i++;
            }
            DBCon.CloseAll(conn_dept, com_dept);
        }
        DBCon.CloseAll(conn, com);
    }

    protected void studenteditsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(studenteditage.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('年龄不能为空！')", true);
        }
        if (Convert.ToInt32(studenteditdept.SelectedValue) == 0)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('请选择院系！')", true);
        }
        int xh = 0;
        int nl = 0;
        string xb = null;
        string xm = null;
        int dno = 0;
        try
        {
            xh = Convert.ToInt32(studentedituser.Text.Trim());
            xm = studenteditname.Text.Trim();
            xb = "男";
            if (studenteditsex2.Checked)
            {
                xb = "女";
            }
            nl = Convert.ToInt32(studenteditage.Text.Trim());
            dno = Convert.ToInt32(studenteditdept.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('请在年龄中输入数字！')", true);
        }

        string sql = "update tb_student set xm='" + xm + "',xb='" + xb + "',nl='" + nl + "',dno='" + dno + "' where xh ='" + xh + "'";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('编辑成功')", true);
            StudentListView.DataSource = null;
            StudentListView.DataBind();

            student_panel.Visible = true;
            managestudent_panel.Visible = true;
            editstudent_panel.Visible = false;

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('编辑失败')", true);
        }
    }
    

    protected void studentdelete_Click(object sender, EventArgs e)
    {
        int xh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "delete from tb_student where xh ='" + xh + "'";
        try
        {
            if (DBControl.delete(sql) > 0)
            {
                StudentListView.DataSource = null;
                StudentListView.DataBind();
                ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('删除成功')", true);

            }
            else
            {
                StudentListView.DataSource = null;
                StudentListView.DataBind();
                ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('该学生不存在')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('系统异常')", true);
        }
    }
}