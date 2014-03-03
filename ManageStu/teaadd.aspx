<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaadd.aspx.cs" Inherits="teaadd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学籍管理系统</title>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/style2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="resources/scripts/facebox.js"></script>
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Panel ID="teacher_panel" runat="server" Visible="true">
      <div style="width:80%; margin:0 auto" id="main-content">
              <asp:Panel ID="addteacher_panel" runat="server" Visible="true">
	            <div class="tab-content default-tab" id="Div6">
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>添加教师</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div7">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">工号：</div></td>
			                <td width="26%"><asp:TextBox ID="teacheradduser" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">姓名：</div></td>
		                    <td><asp:TextBox ID="teacheraddname" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">性别：</div></td>
		                    <td>男<asp:RadioButton ID="teacheraddsex1" runat="server" Checked="true" GroupName="teacheraddsex" />
                                &nbsp;女<asp:RadioButton ID="teacheraddsex2" runat="server" GroupName="teacheraddsex" /></td>
		                    <td>&nbsp;</td>
		                   </tr>
		                   <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">职称：</div></td>
			                <td width="26%"><asp:TextBox ID="teacheraddtitles" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                            <tr>
                                <td width="17%">&nbsp;</td>
                                <td width="35%"><div align="center"> 工龄：</div></td>
                                <td width="26%"><asp:TextBox ID="teacheraddage" runat="server"></asp:TextBox></td>
                                <td width="22%"> &nbsp;</td>
                            </tr>
                          <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center"> 出生年月：</div></td>
			                <td width="26%"><asp:TextBox ID="teacheraddbirth" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                            <tr>
                                <td width="17%">&nbsp;</td>
                                <td width="35%"><div align="center"> 基本工资：</div></td>
                                <td width="26%"><asp:TextBox ID="teacheraddsalary" runat="server"></asp:TextBox></td>
                                <td width="22%"> &nbsp;</td>
                            </tr>
                            <tr>
                                <td width="17%">
                                    &nbsp;</td>
                                <td width="35%">
                                    <div align="center">
                                        院系：</div>
                                </td>
                                <td width="26%">
                                    <asp:DropDownList ID="teacheradddept" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td width="22%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="teacheraddsub" runat="server" Text="添加" class="button" 
                                        onclick="teacheraddsub_Click" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
		                </table>
		                </div>
	                </div>
                  </div>
             
             </asp:Panel>
             </div>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
