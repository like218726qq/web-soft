<!--#include file="conn.asp"-->
<% 
	n=8
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=2 order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
%>

<% 
act=trim(request("act"))
if act="post" then

	username=lcase(trim(request("username")))
	password=lcase(trim(request("password")))
	sex=lcase(trim(request("sex")))
	
	'验证码

	if len(username)<4 or len(username)>20 or feifa(username) then
		call msg("用户名格式不正确","")
	end if
	
	if len(password)<4 or len(password)>20 or feifa(password) then
		call msg("密码格式不正确","")
	end if
	
	if sex="学生" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from person where username='"&username&"'"
		rs.open sql,conn,1,3
		if rs.eof then
			call msg("该用户名不存在","")
		else
			if rs("password")<>password then
				call msg("用户名或密码错误","")
			else
				if rs("pass")<>"yes" then
					call msg("该用户已被停用","")
				else
						session("person")=username
						'session("info_id")=rs("id")
						'session("mem")=rs("mem")
						'session("rename")=rs("rename")
						rs("login_num")=rs("login_num")+1
						rs("ltime")=rs("etime")
						rs("lip")=rs("eip")
						rs("etime")=now()
						rs("eip")=getip()
						rs.update()
				end if
			end if
		end if
		rs.close
		set rs=nothing
		call msg("登录成功","location='person_home.asp';")
	
	elseif sex="教师" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from person1 where username='"&username&"'"
		rs.open sql,conn,1,3
		if rs.eof then
			call msg("该用户名不存在","")
		else
			if rs("password")<>password then
				call msg("用户名或密码错误","")
			else
				if rs("pass")<>"yes" then
					call msg("该用户已被停用","")
				else
						session("person1")=username
						'session("info_id1")=rs("id")
	'					session("mem")=rs("mem")
						'session("rename")=rs("rename")
						rs("login_num")=rs("login_num")+1
						rs("ltime")=rs("etime")
						rs("lip")=rs("eip")
						rs("etime")=now()
						rs("eip")=getip()
						rs.update()
				end if
			end if
		end if
		rs.close
		set rs=nothing
		call msg("登录成功","location='person_home_js.asp';")
	end if
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
                <li class="oms"><%=title%></li>
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
                        	<div style="padding:0px 5px 2px 5px;">
                                <div style="line-height:180%;">
                                <%
									set rs=server.CreateObject("adodb.recordset")
									sql="select * from tol_co where id=6"
									rs.open sql,conn,1,1
									if not rs.eof then
										response.write rs("z_body")
									end if
									rs.close
									set rs=nothing
								%>
                                </div>
                            </div>
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
