<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=5 order by px desc,id desc"
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
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="js/DD.min.js" mce_src="js/DD.min.js"></script>
<script type="text/javascript">     /* EXAMPLE */ 
  DD_belatedPNG.fix('div,img');  
   
 </script> 
</head>

<body>

<!--TOP部分-->
<div id="TOP">
    <div id="TOPIN">
        <div id="LOGO"><A href="index.asp"><img src="images/index_02.jpg" width="549" height="87" /></A></div>
        <div id="top_right">
            <div id="link"><A href="#"><img src="images/index_05.jpg" /></A><A href="../en/index.asp"><img src="images/index_01_07.jpg" /></A></div>
            <div id="pt">24小时服务热线：020-28320269</div>
        </div>
        <div class="clear"></div>
    </div>
    <div id="NAV">
       <ul>
            <li><a href="index.asp" class="a1"></a></li>
            <li><a href="about.asp" class="a2"></a></li>
            <li><a href="service.asp" class="a3"></a></li>
            <li><a href="news.asp" class="a4"></a></li>
            <li><a href="price.asp" class="a5"></a></li>
            <li><a href="search.asp" class="a6"></a></li>
            <li><a href="jobs.asp" class="a7"></a></li>
            <li><a href="contact.asp" class="a8"></a></li>
         </ul>
    </div>
    
</div>


<!--MAIN部分-->
<div id="MAIN">
    <!--广告图部分-->
    <!--#include file="banner.asp"-->
    
    <!---->
    <div id="con_main">
        <div id="left">
            <div id="co">
                <div class="co_title"><img src="images/lx_03.jpg" /></div>
                <div class="co_list">
                    <ul>
                    <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=5 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
                        <li><img src="images/index_34.jpg" /><a href="contact.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%>
<li><img src="images/index_34.jpg" /><a href="message.asp">在线留言</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="cygj">
                <div class="cygj_title"><img src="images/1.jpg" /></div>
                <div class="cygj_list">
                    <ul>
<li><A href="callto://zedfreight/" target="_blank"><img src="images/2.jpg" /></A></li>
                        <li><A href="msnim:chat?contact=zedfreight@hotmail.com" target="_blank"><img src="images/3.jpg" /></A></li>
                        <li><A href="#" target="_blank"><img src="images/4.jpg" /></A></li>
                        <li><A href="mailto:postmaster@zedfreight.com" target="_blank"><img src="images/5.jpg" /></A></li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        
        <div id="right">
            <div id="right_pr_title">
                <h2><%=title%></h2>
                <span>您现在所在位置：首页 > 联系我们 > <%=title%></span>
                <div class="clear"></div>
            </div>
            <div id="right_pr_co">
            <div style="_height:320px; min-height:320px; height:auto"><%=z_body%>
            </div>
             <div class="right_pr_co_img"><img src="images/pro_11.jpg" /></div> 
            </div>
            <div class="clear"></div>
        </div>
        
    </div>
    <div class="clear"></div>
    
    <!--#include file="link.asp"-->
    <div class="clear"></div>
    
</div>

<!--BOT部分-->
<!--#include file="foot.asp"-->





</body>
</html>
