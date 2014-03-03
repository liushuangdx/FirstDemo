using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class stuadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.studentadddept.Items.Clear();
            this.studentadddept.Items.Add("请选择");
            this.studentadddept.Items[0].Value = "0";

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
                this.studentadddept.Items.Add(dept["dna"].ToString());
                this.studentadddept.Items[i].Value = dept["dno"].ToString();
                i++;
            }
            DBCon.CloseAll(conn, com);
        }
    }

    protected void studentprepare()
    {
        this.studentadddept.Items.Clear();
        this.studentadddept.Items.Add("请选择");
        this.studentadddept.Items[0].Value = "0";

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
            this.studentadddept.Items.Add(dept["dna"].ToString());
            this.studentadddept.Items[i].Value = dept["dno"].ToString();
            i++;
        }
        DBCon.CloseAll(conn, com);
    }
    protected void studentaddsub_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(studentadduser.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('学号不能为空！')", true);
        }
        if (string.IsNullOrEmpty(studentaddname.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('姓名不能为空！')", true);

        }
        if (string.IsNullOrEmpty(studentaddage.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('年龄不能为空！')", true);
        }
        if (Convert.ToInt32(studentadddept.SelectedValue) == 0)
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
            xh = Convert.ToInt32(studentadduser.Text.Trim());
            xm = studentaddname.Text.Trim();
            xb = "男";
            if (studentaddsex2.Checked)
            {
                xb = "女";
            }
            nl = Convert.ToInt32(studentaddage.Text.Trim());
            dno = Convert.ToInt32(studentadddept.SelectedValue);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('请在学号和年龄中输入数字！')", true);
        }
        string check = "SELECT * FROM tb_student WHERE xh = '" + xh + "'";
        if (Convert.ToInt32(DBControl.findOne(check)) > 0)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('该学号已经被使用！')", true);
        }
        string sql = "insert into tb_student (xh,xm,xb,nl,dno) values('" + xh + "','" + xm + "','" + xb + "','" + nl + "','" + dno + "')";
        try
        {
            DBControl.Insert(sql);
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('插入成功')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.student_panel, this.GetType(), "updateScript", "alert('插入失败')", true);
        }
    }
}