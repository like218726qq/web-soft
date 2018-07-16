<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'连接数据库
openconn

'提取和验证传递参数
id_lm=html(trim(request("id_lm")))
keyword=bsql(html(trim(request("keyword"))))
if id_lm<>"" then
	if not checknum(id_lm) then 
		call msg("参数错误","")
	else
		set rs=server.CreateObject("adodb.recordset")
		sql="select id_lm,xia from tol_lm where id_lm="&id_lm&""
		rs.open sql,conn,1,1
		if not rs.eof  then
			tt=""
			tt=" a.lm="&rs("id_lm")&""	
			call xialm(rs("id_lm"),tt)
		end if
		rs.close
		set rs=nothing
		
		sub xialm(fid,tt)
		set rsb=server.CreateObject("adodb.recordset")
		sql="select id_lm,xia,add_xx from tol_lm  where fid="&fid&" order by px desc,id_lm desc"
		rsb.open sql,conn,1,1
		while not rsb.eof
			tt=tt&" or a.lm="&rsb("id_lm")&"" 
			call xialm(rsb("id_lm"),tt)
			rsb.movenext
		wend
		rsb.close
		set rsb=nothing
		end sub
		
		if tt<>"" then 
			sq=" and ("&tt&") "
		end if
		pra="&id_lm="&id_lm&""
	end if
end if
if keyword<>"" then
	sq=sq&" and a.title like '%"&keyword&"%'"
	pra=pra&"&keyword="&server.URLEncode(keyword)&""
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资料管理首页</title>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script src="../scripts/function.js" language="javascript"></script>
</head>

<body >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="topbg">
    <td  colspan="2" >资料管理----管理首页</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td ><a href="default.asp">资料管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加资料</a></td>
  </tr>
</table>
<br />

<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
    <TR class="tdbg3" >
      <TD width="70"  valign="top"><strong>分类检索：</strong></TD>
      <TD><form id="sform" name="sform" method="get" action="default.asp">
           <select name="id_lm">
            <option value="" selected>所有栏目</option>
            <%
			
            '添加信息时显示栏目过程
            Set rsa= Server.CreateObject("ADODB.Recordset")
            sql="select * from tol_lm where fid=0 order by px desc,id_lm desc"
            rsa.open sql,conn,1,1
            while not rsa.eof 	
                i=""
                    response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
                    call addinfo(rsa("id_lm"),i)
                rsa.movenext
            wend
            rsa.close
            set rsa=nothing
            
            sub addinfo(fid,i)
            i=i&"&nbsp;"
            sql="select * from tol_lm where fid="&fid&" order by px desc,id_lm desc"
            Set rsb= Server.CreateObject("ADODB.Recordset")
            rsb.open sql,conn,1,1
            while not rsb.eof
                response.write"<option value='"&rsb("id_lm")&"'>"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
				call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
                rsb.movenext
            wend
            rsb.close
            set rsb=nothing
            end sub
            %>
         </select>
         <script language="javascript">
		 document.getElementById("id_lm").value="<%=id_lm%>";
         </script>
         <input name="keyword" type="text" id="keyword" size="15" maxlength="50"  value="<%=keyword%>"/>
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
      <td width="23" align="center" >ID</td>
      <td align="left" >标题</td>
      <td align="center" >排序</td>
      <td align="center" >常规管理操作</td>
    </tr>
	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select a.id,a.title,a.px,b.title_lm from tol_co a,tol_lm b where a.lm=b.id_lm "&sq&" order by a.px desc,a.id desc"
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
      <td height="22" align="right" ><input name="id" id="id" type="checkbox" value="<%=rs("id")%>" onClick="checkpx(<%=rs("id")%>)"></td>
      <td ><strong>[</strong><%=rs("title_lm")%><strong>] </strong><%=rs("title")%></td>
      <TD align='center'><input name="<%=rs("id")%>" id="<%=rs("id")%>" type="text" value="<%=rs("px")%>" size="5" maxlength="10" disabled></TD>
      <td align="center" ><a href="edit.asp?id=<%=rs("id")%>">修改</a>|<a href="make.asp?id=<%=rs("id")%>&ac=del"  onClick="return confirm('确定要删除该数据吗?')">删除</a></td>
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
                  <input name=chkall onClick=CheckAll(this.form,"yes")  type=button value='全选'>
                    &nbsp;&nbsp;
                  <input name=chkOthers onClick=CheckOthers(this.form,"yes")  type=button value='反选'>
					<select name="ac" id="ac">
                    <option value="px">修改选中排序</option>
                     <option value="del">删除选中信息</option>
                    </select>
		        <input type="submit" value="提交操作" name="submit1"  onClick="return confirm('确定要提交操作吗?')">     </TD>
                </TR>
              </TBODY>
  </TABLE>
</form>	
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border" >
  <tr class=tdbg3>
    <td >     
    <%
    '分页过程
    if pagenum<>"" then
        call listpage(pra) 
    end if
    %>
    </td>
  </tr>
</table>

</body>
</html>
