<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>资料栏目管理----添加栏目</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<LINK href="../admin.css" rel="stylesheet" type="text/css">
<script src="../scripts/function.js"></script>
<SCRIPT language="JavaScript" type="text/JavaScript">
function check(){
	var title_lm=document.form1.title_lm;
	var px=document.form1.px;
	if (title_lm.value==""){
		alert("栏目名称不能为空");
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
<TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <TR class="topbg">
	  <TD colspan="2" align="center">资料栏目管理----添加栏目</TD>
  </TR>  
  <TR class="tdbg">   
	  <TD width="70" height="26">
		  <STRONG>管理导航：</STRONG>
	  </TD>  
	  <TD height="26">
		  <A href="default.asp">栏目管理首页</A>&nbsp;|&nbsp;<A href="add.asp">添加栏目</A>
	  </TD>
  </TR>
</TABLE>
  <br />
<FORM name="form1" method="post" action="addd.asp" onSubmit="return check()">
 <TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <TR class="title">
		<TD  colspan="2" align="center">
			添加栏目
	  </TD>
	</TR>
	
    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>上级栏目：</STRONG>		</TD>
  <TD>
			<SELECT name="fid">
				<OPTION value="0" selected>无{作为一级栏目}</OPTION>
				<%
				'打开数据库
				openconn
				
				'显示栏目
				Set rsa= Server.CreateObject("ADODB.Recordset")
				sql="select * from tol_lm where fid=0 and xia='yes' order by px desc,id_lm desc"
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
					sql="select * from tol_lm where fid="&fid&" and xia='yes' order by px desc,id_lm desc"
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
			<STRONG>栏目名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm" type="text" id="title_lm" size="30" maxlength="150">
		  <FONT color=red>*</FONT>
		</TD>
	</TR>
	<TR class="tdbg">
	    <TD width="120" align="right">
			<STRONG>英文版栏目名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm_en" type="text" id="title_lm_en" size="30" maxlength="150">
		  <FONT color=red>*</FONT>
		</TD>
	</TR>
	<TR class="tdbg">
	    <TD width="120" align="right">
			 <STRONG>栏目属性：</STRONG>
	 	</TD>      
      <TD>
			<input name="add_xx" type="radio" value="yes" checked>是
			<input name="add_xx" type="radio"  value="no">
		  否 可以添加信息，(不能添加信息时只做为栏目导航)</TD>    
    </TR>
	 	<TR class="tdbg">
	    <TD width="120" align="right">
			 <STRONG>下级栏目：</STRONG>
	 	</TD>      
        <TD>
			<input name="xia" type="radio" value="yes" checked>是
			<input name="xia" type="radio"  value="no">
		  否 有下级栏目</TD>    
    </TR>
	 <TR class="tdbg">
		  <TD width="120" align="right">
		  <STRONG>显示顺序：</STRONG>
		  </TD>      
	   <TD>
		<INPUT name="px" type="text" id="px" value="100" size="8" maxlength="10" >
		<FONT color=red>*(从大到小排序)</FONT></TD>    
    </TR>
<!--中文版优化-->
<tr>
    <td class="tdbg" align="right"><b>中文版搜索优化：</b></td>
    <td>
        <table class="tdbg" width="100%"> 
            <tr class="tdbg">
                <td align="right"><b>标题：</b></td>
                <td><input type="text" name="titles" value="<%=titles%>" style="width:900px" /></td>
            </tr>
            <tr class="tdbg">
                <td align="right"><b>关键词：</b></td>
                <td><input type="text" name="keys" value="<%=keys%>" style="width:900px" /></td>
            </tr> 
            <tr class="tdbg">
                <td align="right"><b>描述：</b></td>
                <td><input type="text" name="des" value="<%=des%>" style="width:900px" /></td>
            </tr> 
        </table>
    </td>
</tr>
 <!--中文版优化-->
 <!--英文版优化-->
<tr>
    <td class="tdbg" align="right"><b>英文版搜索优化：</b></td>
    <td>
        <table class="tdbg" width="100%">
            <tr class="tdbg">
                <td align="right"><b>Title:</b></td>
                <td><input type="text" name="titles_en" value="<%=titles_en%>" style="width:900px" /></td>
            </tr>
            <tr class="tdbg">
                <td align="right"><b>Keyword:</b></td>
                <td><input type="text" name="keys_en" value="<%=keys_en%>" style="width:900px" /></td>
            </tr> 
            <tr class="tdbg">
                <td align="right"><b>Describe:</b></td>
                <td><input type="text" name="des_en" value="<%=des_en%>" style="width:900px" /></td>
            </tr> 
        </table>
    </td>
</tr>
 <!--英文版优化-->    
 </TABLE>
 <p align="center"><INPUT name="Add" type="submit" value=" 添 加 " style="cursor:hand;">&nbsp;&nbsp;<INPUT name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</p>
</FORM>
</body>
</html>
</BODY></HTML>
