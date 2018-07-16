<!--#include file="../inc.asp"-->
<%
'检查登录
checklogin
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>添加信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script language="javascript" src="../scripts/function.js"></script>
<script language = "JavaScript">
function Check(){
	var lm=document.form1.lm;
	var title=document.form1.title;
	var uselink=document.form1.uselink;
	var link_url=document.form1.link_url;
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
		alert("信息标题不能为空");
		title.focus();
		return false;
	}
	if((uselink.checked==true)&&(link_url.value=="http://"||link_url.value=="")){
		alert("请填写外部连接地址")
		link_url.focus()
		return false
	}
	if(px.value==""){
		alert("显示顺序不能为空")
		px.focus()
		return false
	}
}

<%

'连接数据库
openconn

set rs=server.CreateObject("adodb.recordset")
sql="select * from teach_lm  order by px desc,id_lm desc"
rs.open sql,conn
if not rs.eof  then
	response.write"shu_lm=new Array();"&chr(10)
	a=0
	while not rs.eof
		response.write "shu_lm["&a&"]=new Array('"&rs("id_lm")&"','"&rs("link_url")&"','"&rs("info_from")&"','"&rs("f_body")&"','"&rs("z_body")&"','"&rs("img_sl")&"','"&rs("wtime")&"','"&rs("s_pic")&"','"&rs("s_typ")&"','"&rs("s_wid")&"','"&rs("s_hei")&"','"&rs("dow_sl")&"','"&rs("vid_sl")&"');"&chr(10)
		a=a+1
		rs.movenext
	wend
	response.write"var counter="&a-1&";"&chr(10)
end if
rs.close
set rs=nothing
%>

function check_display(){
	var dis_uselink=document.getElementById("dis_uselink");
	var dis_info_from=document.getElementById("dis_info_from");
	var dis_f_body=document.getElementById("dis_f_body");
	var dis_z_body=document.getElementById("dis_z_body");
	var dis_img_sl=document.getElementById("dis_img_sl");
	var dis_dow_sl=document.getElementById("dis_dow_sl");
	var dis_vid_sl=document.getElementById("dis_vid_sl");
	var dis_wtime=document.getElementById("dis_wtime");
	var dis_frame1=document.getElementById("frame1");
	var lm=document.form1.lm.value;
	var img_sl=document.getElementById("img_sl").value;
	for (i=0;i<=counter;i++){
		if (lm==shu_lm[i][0]){
			(shu_lm[i][1]=="yes")?dis_uselink.style.display="":dis_uselink.style.display="none";
			(shu_lm[i][2]=="yes")?dis_info_from.style.display="":dis_info_from.style.display="none";
			(shu_lm[i][3]=="yes")?dis_f_body.style.display="":dis_f_body.style.display="none";
			(shu_lm[i][4]=="yes")?dis_z_body.style.display="":dis_z_body.style.display="none";
			if(shu_lm[i][5]=="yes"){
				dis_img_sl.style.display="";
				dis_frame1.src="uploadd.asp?frameid=frame1&kuang=img_sl&img_sl="+img_sl+"&s_pic="+shu_lm[i][7]+"&s_typ="+shu_lm[i][8]+"&s_wid="+shu_lm[i][9]+"&s_hei="+shu_lm[i][10];
			}else{
				dis_img_sl.style.display="none";
			}
			(shu_lm[i][11]=="yes")?dis_dow_sl.style.display="":dis_dow_sl.style.display="none";
			(shu_lm[i][12]=="yes")?dis_vid_sl.style.display="":dis_vid_sl.style.display="none";
			(shu_lm[i][6]=="yes")?dis_wtime.style.display="":dis_wtime.style.display="none";
			break;
		}
	}
}

</script>

</head>
<body >
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="100%" border="0"  cellpadding="2" cellspacing="1" class="border">  
    <tr class="topbg"> 
        <td  colspan="2"  align="center">信息中心管理----添加信息</td>  
    </tr>  
    <tr class="tdbg">   
        <td width="70" height="26" ><strong>管理导航：</strong></td>
        <td><a href="default.asp">信息管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加信息</a>&nbsp;</td>
    </tr>
