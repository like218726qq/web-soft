<!--#include file="conn.asp"-->
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
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>港置地产代理(深圳)有限公司桂芳园分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#fffefa">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="214" valign="top">
		<!--#include file="left_about.asp"-->
		<!--#include file="left_contact.asp"-->
    </td>
    <td width="27">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:28px;">
      <tr>
         <td style="background:url(images/pro_06.jpg); width:715px; height:23px; color:#a18307; font-size:14px; font-weight:bold; padding:6px 0 0 22px;" valign="middle"> 行业动态</td>
      </tr>
      <tr>
        <td style="line-height:26px; padding:10px 5px; color:464646; font-weight:500;">
          <div style="padding:0px 5px 2px 5px;">
            <div style="text-align:center;font-weight:bold; font-size:14px; padding:5px 0 5px 0px;"><font style="color:<%=color_font%>;"><%=title%></font></div>
            <div style="text-align:right; line-height:22px; color:#999; padding-bottom:5px;">时间：<%=wtime%></div>
            <div style="line-height:180%;"><%=z_body%></div>
            <div style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>
      	 </div>
        </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="botton.asp"-->
</body>
</html>
