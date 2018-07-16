<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width:1006px; height:426px;">
    <%
set rs=server.CreateObject("ADODB.recordset")
rs.open "select top 5 title,img_sl,link_url from info_co where lm=17 and pass='yes' order by px asc,id asc",conn,1,1
if not rs.eof then
	a=1
	while not rs.eof
		if a=1 then
			files="../"&rs("img_sl")
			links=rs("link_url")
			texts=rs("title")
			a=2
		else
			files=files&"|"&"../"&rs("img_sl")
			links=links&"|"&rs("link_url")
			texts=texts&"|"&rs("title")
		end if
	rs.movenext
	wend
%>
       <script>
var swf_width=1006;
	var swf_height=426;
	  var files = "<%=files%>";
    var links = "";
	var texts = "";
	// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
	var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"
	
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
%>

    </td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="9"></td>
  </tr>
</table>