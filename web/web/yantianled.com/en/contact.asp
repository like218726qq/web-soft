<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=2
	if id="" or not checknum(id) then
		call msg("Parameter error","")
	end if
		sql="select * from tol_co where id="&id&""
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof then
		call msg("The information does not exist or has been deleted","")
	else
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
%>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
	<div id="logo"><div class="lan"></div></div>
    <div id="nav">
   <ul id="nav_ul">
         <li><a href="index.asp" class="b1 c1"></a></li>
        <li><a href="about.asp" class="b2"></a></li>
        <li><a href="products.asp" class="b3"></a></li>
        <li><a href="news.asp" class="b4"></a></li>
        <li><a href="message.asp" class="b5"></a></li>
        <li><a href="contact.asp?id=2" class="b6"></a></li>
   </ul>
    </div>
</div>
<div class="clear"></div>
<div id="main">
		<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">产品类别</p>
        <div class="indPlist">
        	<p class="indPimg"><%
set rs=server.CreateObject("ADODB.recordset")
rs.open "select top 5 title,img_sl,link_url from info_co where lm=1 and pass='yes' order by px desc,id desc",conn,1,1
if not rs.eof then
	a=1
	while not rs.eof
		if a=1 then
			files="../"&rs("img_sl")
			links=rs("link_url")
			texts=rs("title")
			a=2
		else
			files=files&"|../"&rs("img_sl")
			links=links&"|"&rs("link_url")
			texts=texts&"|"&rs("title")
		end if
	rs.movenext
	wend
%>
	<script>
    var swf_width=187;
    var swf_height=151;
    var files = "<%=files%>";
    var links = "<%=links%>";
    var texts = "";
    // 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
    var swf_config = "|2|||0xFFFFFF|0xb70211||5|2|1|_blank"
    
    document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
    document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
    document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
    document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
    document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
    </script>
<%
end if
rs.close
set rs=nothing
%></p>
            <ul class="indPlist1">
            	  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="products.asp?lm=<%=rs("id_lm")%>">• <%=rs("title_lm")%></a></li>
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
            </ul>
            <p class="indPimg"><a href="products.asp"><img src="images/cp-_32.jpg" width="187" height="126" /></a></p>
        </div>
    </div>
    <div id="indRight">
      <div id="indPro">
        	<p class="nindProTitle">　　<%=title%></p>
            <div style="padding:15px; line-height:180%; padding-top:25px;_height:400px;min-height:400px;">

    <%=z_body%>

</div>
       <div class="clear"></div>
<div class="page" style="text-align:right;"><a href="javascript:history.back();">[后面]</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
