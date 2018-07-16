<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息栏目管理----添加栏目</title>
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

</head>

<body >
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr  class="topbg">
    <td  colspan="2" align="center">信息栏目管理----添加栏目</td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="26"><STRONG>管理导航：</STRONG></td>
    <td height="26"><a href="default.asp">栏目管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加栏目</a></td>
  </tr>
</table>

<br />
<FORM name="form1" method="post" action="addd.asp" onSubmit="return check()">
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="border">
  <tr align="center">
    <td  colspan="2" class="title">添加栏目</td>
    </tr>
  <tr class="tdbg">
    <td width="120" align="right"><STRONG>上级栏目：</STRONG></td>
<td>
				<SELECT name='fid'>
				<OPTION value='0' selected>无{作为一级栏目}</OPTION>
				<%
				
				'连接数据库
				openconn
				
				'显示栏目
				Set rsa= Server.CreateObject("ADODB.Recordset")
				sql="select id_lm,title_lm,xia from info_lm where fid=0 and xia='yes' order by px desc,id_lm desc"
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
					sql="select id_lm,title_lm,xia from info_lm where fid="&fid&" and xia='yes' order by px desc,id_lm desc"
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
            </td>
  </tr>
  <tr class="tdbg">
    <td align="right"><STRONG>栏目中文名称：</STRONG></td>
    <td><INPUT name="title_lm" type="text" id="title_lm" size="30" maxlength="150">
     <FONT color=red>*</FONT></td>
  </tr>
  <tr class="tdbg">
    <td align="right"><STRONG>栏目英文名称：</STRONG></td>
    <td><INPUT name="title_lm_en" type="text" id="title_lm_en" size="30" maxlength="150"></td>
  </tr>
  <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="100" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr>  
  <tr class="tdbg">
    <td align="right"><STRONG>高级选项：</STRONG></td>
    <td>
      <input name="gao" type="checkbox" id="gao" value="yes" onClick="checkgao()">
    显示高级设置</td>
  </tr>
  
  <tr class="tdbg"  id="gaoji" style="display:none;">
    <td align="right">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30"><label>
          <input name="add_xx" type="radio" value="yes" checked>
          是
          <input type="radio" name="add_xx" value="no">
        否 可以添加信息</label></td>
      </tr>
      <tr>
        <td height="30"><label>
          <input name="xia" type="radio" value="yes" checked>
          是
          <input type="radio" name="xia" value="no">
        否 有下级栏目</label></td>
      </tr>
      <tr>
        <td height="30"><label>
          <input type="radio" name="link_url" value="yes">
          是
          <input name="link_url" type="radio" value="no" checked>
        否 有连接地址</label></td>
      </tr>
      <tr>
        <td height="30">
          <input type="radio" name="info_from" value="yes">
          是
          <input name="info_from" type="radio" value="no" checked>
        否 有信息来源和信息作者</td>
      </tr>
      <tr>
        <td height="30">
          <input type="radio" name="f_body" value="yes">
          是
          <input name="f_body" type="radio" value="no" checked>
        否 有简要介绍</td>
      </tr>
      <tr>
        <td height="30">
          <input name="z_body" type="radio" value="yes" checked>
          是
          <input type="radio" name="z_body" value="no">
        否 有详细介绍</td>
      </tr>
      <tr>
        <td height="30">
          <input type="radio" name="img_sl"  value="yes" onclick="document.getElementById('tr_s').style.display=''">
          是
          <input name="img_sl" type="radio"  value="no" checked onclick="document.getElementById('tr_s').style.display='none'">
        否 有图片上传</td>
      </tr>
      <tr id="tr_s" style="display:none;">
        <td height="30">
          <input type="radio" name="s_pic" id="s_pic" value="yes" onclick="document.getElementById('tb_s').style.display=''">
          是
          <input name="s_pic" type="radio" id="s_pic" value="no" checked  onclick="document.getElementById('tb_s').style.display='none'">
        否 生成缩略图
        <table border="0" cellspacing="0" cellpadding="2" id="tb_s" style="display:none;">
          <tr>
          <td>类型</td>
            <td>
            <select name="s_typ" id="s_typ">
                <option value="yes">固定尺寸</option>
                <option value="no" selected="selected">不超过尺寸</option>
            </select></td>
            <td>宽度</td>
            <td><input type="text" size="8" name="s_wid" /></td>
            <td>高度</td>
            <td><input type="text" size="8" name="s_hei" /></td>
          </tr>
        </table>

        </td>
      </tr>
      <tr>
        <td height="30">
          <input name="dow_sl" type="radio" value="yes">
          是
          <input name="dow_sl" type="radio" value="no" checked>
        否 有文件上传</td>
      </tr>
      <tr>
        <td height="30">
          <input name="vid_sl" type="radio" value="yes">
          是
          <input name="vid_sl" type="radio" value="no" checked>
        否 有视频上传</td>
      </tr>
      <tr>
        <td height="30">
          <input name="wtime" type="radio" value="yes" checked>
          是
          <input name="wtime" type="radio" value="no">
        否 有发布时间</td>
      </tr>

    </table></td>
  </tr>
</table>
<p align="center"><INPUT name="Add" type="submit" value=" 添 加 " style="cursor:hand;">&nbsp;&nbsp;<INPUT name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="window.location.href='default.asp'" style="cursor:hand;">
</p>
</form>
</body>
</html>
