<!--#include file="../inc.asp"-->	
<%
'检查登录
checklogin

'获取提交参数
id=request("id")
if id="" or not checknum(id) then 
	call msg("参数错误","")
end if

'连接数据库
openconn

'获取记录数据
set rs=server.createobject("adodb.recordset")
sql="select * from pro_lm where id_lm="&id&""
rs.open sql,conn,1,1
if rs.eof then 
	call msg("数据不存在,或已删除!","")
else
	fid=rs("fid")
	title_lm=rs("title_lm")
	title_lm_en=rs("title_lm_en")
	title_lm_es=rs("title_lm_es")
	f_body=rs("f_body")
	f_body_en=rs("f_body_en")
	f_body_es=rs("f_body_es")
	img_sl=rs("img_sl")
	add_xx=rs("add_xx")
	xia=rs("xia")
	px=rs("px")
end if
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>产品分类管理----修改分类</TITLE>
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
<TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <TR class="topbg">
	  <TD  colspan="2" align="center">
		  产品分类管理----修改分类
	  </TD>
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
<br>
<FORM name="form1" method="post" action="editt.asp" onSubmit="return check()">
<INPUT name="id" type="hidden" value="<%=id%>">
  <TABLE width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    <TR class="title">
		<TD  colspan="2" align="center">
			修改分类
		</TD>
	</TR>
    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>上级分类：</STRONG>		</TD>
  <TD>
			
			<SELECT name="fid">
				<OPTION value="0" selected>无{作为一级分类}</OPTION>
				<%
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
			<script>
			document.form1.fid.value=<%=fid%>
			</script>
		</TD>
	</TR>

    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>英文名称：</STRONG>		</TD>
  <TD>
			<INPUT name="title_lm" type="text" id="title_lm" value="<%=title_lm%>" size="30" maxlength="150">
	    <FONT color=red>*</FONT>		</TD>
	</TR>
    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>日文名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm_en" type="text" id="title_lm_en" value="<%=title_lm_en%>" size="30" maxlength="150">
	    <FONT color=red>*</FONT>		</TD>
	</TR>
    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>西班牙语名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm_es" type="text" id="title_lm_es" value="<%=title_lm_es%>" size="30" maxlength="150">
	    <FONT color=red>*</FONT>		</TD>
	</TR>
   <!-- <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍：</strong></td>
                <td>
				  <textarea name="f_body" cols="72" rows="4" id="f_body"><%'f_body%></textarea>				</td>
          </tr>
    <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍(英语语)：</strong></td>
                <td><textarea name="f_body_en" cols="72" rows="4" id="f_body_en"><%'f_body_en%></textarea></td>
    </tr>
    <tr class="tdbg">
                <td width="120" align="right"><strong>简要介绍(西班牙语)：</strong></td>
                <td>
				  <textarea name="f_body_es" cols="72" rows="4" id="f_body_es"><%'f_body_es%></textarea>				</td>
          </tr>
    <TR class="tdbg">
	    <TD width="120" align="right"><strong>图片上传(图片尺寸最适合为322*181)：</strong></TD>
		<TD><IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="uploadd.asp?frameid=frame1&kuang=img_sl&img_sl=<%'img_sl%>" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl" value="<%'img_sl%>"></TD>
	</TR>-->
    <TR class="tdbg">
		<TD width="120" align="right">
			<STRONG>分类属性：</STRONG>
		</TD>      
		<TD>
			<input name="add_xx" type="radio" value="yes"  <%if add_xx="yes" then response.write" checked" end if%>>是
			<input type="radio" name="add_xx" value="no" <%if add_xx="no" then response.write" checked" end if%>>否 可以添加信息，(不能添加信息时只做为分类导航)

		</TD>    
    </TR>
    	 	<TR class="tdbg">
	    <TD width="120" align="right">
			 <STRONG>下级分类：</STRONG>
	 	</TD>      
        <TD>
			<input name="xia" type="radio" value="yes" <%if xia="yes" then response.write" checked" end if%>>是
			<input name="xia" type="radio"  value="no" <%if xia="no" then response.write" checked" end if%>>
		  否 有下级分类</TD>    
    </TR>
    <TR class="tdbg">
		  <TD width="120" align="right" class="tdbg">
			  <STRONG>显示顺序：</STRONG>
		  </TD>
		  <TD class="tdbg">
			  <input name="px" type="text"  id="px"  value="<%=px%>" size="8" maxlength="10">
			  <FONT color=red> *(从大到小排序)</FONT>
		  </TD>
    </TR>
 </TABLE>	
 <p align="center">		<INPUT name="Add" type="submit" value=" 修 改 " style="cursor:hand;">&nbsp;&nbsp;<INPUT name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</p>
</FORM>

</BODY></HTML>
