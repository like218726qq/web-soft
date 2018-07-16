<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=8 order by px desc,id desc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
%>
<body>
<!--#include file="top1.asp"--> 
<table  border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
<tr>
	<td>
<script>
var swf_width=995;
var swf_height=230;
var files = '<%
	dim temp
	sql="select * from info_co where lm=19 and pass='yes' order by px desc,id asc"
	set rs=conn.execute(sql)
	do while not rs.eof
		temp=temp&"../"&rs("img_sl")&"|"
	rs.movenext
	loop
	rs.close
	temp=mid(temp,1,len(temp)-1)
	response.Write(temp)
%>';
var links = "";
var texts = "";
// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque"><param name="wmode" value="transparent" />');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">Contact Us</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select id,title from tol_co where lm=8 order by px desc,id desc"
					rs.open sql,conn,1,1
					while not rs.eof
				%>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="contact.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              	</tr>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing
				%>
            
                <tr>
                	<td height="142px"></td>
                    <td height="142px"></td>
                </tr>
          </table>
   	  	</td>
   	  <td width="20px"></td>
      	<td valign="top" width="760px">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0px">
                <tr>
                  <td height="30px" style="background-image:url(images/news1_03.jpg)" >Current Location：<a href="index.asp">Home</a> > <a href="contact.asp">Contact Us</a> > <%=title%></td>
                </tr>
          </table>
          <div style="margin-top:20px; margin-bottom:20px; margin-right:20px; line-height:25px"><%=z_body%></div>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
