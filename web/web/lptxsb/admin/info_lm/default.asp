<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>信息栏目管理----管理首页</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
</HEAD>
<BODY >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr  class="topbg">
    <td  colspan="2" align="center">信息栏目管理----管理首页</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26"><STRONG>管理导航：</STRONG></td>
    <td height="26"><a href="default.asp">栏目管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加栏目</a></td>
  </tr>
</table>
<br>
<form name="form1" action="make.asp" method="post">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="title">
     <TD align=center width="30">选中</TD>
    <td >栏目名称</td>
    <td  >排序</td>
    <td  >常规管理操作</td>
  </tr>
  	<%
	'连接数据库
	openconn
	
	'栏目首页显示栏目过程
	Set rsa= Server.CreateObject("ADODB.Recordset")
	sql="select id_lm,title_lm,add_xx,xia,px from info_lm where fid=0 order by px desc,id_lm desc"
	rsa.open sql,conn,1,1
	while not rsa.eof
		i=""
		zt="" 
		if rsa("add_xx")="yes" then
			zt="<font color='blue' style='font-weight:bold;'>√</font>"
		else
			zt="<font color='red' style='font-weight:bold;'>×</font>"
		end if
		%>
        <tr class="tdbg"  onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
            <TD align='center'><input name="id" id="id" type="checkbox" value="<%=rsa("id_lm")%>" onClick="checkpx(<%=rsa("id_lm")%>)"></TD>
            <td ><IMG height=15 src='../images/tree_folder4.gif' width=15 valign='abvmiddle'><A href='edit.asp?id=<%=rsa("id_lm")%>'><STRONG><%=rsa("title_lm")%></STRONG></A>&nbsp;<%=rsa("id_lm")%>&nbsp;<%=zt%></td>
            <td align="center"><input name="<%=rsa("id_lm")%>" id="<%=rsa("id_lm")%>" type="text" value="<%=rsa("px")%>" size="5" maxlength="10" disabled></td>
            <TD align='center'><A href='edit.asp?id=<%=rsa("id_lm")%>'>修改设置</A> | <A href='make.asp?id=<%=rsa("id_lm")%>&ac=del'  onClick="return confirm('提示:真的要删除该栏目吗?\r\n\r\n属于该栏目的所有信息将被删除')"   >删除</A></TD>
        </tr>
		<%
		if rsa("xia")="yes" then 
			call deflm(rsa("id_lm"),i)
		end if
		rsa.movenext
	wend
	rsa.close
	set rsa=nothing
	
	'关闭数据库
	closeconn
    %>
</table>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY><TR>
                <TD height=30 align="left">				&nbsp;&nbsp; &nbsp;&nbsp;
                  <input name=chkall onClick=CheckAll(this.form,"yes")  type=button value='全选'>
                    &nbsp;&nbsp;
                  <input name=chkOthers onClick=CheckOthers(this.form,"yes")  type=button value='反选'>

		        <input type="submit" value="修改选中排序" name="submit1"  onClick="return confirm('真的要修改选中排序吗?')">
				<input type="hidden" name="ac" value="px">     </TD>
                </TR>
                
              </TBODY>
          </TABLE>
</form>
<%
	'栏目首页显示栏目子过程
	sub deflm(fid,i)
		i=i&""
		Set rsb= Server.CreateObject("ADODB.Recordset")
		sql="select id_lm,title_lm,add_xx,xia,px from info_lm where fid="&fid&" order by px desc,id_lm desc"
		rsb.open sql,conn,1,1
		while not rsb.eof
			tt="" 
			if rsb("add_xx")="yes" then
				tt="<font color='blue' style='font-weight:bold;'>√</font>"
			else
				tt="<font color='red' style='font-weight:bold;'>×</font>"
			end if
			response.write"<TR class=tdbg   onMouseOver='DoHL();' onMouseOut='DoLL();' onClick='DoSL();'>"&chr(10)
			response.write"<td align='center'><input name='id' type='checkbox' value='"&rsb("id_lm")&"'  onClick='checkpx("&rsb("id_lm")&")'></td>"&chr(10)
			response.write"<TD>"&i&" &nbsp;&nbsp;|—"
			if rsb("xia")="yes" then 
				response.write"<IMG height=15 src='../images/tree_folder4.gif' width=15 valign='abvmiddle'>"
			else
				response.write"<IMG height=15 src='../images/tree_folder3.gif' width=15 valign='abvmiddle'>"
			end if 
			response.Write"<a href='edit.asp?id="&rsb("id_lm")&"'>"&rsb("title_lm")&"</a>&nbsp;"&rsb("id_lm")&"&nbsp;"&tt&"</TD>"&chr(10)
			response.write"<TD align='center'><input name='"&rsb("id_lm")&"' type='text' value='"&rsb("px")&"' size='5' maxlength='10' disabled></TD>"&chr(10)
			response.write"<TD align='center'> <A href='edit.asp?id="&rsb("id_lm")&"'>修改设置</A> | <A href='make.asp?id="&rsb("id_lm")&"&ac=del' onClick=""return confirm('提示:真的要删除该栏目吗?\r\n\r\n属于该栏目的所有信息将被删除')"" >删除</A></TD>"&chr(10)
			response.write"</TR>"&chr(10)
			if rsb("xia")="yes" then
				call deflm(rsb("id_lm"),i&" &nbsp;│&nbsp;")
			end if
			rsb.movenext
		wend
		rsb.close
		set rsb=nothing
	end sub
	%>
<br>
<B>说明</B>：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1.显示顺序从大到小排列<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2.<font color='red' style='font-weight:bold;'>×</font> 不能添加信息 <font color='blue' style='font-weight:bold;'>√</font> 可以添加信息<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3.删除主栏目时子栏目也相应删除,属于这些栏目的信息也相应删除
</BODY></HTML>