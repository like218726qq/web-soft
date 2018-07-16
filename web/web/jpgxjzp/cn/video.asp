<!--#include file="../html.conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.title.asp"-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script type="text/javascript" src="js/flash.js"></script>
</head>

<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<div class="cont">
<div class="contact">
<div class="contleft">
	<h4 class="cust"><b>消费导航</b> <span>CUSTOMER CENTER</span></h4>
    <div class="title">
    	<span class="hongtit"><a href="video.asp"><b>视频欣赏<br /></b><strong>Products</strong></a></span>
        <ul class="submenua" style="display:none;">
        <%
		'set rs = server.createobject("adodb.recordset")
'		  sql="select  * from pro_lm order by px desc,id_lm desc "
'		  rs.open sql,conn,1,1
'		  if not  rs.eof then
'		  while not rs.eof
'			%>
'            <!--<li>·<a href="products.asp?fid=<%'=rs("id_lm")%>"><%'=rs("title_lm")%></a></li>-->
'            <%
'		  rs.movenext
'		  wend	
'		  end if
'		  rs.close
'		  set rs=nothing
		 %>
        </ul>
        <ul class="video clear">
        	<li><a href="products.asp"><b>产品展示<br />
        	</b><strong>Products</strong></a></li>
              <li><a href="http://www.tx315.com/wlynfj.aspx" target="_blank"><b>防伪查询<br />
        	</b><strong>Security Check</strong></a></li>
            <li><a href="service.asp"><b>服务中心<br />
        	</b><strong>Service Center</strong></a></li>
            <li><a href="culture.asp"><b>品酒文化<br />
        	</b><strong>Wine Culture</strong></a></li>
        </ul>
    </div>
</div>
<div class="contright">
	<h4 class="contrtit"><b>视频欣赏<br /></b> <span>Video</span></h4>
    <ul class="pic">
    	<!--#include file="../html.video.asp"-->
    </ul>
    <!--#include file="../html.page_num.asp"-->
</div>
</div>
</div>
<!--#include file="../index.end.asp"-->
</body>
</html>