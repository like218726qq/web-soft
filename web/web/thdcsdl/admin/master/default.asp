<!--#include file="../inc_n.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员管理首页</title>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
 function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==false)
			{
				e.checked = true;// form.chkall.checked;
			}
			else
			{
				e.checked = false;
			}
	}
}

function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			e.checked = true// form.chkall.checked;
	}
}
//-->
</script>
</head>
<body leftmargin="2" rightmargin="1" topmargin="2" bottommargin="0">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr>
    <td height="23" align="center" colspan="2" class="topbg"><strong style="color:#FFFFFF; ">管理员管理</strong></td>
  </tr>
  <tr>
    <td width="70" height="23" class="tdbg"><strong>管理导航：</strong></td>
    <td class="tdbg"><a href="default.asp">管理员管理首页</a> | <a href="add.asp">添加管理员</a></td>
  </tr>
</table>
<FORM name=myform   action="make.asp" method=post target="theblank">

<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="border">
  <tr class="title">
  <td width="30"  align="center" class="title"><strong>选中</strong></td>
    <td height="22" class="title"><strong>帐号</strong></td>
	<td  align="center" class="title"><strong>密码</strong></td>
	<td  align="center" class="title"><strong>使用人</strong></td>
	<td  align="center" class="title"><strong>录入时间</strong></td>
    <td  align="center" class="title"><strong>最后登录</strong></td>
	 <td  align="center" class="title"><strong>登录次数</strong></td>
	 <td align="center"><strong>状态</strong></td>
    <td  align="center" class="title"><strong>管理管理员</strong></td>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from master order by id desc "
  rs.open sql,conn,1,1
	'分页
	if not rs.eof then
	pagenum=25
	rs.pagesize=pagenum
	counter=rs.recordcount
	pagezong=rs.pagecount
	pageno=trim(request.querystring("page"))
	if pageno="" or not isnumeric(pageno) then pageno=1
	if pageno-pagezong>0 then pageno=pagezong
	rs.absolutepage=pageno
	a=1
	end if
  while not rs.eof and a<=pagenum
    zt=""
	if rs("pass")<>"yes" then 
	zt="<font color='green'>屏蔽</font>"
	else
	zt="<font color='blue'>正常</font>"
	end if
  %>
    <tr>
    <td width="20" height="22" align="center"  class="tdbg"><input type="checkbox" name="id" value="<%=rs("id")%>"></td>
    <td  class="tdbg"><%=rs("username")%></td>
	<td align="center"   class="tdbg"><%=rs("password")%></td>
	<td align="center"   class="tdbg"><%=rs("rename")%></td>
	<td align="center"   class="tdbg"><%=rs("wtime")%></td>
	<td align="center"   class="tdbg"><%=rs("ltime")%></td>
    <td align="center"  class="tdbg" style="color:#FF0000; font-weight:bold;"><%=rs("login_num")%></td>
	<td align="center"  class="tdbg" ><%=zt%></td>
    <td align="center"   class="tdbg"><a href="edit.asp?id=<%=rs("id")%>">修改</a> | <a href="make.asp?id=<%=rs("id")%>&ac=del" target="theblank">删除</a> | 
	<%
	if rs("pass")="yes" then
	%>
	<a href="make.asp?id=<%=rs("id")%>&ac=ping1"  target="theblank">停用</a>
	<%
	else
	%>
	<a href="make.asp?id=<%=rs("id")%>&ac=ping2"  target="theblank">启用</a>
	<%end if%>
	</td>
  </tr>
  <%
  rs.movenext
  wend
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  %>
</table>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY><TR>
                <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
                  <input name=chkall onClick=CheckAll(this.form)  type=button value='全选'>
                    &nbsp;&nbsp;
                  <input name=chkOthers onClick=CheckOthers(this.form)  type=button value='反选'>

		        <input type="submit" value="删除选中管理员" name="submit1"  onClick="return confirm('真的要删除选中管理员吗?')">     </TD>
                </TR>
                
              </TBODY>
          </TABLE>
<table width="100%" height="25"  border="0" cellpadding="0" cellspacing="1" class="border">
  <tr>
    <td class="tdbg">
	<%if pagenum<>"" then 
	key=""
	call listpage(key)
	end if%></td>
  </tr>
</table>
</form>
<iframe width="0" height="0" frameborder="0" scrolling="no" name="theblank"></iframe>
</body>
</html>
