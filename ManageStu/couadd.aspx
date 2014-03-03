<%@ Page Language="C#" AutoEventWireup="true" CodeFile="couadd.aspx.cs" Inherits="couadd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学籍管理系统</title> <link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
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
    <asp:Panel ID="course_panel" runat="server" Visible="true" >
     <div style="width:80%; margin:0 auto" id="main-content">
              <asp:Panel ID="addcourse_panel" runat="server" Visible="true">
              
	            <div class="tab-content default-tab" id="Div18">
		          
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>添加课程</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div19">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">课程代号：</div></td>
			                <td width="26%"><asp:TextBox ID="courseaddnum" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">课程名：</div></td>
		                    <td><asp:TextBox ID="courseaddname" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">课时数：</div></td>
		                    <td><asp:TextBox ID="courseaddcount" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">必修课：</div></td>
		                    <td><asp:DropDownList ID="courseaddisneed" runat="server">
                                                            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                                            <asp:ListItem Value="0">否</asp:ListItem>
                                 </asp:DropDownList></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">学分：</div></td>
		                    <td><asp:DropDownList ID="courseaddcredit" runat="server" >
                                        <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                 </asp:DropDownList></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">授课老师：</div></td>
		                    <td><asp:DropDownList ID="courseaddteacher" runat="server" >
                                 </asp:DropDownList></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="courseaddsub" runat="server" Text="添加" class="button" 
                                        onclick="courseaddsub_Click" />
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
