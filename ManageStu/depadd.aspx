<%@ Page Language="C#" AutoEventWireup="true" CodeFile="depadd.aspx.cs" Inherits="depadd" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="department_panel" runat="server" Visible="true" >
              <div style="width:80%; margin:0 auto" id="main-content">
              <asp:Panel ID="adddepartment_panel" runat="server" Visible="true">
               
	            <div class="tab-content default-tab" id="Div24">
		            
		            </div>
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>添加院系</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div25">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">系号：</div></td>
			                <td width="26%"><asp:TextBox ID="departmentadddno" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">系名：</div></td>
		                    <td><asp:TextBox ID="departmentaddname" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">系负责人：</div></td>
		                    <td><asp:TextBox ID="departmentaddcharge" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">专业数：</div></td>
		                    <td><asp:TextBox ID="departmentadddso" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="departmentaddsub" runat="server" Text="添加" class="button" 
                                        onclick="departmentaddsub_Click" />
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
