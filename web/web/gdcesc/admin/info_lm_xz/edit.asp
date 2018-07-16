<!--#include file="../inc.asp"-->	
<%
'检查登录
checklogin

'获取参数
id=request("id")
if id="" or not checknum(id) then 
	call msg("错误参数","")
end if

'连接数据库
openconn

set rs=server.createobject("adodb.recordset")
sql="select * from info_lm_xz where id_lm="&id
rs.open sql,conn,1,1
if rs.eof then 
	call msg("数据不存在,或已删除","")
else
	fid=rs("fid")
	title_lm=rs("title_lm")
	px=rs("px")
	add_xx=rs("add_xx")
	xia=rs("xia")
	link_url=rs("link_url")
	info_from=rs("info_from")
	f_body=rs("f_body")
	z_body=rs("z_body")
	img_sl=rs("img_sl")
	wtime=rs("wtime")
	s_pic=rs("s_pic")
	s_typ=rs("s_typ")
	s_wid=rs("s_wid")
	s_hei=rs("s_hei")
	dow_sl=rs("dow_sl")
	vid_sl=rs("vid_sl")
end if
rs.close
set rs=nothing
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>信息栏目管理----修改栏目</TITLE>
<META http-equiv='Content-Type' content='text/html; charset=utf-8'>
<LINK href="../css/admin_style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../scripts/function.js"></script>
<SCRIPT language="JavaScript" type="text/JavaScript">
function check(){
	title_lm=document.form1.title_lm;
	px=document.form1.px;
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
function checkgao(){
	if (gaoji.style.display==""){
		gaoji.style.display="none"
	}else{ 
		gaoji.style.display=""
	}
}
</SCRIPT>

</HEAD>
<BODY>
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr  class="topbg">
    <td colspan="2" align="center">信息栏目管理----修改栏目</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26"><STRONG>管理导航：</STRONG></td>
    <td height="26"><a href="default.asp">栏目管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加栏目</a></td>
  </tr>
</table>
<br />
<FORM name='form1' method='post' action='editt.asp' onsubmit='return check()'>
<INPUT name="id" type="hidden" value="<%=id%>">
  <TABLE width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
    <TR class='title'>
		<TD height='22' colspan='2' align='center'>
			修改栏目
		</TD>
	</TR>
    <TR class='tdbg'>
		<TD width='120' align="right">
			<STRONG>所属栏目：</STRONG>
		</TD>
		<TD>
			
			<SELECT name='fid'>
				<OPTION value='0' selected>无{作为一级栏目}</OPTION>
				<%
				
				'显示栏目
				Set rsa= Server.CreateObject("ADODB.Recordset")
				sql="select id_lm,title_lm,xia from info_lm_xz where fid=0 and xia='yes' order by px desc,id_lm desc"
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
					sql="select id_lm,title_lm,xia from info_lm_xz where fid="&fid&" and xia='yes' order by px desc,id_lm desc"
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
        document.form1.fid.value="<%=fid%>"
        </script>
		</TD>
	</TR>

    <TR class='tdbg'>
		<TD width='120' align="right">
			<STRONG>栏目名称：</STRONG>
		</TD>
		<TD>
			<INPUT name='title_lm' type='text' id="title_lm" value="<%=title_lm%>" size='30' maxlength='150'>
		  <FONT color=red>*</FONT>		</TD>
	</TR>

    <TR class='tdbg'>
		  <TD width="120" align="right" class="tdbg">
			  <STRONG>显示顺序：</STRONG>
		  </TD>
	  <TD>
			  <input name="px" type="text" id="px"  value="<%=px%>">
			  <FONT color=red>*(从大到小排序)</FONT> </TD>
    </TR>
    <tr class="tdbg">
    <td height="22" align="right"><STRONG>高级选项：</STRONG></td>
    <td><label>
      <input name="gao" type="checkbox" id="gao" value="yes" onClick="checkgao()">
    显示高级设置</label></td>
  </tr>
  
  <tr class="tdbg"  id="gaoji" style="display:none;">
    <td height="22" align="right">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30">
          <input name="add_xx" type="radio" value="yes" <%if add_xx="yes" then response.write" checked" end if%>>
          是
          <input type="radio" name="add_xx" value="no"  <%if add_xx="no" then response.write" checked" end if%>>
        否 可以添加信息</td>
      </tr>
      <tr>
        <td height="30">
          <input name="xia" type="radio" value="yes" <%if xia="yes" then response.write" checked" end if%>>
          是
          <input type="radio" name="xia" value="no" <%if xia="no" then response.write" checked" end if%>>
        否 有下级栏目</td>
      </tr>

      <tr>
        <td height="30">
          <input type="radio" name="link_url" value="yes" <%if link_url="yes" then response.write" checked" end if%>>
          是
          <input name="link_url" type="radio" value="no" <%if link_url="no" then response.write" checked" end if%>>
        否 有连接地址</td>
      </tr> 
      <tr>
        <td height="30">
          <input type="radio" name="info_from" value="yes" <%if info_from="yes" then response.write" checked" end if%>>
          是
          <input name="info_from" type="radio" value="no" <%if info_from="no" then response.write" checked" end if%>>
        否 有信息来源</td>
      </tr>
      <tr>
        <td height="30">
          <input type="radio" name="f_body" value="yes" <%if f_body="yes" then response.write" checked" end if%>>
          是
          <input name="f_body" type="radio" value="no" <%if f_body="no" then response.write" checked" end if%>>
        否 有简要介绍</td>
      </tr>
      <tr>
        <td height="30">
          <input name="z_body" type="radio" value="yes" <%if z_body="yes" then response.write" checked" end if%>>
          是
          <input type="radio" name="z_body" value="no" <%if z_body="no" then response.write" checked" end if%>>
        否 有详细介绍</td>
      </tr>
      <tr>
        <td height="30">
          <input type="radio" name="img_sl"  value="yes" <%if img_sl="yes" then response.write" checked" end if%>  onclick="document.getElementById('tr_s').style.display=''">
          是
          <input name="img_sl" type="radio" value="no" <%if img_sl="no" then response.write" checked" end if%>  onclick="document.getElementById('tr_s').style.display='none'">
        否 有文件上传</td>
      </tr>
      <tr  id="tr_s"  <%if img_sl="no" then response.write"style=""display:none;""" end if%>>
        <td height="30">
          <input type="radio" name="s_pic" id="s_pic" value="yes" <%if s_pic="yes" then response.write" checked" end if%> onclick="document.getElementById('tb_s').style.display=''">
          是
          <input name="s_pic" type="radio" id="s_pic" value="no" <%if s_pic="no" then response.write" checked" end if%> onclick="document.getElementById('tb_s').style.display='none'">
        否 生成缩略图
        <table border="0" cellspacing="0" cellpadding="2" id="tb_s" <%if s_pic="no" then response.write"style=""display:none;""" end if%>>
          <tr>
          <td>类型</td>
            <td>
            <select name="s_typ" id="s_typ">
                <option value="yes">固定尺寸</option>
                <option value="no">不超过尺寸</option>
            </select>
            <script>
            document.getElementById("s_typ").value="<%=s_typ%>";
            </script>
            </td>
            <td>宽度</td>
            <td><input type="text" size="8" name="s_wid" value="<%=s_wid%>"/></td>
            <td>高度</td>
            <td><input type="text" size="8" name="s_hei"  value="<%=s_hei%>"/></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td height="30">
          <input name="dow_sl" type="radio" value="yes" <%if dow_sl="yes" then response.write" checked" end if%>>
          是
          <input name="dow_sl" type="radio" value="no"  <%if dow_sl="no" then response.write" checked" end if%>>
        否 有文件上传</td>
      </tr>
      <tr>
        <td height="30">
          <input name="vid_sl" type="radio" value="yes" <%if vid_sl="yes" then response.write" checked" end if%>>
          是
          <input name="vid_sl" type="radio" value="no"  <%if vid_sl="no" then response.write" checked" end if%>>
        否 有视频上传</td>
      </tr>
      <tr>
        <td height="30">
          <input name="wtime" type="radio" value="yes" <%if wtime="yes" then response.write" checked" end if%>>
          是
          <input name="wtime" type="radio" value="no" <%if wtime="no" then response.write" checked" end if%>>
        否 有发布时间</td>
      </tr>

    </table></td>
  </tr>
 </TABLE>
 			<p align="center"><INPUT name='Add' type='submit' value=' 修 改 ' style='cursor:hand;'>&nbsp;&nbsp;<INPUT name='Cancel' type='button' id='Cancel' value=' 取 消 ' onClick="window.location.href='default.asp'" style='cursor:hand;'></p>

</FORM>



</BODY></HTML>
