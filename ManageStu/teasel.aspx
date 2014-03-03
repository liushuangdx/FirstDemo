<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teasel.aspx.cs" Inherits="teasel" %>

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
        <div style="margin-bottom:10px;">
            请输入教师工号：<asp:TextBox ID="teacherselectcontent" CssClass="text-input" runat="server"></asp:TextBox>
            <asp:Button ID="teacherselect" runat="server" Text="查询" CssClass="button" 
                onclick="teacherselect_Click"/>
        </div>
         <asp:Panel ID="selectteacher_panel" runat="server" Visible="true">
                    <asp:Panel ID="selectteacherss_panel" runat="server" Visible="true">
	                    <div class="tab-content default-tab" id="Div32">
		                    <div class="content-box">
                            <div class="content-box-header">
                            <h3>查询结果</h3>
                            <ul class="content-box-tabs">
                                
                            </ul>
                            <div class="clear"></div>
                            </div>
                            <div class="content-box-content">
                            <div class="tab-content default-tab" id="Div33">
		                        <div style="width:100%; min-height:300px; height: 514px;">
                                    <asp:Panel ID="selectteacherresult_panel" runat="server" Visible="false">
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:db_schoolConnectionString1 %>" 
                                            SelectCommand="SELECT * FROM [tb_course] WHERE ([gh] = @gh)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="gh" SessionField="selectteachergh" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <%=Session["selectteacherresultinfo"]%>
                                        <asp:ListView ID="SelectTeacherListView" runat="server" 
                                            DataSourceID="SqlDataSource7"  ItemContainerID= "ItemPlaceHolder" > 
                                          <LayoutTemplate> 
                                            <table border="0"  width="600"> 
                                              <thead> 
                                                <tr>
                                                  <td>&nbsp;</td>  
                                                  <td>&nbsp;</td>  
                                                  <td>课程代号</td> 
                                                  <td>课程名</td> 
                                                  <td>课时数</td> 
                                                  <td>必修课</td>
                                                  <td>学分</td> 
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
                                              <td><%#Eval("kcdh")%></td> 
                                              <td><%#Eval("kcm")%></td>
                                              <td><%#Eval("kss")%></td>
                                              <td><%#Eval("bxk").ToString()=="True"?"是":"否"%></td>
                                              <td><%#Eval("xf")%></td> 
                                              <td></td>
                                              <td></td>      
                                            </tr> 
                                          </ItemTemplate>            
                                        </asp:ListView> 
                                       <asp:PlaceHolder runat="server" ID="PlaceHolder6"></asp:PlaceHolder>
               
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
