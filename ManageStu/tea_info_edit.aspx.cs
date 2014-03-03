using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class tea_info_edit : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select * from tb_teacher where gh ='" + Session["teacher"] + "'";
            SqlConnection conn = DBCon.getConnection();
            SqlCommand com = new SqlCommand(sql, conn);
            SqlDataReader teaedit = null;
            try
            {
                conn.Open();
                teaedit = com.ExecuteReader();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            if (teaedit.Read())
            {
                teacheredituser.Text = teaedit["gh"].ToString();
                teachereditname.Text = teaedit["xm"].ToString();
                teachereditage.Text = teaedit["gl"].ToString();
                teacheredittitles.Text = teaedit["zc"].ToString();
                teachereditsalary.Text = teaedit["jbgz"].ToString();
                if (teaedit["xb"].ToString() == "女")
                {
                    teachereditsex2.Checked = true;
                }
                teachereditbirth.Text = Convert.ToDateTime(teaedit["csrq"]).ToString("yyyy-MM-dd");
                teachereditbirth.Attributes.Add("OnClick", "WdatePicker({startDate: '" + Convert.ToDateTime(teaedit["csrq"]).ToString("yyyy-MM-dd") + "'})");

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
                this.teachereditdept.Items.Clear();
                int i = 0;
                while (dept.Read())
                {
                    this.teachereditdept.Items.Add(dept["dna"].ToString());
                    this.teachereditdept.Items[i].Value = dept["dno"].ToString();
                    if (dept["dno"].ToString() == teaedit["dno"].ToString())
                        this.teachereditdept.Items[i].Selected = true;
                    i++;
                }
                DBCon.CloseAll(conn_dept, com_dept);
            }
            DBCon.CloseAll(conn, com);
        }
    }

    protected void teachereditsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(teachereditage.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('工龄不能为空！')", true);
        }
        if (string.IsNullOrEmpty(teachereditsalary.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('基本工资不能为空！')", true);
        }
        if (Convert.ToInt32(teachereditdept.SelectedValue) == 0)
        {
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('请选择院系！')", true);
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
            gh = Convert.ToInt32(teacheredituser.Text.Trim());
            xm = teachereditname.Text.Trim();
            xb = "男";
            if (teachereditsex2.Checked)
            {
                xb = "女";
            }
            zc = teacheredittitles.Text.Trim();
            gl = Convert.ToInt32(teachereditage.Text.Trim());
            csrq = Convert.ToDateTime(teachereditbirth.Text.Trim());
            jbgz = Convert.ToInt32(teachereditsalary.Text.Trim());
            dno = Convert.ToInt32(teachereditdept.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('请在工龄、基本工资中输入数字')", true);
        }

        string sql = "update tb_teacher set xm='" + xm + "',xb='" + xb + "',zc='" + zc + "',gl='" + gl + "',csrq='" + csrq + "',jbgz='" + jbgz + "',dno='" + dno + "' where gh ='" + gh + "'";
        try
        {
            DBControl.update(sql);
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('编辑成功')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.manageinfo_panel, this.GetType(), "updateScript", "alert('编辑失败')", true);
        }
    }
}