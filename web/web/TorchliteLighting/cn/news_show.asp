<!--#include file="conn.asp"-->
<%
	a=5
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
		if rs("link_url")<>"" then
			response.Redirect rs("link_url"):response.End()
		end if
		lm=rs("lm")
		title=rs("title")
		color_font=rs("color_font")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao="&gt;"&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>钜丰源灯饰有限公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
	  <!--#include file="left_con.asp"-->
    </td>
    <td width="15" height="100">&nbsp;</td>
    <td width="774" valign="top" bgcolor="#f8f8f8"><table width="774" border="0" cellpadding="0" cellspacing="0" background="images/products_03.jpg">
      <tr>
        <td width="42" height="33">&nbsp;</td>
        <td width="105" class="zhans">新闻资讯</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">当前位置：<a href="index.asp">首页</a> &gt;&gt; <a href="news.asp">新闻资讯</a> &gt;&gt; <%=title%></td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding-top:15px; padding-left:11px;">
          	<%
				id=request("id")
				set rs=server.CreateObject("adodb.recordset")
				rs.open "select * from info_co where pass='yes' and id="&id&" order by px desc,id desc",conn,1,2
				  rs("read_num")=rs("read_num")+1
				  rs.update()
			%> 
			<table width="98%" align="center">
				<tr>
					<td style="line-height:180%; padding:10px 0 5px 0;" align="center" valign="bottom"><span style="font-size:14px;"><%=rs("title")%></span></td>
				</tr>
				<tr>
					<td height="20" align="center" bgcolor="#E0E0E0" style="border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #E0E0E0;font-size:12px;">发布日期:<%=FormatDateTime(rs("wtime"),2)%> &nbsp;  | &nbsp; 阅读:<%=rs("read_num")%></td>
				</tr>
				<tr>
				  <td><table width="98%" align="center">
					<tr>
					  <td style="font-size:12px; padding-top:3px; line-height:24px;"><%=rs("z_body")%></td>
					</tr>
				  </table></td>
				</tr>
				<tr><td height="10px"></td></tr>
				<tr>
					<td height="30" align="right" style="padding-right:20px;"><a href="javascript:history.go(-1)" style="text-decoration:none;">[ 返回 ]</a></td>
				</tr>
			</table>
			<%
				rs.close
				set rs=nothing
			%>  
          </td>
        </tr>
      </table>
      <table width="774" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" align="center" class="weiz"><%if pagenum<>"" then call listpage(pra) end if%></td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
