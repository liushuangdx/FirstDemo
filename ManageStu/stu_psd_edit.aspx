<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_psd_edit.aspx.cs" Inherits="stu_psd_edit" %>

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
        <asp:Panel ID="resetpass_panel" runat="server" Visible="true">
                
	            <div class="tab-content default-tab" id="Div2">
		            
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>重置密码</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div3">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">旧密码：</div></td>
			                <td width="26%"><asp:TextBox ID="oldpass" runat="server" TextMode="Password"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">新密码：</div></td>
		                    <td><asp:TextBox ID="newpass" runat="server" TextMode="Password"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
		                   <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">新密码确认：</div></td>
			                <td width="26%"><asp:TextBox ID="newpass2" runat="server" TextMode="Password"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="resetpasssub" runat="server" Text="重置密码" class="button" 
                                        onclick="resetpasssub_Click" />
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
