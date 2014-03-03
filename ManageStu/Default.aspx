<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

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
                        <a style="color: #16547E">用户 ：<%=Session["admin"]%></a>&nbsp;&nbsp; <a style="color: #16547E">身份 ：超级管理员</a>&nbsp;&nbsp;
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
                                                <li id="left_tab1" title="操作菜单" onClick="javascript:border_left('left_tab1','left_menu_cnt1');"><span>学生</span></li>
                                            </ul>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                                    <li id="Li1"><a title="添加学生" onclick="show_title('添加学生')" href="stuadd.aspx" target="content3">
                                                        <span>添加学生</span></a></li>
                                                    <li id="Li2"><a title="学生管理" onclick="show_title('学生管理')" href="stulist.aspx" target="content3">
                                                        <span>学生管理</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            
                                            <ul class="tabpage2">
                                                <li id="left_tab2" onClick="javascript:border_left('left_tab2','left_menu_cnt2');" title="操作菜单"><span>教师</span></li>
                                            </ul>
                                            <div id="left_menu_cnt2" class="left_menu_cnt">
                                                <ul id="dleft_tab2">
                                                    <li id="Li3"><a title="添加教师" onclick="show_title('添加教师')" href="teaadd.aspx" target="content3">
                                                        <span>添加教师</span></a></li>
                                                    <li id="Li4"><a title="教师管理" onclick="show_title('教师管理')" href="tealist.aspx" target="content3">
                                                        <span>教师管理</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            
                                            <ul class="tabpage2">
                                                <li id="left_tab3" onClick="javascript:border_left('left_tab3','left_menu_cnt3');" title="操作菜单"><span>院系</span></li>
                                            </ul>
                                            <div id="left_menu_cnt3" class="left_menu_cnt">
                                                <ul id="dleft_tab3">
                                                    <li id="Li5"><a title="添加院系" onclick="show_title('添加院系')" href="depadd.aspx" target="content3">
                                                        <span>添加院系</span></a></li>
                                                    <li id="Li6"><a title="院系管理" onclick="show_title('院系管理')" href="deplist.aspx" target="content3">
                                                        <span>院系管理</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>

                                            <ul class="tabpage2">
                                                <li id="left_tab4" onClick="javascript:border_left('left_tab4','left_menu_cnt4');" title="操作菜单"><span>课程</span></li>
                                            </ul>
                                            <div id="left_menu_cnt4" class="left_menu_cnt">
                                                <ul id="dleft_tab4">
                                                    <li id="Li8"><a title="添加课程" onclick="show_title('添加课程')" href="couadd.aspx" target="content3">
                                                        <span>添加课程</span></a></li>
                                                    <li id="Li9"><a title="课程管理" onclick="show_title('课程管理')" href="coulist.aspx" target="content3">
                                                        <span>课程管理</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>

                                            <ul class="tabpage2">
                                                <li id="left_tab5" onClick="javascript:border_left('left_tab5','left_menu_cnt5');" title="操作菜单"><span>用户</span></li>
                                            </ul>
                                            <div id="left_menu_cnt5" class="left_menu_cnt">
                                                <ul id="dleft_tab5">
                                                    <li id="Li11"><a title="添加用户" onclick="show_title('添加用户')" href="admadd.aspx" target="content3">
                                                        <span>添加用户</span></a></li>
                                                    <li id="Li12"><a title="用户管理" onclick="show_title('用户管理')" href="admlist.aspx" target="content3">
                                                        <span>用户管理</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>


                                            <ul class="tabpage2">
                                                <li id="left_tab6" onClick="javascript:border_left('left_tab6','left_menu_cnt6');" title="操作菜单"><span>查询</span></li>
                                            </ul>
                                            <div id="left_menu_cnt6" class="left_menu_cnt">
                                                <ul id="dleft_tab6">
                                                    <li id="Li14"><a title="学生查询" onclick="show_title('学生查询')" href="stusel.aspx" target="content3">
                                                        <span>学生查询</span></a></li>
                                                    <li id="Li15"><a title="教师查询" onclick="show_title('教师查询')" href="teasel.aspx" target="content3">
                                                        <span>教师查询</span></a></li>
                                                    <li id="Li16"><a title="课程查询" onclick="show_title('课程查询')" href="cousel.aspx" target="content3">
                                                        <span>课程查询</span></a></li>
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
