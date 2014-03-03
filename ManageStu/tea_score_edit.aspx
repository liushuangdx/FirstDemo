<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_score_edit.aspx.cs" Inherits="tea_score_edit" %>

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
     <div style="width:80%; margin:0 auto" id="main-content">
        <div style=" margin-bottom:10px;">
            请选择课程：<asp:DropDownList ID="coursechoosecontent"  runat="server"></asp:DropDownList>
            <asp:Button ID="coursechoose" runat="server" Text="查询" CssClass="button"  onclick="coursechoose_Click"/>
        </div>
     <asp:Panel ID="courseevaluate_panel" runat="server" Visible="true">
                    <asp:Panel ID="courseevaluatess_panel" runat="server" Visible="true">
	                    <div class="tab-content default-tab" id="Div5">
		                  
                        <div class="content-box">
                            <div class="content-box-header">
                            <h3>选课学生</h3>
                            <ul class="content-box-tabs">
                               
                            </ul>
                            <div class="clear"></div>
                            </div>
                            <div class="content-box-content">
                            <div class="tab-content default-tab" id="Div6">
		                        <div style="width:100%; min-height:300px;">
                                    <asp:Panel ID="coursechooseresult_panel" runat="server" Visible="false">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:db_schoolConnectionString1 %>" 
                                            SelectCommand="SELECT * FROM [vi_ccs] WHERE ([kcdh] = @kcdh)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="kcdh" SessionField="courseevaluatekcdh" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <%=Session["courseevaluateinfo"]%>
                                        <asp:ListView ID="CourseEvaluateListView" runat="server" 
                                            DataSourceID="SqlDataSource1"  ItemContainerID= "ItemPlaceHolder" > 
                                          <LayoutTemplate> 
                                            <table border="0"  width="600"> 
                                              <thead> 
                                                <tr>
                                                  <td>&nbsp;</td>  
                                                  <td>&nbsp;</td>  
                                                  <td>学号</td> 
                                                  <td>姓名</td> 
                                                  <td>性别</td> 
                                                  <td>年龄</td>
                                                  <td>所在学院</td>
                                                  <td>是否通过</td>
                                                  <td>成绩</td>
                                                  <td>补考成绩</td>  
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
                                              <td><%#Eval("xh")%></td> 
                                              <td><%#Eval("xm")%></td>
                                              <td><%#Eval("xb")%></td>
                                              <td><%#Eval("nl")%></td>
                                              <td><%#Eval("dept")%></td>
                                              <td><%#Eval("pass").ToString()=="True"?"是":"否"%></td>
                                              <td><%#String.IsNullOrEmpty(Eval("cj").ToString())?"未评分":Eval("cj")%></td> 
                                              <td><%#String.IsNullOrEmpty(Eval("bkcj").ToString()) && Eval("pass").ToString() == "True" ? "无需补考" : Eval("bkcj")%></td>  
                                              <td><asp:Button ID="courseevaluatexh" runat="server" Text="评分" CssClass="button" CommandArgument='<%# Eval("xh") %>' OnClick="coursescore_Click" /></td>
                                              <td></td>      
                                            </tr> 
                                          </ItemTemplate>            
                                        </asp:ListView> 
                                       <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
               
                                    </asp:Panel>


                                     <asp:Panel ID="coursescore_panel" runat="server" Visible="false">
                                            <div style="width:100%;">
		                                    <table width="600" border="0">
		                                      <tr>
			                                    <td width="17%">&nbsp;</td>
			                                    <td class="style4"><div align="center">学号：</div></td>
			                                    <td class="style6"><asp:TextBox ID="studentscorexh" runat="server" ReadOnly="true"></asp:TextBox></td>
			                                    <td width="22%">&nbsp;</td>
		                                      </tr>
		                                      <tr>
		                                        <td>&nbsp;</td>
		                                        <td class="style4"><div align="center">姓名：</div></td>
		                                        <td class="style6"><asp:TextBox ID="studentscorexm" runat="server" ReadOnly="True"></asp:TextBox></td>
		                                        <td>&nbsp;</td>
		                                        </tr>
		                                       <tr>
			                                    <td width="17%">&nbsp;</td>
			                                    <td class="style4"><div align="center">成绩：</div></td>
			                                    <td class="style6"><asp:TextBox ID="studentscorecj" runat="server"></asp:TextBox></td>
			                                    <td width="22%">&nbsp;</td>
		                                      </tr>
                                              <tr>
			                                    <td width="17%">&nbsp;</td>
			                                    <td class="style4"><div align="center">补考成绩：</div></td>
			                                    <td class="style6">
                                                    <asp:TextBox ID="studentscorebkcj" runat="server"></asp:TextBox>（无需补考则不填）
                                                </td>
			                                    <td width="22%">&nbsp;</td>
		                                      </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td class="style6">
                                                        <asp:Button ID="coursescoresub" runat="server" Text="确认修改" class="button" 
                                                            onclick="coursescoresub_Click" />
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
		                                    </table>
		                                    </div>
                                    </asp:Panel>
		                        </div>
	                        </div>
                            </div>
                        </div>
                    </asp:Panel>
             </asp:Panel>
     
     </div>

    </div>
    </form>
</body>
</html>
