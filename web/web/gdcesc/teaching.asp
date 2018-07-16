<!--#include file="conn.asp"-->
<%n=8

	lm=request("lm")
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			sql="select id_lm,title_lm from teach_lm where id_lm="&lm&""
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
			end if
			rs.close
			set rs=nothing
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
		sql="select top 1 id_lm,title_lm from teach_lm where fid=0 order by px desc,id_lm desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
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
                <li class="oms"><%=title_lm%></li>
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
                          <%
								set rs=server.CreateObject("adodb.recordset")
								sql="select id,title,color_font,wtime from teach_co where pass='yes' "&sq&" order by px desc,id desc"
								rs.open sql,conn,1,1
								if not rs.eof then
									pagenum=15
									rs.pagesize=pagenum
									counter=rs.recordcount
									pagezong=rs.pagecount
									pageno=trim(request.querystring("page"))
									if pageno="" or not isnumeric(pageno) then 
										pageno=1
									end if
									if pageno<1 then
										pageno=1
									end if
									if pageno-pagezong>0 then 
										pageno=pagezong
									end if
									rs.absolutepage=pageno
									a=1
									while not rs.eof and a<=pagenum
							%>
							<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">	
						   <tr>				
							  <td style="border-bottom:dotted 1px #ccc; font-size:14px; font-weight:bold; color:#333333; padding-bottom:10px;" align="right" valign="middle" width="27">.</td>
							  <td width="605" align="left" valign="middle" style="border-bottom:dotted 1px #ccc; padding-left:5px;">
								<a href="teaching_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a>									   </td>
							 <td width="139" style="border-bottom:dotted 1px #ccc" height="30" align="center"> <%=formatdate(rs("wtime"))%></td>
						  </tr>
						  <tr>
							  <td valign="top" colspan="3"><div class="fgx"></div></td>
						  </tr>
					   </table>
					   <%
								a=a+1
								rs.movenext
								wend
									else
						%>
						<div style="text-align:center; margin-top:50px; margin-left:200px; width:200px; vertical-align:top; font-size:12px;">暂无信息！</div>
						<%		
							end if
							rs.close
							set rs=nothing
						%>
                        <span style="padding:10px 0"><%if pagenum<>"" then call listpage(pra) end if%></span>
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
