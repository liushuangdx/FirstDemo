<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_info_edit.aspx.cs" Inherits="stu_info_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学籍管理</title>
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
    <div style="width:80%; margin:0 auto" id="main-content">
         <asp:Panel ID="manageinfo_panel" runat="server" Visible="true">
               
	            <div class="tab-content default-tab" id="Div4">
		            
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>资料修改</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div5">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">学号：</div></td>
			                <td width="26%"><asp:TextBox ID="studentedituser" runat="server" ReadOnly="true"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">姓名：</div></td>
		                    <td><asp:TextBox ID="studenteditname" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">性别：</div></td>
		                    <td>男<asp:RadioButton ID="studenteditsex1" runat="server" Checked="true" GroupName="studentaddsex" />
                                &nbsp;女<asp:RadioButton ID="studenteditsex2" runat="server" GroupName="studentaddsex" /></td>
		                    <td>&nbsp;</td>
		                   </tr>
		                   <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">年龄：</div></td>
			                <td width="26%"><asp:TextBox ID="studenteditage" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                          <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">院系：</div></td>
			                <td width="26%">
                                <asp:DropDownList ID="studenteditdept" runat="server" Enabled="False">
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
                                    <asp:Button ID="studenteditsub" runat="server" Text="确认修改" class="button" 
                                        onclick="studenteditsub_Click" />
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
    </div>

    </form>
</body>
</html>
