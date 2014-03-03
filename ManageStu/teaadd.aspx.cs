using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class teaadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.teacheradddept.Items.Clear();
            this.teacheradddept.Items.Add("请选择");
            this.teacheradddept.Items[0].Value = "0";

            string sql = "select * from tb_department";
            SqlConnection conn = DBCon.getConnection();
            SqlCommand com = new SqlCommand(sql, conn);
            SqlDataReader dept = null;
            try
            {
                conn.Open();
                dept = com.ExecuteReader();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            int i = 1;
            while (dept.Read())
            {
                this.teacheradddept.Items.Add(dept["dna"].ToString());
                this.teacheradddept.Items[i].Value = dept["dno"].ToString();
                i++;
            }
            DBCon.CloseAll(conn, com);
            this.teacheraddbirth.Attributes.Add("OnClick", "WdatePicker({startDate: '1990-05-01'})");
        }
    }

    protected void teacheraddsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(teacheradduser.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('工号不能为空！')", true);
        }
        if (string.IsNullOrEmpty(teacheraddname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('姓名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(teacheraddage.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('工龄不能为空！')", true);
        }
        if (string.IsNullOrEmpty(teacheraddsalary.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('基本工资不能为空！')", true);
        }
        if (Convert.ToInt32(teacheradddept.SelectedValue) == 0)
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('请选择院系！')", true);
        }
        int gh = 0;
        string xb = null;
        string xm = null;
        string zc = null;
        DateTime csrq = System.DateTime.Now;
        int gl = 0;
        int jbgz = 0;
        int dno = 0;
        try
        {
            gh = Convert.ToInt32(teacheradduser.Text.Trim());
            xm = teacheraddname.Text.Trim();
            xb = "男";
            if (teacheraddsex2.Checked)
            {
                xb = "女";
            }
            zc = teacheraddtitles.Text.Trim();
            gl = Convert.ToInt32(teacheraddage.Text.Trim());
            csrq = Convert.ToDateTime(teacheraddbirth.Text.Trim());
            jbgz = Convert.ToInt32(teacheraddsalary.Text.Trim());
            dno = Convert.ToInt32(teacheradddept.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('请在工号、工龄、基本工资中输入数字')", true);
        }
        string check = "SELECT * FROM tb_teacher WHERE gh = '" + gh + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('该工号已经被使用！')", true);
        }
        string sql = "insert into tb_teacher (gh,xm,xb,zc,gl,csrq,jbgz,dno) values('" + gh + "','" + xm + "','" + xb + "','" + zc + "','" + gl + "','" + csrq + "','" + jbgz + "','" + dno + "')";
        try
        {
            //Response.Write(sql);
            DBControl.Insert(sql);
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('插入成功')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.teacher_panel, this.GetType(), "updateScript", "alert('插入失败')", true);
        }
    }

}