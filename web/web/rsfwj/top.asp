<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="key.asp"-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" mce_src="js/DD_belatedPNG.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script> <![endif]-->
<script type="text/javascript" src="js/imgRule.js"></script>

</head>

<body>
<script src="js/shoucang.js" type="text/javascript"></script>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top_beij.jpg">
  <tr>
    <td align="center"><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="235" rowspan="2"><a href="index.asp"><img src="images/logo.jpg" width="235" height="89" /></a></td>
        <td height="49" align="right" valign="bottom" style="padding-right:39px;"><table width="126" border="0" cellspacing="0" cellpadding="0" background="images/top_you.jpg">
            <tr>
              <td height="20" align="center" class="top_you"><a href="#" style="behavior:url(#default#homepage)" onClick="setHomepage(location)">设为主页</a> | <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></td>
            </tr>
          </table>
            <table width="126" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/index_08.jpg" width="126" height="13" /></td>
              </tr>
          </table></td>
      </tr>
      <tr>
        <td height="40" align="left"><img src="images/nav.jpg" width="767" height="40" border="0" usemap="#Map" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<%
set rs=server.CreateObject("ADODB.recordset")
rs.open "select  title,img_sl,link_url from info_co where lm=43 and pass='yes' order by px desc,id desc",conn,1,1
if not rs.eof then
	a=1
	while not rs.eof
		if a=1 then
			files=rs("img_sl")
			links=rs("link_url")
			texts=rs("title")
			a=2
		else
			files=files&"|"&rs("img_sl")
			links=links&"|"&rs("link_url")
			texts=texts&"|"&rs("title")
		end if
	rs.movenext
	wend
%>
	<script>
    var swf_width=1002;
    var swf_height=401;
    var files = "<%=files%>";
    var links = "<%=links%>";
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
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" background="images/news_beij.jpg">
  <tr>
    <td width="42" height="39" align="right"><img src="images/news.jpg" width="35" height="39" /></td>
    <td width="70"><strong>公司新闻：</strong></td>
    <td width="890">
 <!--#include file="in_news.asp"-->
    
    </td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/index_16.jpg" width="1002" height="20" /></td>
  </tr>
</table>
<map name="Map" id="Map">
  <area shape="rect" coords="10,9,54,31" href="index.asp" />
  <area shape="rect" coords="102,7,167,35" href="about.asp" />
  <area shape="rect" coords="217,8,288,34" href="news.asp" />
  <area shape="rect" coords="333,9,398,34" href="product.asp" />
  <area shape="rect" coords="444,7,511,32" href="messages.asp" />
  <area shape="rect" coords="554,6,620,34" href="job.asp" />
  <area shape="rect" coords="664,8,732,33" href="contact.asp" />
</map>
