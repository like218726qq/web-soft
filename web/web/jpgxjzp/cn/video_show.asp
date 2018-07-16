<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<%info()%>
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('.ydcon img,.ydcon input img,.ban,.ban li img');
</script>
</head>
<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="slide.3d.asp"-->
	<div class="body_bg">
    	<div class="line"></div>   
        <div class="listcon">
            <div class="listL">
            	<h4>学校设施</h4>
                <div class="Lcon">
                	<ul>
                    <%call info_lm_nav(40,"shool.asp")%>
                    </ul>
                </div>
            </div>
            <div class="listR">
            	<h5>您当前的位置：<a href="index.asp">首页</a> >> <a href="shool.asp">学校设施</a> >> <%=title_lm%> >> <%=title%>  </h5>
                <div class="Rcon">
                <style>
				.img0{ width:165px; height:106px; overflow:hidden; margin:5px auto 10px auto;}
				.txt0{ width:165px; height:25px; line-height:25px; overflow:hidden; margin:0 auto; text-align:center;}
				.img1{ width:105px; height:140px; overflow:hidden; margin:5px auto 8px auto;}
				.txt1{ width:105px; height:25px; line-height:25px; overflow:hidden; margin:0 auto; text-align:center;}
				</style>
                	<ul class="nobg" style="height:auto;">
                    <!--#include file="../html.video_show.asp"-->
                    </ul>
                     
                </div>
            	<div class="Rbut"><img src="images/listRbut.jpg" width="769" height="4" /></div>
            </div>
              <!--#include file="../html.page.asp"-->
        </div>
    </div>
<!--#include file="../index.end.asp"-->
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%info()%>
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
    	<!--#include file="../html.video_show.asp"-->
    </ul>
    <!--#include file="../html.page_num.asp"-->
</div>
</div>
</div>
<!--#include file="../index.end.asp"-->
</body>
</html>