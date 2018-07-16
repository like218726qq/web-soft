<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'提取和验证传递参数
keyword=bsql(html(trim(request("keyword"))))
if keyword<>"" then
	sq=" and ( username like '%"&keyword&"%' or rename like '%"&keyword&"%')"
	pra="&keyword="&server.URLEncode(keyword)&""
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品订购管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</head>
<body >
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    <tr class="topbg">
    <td colspan="2"  align="center">写作中心管理</td>  
  </tr>
</table><br />
<!--<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
    <TR class="tdbg3" >
      <TD width="70"  valign="top"><strong>订单检索：</strong></TD>
      <TD>
      <form id="sform" name="sform" method="get" action="default.asp">
         <input name="keyword" type="text" id="keyword" size="30" maxlength="50"  value="< %=keyword%>"/>
         <input type="submit" name="button" id="button" value="检索" />
        </form>
      </TD>
    </TR>
  </TBODY>
</TABLE>--><br />

<FORM name="form1"   action="make.asp" method="post"  onsubmit="return checkyes(form1)">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
<TBODY>
      <TR class=title >
        <TD align=middle ><STRONG>选中</STRONG></TD>
        <TD width="50" align=center><STRONG>ID</STRONG></TD>
        <TD align="left"><STRONG>姓名</STRONG></TD>
        <TD align="left"><STRONG>批改教师</STRONG></TD>
        <td align="center"><strong>写作时间</strong></td>
        <TD align=middle><STRONG>状态</STRONG></TD>
        <TD align=middle><STRONG>常规管理操作</STRONG></TD>
      </TR>
<%
'连接数据库
openconn

Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from pro_order_xz where 1=1 "&sq&" order by id desc"
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
js=""
if rs("person_js")<>"" then
	set rs1=server.CreateObject("adodb.recordset")
	sql="select * from person1 where id="&rs("person_js")&""
	rs1.open sql,conn,1,3
	if not rs1.eof then
		js=rs1("username")
	end if
	rs1.close
	set rs1=nothing
end if

zt=""
if rs("chakan")="yes" then
    zt="<font color='#cccccc'>已看</font>"
else
    zt="<font color='blue'>未看</font>"
end if
%>
<TR class=tdbg  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
    <TD align=middle width=30><input type=checkbox name="id" id="id" value="<%=rs("id")%>" ></TD>
    <TD align=center><%=rs("id")%></TD>
    <TD><A href=order_show.asp?id=<%=rs("id")%>><%=rs("person_xs")%></a></TD>
    <TD><%=js%></TD>
    <td align="center"><%=rs("wtime")%></td>
    <TD align=middle><%=zt%>&nbsp;&nbsp;<%=send_z1(rs("send_zt"))%> &nbsp;&nbsp;<%=py(rs("taolun"))%> </TD>
    <TD align=center>&nbsp;<A href="order_show.asp?id=<%=rs("id")%>">查看</A> <A onClick="return confirm('真的要删除该订单吗？');" href="make.asp?id=<%=rs("id")%>" >删除</A></TD>
</TR>
<%
a=a+1
rs.movenext
wend
rs.close
set rs=nothing

'关闭数据库
closeconn
%>
    </TBODY>
  </TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY><TR>
    <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
      <input name=chkall onClick=CheckAll(this.form,"no")  type=button value="全选">
        &nbsp;&nbsp;
      <input name=chkOthers onClick=CheckOthers(this.form,"no")  type=button value="反选">

    <input type="submit" value="删除选中信息" name="submit1"  onClick="return confirm('真的要删除选中信息吗?')">     </TD>
    </TR>
    
  </TBODY>
</TABLE>

<table width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="border:1px solid #2F78C8; ">
  <tr class=tdbg>
    <td height="25" bgcolor="#D3E7F8">     
	<%
    '分页过程
    if pagezong<>"" then
        call listpage(pra) 
    end if
    %>
    </td>
  </tr>
</table>
</form>	
<p />
  <B>
  说明</B>：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.<font color="blue">未看</font>---该信息没有查看<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.<font color="#cccccc">已看</font>---该信息已经查看
</body>
</html>
