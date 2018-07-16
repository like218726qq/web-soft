<!--#include file="conn.asp"-->
<!--#include file="person_checklogin_js.asp"-->
<%
	per=3
	g=1
	m=1

act=trim(request("act"))
if act="post" then
	y_password=html(lcase(trim(request.Form("y_password"))))
	password=html(lcase(trim(request.Form("password"))))
	confirmpassword=html(lcase(trim(request.Form("confirmpassword"))))
	
	if y_password="" or password="" or confirmpassword="" then
		call msg("带*号的必须填写","")
	end if
	
	if len(y_password)<4 or len(y_password)>20 or feifa(y_password) or len(password)<4 or len(password)>20 or feifa(password) or confirmpassword<>password then
		call msg("错误的密码格式","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person1 where username='"&session("person1")&"' and pass='yes'"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该用户不存在或已删除","location='person_loginout.asp'")
	else
		if rs("password")<>y_password then
			call msg("旧密码错误","")
		else
			rs("password")=password
			rs.update()
			call msg("修改成功","location=""person_pwd_edit_js.asp""")
		end if
	end if
	rs.close
	set rs=nothing
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
<style>
.liststyle td{ text-align:left; color:#666666; padding:3px;}
.liststyle th{ text-align:right; font-weight:normal;}
</style>
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->
<!--#include file="nav_teach.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par1">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">修改密码</li>
             </ul>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--学校列表-->
             
             <div class="clear"></div>
             <div class="xylb2_1">
             	<table border="0" cellpadding="0" cellspacing="0" width="705" height="540">
                	<tr>
                    	<td valign="top">
                             <table width="60%" border="0" align="center" cellpadding="2" cellspacing="0"  >
                                  <form  id=forn name=forn onSubmit="return checkForm('forn')" action=person_pwd_edit_js.asp?act=post method=post style="margin:0px; padding:0px;" >
                                   <tr>
                                     <td class="reg_ti">旧密码</td>
                                            </tr>
                                   <tr>
                                     <td><input  name="y_password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="旧密码"  checkMsg="请输入 4-20 数字、字母"/></td>
                                   </tr>
                                   <tr>
                                     <td class="reg_ti">新密码</td>       
                                   </tr>
                                   <tr>
                                     <td><input  name="password" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="新密码"  checkMsg="请输入 4-20 数字、字母"/></td>
                                   </tr>
                            
                                   <tr>
                                     <td class="reg_ti">确认密码</td>       
                                   </tr>
                                   <tr>
                                     <td><input  name="confirmpassword" type="password" class="input_m"  size="25" maxlength="20" style="WIDTH: 180px" canEmpty="N" checkType="password,4,20" checkStr="确认密码" equal="password" /></td>
                                   </tr>
                              <tr>
                                <td><input name="subm" type="image" src="images/edit.jpg"  ></td>
                              </tr>
                              </form> 
                            </table>
                        </td>
                    </tr>
                </table> 
             </div>
           
             <div class="clear"></div>
          </div>
       </div>
       
       
       
   </div>
   
   <!--内页右边-->
   <div class="main_right">
       <!--微博栏-->
       <div class="wbl">
          <!--#include file="left_person.asp"-->
       </div>
       <div class="clear"></div>
        <!--图片-->
        <!--#include file="left_bottom.asp"-->   
   </div>
   <div class="clear"></div>
</div>
<div id="footer">
	<!--#include file="bottom.asp"-->
</div>
</body>
</html>
