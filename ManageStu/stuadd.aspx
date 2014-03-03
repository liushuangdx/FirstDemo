<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stuadd.aspx.cs" Inherits="stuadd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
         <asp:Panel ID="student_panel" runat="server" Visible="true" >
              <div style="width:80%; margin:0 auto" id="main-content">
              <asp:Panel ID="addstudent_panel" runat="server" Visible="true">
	                <div class="tab-content default-tab" id="tab1">
	                </div>
                    <div class="content-box">
                      <div class="content-box-header">
                        <h3>添加学生</h3>
                        <ul class="content-box-tabs">
                        </ul>
                        <div class="clear"></div>
                      </div>
                      <div class="content-box-content">
                        <div class="tab-content default-tab" id="tab1">
		                    <div style="width:100%;">
		                    <table width="600" border="0">
		                      <tr>
			                    <td width="17%">&nbsp;</td>
			                    <td width="35%"><div align="center">学号：</div></td>
			                    <td width="26%"><asp:TextBox ID="studentadduser" runat="server"></asp:TextBox></td>
			                    <td width="22%">&nbsp;</td>
		                      </tr>
		                      <tr>
		                        <td>&nbsp;</td>
		                        <td><div align="center">姓名：</div></td>
		                        <td><asp:TextBox ID="studentaddname" runat="server"></asp:TextBox></td>
		                        <td>&nbsp;</td>
		                        </tr>
		                      <tr>
		                        <td>&nbsp;</td>
		                        <td><div align="center">性别：</div></td>
		                        <td>男<asp:RadioButton ID="studentaddsex1" runat="server" Checked="true" GroupName="studentaddsex" />
                                    &nbsp;女<asp:RadioButton ID="studentaddsex2" runat="server" GroupName="studentaddsex" /></td>
		                        <td>&nbsp;</td>
		                       </tr>
		                       <tr>
			                    <td width="17%">&nbsp;</td>
			                    <td width="35%"><div align="center">年龄：</div></td>
			                    <td width="26%"><asp:TextBox ID="studentaddage" runat="server"></asp:TextBox></td>
			                    <td width="22%">&nbsp;</td>
		                      </tr>
                              <tr>
			                    <td width="17%">&nbsp;</td>
			                    <td width="35%"><div align="center">院系：</div></td>
			                    <td width="26%">
                                    <asp:DropDownList ID="studentadddept" runat="server">
                                    </asp:DropDownList>
                                </td>
			                    <td width="22%">&nbsp;</td>
		                      </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="studentaddsub" runat="server" Text="添加" class="button" 
                                            onclick="studentaddsub_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
		                    </table>
		                    </div>
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
