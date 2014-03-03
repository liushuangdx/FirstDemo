using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class deplist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void departmentedit_Click(object sender, EventArgs e)
    {
      
        department_panel.Visible = true;
        managedepartment_panel.Visible = false;
        editdepartment_panel.Visible = true;

        int dno = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "select * from tb_department where dno ='" + dno + "'";
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader department = null;
        try
        {
            conn.Open();
            department = com.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        if (department.Read())
        {
            departmenteditdno.Text = department["dno"].ToString();
            departmenteditdna.Text = department["dna"].ToString();
            departmenteditdeo.Text = department["deo"].ToString();
            departmenteditdso.Text = department["dso"].ToString();

        }
        DBCon.CloseAll(conn, com);
    }
    protected void departmenteditsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(departmenteditdna.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(departmenteditdeo.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系负责人不能为空！')", true);
        }
        if (string.IsNullOrEmpty(departmenteditdso.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('专业数不能为空！')", true);
        }
        int dno = 0;
        string dna = null;
        string deo = null;
        int dso = 0;
        try
        {
            dno = Convert.ToInt32(departmenteditdno.Text.Trim());
            dna = departmenteditdna.Text.Trim();
            deo = departmenteditdeo.Text.Trim();
            dso = Convert.ToInt32(departmenteditdso.Text.Trim());
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('请在专业数中输入数字！')", true);
        }


        string sql = "update tb_department set dna='" + dna + "',deo='" + deo + "',dso='" + dso + "' where dno ='" + dno + "'";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('编辑成功')", true);
            DepartmentListView.DataSource = null;
            DepartmentListView.DataBind();
            managedepartment_panel.Visible = true;
            editdepartment_panel.Visible = false;

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('编辑失败')", true);
        }
    }
    protected void departmentdelete_Click(object sender, EventArgs e)
    {
        int dno = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "delete from tb_department where dno  ='" + dno + "'";
        try
        {
            if (DBControl.delete(sql) > 0)
            {
                DepartmentListView.DataSource = null;
                DepartmentListView.DataBind();
                ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('删除成功')", true);
            }
            else
            {
                DepartmentListView.DataSource = null;
                DepartmentListView.DataBind();
                ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('该系不存在')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系统异常')", true);
        }
    }
}