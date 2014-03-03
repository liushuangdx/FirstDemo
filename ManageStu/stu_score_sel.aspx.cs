using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class stu_score_sel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void selectscore_Click(object sender, EventArgs e)
    {
       
       
      
        selectscore_panel.Visible = true;

        ScoreListView.DataSource = null;
        ScoreListView.DataBind();
    }
}