<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cousel.aspx.cs" Inherits="cousel" %>

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
           
           <div style=" margin-bottom:10px;">
                请输入课程代号：<asp:TextBox ID="courseselectcontent" CssClass="text-input" runat="server"></asp:TextBox>
                <asp:Button ID="courseselect" runat="server" Text="查询" CssClass="button" 
                    onclick="courseselect_Click"/>
            </div>

           <asp:Panel ID="selectcourse_panel" runat="server" Visible="true">
                    <asp:Panel ID="selectcoursess_panel" runat="server" Visible="true">
                       
	                    <div class="tab-content default-tab" id="Div34">
		                    
	                
                        <div class="content-box">
                            <div class="content-box-header">
                            <h3>查询结果</h3>
                            <ul class="content-box-tabs">
                                
                            </ul>
                            <div class="clear"></div>
                            </div>
                            <div class="content-box-content">
                            <div class="tab-content default-tab" id="Div35">
		                        <div style="width:100%; min-height:300px; height: 514px;">
                                    <asp:Panel ID="selectcourseresult_panel" runat="server" Visible="false">
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:db_schoolConnectionString1 %>" 
                                            SelectCommand="SELECT * FROM [vi_ccs] WHERE ([kcdh] = @kcdh)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="kcdh" SessionField="selectcoursekcdh" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <%=Session["selectcourseresultinfo"]%>
                                        <asp:ListView ID="SelectCourseListView" runat="server" 
                                            DataSourceID="SqlDataSource8"  ItemContainerID= "ItemPlaceHolder" > 
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
                                              <td></td>
                                              <td></td>      
                                            </tr> 
                                          </ItemTemplate>            
                                        </asp:ListView> 
                                       <asp:PlaceHolder runat="server" ID="PlaceHolder7"></asp:PlaceHolder>
               
                                    </asp:Panel>
		                        </div>
	                        </div>
                            </div>
                        </div>
                    </asp:Panel>
             </asp:Panel>
          </asp:Panel>
     </div>

    </div>
    </form>
</body>
</html>
