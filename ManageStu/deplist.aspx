<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deplist.aspx.cs" Inherits="deplist" %>

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
    <asp:Panel ID="department_panel" runat="server" Visible="true">
       <div style="width:80%; margin:0 auto" id="main-content">
        <asp:Panel ID="managedepartment_panel" runat="server" Visible="true">
               
	            <div class="tab-content default-tab" id="Div26">
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>管理院系</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div27">
		                <div style="width:100%;">
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:db_schoolConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [tb_department]"></asp:SqlDataSource>
                            <asp:ListView ID="DepartmentListView" runat="server" 
                                DataSourceID="SqlDataSource5"  ItemContainerID= "ItemPlaceHolder" > 
                              <LayoutTemplate> 
                                <table border="0"  width="600"> 
                                  <thead> 
                                    <tr>
                                      <td>&nbsp;</td>  
                                      <td>&nbsp;</td>  
                                      <td>系号</td> 
                                      <td>系名</td> 
                                      <td>系负责人</td> 
                                      <td>专业数</td>
                                      <td>&nbsp;</td> 
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>  
                                      <td>&nbsp;</td>  
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
                                  <td></td> 
                                  <td></td> 
                                  <td><%#Eval("dno")%></td> 
                                  <td><%#Eval("dna")%></td>
                                  <td><%#Eval("deo")%></td>
                                  <td><%#Eval("dso")%></td> 
                                  <td><asp:Button ID="departmentedit" runat="server" Text="编辑" CssClass="button" CommandArgument='<%# Eval("dno") %>' OnClick="departmentedit_Click" /></td>
                                  <td><asp:Button ID="departmentdelete" runat="server" Text="删除" CssClass="button" CommandArgument='<%# Eval("dno") %>' OnClick="departmentdelete_Click" /></td> 
                                  <td></td>      
                                   <td></td> 
                                </tr> 
                              </ItemTemplate>            
                            </asp:ListView> 
                           <asp:PlaceHolder runat="server" ID="PlaceHolder4"></asp:PlaceHolder>
		                </div>
	                </div>
                  </div>
                    
                </div>
             </asp:Panel>

             <asp:Panel ID="editdepartment_panel" runat="server" Visible="false">
                <h2>学籍管理系统!!!</h2>
                <div class="clear"></div>
	            <div class="tab-content default-tab" id="Div28">
		            <div class="notification attention png_bg"> <a href="#" class="close"><img src="resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
			            <div style=font-size:14px> 信息提示:编辑院系</div>
		            </div>
	            </div>
                <div class="content-box">
                  <div class="content-box-header">
                    <h3>编辑院系</h3>
                    <ul class="content-box-tabs">
                    </ul>
                    <div class="clear"></div>
                  </div>
                  <div class="content-box-content">
                    <div class="tab-content default-tab" id="Div29">
		                <div style="width:100%;">
		                <table width="600" border="0">
		                  <tr>
			                <td width="17%">&nbsp;</td>
			                <td width="35%"><div align="center">系号：</div></td>
			                <td width="26%"><asp:TextBox ID="departmenteditdno" runat="server" ReadOnly="True"></asp:TextBox></td>
			                <td width="22%">&nbsp;</td>
		                  </tr>
		                  <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">系名：</div></td>
		                    <td><asp:TextBox ID="departmenteditdna" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">系负责人：</div></td>
		                    <td><asp:TextBox ID="departmenteditdeo" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
		                    <td>&nbsp;</td>
		                    <td><div align="center">专业数：</div></td>
		                    <td><asp:TextBox ID="departmenteditdso" runat="server"></asp:TextBox></td>
		                    <td>&nbsp;</td>
		                    </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="departmenteditsub" runat="server" Text="确认修改" class="button" 
                                        onclick="departmenteditsub_Click" />
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
