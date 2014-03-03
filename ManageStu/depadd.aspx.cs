using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class depadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void departmentaddsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(departmentadddno.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系号不能为空！')", true);
        }
        if (string.IsNullOrEmpty(departmentaddname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系名不能为空！')", true);
        }
        if (string.IsNullOrEmpty(departmentaddcharge.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('系负责人不能为空！')", true);
        }
        if (string.IsNullOrEmpty(departmentadddso.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('专业数不能为空！')", true);
        }
        int dno = 0;
        string dna = null;
        string deo = null;
        int dso = 0;
        try
        {
            dno = Convert.ToInt32(departmentadddno.Text.Trim());
            dna = departmentaddname.Text.Trim();
            deo = departmentaddcharge.Text.Trim();
            dso = Convert.ToInt32(departmentadddso.Text.Trim());
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('请在系号和专业数中输入数字！')", true);
        }
        string check = "SELECT * FROM tb_department WHERE dno = '" + dno + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('该系号已经被使用！')", true);
            return;
        }
        string sql = "insert into tb_department (dno,dna,deo,dso) values('" + dno + "','" + dna + "','" + deo + "','" + dso + "')";
        try
        {
            DBControl.Insert(sql);
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('插入成功')", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.department_panel, this.GetType(), "updateScript", "alert('插入失败')", true);
        }
    }
}
