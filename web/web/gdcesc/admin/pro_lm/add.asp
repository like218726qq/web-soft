<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>产品分类管理----添加分类</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script src="../scripts/function.js"></script>
<SCRIPT language="JavaScript" type="text/JavaScript">
function check(){
	var title_lm=document.form1.title_lm;
	var px=document.form1.px;
	if (title_lm.value==""){
		alert("分类名称不能为空");
		title_lm.focus();
		return false;
	}
	if (px.value==""){
		alert("显示顺序不能为空");
		px.focus();
		return false;
	}
}
</SCRIPT>
</HEAD>
<BODY>
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <TR class="topbg">
	  <TD colspan="2" align="center">产品分类管理----添加分类</TD>
  </TR>  
  <TR class="tdbg">   
	  <TD width="70" height="26">
		  <STRONG>管理导航：</STRONG>
	  </TD>  
	  <TD height="26">
		  <A href="default.asp">分类管理首页</A>&nbsp;|&nbsp;<A href="add.asp">添加分类</A>
	  </TD>
  </TR>
</TABLE>
  <br />
<FORM name="form1" method="post" action="addd.asp" onSubmit="return check()">
 <TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <TR class="title">
		<TD  colspan="2" align="center">
			添加分类
	  </TD>
	</TR>
	
    <TR class="tdbg" style="display:none;">
		<TD width="120" align="right">
			<STRONG>上级分类：</STRONG>		</TD>
  <TD>
			<SELECT name="fid">
				<OPTION value="0" selected>无{作为一级分类}</OPTION>
				<%
				'打开数据库
				openconn
				
				'显示分类
				Set rsa= Server.CreateObject("ADODB.Recordset")
				sql="select * from pro_lm where fid=0 and xia='yes' order by px desc,id_lm desc"
				rsa.open sql,conn,1,1
				while not rsa.eof 
					i=""
					response.write"<OPTION value="&rsa("id_lm")&">• "&rsa("title_lm")&"</OPTION>"&chr(10)
					if rsa("xia")="yes" then 
						call addlm(rsa("id_lm"),i)
					end if
					rsa.movenext
				wend
				rsa.close
				set rsa=nothing
				
				'关闭数据库
				closeconn
				
				sub addlm(fid,i)
					i=i&"&nbsp;"
					Set rsb= Server.CreateObject("ADODB.Recordset")
					sql="select * from pro_lm where fid="&fid&" and xia='yes' order by px desc,id_lm desc"
					rsb.open sql,conn,1,1
					while not rsb.eof
						response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
						if rsb("xia")="yes" then 
							call addlm(rsb("id_lm"),i&" 　|&nbsp;")
						end if
						rsb.movenext
					wend
					rsb.close
					set rsb=nothing
				end sub
				%>
			</SELECT>
	   	</TD>
   	</TR>
	
    <TR class="tdbg">
	    <TD width="120" align="right">
			<STRONG>分类名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm" type="text" id="title_lm" size="30" maxlength="150">
		  <FONT color=red>*</FONT>
		</TD>
	</TR>
		  <tr class="tdbg" >          
        <td width="135" align="right"><strong> 图片上传：</strong></td>          
     	<td ><IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="up.asp?frameid=frame1&kuang=img_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl"></td>
      </tr>
	<TR class="tdbg"  style="display:none;">
	    <TD width="120" align="right">
			 <STRONG>分类属性：</STRONG>
	 	</TD>      
      <TD>
			<input name="add_xx" type="radio" value="yes" checked>是
			<input name="add_xx" type="radio"  value="no">
		  否 可以添加信息，(不能添加信息时只做为分类导航)</TD>    
    </TR>
	 	<TR class="tdbg" style="display:none;">
	    <TD width="120" align="right">
			 <STRONG>下级分类：</STRONG>
	 	</TD>      
        <TD>
			<input name="xia" type="radio" value="yes" checked>是
			<input name="xia" type="radio"  value="no">
		  否 有下级分类</TD>    
    </TR>
	 <TR class="tdbg">
		  <TD width="120" align="right">
		  <STRONG>显示顺序：</STRONG>
		  </TD>      
	   <TD>
		<INPUT name="px" type="text" id="px" value="100" size="8" maxlength="10" >
		<FONT color=red>*(从大到小排序)</FONT></TD>    
    </TR>
 </TABLE>
 <p align="center"><INPUT name="Add" type="submit" value=" 添 加 " style="cursor:hand;">&nbsp;&nbsp;<INPUT name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</p>
</FORM>
</body>
</html>
</BODY></HTML>
