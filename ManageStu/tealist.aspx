<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tealist.aspx.cs" Inherits="tealist" %>

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
     <asp:Panel ID="manageteacher_panel" runat="server" Visible="true">
	            <div class="tab-content default-tab" id="Div8">
		         
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>管理教师</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div9">
		                <div style="width:100%;">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:db_schoolConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [vi_teacher]"></asp:SqlDataSource>
                            <asp:ListView ID="TeacherListView" runat="server" 
                                DataSourceID="SqlDataSource2"  ItemContainerID= "ItemPlaceHolder" > 
                              <LayoutTemplate> 
                                <table border="0"  width="600"> 
                                  <thead> 
                                    <tr>
                                      <td>工号</td>  
                                      <td>姓名</td>  
                                      <td>性别</td> 
                                      <td>职称</td> 
                                      <td>工龄</td> 
                                      <td>出生年月</td>
                                      <td>基本工资</td> 
                                      <td>学院</td>
                                      <td></td>  
                                      <td></td>  
                                    </tr> 
                                  </thead> 
                                  <tbody> 
                                    <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder> 
                                  </tbody> 
                                </table> 
                                <p align="center">
                                <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="10"> 
                                    <Fields> 
                                        <asp:TemplatePagerField>               
                                            <PagerTemplate> 
                                            <b> 
                                            第 <asp:Label runat="server" ID="CurrentPageLabel" Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" /> 页   
                                            共 <asp:Label runat="server" ID="TotalPagesLabel"  Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />页 
                                            ( 共<asp:Label runat="server" ID="TotalItemsLabel"  Text="<%# Container.TotalRowCount%>" /> 条记录) 
                                            </b> 
                                            </PagerTemplate> 
                                        </asp:TemplatePagerField> 
                                        <asp:NextPreviousPagerField  ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="true" /> 
                                        <asp:NumericPagerField   ButtonCount="5" /> 
                                        <asp:NextPreviousPagerField  ButtonType="Link" ShowLastPageButton="true"  ShowNextPageButton="true" ShowPreviousPageButton="false" /> 
                                    </Fields> 
                                </asp:DataPager>
                                </p>
                              </LayoutTemplate> 
                              <ItemTemplate> 
                                <tr> 
                                  <td><%#Eval("gh")%></td> 
                                  <td><%#Eval("xm")%></td> 
                                  <td><%#Eval("xb")%></td> 
                                  <td><%#Eval("zc")%></td>
                                  <td><%#Eval("gl")%></td> 
                                  <td><%#Convert.ToDateTime(Eval("csrq")).ToString("yyyy-MM-dd")%></td>
                                  <td><%#Eval("jbgz")%></td>
                                  <td><%#Eval("dept")%></td> 
                                  <td><asp:Button ID="teacheredit" runat="server" Text="编辑" CssClass="button" CommandArgument='<%# Eval("gh") %>' OnClick="teacheredit_Click" /></td>
                                  <td><asp:Button ID="teacherdelete" runat="server" Text="删除" CssClass="button" CommandArgument='<%# Eval("gh") %>' OnClick="teacherdelete_Click" /></td> 
         
                                </tr> 
                              </ItemTemplate>            
                            </asp:ListView> 
                           <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
		                </div>
	                </div>
                  </div>
                    
                </div>
             </asp:Panel>

             <asp:Panel ID="editteacher_panel" runat="server" Visible="false">
                <h2>学籍管理系统!!!</h2>
                <div class="clear"></div>
	            <div class="tab-content default-tab" id="Div10">
		        
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>编辑教师</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div11">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">工号：</div></td>
			                <td width="26%"><asp:TextBox ID="teacheredituser" runat="server" ReadOnly="True"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">姓名：</div></td>
		                    <td><asp:TextBox ID="teachereditname" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">性别：</div></td>
		                    <td>男<asp:RadioButton ID="teachereditsex1" runat="server" Checked="true" GroupName="teachereditsex" />
                                &nbsp;女<asp:RadioButton ID="teachereditsex2" runat="server" GroupName="teachereditsex" /></td>
		                    <td>&nbsp;</td>
		                   </tr>
		                   <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">职称：</div></td>
			                <td width="26%"><asp:TextBox ID="teacheredittitles" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                            <tr>
                                <td width="17%">&nbsp;</td>
                                <td width="35%"><div align="center"> 工龄：</div></td>
                                <td width="26%"><asp:TextBox ID="teachereditage" runat="server"></asp:TextBox></td>
                                <td width="22%"> &nbsp;</td>
                            </tr>
                          <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center"> 出生年月：</div></td>
			                <td width="26%"><asp:TextBox ID="teachereditbirth" runat="server"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
                            <tr>
                                <td width="17%">&nbsp;</td>
                                <td width="35%"><div align="center"> 基本工资：</div></td>
                                <td width="26%"><asp:TextBox ID="teachereditsalary" runat="server"></asp:TextBox></td>
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
                                    <asp:DropDownList ID="teachereditdept" runat="server">
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
                                    <asp:Button ID="teachereditsub" runat="server" Text="确认修改" class="button" 
                                        onclick="teachereditsub_Click" />
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
