<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <TITLE>用户登录</TITLE>
<LINK href="images/Default.css" type=text/css rel=stylesheet>
<LINK href="images/xtree.css" type=text/css rel=stylesheet>
<LINK href="images/User_Login.css" type=text/css rel=stylesheet>
</head>
<body id=userlogin_body>
    <form id="form1" runat="server">
    <div>
    <DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text>用户名： </LI>
      <LI class=user_main_input><asp:TextBox ID="username" runat="server" class="TxtUserNameCssClass"></asp:TextBox>
      </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><asp:TextBox ID="password" runat="server" class="TxtPasswordCssClass" TextMode="Password"></asp:TextBox>
      </LI></UL>
    <UL>
      <LI class=user_main_text>类 别： </LI>
      <LI class=user_main_input>
         <asp:DropDownList  ID="usertype" runat="server">
                     <asp:ListItem Value="1">学生</asp:ListItem>
                     <asp:ListItem Value="2">教师</asp:ListItem>
                     <asp:ListItem Value="3">管理员</asp:ListItem>
                  </asp:DropDownList></LI></UL></DIV></LI>
    <LI class=user_main_r>

        <asp:ImageButton ID="ImageButton1" runat="server" 
            class="IbtnEnterCssClass id=IbtnEnter" ImageUrl="~/images/user_botton.gif" 
            onclick="ImageButton1_Click" />
     </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px"></SPAN> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV></DIV>
    </div>
    </form>
</body>
</html>
