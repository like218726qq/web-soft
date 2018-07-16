<!--#include file="top.asp"-->
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
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=""&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="239" valign="top"><!--#include file="new_left.asp"-->
 

      <table width="239" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="left_con.asp"--></td>
    <td width="36" height="100">&nbsp;</td>
    <td valign="top"><table width="707" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="379" height="29"><strong><%=dao%></strong></td>
        <td width="328" align="right" class="weiz" style="padding-right:15px;">您当前位置：<a href="index.asp">首页</a> &gt;&gt; <a href="#"><%=dao%></a></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/products_tiao.jpg" width="707" height="1" /></td>
      </tr>
    </table>
      <table width="707" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <div class="nei_title"><%=title%></div>
      <div class="nei_time">发布时间：<%=wtime%></div>
<div class="nei_body"><%=z_body%></div>

  </tr>
</table>
<!--#include file="foot.asp"-->