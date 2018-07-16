<!--#include file="conn.asp"-->
<% 
	per=7
	g=1
	t=1
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
                <li class="oms">个人账号管理</li>
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
								if rs.eof then
									call msg("该用户不存在","location='person_loginout.asp'")
								else
							%>
							<table width="630" border="2" align="center" cellpadding="0" cellspacing="0"  style=" border:1px solid #CCCCCC;border-collapse: collapse" >
								
					    <tr>
									  <th align="right" bgcolor="#FFFFFF" class="bg3">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</th>
									    <td width="214" bgcolor="#FFFFFF" class="title_bg"><span class="fon"><%=rs("rename")%></span></td>
                       	  <th width="84" align="right" bgcolor="#FFFFFF" class="bg3">性别：</th>
                          <td width="263" bgcolor="#FFFFFF" class="title_bg"><span class="fon"><%=rs("xingbie")%></span></td>
							 	    </tr>
									<tr>
									  <th align="right" bgcolor="#FFFFFF" class="bg3">口语次数：</th>
									  <td bgcolor="#FFFFFF" class="title_bg"><span class="fon"><%=rs("ky")%>次</span></td>
									  <th width="84" align="right"  class="bg3">写作次数：</th>
									  <td bgcolor="#FFFFFF" class="title_bg"><span class="fon"><%=rs("xz")%>篇</span></td>
									</tr>
									<tr>
									  <th width="109" align="right" bgcolor="#FFFFFF"  class="bg3">年级 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="title_bg"><%=rs("nj")%>&nbsp;</td>
									  </tr>
									<tr>
									  <th width="109" align="right" bgcolor="#FFFFFF"  class="bg3">专业 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="title_bg"><%=rs("zy")%>&nbsp;</td>
									  </tr>
									<tr>
									  <th width="109" align="right" bgcolor="#FFFFFF"  class="bg3">在读学校 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="title_bg"><%=rs("xx")%>&nbsp;</td>
									  </tr>
									<tr>
									  <th width="109" align="right" bgcolor="#FFFFFF"  class="bg3">联系电话 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="title_bg"><%=rs("phone")%>&nbsp;</td>
									  </tr>
									<tr>
									  <th width="109" align="right" bgcolor="#FFFFFF" class="bg3">邮箱地址 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF"  class="title_bg"><%=rs("email")%>&nbsp;</td>
									  </tr>
									<!--<tr>
									  <th width="132" align="right" bgcolor="#FFFFFF">公司名称 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="fon">< %=rs("company")%>&nbsp;</td>
									  </tr>
									<tr>-->
									  <th width="109" align="right" bgcolor="#FFFFFF" class="bg3">传真号码 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF"  class="title_bg"><%=rs("fax")%>&nbsp;</td>
									  </tr>
						
											  <tr>
									  <th width="109" align="right" bgcolor="#FFFFFF" class="bg3">邮编地址 ： </th>
									  <td colspan="3" bgcolor="#FFFFFF"  class="title_bg"><%=rs("post")%>&nbsp;</td>
									  </tr>
						
									<tr>
									  
									  <th width="109" align="right" bgcolor="#FFFFFF" class="bg3">联系地址  ： </th>
									  <td colspan="3" bgcolor="#FFFFFF" class="title_bg"><%=rs("address")%>&nbsp;</td>
									</tr>
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
