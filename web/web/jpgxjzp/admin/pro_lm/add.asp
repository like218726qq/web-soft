<!--#include file="../inc.asp"-->
<%
'验证登录情况
checklogin
fid=request.QueryString("id_lm")
url_attr=""
if fid<>"" then url_attr="&id_lm="&fid end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>产品分类管理----添加分类</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<LINK href="../admin.css" rel="stylesheet" type="text/css">
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
	  <TD colspan="2" align="center">产品分类管理----添加分类</TD>
  </TR>  
  <TR class="tdbg">   
	  <TD width="70" height="26">
		  <STRONG>管理导航：</STRONG>
	  </TD>  
	  <TD height="26">
		  <A href="default.asp<%=url_attr%>">分类管理首页</A>&nbsp;|&nbsp;<A href="add.asp<%=url_attr%>">添加分类</A>
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
	
    <TR class="tdbg">
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
					response.write"<OPTION value="&rsa("id_lm")&">• "&rsa("title_lm")&"["&rsa("title_lm_en")&"]</OPTION>"&chr(10)
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
						response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"["&rsb("title_lm_en")&"]</option>"&chr(10)
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
            window.document.all.fid.value="<%=fid%>";
            </script>
	   	</TD>
   	</TR>
	
    <TR class="tdbg">
	    <TD width="120" align="right">
			<STRONG>中文名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm" type="text" id="title_lm" size="30" maxlength="150">
		  <FONT color=red>*</FONT>
		</TD>
	</TR>
    <TR class="tdbg" style="display:none;">
	    <TD width="120" align="right">
			<STRONG>英文名称：</STRONG>
		</TD>
		<TD>
			<INPUT name="title_lm_en" type="text" id="title_lm_en" size="30" maxlength="150">
		  <FONT color=red>*</FONT>
		</TD>
	</TR>
	
	<TR class="tdbg">
	    <TD width="120" align="right">
			 <STRONG>分类属性：</STRONG>
	 	</TD>      
      <TD>
			<input name="add_xx" type="radio" value="yes" checked>是
			<input name="add_xx" type="radio"  value="no">
		  否 可以添加信息，(不能添加信息时只做为分类导航)</TD>    
    </TR>
	 	<TR class="tdbg">
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
    <tr class="tdbg" style="display:none;">          
            <td width="120" align="right"><strong>图片上传：</strong></td>          
            <td ><IFRAME id="frame1" name="frame1" style="margin-top:2px;"height=22 src="up.asp?frameid=frame1&kuang=img_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl"></td>
    </tr>
    <tr class="tdbg" style="display:none;">
        <td width="120" align="right"><strong>中文备注：</strong></td>
        <td><textarea name="nodes" cols="72" rows="4"><%=nodes%></textarea></td>
    </tr>
    <tr class="tdbg" style="display:none;">
        <td width="120" align="right"><strong>英文备注：</strong></td>
        <td><textarea name="nodes_en" cols="72" rows="4"><%=nodes_en%></textarea></td>
    </tr>
  <!--中文版优化-->
<tr style="display:none;">
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
<tr style="display:none;">
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
