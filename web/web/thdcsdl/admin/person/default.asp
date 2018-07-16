<!--#include file="../inc_n.asp"-->
<html><head><title>会员管理首页</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
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
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body leftmargin='2' topmargin='1' marginwidth='0' marginheight='0'>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <tr class='topbg'>
    <td height='22' colspan='3'  align='center'><strong>会员中心管理----</strong>会员管理首页</td>
  </tr>
  <tr class='tdbg'>
    <td width='70' height='30' ><strong>管理导航：</strong></td>
    <td width="390"><a href='default.asp'>会员管理首页</a>&nbsp;|&nbsp;<a href='add.asp'>添加会员</a>&nbsp;</td>
    <td align="right"><table width="308" height="25" border="0" cellpadding="0" cellspacing="0">
      <form  action="default.asp"  method="post" name="formn">
        <tr>
          <td width="79" align="right">搜索:</td>
          <td width="130"><input name="keyword" type="text" size="18" maxlength="50" value="<%=keyword%>"></td>
          <td width="99"><input type="submit" name="Submit" value="搜索"></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
<BR>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR>
      <FORM name="form1"  onsubmit="return CheckForm()" action="make.asp" method=post target="theBlankFrame">
        <TD><TABLE class=border cellSpacing=1 cellPadding=0 width="100%" border=0>
            <TBODY>
              <TR class=title height=22>
                <TD align=middle height=22><STRONG>选中</STRONG></TD>
                <TD align=middle><STRONG>ID</STRONG></TD>
                <TD align=middle><STRONG>帐号</STRONG></TD>
				<TD align=middle><STRONG>密码</STRONG></TD>
				<td align=middle><STRONG>姓名</STRONG></td>
                <TD align=middle><STRONG>姓别</STRONG></TD>
                <TD align=middle><STRONG>电话</STRONG></TD>
                <TD align=middle><STRONG>登录次数</STRONG></TD>
				<TD align=middle><STRONG>状态</STRONG></TD>
                <TD align=middle><STRONG>常规管理操作</STRONG></TD>
              </TR>
			  <%
			  keyword=replace(trim(request("keyword")),"'","")
			  if keyword<>"" then tt="where username like '%"&keyword&"%' or rename like '%"&keyword&"%'"
			  set rs=server.CreateObject("adodb.recordset")
			  sql="select * from person "&tt&" order by id desc"
			  rs.open sql,conn,1,1
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
              <TR class=tdbg onMouseOver="this.style.backgroundColor='#BFDFFF'" onMouseOut="this.style.backgroundColor=''">
                <TD align=middle width=30><input type=checkbox name="id" value='<%=rs("id")%>' ></TD>
                <TD align=middle><%=rs("id")%></TD>
                <TD ><%=rs("username")%></TD>
				<TD><%=rs("password")%></TD>
                <TD><%=rs("rename")%></TD>
                <TD align=middle><%=rs("sex")%></TD>
				<TD align=middle><%=rs("phone")%></TD>
                <TD align=middle><span class="style1"><strong><%=rs("login_num")%></strong></span></TD>
				<TD align=middle><%=zt%></TD>
                <TD align=center> <A href="edit.asp?id=<%=rs("id")%>">修改</A>|<A href="make.asp?id=<%=rs("id")%>&ac=del" target="theBlankFrame" onClick="return confirm('真的要删除吗?')">删除</A>|
				<%if rs("pass")="yes" then%>
				<a href="make.asp?id=<%=rs("id")%>&ac=ping1"  target="theBlankFrame">屏蔽</a>
				<%else%>
				<a href="make.asp?id=<%=rs("id")%>&ac=ping2"  target="theBlankFrame">取消</a>
				<%end if%>
				</TD>
              </TR>
<%
		a=a+1
	 	rs.movenext
		wend
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
%>
            </TBODY>
          </TABLE>
		  
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY><TR>
                <TD height=30 >
                   &nbsp;&nbsp; &nbsp;&nbsp;<input name=chkall onClick=CheckAll(this.form)  type=button value='全选'>
                    &nbsp;&nbsp;
                  <input name=chkOthers onClick=CheckOthers(this.form)  type=button value='反选'>
                 &nbsp; 
			      <input type="hidden" name="ac" value="del">
			      &nbsp; 
		        <input type="submit" value="删除选中" name="submit1"  onClick="return confirm('真的要删除吗?')">				</TD>
                </TR>
              </TBODY>
          </TABLE>
        </TD>
      </FORM>
    </TR>
  </TBODY>
</TABLE><table width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="border:1px solid #2F78C8; ">
  <tr class=tdbg>
    <td height="25" bgcolor="#D3E7F8"><%
				'分页过程
				key="&keyword="&keyword&""
				if pagezong<>"" then
				call listpage(key) 
				end if
				%></td>
  </tr>
</table>
	 <br>
<B>说明</B>：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.<font  color="#008000">屏蔽</font>---该会员已经停止开放<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2.<font color="blue">正常</font>---该会员一切正常使用
<IFRAME id=theBlankFrame name=theBlankFrame style="WIDTH: 0px; HEIGHT: 0px" src="images/blank.htm"></IFRAME>
