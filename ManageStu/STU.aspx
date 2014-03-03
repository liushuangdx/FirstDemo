<%@ Page Language="C#" AutoEventWireup="true" CodeFile="STU.aspx.cs" Inherits="STU" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>学籍系统管理后台</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <link href="css/default.css" type="text/css" rel="stylesheet">

    <script language="javascript" src="js/menu.js" type="text/javascript"></script>

</head>
<body onload="javascript:border_left('left_tab1','left_menu_cnt1');">
    <form id="form1" runat="server">
        <table id="indextablebody" cellpadding="0">
            <thead>
                <tr>
                    <th>
                        <div id="logo" title="用户管理后台">
                        </div>
                    </th>
                    <th>
                        <a style="color: #16547E">用户 ：<%=Session["student"]%></a>&nbsp;&nbsp; <a style="color: #16547E">身份 ：学生</a>&nbsp;&nbsp;
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="menu">
                        <ul class="bigbtu">
                            <li id="now01"><a title="管理首页" href="Default.aspx" target="_parent">管理首页</a></li>
                            <li id="now02"><a title="安全退出" href="loginoff.aspx" onclick="loginoff_Click">安全退出</a></li>
                        </ul>
                    </td>
                    <td class="tab">
                        <ul id="tabpage1">
                            <li id="tab1" title="管理首页"><span id="spanTitle">管理首页</span></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="t1">
                        <div id="contents">
                            <table cellpadding="0">
                                <tr class="t1">
                                    <td>
                                        <div class="menu_top">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="t2">
                                    <td>
                                        <div id="menu" class="menu">
                                            <ul class="tabpage2">
                                                <li id="left_tab1" title="操作菜单" onClick="javascript:border_left('left_tab1','left_menu_cnt1');"><span>个人</span></li>
                                            </ul>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                                    <li id="Li1"><a title="信息修改" onclick="show_title('信息修改')" href="stu_info_edit.aspx" target="content3">
                                                        <span>信息修改</span></a></li>
                                                    <li id="Li2"><a title="密码修改" onclick="show_title('密码修改')" href="stu_psd_edit.aspx" target="content3">
                                                        <span>密码修改</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            
                                            <ul class="tabpage2">
                                                <li id="left_tab2" onClick="javascript:border_left('left_tab2','left_menu_cnt2');" title="操作菜单"><span>选课</span></li>
                                            </ul>
                                            <div id="left_menu_cnt2" class="left_menu_cnt">
                                                <ul id="dleft_tab2">
                                                    <li id="Li3"><a title="选择课程" onclick="show_title('选择课程')" href="stu_cou_choose.aspx" target="content3">
                                                        <span>选择课程</span></a></li>
                                                    <li id="Li4"><a title="退选课程" onclick="show_title('退选课程')" href="stu_cou_out.aspx" target="content3">
                                                        <span>退选课程</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            
                                            <ul class="tabpage2">
                                                <li id="left_tab3" onClick="javascript:border_left('left_tab3','left_menu_cnt3');" title="操作菜单"><span>查询</span></li>
                                            </ul>
                                            <div id="left_menu_cnt3" class="left_menu_cnt">
                                                <ul id="dleft_tab3">
                                                    <li id="Li5"><a title="成绩查询" onclick="show_title('成绩查询')" href="stu_score_sel.aspx" target="content3">
                                                        <span>成绩查询</span></a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>

                                           

                                        </div>
                                        <tr class="t3">
                                            <td>
                                                <div class="menu_end">
                                                </div>
                                            </td>
                                        </tr>
                            </table>
                        </div>
                    </td>
                    <td class="t2">
                        <div id="cnt">
                            <div id="dtab1">
                                <iframe name="content3" src="main.aspx" frameborder="no" width="100%" height="1005" scrolling="yes" ></iframe>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <script>
        //修改标题
        function show_title(str){
	        document.getElementById("spanTitle").innerHTML=str;
	    }
	    function SetWinHeight(obj) {
	        var win = obj;
	        if (document.getElementById) {
	            if (win && !window.opera) {
	                if (win.contentDocument && win.contentDocument.body.offsetHeight)
	                    win.height = win.contentDocument.body.offsetHeight;
	                else if (win.Document && win.Document.body.scrollHeight)
	                    win.height = win.Document.body.scrollHeight;
	            }
	        }
	    } 
        </script>
    </form>
</body>
</html>
