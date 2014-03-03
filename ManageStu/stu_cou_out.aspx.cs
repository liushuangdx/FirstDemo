using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class stu_cou_out : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void outcoursesub_Click(object sender, EventArgs e)
    {
        int kcdh = Int32.Parse((sender as Button).CommandArgument.ToString());
        string sql = "delete from tb_study where xh='" + Session["student"] + "' and kcdh  ='" + kcdh + "' and cj is null ";
        try
        {
            if (DBControl.delete(sql) > 0)
            {
                StudyListView.DataSource = null;
                StudyListView.DataBind();
                ScriptManager.RegisterStartupScript(this.outcourse_panel, this.GetType(), "updateScript", "alert('退选成功')", true);
            }
            else
            {
                StudyListView.DataSource = null;
                StudyListView.DataBind();
                ScriptManager.RegisterStartupScript(this.outcourse_panel, this.GetType(), "updateScript", "alert('该课程已有成绩，不能退选')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.outcourse_panel, this.GetType(), "updateScript", "alert('系统异常')", true);
        }
    }
}