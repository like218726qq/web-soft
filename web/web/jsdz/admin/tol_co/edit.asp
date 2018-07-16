<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

'验证传递参数
id=request("id")
w_url=request.ServerVariables("HTTP_REFERER")

if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'打开数据库
openconn

'提取数据
set rs=server.CreateObject("adodb.recordset")
sql="select * from tol_co where id="&id&""
rs.open sql,conn,1,1
if rs.eof then 
	call msg("该信息不存在或已删除","")
else
	lm=rs("lm")
	title=rs("title")
	z_body=rs("z_body")
	px=rs("px")
end if
rs.close
set rs=nothing

'获取该信息所在栏目是否可添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select add_xx from tol_lm where id_lm="&lm&""
rs.open sql,conn,1,1
if rs.eof then
	call msg("该信息对应的栏目不存在或已删除","")
else
	add_xx=rs("add_xx")
end if
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资料管理--修改资料</title>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script language = "JavaScript">
function Check(){
	var lm=document.form1.lm;
	var title=document.form1.title;
	var px=document.form1.px;
	if (lm.value=="n"){
		alert("请选择栏目");
		lm.focus();
		return false;
	}
	if (lm.value=="no"){
		alert("所选栏目不允许添加信息");
		lm.focus();
		return false;
	}
	if (title.value==""){
		 alert("标题不能为空");
		 title.focus();
		 return false;
	}
	if (px.value==""){
		 alert("排序不能为空");
		 px.focus();
		 return false;
	}
}
</script>
<script src="../scripts/function.js"></script>
</head>

<body>
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="topbg">
    <td  colspan="2" >资料管理----修改资料</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26" ><strong>管理导航：</strong></td>
    <td ><a href="default.asp">资料管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加资料</a></td>
  </tr>
</table>
<br />
<form action="editt.asp" name="form1" method="post" onSubmit="return Check()">
<input  type="hidden" name="id" value="<%=id%>">
<input  type="hidden" name="w_url" value="<%=w_url%>">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center" class="title">
    <td  colspan="2" >修改资料</td>
    </tr>
  <tr>
    <td width="120" align="right" class="tdbg"><strong>所属栏目：</strong></td>
    <td class="tdbg"> 
	   <select name="lm" >
		<option value="n" selected>请选择栏目</option>
		<%
		'添加信息时显示栏目过程
		Set rsa= Server.CreateObject("ADODB.Recordset")
		sql="select * from tol_lm where fid=0 order by px desc,id_lm desc"
		rsa.open sql,conn,1,1
		while not rsa.eof 	
			i=""
			if rsa("add_xx")="yes" then
				response.write"<OPTION value='"&rsa("id_lm")&"' >• "&rsa("title_lm")&"</OPTION>"&chr(10)
			elseif add_xx="no" then
				response.write"<OPTION value='"&rsa("id_lm")&"' >• "&rsa("title_lm")&"</OPTION>"&chr(10)
			else
				response.write"<OPTION value='no'>• "&rsa("title_lm")&"×</OPTION>"&chr(10)
			end if
			call addinfo(rsa("id_lm"),i)
			rsa.movenext
		wend
		rsa.close
		set rsa=nothing
		
		'关闭数据库
		closeconn
		
		sub addinfo(fid,i)
			i=i&"&nbsp;"
			sql="select * from tol_lm where fid="&fid&" order by px desc,id_lm desc"
			Set rsb= Server.CreateObject("ADODB.Recordset")
			rsb.open sql,conn,1,1
			while not rsb.eof
				if rsb("add_xx")="yes" then
					response.write("<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>")&chr(10)
				elseif add_xx="no" then
					response.write("<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>")&chr(10)
				else
					response.write("<option value='no'>"&i&" 　|—"&rsb("title_lm")&"×</option>")&chr(10)
				end if
				call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
				rsb.movenext
			wend
			rsb.close
			set rsb=nothing
		end sub
		%>
	 </select>
	 <script>
	 document.form1.lm.value="<%=lm%>"
	 <%
	 if add_xx="no" then
		 response.write chr(10)&"document.form1.lm.disabled='disabled';"
	 end if
	 %>
     </script>
      <%
	 if add_xx="no" then
		 response.write"<input type='hidden' name='lm' value='"&lm&"'>"
	 end if
	 %>
	 </td>
  </tr>
    <tr>
    <td width="120"  align="right" class="tdbg"><strong>标　　题：</strong></td>
    <td class="tdbg"><input name="title" type="text" id="title" size="30" maxlength="150" value="<%=title%>"></td>
  </tr>
   <tr>
    <td width="120" align="right" class="tdbg"><strong>内　　容：</strong></td>
    <td class="tdbg">
    <!-- #INCLUDE file="../fckeditor.asp" -->
    <%
    Dim oFCKeditor
    Set oFCKeditor = New FCKeditor
    oFCKeditor.Config("LinkBrowser") = "true" 
    oFCKeditor.Config("ImageBrowser") = "true" 
    oFCKeditor.Config("FlashBrowser") = "true" 
    oFCKeditor.Config("LinkUpload") = "true" 
    oFCKeditor.Config("ImageUpload") = "true" 
    oFCKeditor.Config("FlashUpload") = "true" 
    oFCKeditor.Value = z_body
    oFCKeditor.Create "z_body"
    %>		</td>
  </tr>
  
<tr class="tdbg">
    <td width="120" align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="<%=px%>" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr>
  
</table><p align="center">   
		<INPUT type="submit" id="b1" name="b1"   value=" 修 改 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='<%=w_url%>'" style="cursor:hand;">  </p>
</form>
</body>
</html>