</table>
<br />
<form method="POST" name="form1"  onsubmit="return Check()" action="addd.asp" >  
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
    <tr class="title">      
         <td  align="center" colspan="2"><b>添加信息</b></td>   
    </tr>    
    <tr class="tdbg"> 
        <td width="120" align="right"><strong>所属栏目：</strong></td> 
        <td>
	   <select name="lm" onChange="check_display()">
		<option value="n" selected>请选择栏目</option>
		<%
		'添加信息时显示栏目过程
		Set rsa= Server.CreateObject("ADODB.Recordset")
		sql="select id_lm,title_lm,add_xx,xia from teach_lm where fid=0 order by px desc,id_lm desc"
		rsa.open sql,conn,1,1
		while not rsa.eof 	
			i=""
			if rsa("add_xx")="yes" then
				response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
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
			sql="select id_lm,title_lm,add_xx,xia from teach_lm where fid="&fid&" order by px desc,id_lm desc"
			Set rsb= Server.CreateObject("ADODB.Recordset")
			rsb.open sql,conn,1,1
			while not rsb.eof
				if rsb("add_xx")="yes" then
					response.write"<option value="&rsb("id_lm")&">"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
				else
					response.write"<option value='no'>"&i&" 　|—"&rsb("title_lm")&"×</option>"&chr(10)
				end if
				call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
				rsb.movenext
			wend
			rsb.close
			set rsb=nothing
		end sub
		%>
	 </select>
         </td> 
    </tr>   
    <tr class="tdbg" >           
     <td width="120" align="right"><strong>信息标题：</strong></td>          
      <td ><input name="title" type="text" id="title"  size="44" maxlength="150">              
                <font color="#FF0000"> *</font> 
                <select name="color_font" id="select">
                  <option value="" selected>颜色</option>
                  <option value="#000000" style="background-color:#000000"></option>
                  <option value="#FFFFFF" style="background-color:#FFFFFF"></option>
                  <option value="#008000" style="background-color:#008000"></option>
                  <option value="#800000" style="background-color:#800000"></option>
                  <option value="#808000" style="background-color:#808000"></option>
                  <option value="#000080" style="background-color:#000080"></option>
                  <option value="#800080" style="background-color:#800080"></option>
                  <option value="#808080" style="background-color:#808080"></option>
                  <option value="#FFFF00" style="background-color:#FFFF00"></option>
                  <option value="#00FF00" style="background-color:#00FF00"></option>
                  <option value="#00FFFF" style="background-color:#00FFFF"></option>
                  <option value="#FF00FF" style="background-color:#FF00FF"></option>
                  <option value="#FF0000" style="background-color:#FF0000"></option>
                  <option value="#0000FF" style="background-color:#0000FF"></option>
                  <option value="#008080" style="background-color:#008080"></option>
                </select>
       </td >
    </tr>
    
    <tr  class="tdbg" id="dis_uselink" style="display:none;" >
    <td align="right"><strong>连接地址：</strong></td>
    <td><input name="link_url" type="text" id="link_url" size="58" maxlength="250"  value=""></td>
    </tr>
    <tr class="tdbg" id="dis_info_from" style="display:none;">           
         <td width="120" align="right"><strong>信息来源：</strong></td>          
         <td ><input name="info_from" type="text" id="info_from"   maxlength="50">
          &nbsp; 信息作者：<input name="info_author" type="text" id="info_author"   maxlength="50"/></td >
    </tr>
    <tr class="tdbg"  id="dis_f_body" style="display:none;">
        <td align="right" valign="top"><strong><br>信息精要：</strong></td>
        <td ><textarea name="f_body" cols="72" rows="4" id="f_body"></textarea></td>
    </tr>
    <tr class="tdbg" id="dis_z_body">          
        <td width="120" align="right" valign="middle"><p><strong>信息内容：<br></strong><br></td>
    <td >
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
    oFCKeditor.Value = ""
    oFCKeditor.Create "z_body"
    %>
    </td>        
    </tr>
    <tr class="tdbg" id="dis_img_sl" style="display:none;">          
        <td width="120" align="right"><strong>图片上传：</strong></td>          
        <td ><IFRAME name="frame1" id="frame1" style="margin-top:2px;"height=22 src="up.asp?frameid=frame1&kuang=img_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="img_sl" id="img_sl"></td>
    </tr>
    <tr class="tdbg" id="dis_dow_sl" style="display:none;">          
        <td width="120" align="right"><strong>文件上传：</strong></td>          
        <td ><IFRAME name="frame2" id="frame2" style="margin-top:2px;"height=22 src="upd.asp?frameid=frame2&kuang=dow_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="dow_sl" id="dow_sl"></td>
    </tr>
    <tr class="tdbg" id="dis_vid_sl" style="display:none;">          
        <td width="120" align="right"><strong>视频上传：</strong></td>          
        <td ><IFRAME name="frame3" id="frame3" style="margin-top:2px;"height=22 src="upv.asp?frameid=frame3&kuang=vid_sl" width="280" frameborder=0  scrolling=no  ></iframe><input type="hidden" name="vid_sl" id="vid_sl"></td>
    </tr>
    <tr class="tdbg" id="dis_wtime">
        <td width="120" align="right"><strong>发布时间：</strong></td>
        <td ><input name="wtime" type="text" id="wtime" value="<%=now()%>" maxlength="50">              时间格式为“年-月-日 时:分:秒”，如：<font color="#0000FF">2003-5-12 12:32:47</font></td>
    </tr>
  <tr class="tdbg">
    <td align="right"><STRONG>显示顺序：</STRONG></td>
    <td><input name="px" type="text" id="px" value="100" size="10" maxlength="10" >
      <FONT color=red>*(从大到小排序)</FONT></td>
  </tr> 
</table>

<p align="center">   
		<INPUT type="submit" id="b1" name="b1"   value=" 添 加 " > &nbsp;       <input name="Cancel" type="button" id="Cancel" value=" 取 消 " onClick="location='default.asp'" style="cursor:hand;">  </p><br>
	</form>
	  
	  
	  </body></html>
