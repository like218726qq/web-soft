<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("Parameter error","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("The information does not exist or has been deleted","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title_bl")
		pro_danwei=rs("pro_danwei_bl")
		pro_color=rs("pro_color_bl")
		pro_guige=rs("pro_guige_bl")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body_bl")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm_bl from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao="　"&rsa("title_lm_bl")
		title_lm=rsa("title_lm_bl")
	end if
	rsa.close
	set rsa=nothing

%>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
	<div id="logo"><div class="lan"><a href="../en/index.asp">English</a>　|　<a href="#">Idioma español</a></div></div>
    <div id="nav">
   <ul id="nav_ul">
        <li><a href="index.asp" class="b1"></a></li>
        <li><a href="about.asp" class="b2"></a></li>
        <li><a href="products.asp" class="b3 c3"></a></li>
        <li><a href="message.asp" class="b4"></a></li>
         <li><a href="service.asp?id=3" class="b5"></a></li>
        <li><a href="contact.asp?id=2" class="b6"></a></li>
   </ul>
    </div>
</div>
<div class="clear"></div>
<div id="main">
		<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">Categorías de productos</p>
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
	sql="select id_lm,title_lm_bl from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="products.asp?lm=<%=rs("id_lm")%>">• <%=rs("title_lm_bl")%></a></li>
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
        	<p class="nindProTitle">Productos mostrar　　<%=dao%></p>
            <div style="padding:5px; line-height:180%; padding-top:5px;_height:550px;min-height:550px;">
<table width="700"  border="0" align="center" cellspacing="1" bgcolor="#FFFFFF">
<tr>
                      <td width="400" rowspan="6" align="center" valign="middle" bgcolor="#F7F7F7"><a href="../<%=getbpic(img_sl,"d")%>" target="_blank"><img src="../<%=getbpic(img_sl,"d")%>" onload="if (this.width>400){this.height=400*this.height/this.width;this.width=400;}" /></a></td>
            <td width="114" height="22" align="right" bgcolor="#CCCCCC"><strong>Nombre del producto:</strong></td>
            <td width="176" bgcolor="#F7F7F7">&nbsp;<%=title%></td>
          </tr>
                    <tr>
                      <td height="19" align="right" bgcolor="#CCCCCC"><strong>No Procuct:</strong></td>
                      <td bgcolor="#F7F7F7">&nbsp;<%=pro_danwei%></td>
                    </tr>
                                        <tr>
                      <td height="19" align="right" bgcolor="#CCCCCC"><strong>Procuct modelo:</strong></td>
                      <td bgcolor="#F7F7F7">&nbsp;<%=pro_color%></td>
                    </tr>
                    <tr>
                      <td height="19" align="right" bgcolor="#CCCCCC"><strong>Precio:</strong></td>
                      <td bgcolor="#F7F7F7">&nbsp;<%=pro_guige%></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#CCCCCC"><strong>Más Información:</strong></td>
                      <td bgcolor="#F7F7F7">&nbsp;<%=f_body%></td>
                    </tr>
			        <tr>
                      <td height="19" align="right" bgcolor="#CCCCCC"><strong>&nbsp;Contador de visitas:</strong></td>
                      <td bgcolor="#F7F7F7">&nbsp;<%=read_num%></td>
                    </tr>
                    <tr bgcolor="D1E9A4">
                      <td height="30" colspan="3" bgcolor="#CCCCCC"><strong>&nbsp;Detalle:</strong></td>
          </tr>
                    <tr valign="top" bgcolor="#F7F7F7">
                      <td height="45" colspan="3" ><%=z_body%></td>
                    </tr>
            </table>
</div>
       <div class="clear"></div>
<div class="page" style="text-align:right;"><a href="javascript:history.Espalda();">[Espalda]</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
