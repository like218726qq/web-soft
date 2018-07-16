<!--#include file="conn.asp"-->
<!--#include file="person_checklogin.asp"-->
<%
	per=7
	g=1
	m=2
	t=1

act=trim(request("act"))
if act="post" then
	rename=html(trim(request.Form("rename")))
	email=html(trim(request.Form("email")))
	phone=html(trim(request.Form("phone")))
	fax=html(trim(request.Form("fax")))
	nj=html(trim(request.Form("nj")))
	xx=html(trim(request.Form("xx")))
	zy=html(trim(request.Form("zy")))
	post=html(trim(request.Form("post")))
	xingbie=html(trim(request.Form("xingbie")))
	address=html(trim(request.Form("address")))
	
	if rename="" or email="" or phone=""  then
		call msg("带*号的必须填写","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from person where username='"&session("person")&"' and pass='yes'"
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该用户已被屏蔽或已删除","location='person_loginout.asp'")
	else
		rs("rename")=rename
		rs("email")=email
		rs("phone")=phone
		rs("fax")=fax
		rs("nj")=nj
		rs("xx")=xx
		rs("zy")=zy
		rs("post")=post
		rs("address")=address
		rs("xingbie")=xingbie
		rs.update()
	end if
	rs.close
	set rs=nothing
	call msg("修改成功","location=""person_zl_edit.asp""")
end if%>
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
                <li class="oms">修改资料</li>
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
								sql="select * from person where username='"&session("person")&"' and pass='yes'"
								rs.open sql,conn,1,1
								if not rs.eof then
							  %>
								
								<table width="60%" border="0" align="center" cellpadding="2" cellspacing="0"  style="margin-top:15px; margin-bottom:15px;">
								<FORM id=zlfrm name=zlfrm onSubmit="return checkForm('zlfrm')" action=person_zl_edit.asp?act=post method=post>
									<tr>
									<td class="reg_ti">
									姓名 <span class="font_8">*</span>    </td>
								   </tr>
									<tr>
									<td class="reg_ti">
									<input name=rename class=input_m id="rename"  value="<%=rs("rename")%>" style="WIDTH: 180px"  size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="姓名">    </td>
								   </tr>
								<FORM id=zlfrm name=zlfrm onSubmit="return checkForm('zlfrm')" action=person_zl_edit.asp?act=post method=post>
									<tr>
									<td class="reg_ti">
									性别 <span class="font_8">*</span>    </td>
								   </tr>
									<tr>
									<td class="reg_ti">
									<input name=xingbie class=input_m id="xingbie"  value="<%=rs("xingbie")%>" style="WIDTH: 180px"  size=25 maxlength="50" canEmpty="N" checkType="string,," checkStr="性别">    </td>
								   </tr>
								   <tr>
									<td class="reg_ti">
									年级 <span class="font_8">*</span>   </td>
									</tr>
								  <tr>
								  <td><input name=nj class=input_m  size=25 maxlength="50"  value="<%=rs("nj")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="年级"></td>
								  </tr>
								   <tr>
									<td class="reg_ti">
									专业 <span class="font_8">*</span>   </td>
									</tr>
								  <tr>
								  <td><input name=zy class=input_m  size=25 maxlength="50"  value="<%=rs("zy")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="专业"></td>
								  </tr>
								   <tr>
									<td class="reg_ti">
									在读学校 <span class="font_8">*</span>   </td>
									</tr>
								  <tr>
								  <td><input name=xx class=input_m  size=25 maxlength="50"  value="<%=rs("xx")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="在读学校"></td>
								  </tr>
								   <tr>
									<td class="reg_ti">
									邮箱 <span class="font_8">*</span>   </td>
									</tr>
								  <tr>
								  <td><input name=email class=input_m  size=25 maxlength="50"  value="<%=rs("email")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="邮箱"></td>
								  </tr>
								 <tr>
									<td class="reg_ti">
									电话  <span class="font_8">*</span></td>
									</tr>
									<tr>
									<td>
									<input name=phone class=input_m  size=25 maxlength="50"  value="<%=rs("phone")%>" style="WIDTH: 180px"  canEmpty="N" checkType="string,," checkStr="电话"></td>
									</tr>
								 <tr>
									<td class="reg_ti">
									传真</td>
									</tr>
									<tr>
									<td>
									<input name=fax class=input_m  size=25 maxlength="50"  value="<%=rs("fax")%>" style="WIDTH: 180px" ></td>
									</tr>
								 <tr>
									<td class="reg_ti">
									邮编 </td>
									</tr>
									<tr>
									<td>
									<input name=post class=input_m id="post"  value="<%=rs("post")%>" style="WIDTH: 180px"  size=25 maxlength="50"></td>
									</tr>
									<tr>
									<td class="reg_ti">
									地址</td>
									</tr>
									<tr>
									<td class="reg_ti">
									<input name="address" class=input_m id="address"  value="<%=rs("address")%>"  size=50 maxlength="150">    </td>
									</tr>
								  <tr>
									<td><input name="subm" type="image" src="images/edit.jpg"  ></td>
								  </tr></FORM>
								</table>
								<%
								end if
								rs.close
								set rs=nothing
								%>

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
