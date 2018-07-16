<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->

<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<script language="javascript">
function check(){
	title=document.getElementById("title");
	rename=document.getElementById("rename");
	email=document.getElementById("email");
	safecode=document.getElementById("safecode");
	if (title.value==""){
		alert("标题不能为空")
		title.focus()
		return false
	}
	if (rename.value==""){
		alert("姓名不能为空")
		rename.focus()
		return false
	}
	if (email.value==""){
		alert("电子邮箱不能为空")
		email.focus()
		return false
	}
	if (safecode.value==""){
		alert("验证码不能为空")
		safecode.focus()
		return false
	}
}
</script>
<style>
.lyb_bor{border:1px solid #ccc;font-size:12px;}
.lyb_inp{ height:15px;}
</style>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="bottom" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="216" height="40" align="center" valign="bottom"><table width="192" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="40" align="center" valign="middle" class="STYLE8" style="background:url(images/ny-zuo_12.jpg)">服务支持</td>
              </tr>
            </table></td>
            <td width="786"><table width="780" border="0" cellspacing="0" cellpadding="0" class="line">
          <tr>
            <td width="34" height="35" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="726" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 服务支持 > 投诉咨询</span>
              <span class="STYLE8">服务支持</span></td>
          </tr>
            <tr><td colspan="2" align="left"><img src="images/neiye-zx_33.jpg" width="780" height="1" /></td>
            </tr>
        </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="811" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="216" align="center" valign="top"><table width="192" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="middle">	<ul class="pro_left">
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=3 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="service.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
          <%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%>

<li><a href="down.asp">资料下载</a></li>
<li><a href="message.asp" class="bgdw">投诉咨询</a></li>
            </ul><img src="images/ny-zuo_17.jpg" /></td>
              </tr>
            </table></td>
    <td width="786" class="line">
    <div class="show">

<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="message_add.asp" onsubmit="return check()">
    <tr>
	  <td width="23%" height="40" align="right">标　　题： </td>
	  <td width="77%" height="25">
      <input name="title" type="text" class="lyb_bor lyb_inp" id="title" size="60" maxlength="50" />
	  <font color="#ff0000">*</font></td>
    </tr>
        <tr>
	  <td width="23%" height="40" align="right">姓　　名： </td>
	  <td width="77%" height="25"><input name="rename" type="text" id="rename" maxlength="50" class="lyb_bor lyb_inp" />
	  <font color="#ff0000">*</font>      </td>
    </tr>
	<tr>
	  <td height="40" align="right">电子邮箱： </td>
	  <td height="25">
      <input name="email" type="text" id="email" maxlength="50"class="lyb_bor lyb_inp"  />
      <font color="#ff0000">*</font></td>	
    </tr>
<tr>
	  <td height="40" align="right">公司名称： </td>
	  <td height="25"><input name="compname" type="text"class="lyb_bor lyb_inp" id="compname" size="60" maxlength="50"  />      </td>	
    </tr>
	<tr>
	  <td height="40" align="right"> 电　　话： </td>
	  <td height="25">
      <input name="phone" type="text" class="lyb_bor lyb_inp" id="phone" size="60" maxlength="50"  />&nbsp;&nbsp;</td>
    </tr>
    <tr>
	  <td height="40" align="right"> 地　　址： </td>
	  <td height="25"><input name="address" type="text" class="lyb_bor lyb_inp" id="address" size="60" maxlength="50" /></td>
    </tr>
	<tr>
	  <td height="40" align="right">留言内容：</td>
	  <td><textarea name="z_body" cols="60" rows="6" id="z_body" class="lyb_bor lyb_tex"></textarea></td>
	</tr>
	 <tr>
	  <td height="40" align="right">验 证 码：</td>
	  <td><input name="safecode" type="text" id="safecode" size="5" class="lyb_bor lyb_inp_01" style="float:left; margin-right:5px;"/><img src="admin/getcode.asp?t=Math.random()" onClick="this.src='admin/getcode.asp?t='+Math.random()" style="cursor:pointer; float:left;" ></td>
	</tr>
	<tr>
	  <td height="40" align="right"></td>
	  <td><input name="submit" type="submit" id="submit2" value=" 发 表 " class="lyb_bor lyb_btn" />
		  　<input type="reset" name="Submit" value=" 重 置 " class="lyb_bor lyb_btn" /></td>
	</tr>
	</form>
</table>
<%
		Set rs= Server.CreateObject("ADODB.Recordset")
		sql="select * from book where id_re=0 and pass='yes'order by id desc"
		rs.open sql,conn,1,1
		if not rs.eof then
			pagenum=5
			rs.pagesize=pagenum
			counter=rs.recordcount
			pagezong=rs.pagecount
			pageno=replace(trim(request.querystring("page")),"'","")
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
		while not rs.eof and a<=pagenum
		%>
		<TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0 style="border-left:1px solid #d4d3d1;border-right:1px solid #d4d3d1; " >
		  <TBODY>
			<TR>
			  <TD  bgColor=#eeeded style="border-top:1px solid #d4d3d1;border-bottom:1px solid #d4d3d1;">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="3%">&nbsp;</td>
					<td width="97%"><datetime><%=rs("wtime")%></datetime>&nbsp;&nbsp; 
					<b>
					<user><%=rs("rename")%></user>
					</b> 留言：</td>
				  </tr>
				</table>
			  </TD>
			</TR>
			<TR>
			  <TD  align=left style="padding-top:2px; padding-left:20px;">
				<font color="#330000"><B><%=rs("title")%></B></font><br>
                <CONTENT><%=rs("z_body")%></CONTENT>
			  </TD>
			</TR>
			<%
			sql="select top 1 * from book where id_re="&rs("id")
			set rsa=server.CreateObject("adodb.recordset")
			rsa.open sql,conn,1,1
			if not rsa.eof then
			%>
			<TR>
			  <TD >
				<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
				  <TBODY>
					<TR bgColor=#eff7ff>
					  <TD width=18></TD>
					  <TD width=58><FONT color=blue>【回复】</FONT></TD>

					  <TD width="496"><% response.write(rsa("wtime")&"&nbsp;&nbsp;"&rsa("rename")&"&nbsp;&nbsp;"&rsa("ip"))%></TD>
					</TR>
					<TR vAlign=top align=left bgColor=#eff7ff height=20>
					  <TD width=18></TD>
					  <TD width=58>
					  <TD><%=rsa("z_body")%></TD>
					</TR>
				  </TBODY>
				</TABLE>
			  </TD>
			</TR>
			<%               
			end if
			rsa.close
			set rsa=nothing
			%>
		  </TBODY>
</TABLE>
			<%
			a=a+1
			rs.movenext
			wend
			rs.close
			set rs=nothing
			%>

            <table width="100%" height="22"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CBD5E9" style="border:1px solid #d4d3d1;">
            <tr>
            <td align="right">
                <%
                call listpage("")
                %>
            </td>
            </tr>
            </table>
	<%end if%>
    <div class="page" style="text-align:center;"><%if pagenum<>"" then call listpage("") end if%></div>   </div>
    
    
    </td>
  </tr>
</table>

         
         
         </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
