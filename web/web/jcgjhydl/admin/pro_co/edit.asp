<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin

id=request("id")
w_url=request.ServerVariables("HTTP_REFERER")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from pro_co where id="&id
rs.open sql,conn,1,1
if rs.eof then 
	call msg("该信息不存在,或已删除!","")
else
	lm=rs("lm")
	title=rs("title")
	pro_danwei=rs("pro_danwei")
	pro_guige=rs("pro_guige")
	pro_color=rs("pro_color")
	pro_money=rs("pro_money")
	f_body=rehtml(rs("f_body"))
	z_body=rs("z_body")
	img_sl=rs("img_sl")
	px=rs("px")
end if
rs.close
set rs=nothing

'获取该信息所在分类是否可添加信息
set rs=server.CreateObject("adodb.recordset")
sql="select add_xx from pro_lm where id_lm="&lm&""
rs.open sql,conn,1,1
if rs.eof then
	call msg("该信息对应的分类不存在或已删除","")
else
	add_xx=rs("add_xx")
end if
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
<script language="javascript">
function check(){
	var lm=document.form1.lm;
	var title=document.form1.title;
	var px=document.form1.px;
	if (lm.value=="n"){
		alert("请选择分类")
		lm.focus();
		return false;
	}
	if (lm.value=="no"){
		alert("该分类不允许添加产品")
		lm.focus();
		return false;
	}
	if (title.value==""){
		alert("请输入产品名称")
		title.focus();
		return false;
	}
	if(px.value==""){
		alert("显示顺序不能为空")
		px.focus()
		return false
	}
}
</script>
</head>

<body>
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
    <tr class="topbg">    
        <td colspan="2"  align="center">
            产品中心管理----产品修改
        </td>  
    </tr> 
    <tr class="tdbg">    
        <td width="70" height="26" ><strong>管理导航：</strong></td>
        <td ><a href="default.asp">产品管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加产品</a></td>
    </tr>
</table>
<br />
<form method="POST" name="form1" action="editt.asp" onSubmit="return check()" >
<input name="id" value="<%=id%>" type="hidden">
<input  type="hidden" name="w_url" value="<%=w_url%>">
      <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        <tr class="title">
          <td  align="center" colspan="2" >产品修改</td>
        </tr>
		<tr class="tdbg">
		  <td align="right"><strong >所属分类：</strong></td>
          <td>				  
            <select name="lm">
				<option value="n" selected>请选择分类</option>
				<%  
                '添加信息时显示分类过程
                Set rsa= Server.CreateObject("ADODB.Recordset")
                sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
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
                sql="select * from pro_lm where fid="&fid&" order by px desc,id_lm desc"
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
             document.form1.lm.value=<%=lm%>
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
          <tr class="tdbg">
            <td width="120" align="right"><strong>产品名称：</strong></td>
            <td ><input name="title" type="text" id="title" value="<%=title%>" size="30" maxlength="150"></td>
          </tr>
     
		  <tr class="tdbg2">
                <td width="120" align="right" class="tdbg"><strong>产品单位：</strong></td>
        <td class="tdbg">               
    <input name="pro_danwei" type="text" id="pro_danwei" maxlength="50" value="<%=pro_danwei%>">
                　产品颜色：
                <input name="pro_color" type="text" id="pro_color" maxlength="50" value="<%=pro_color%>">            </td>
	    </tr>
<tr class="tdbg2">
<td width="120" align="right" class="tdbg"><strong>产品规格：</strong></td>
      <td class="tdbg" ><input name="pro_guige" type="text" id="pro_guige" maxlength="50" value="<%=pro_guige%>">　
              产品售价：
              <input name="pro_money" type="text" id="pro_money" maxlength="50" value="<%=pro_money%>">              </td>
        </tr>

		      <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍：</strong></td>
                <td>
				  <textarea name="f_body" cols="72" rows="4" id="f_body"><%=f_body%></textarea>				</td>
          </tr>
              <tr class="tdbg">
                <td width="120" align="right"><strong >详细介绍：</strong></td>
                <td>
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
    %>		  		</td>
              </tr>
              <tr class="tdbg">
                <td width="120" align="right"><strong>图片上传：</strong></td>
                <td>
               <IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="uploadd.asp?frameid=frame1&kuang=img_sl&img_sl=<%=img_sl%>" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl" value="<%=img_sl%>"></td>
          </tr>
          
<!--在此可加多图上传代码-->

            <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="<%=px%>" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr>  
      </table>
  <p align="center">  
  <input type="submit" name="Submit" value=" 修 改 "> &nbsp;       <input type="button" name="Submit2" value=" 取 消 " onClick="location='<%=w_url%>'"></P>
</form>
