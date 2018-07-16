<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
		title_lm=rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

%>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="bottom" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="216" height="40" align="center" valign="bottom"><table width="192" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="40" align="center" valign="middle" class="STYLE8" style="background:url(images/ny-zuo_12.jpg)">新闻中心</td>
              </tr>
            </table></td>
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0" class="line">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 新闻中心 > <%=title_lm%></span>
              <span class="STYLE8">新闻中心</span></td>
          </tr>
            <tr><td colspan="2" align="left"><img src="images/neiye-zx_33.jpg" width="780" height="1" /></td>
            </tr>
        </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="811" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="216" align="center" valign="top"><table width="192" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="middle">	<ul class="pro_left">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=1 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

<li><a href="news.asp?lm=<%=rs("id_lm")%>" <%if lm=rs("id_lm") then%> class="bgdw"<%end if%>><%=rs("title_lm")%></a></li>

<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786" class="line">
    <div class="show">
<div style=" line-height:180%; _height:700px;min-height:700px;">
     <div style="text-align:center;font-weight:bold; font-size:14px; padding:5px 0 5px 0px; color:#27B5A6"><font style="color:<%=color_font%>;"><%=title%></font></div>
    <div style="text-align:right; line-height:20px; color:#999; padding-bottom:5px; border-bottom:#F2F2F2 solid 1px;">时间：<%=wtime%></div>
	<%
    if img_sl<>"" then
    %>
    <div style="text-align:center; width:100%;">
        <img src="<%=getbpic(img_sl,"d")%>" onload="if (this.width>550){this.height=550*this.height/this.width;this.width=550;}" />
    </div> 
    <%
    end if
    %>
     <div style="text-align:left; line-height:200%; padding:5px;"><%=z_body%>
    </div>
</div><div class="clear"></div>
    <div class="page" style="text-align:right;"><a href="javascript:history.back();">[返回]</a>></div
     ></div>
    
    
    </td>
  </tr>
</table>
         </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
