<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'提取和验证传递参数
keyword=html(trim(request("keyword")))
if keyword<>"" then
	sq=" and ( username like '%"&keyword&"%' or rename like '%"&keyword&"%')"
	pra="&keyword="&server.URLEncode(keyword)&""
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员管理首页</title>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<LINK href="../admin.css" rel="stylesheet" type="text/css">
<script src="../scripts/function.js" language="javascript"></script>
</head>

<body >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="topbg">
    <td  colspan="2" >会员管理----管理首页</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td ><a href="default.asp">管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加会员</a></td>
  </tr>
</table>
<br />

<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
    <TR class="tdbg3" >
      <TD width="70"  valign="top"><strong>会员检索：</strong></TD>
      <TD>
      <form id="sform" name="sform" method="get" action="default.asp">
         <input name="keyword" type="text" id="keyword" size="30" maxlength="50"  value="<%=keyword%>"/>
         <input type="submit" name="button" id="button" value="检索" />
        </form>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<br />

<form action="make.asp" name="form1" method="post" onsubmit="return checkyes(form1)" >
  <table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
    <tr align="center" class="title">
      <td width="30" align="center" >选中</td>
      <td width="50" align="center" >ID</td>
      <td align="left" >用户名</td>
      <td align="center" >联系人</td>
       <td align="center" >电话</td>
       <td align="center" >状态</td>
      <td align="center" >常规管理操作</td>
    </tr>
	<%
	'连接数据库
	openconn
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,username,password,rename,phone,pass from person where 1=1 "&sq&" order by id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=25
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
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
   end if
   while not rs.eof and a<=pagenum
	%>
    <tr class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
      <td height="22" align="center" ><input name="id" id="id" type="checkbox" value="<%=rs("id")%>" onClick="checkpx(<%=rs("id")%>)"></td>
      <td align="center"><%=rs("id")%></td>
      <td><%=rs("username")%></td>
      <td align="center" ><%=rs("rename")%></td>
      <td align="center" ><%=rs("phone")%></td>
      <td align="center" >
	  <%
	  if rs("pass")="yes" then
	  	response.write"<font class=""passyes"">启用</font>"
	  else
	  	response.write"<font class=""passno"">停用</font>"
	  end if
	  %>      </td>
      <td align="center" ><a href="edit.asp?id=<%=rs("id")%>">修改</a>|
      <%
	  if rs("pass")="yes" then
	  %>
      <a href="make.asp?ac=pass1&id=<%=rs("id")%>" >停用</a>|
      <%
	  else
	  %>
      <a href="make.asp?ac=pass2&id=<%=rs("id")%>" >启用</a>|
      <%
	  end if
	  %>
      <a href="make.asp?id=<%=rs("id")%>&ac=del" onClick="return confirm('确定要删除该会员吗?')">删除</a></td>
    </tr>
	<%
	a=a+1
	rs.movenext
	wend
	rs.close
	set rs=nothing
	
	'关闭数据库
	closeconn
	%>
  </table>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY><TR>
        <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
          <input name=chkall onClick=CheckAll(this.form,"no")  type=button value='全选'>
            &nbsp;&nbsp;
          <input name=chkOthers onClick=CheckOthers(this.form,"no")  type=button value='反选'>
          <select name="ac" id="ac">
            <option value="del">删除选中会员</option>
            <option value="pass1">停用选中会员</option>
            <option value="pass2">启用选中会员</option>
          </select>
        <input type="submit" value="提交操作" name="submit1"  onClick="return confirm('确定要提交操作吗?')">     </TD>
        </TR>
    </TBODY>
</TABLE>
	  </TD>
    </TR>
  </TBODY>
</TABLE>	
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border" >
  <tr class=tdbg3>
<td >     
	<%
    '分页过程
    if pagenum<>"" then
        call listpage(pra) 
    end if
    %>	</td>
  </tr>
</table>
</form>
</body>
</html>
