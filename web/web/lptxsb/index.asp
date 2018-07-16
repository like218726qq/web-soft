<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />

<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
    <!--新闻滚动-->


	<!-- js jquery-->
	<script type="text/javascript" src="oppo/jquery-1.4.1.min.js"></script>
	<!-- js functions-->
	<script type="text/javascript" src="oppo/newsScroll.js"></script>
    
    <!--新闻滚动 end-->


<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	color: #FFFFFF;
}
.STYLE4 {
	font-size: 14px;
	color: #4cdfaf;
}
.STYLE5 {color: #605c5c}
.STYLE8 {
	font-size: 12px;
	color: #909090;
}
#focus{width:100%;height:480px; text-align:center;}
#focus div{position:absolute;width:100%;height:480px;overflow:hidden;text-align:center;}
#focus img{width:0px;height:0px;}
#focus #focus_img{display:none;text-align:center;}
#focus_bg{background-repeat:no-repeat; background-position:center;background-image:none}
#focus_show{ float:left; margin-right:0px;text-align:center;}
#focus_show a{width:100%;display:block;height:480px;}
-->
</style>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="position:relative;">
  <tr>
    <td align="center" valign="middle" width="100%">
    
<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" style="position:absolute; top:0px; z-index:99">
  <tr>
    <td align="center" valign="middle">
    <!--#include file="top.asp"-->
    </td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="480" valign="top" style="z-index:0; height:500px;">
    <div id="focus">
    <div id="focus_bg"></div>
    <div id="focus_show"></div>
    <div id="focus_img">
<div name="focus_img" id="focus_1">images/01_01.jpg|product_show.asp?id=29|T100B四叶草</div>

<div name="focus_img" id="focus_2">images/02_01.jpg|product_show.asp?id=28|E80天狼星</div>

<div name="focus_img" id="focus_3">images/03_01.jpg|product_show.asp?id=31|T100A北斗星</div>

<div name="focus_img" id="focus_4">images/04_01.jpg|product_show.asp?id=27|F9A启明星</div>
    </div>
    <script type="text/javascript" src="js/focus.js"></script>
  </div>
  </td>
  </tr>
</table>

    </td>
  </tr>
</table>
<div style="width:100%; margin:0 auto">
<div id="newsbar">
					<a href="news.asp" target="_blank"  id="news_link"   title="进入新闻中心" class="w_finder_c">网站新闻</a>
					<div id="news_li">
						<ul id="roll_mask" style="margin-left:0px;">
                        <%
sql="select top 3 id,title,color_font,wtime from info_co where pass='yes' and lm=3 order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
							<li><a href="news_show.asp?id=<%=rs("id")%>" title="<%=left(rs("title"),26)%>"  target="_blank" class="w_finder_c"><%=left(rs("title"),26)%></a></li>
                            <%rs.movenext     
loop
	end if
	rs.close
	set rs=nothing%>
						</ul>
					</div>
					<a id="news_li_sleft"  href="javascript:void(0)"  title="上一条"></a>
					<a id="news_li_sright" href="javascript:void(0)"  title="下一条"></a>
					<div id="newsbarbg"></div>
				 </div>
                 
		<script type="text/javascript">
		    /** 初始化 */

			 
		 	$("#news_li").rowScroll({line:1,speed:200,left:"news_li_sleft",right:"news_li_sright",timer:"3000"});
		</script>
</div>
<table width="100%" align="center" >
<Tr>
<td align="center" valign="middle">
<table width="1002" align="center">
<tr><td align="center" valign="middle">
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="252" height="190" align="center" valign="bottom"><div id="shipinga" style="width:234px">
<script type="text/javascript">
var s1 = new SWFObject("images/flvplayer.swf", "single", "234", "179", "7");
s1.addParam("allowfullscreen", "true");
s1.addVariable("file", "f1.flv");
s1.addVariable("image", "images/preview.jpg");
s1.addVariable("width", "234");
s1.addVariable("height", "179");
s1.write("shipinga");
</script></div></td>
    <td width="393" align="left" valign="bottom" ><a href="down.asp"><img src="images/lp_07.jpg" width="383" height="180" /></a></td>
    <td width="357" align="left" valign="bottom"><a href="products.asp"><img src="images/lp_09.jpg" width="349" height="180" /></a></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
</td></tr>
</table>
</td>
</Tr>
</table>
<!--#include file="foot.asp"-->


</body>
</html>
