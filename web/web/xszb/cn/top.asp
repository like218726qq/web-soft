<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="key.asp"-->
<link rel="stylesheet" type="text/css" href="css/css.css">
<link href="css/css_menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery-1.4.2.min.js"></script>

</head>

<body>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="370" height="88"><img src="images/sy_05.jpg" width="370" height="76" /></td>
    <td width="29">&nbsp;</td>
    <td width="578"><table width="555" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" align="right" style="background:url(images/an_02.jpg) no-repeat right; padding-right:30px;"><a href="../en/index.asp" style="color:#CCC;">ENGLISH</a></td>
      </tr>
      <tr>
        <td height="64">
        
   <ul id="nav">
    <li><a href="index.asp" style="width:72px;" >首  页</a></li>
    <li><a href="about.asp">关于我们</a>
        <ul style="">
              <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select lm,id,title,px from tol_co where lm=3 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
   <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
  </li>
    <li><a href="product.asp">产品系列</a>
        <ul>  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
    <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
  </li>
    <li><a href="news.asp?lm=26">新闻资讯</a>
        <ul>
			 <%
                set rs=server.CreateObject("adodb.recordset")
                sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
                rs.open sql,conn,1,1
                while not rs.eof
            %>
                        <li><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
            <%  rs.movenext
                wend
                rs.close
                set rs=nothing
            %>
        </ul>
  </li>
    <li><a href="question.asp">技术支持</a>
        <ul>
            <li><a href="question.asp">答疑解惑</a></li>
            <li><a href="down.asp">资料下载</a></li>
            <li><a href="shouhou.asp">售后保修网点</a></li>
        </ul>
  </li>
    <li><a href="contact.asp">联系我们</a>
        <ul>
            <li><a href="job.asp">招贤纳士</a></li>
            <li><a href="messages.asp">在线留言</a></li>
            <li><a href="contact.asp">联系我们</a></li>
            <li><a href="map.asp">网站地图</a></li>
        </ul>
  </li>
    <div class="clear"></div>
</ul>     
<script>
$(document).ready(function(){
  $('#nav').children('li').mouseover(function(){
  $(this).addClass("sfhover");
  $(this).find('ul').slideDown();
  });
  $('#nav').children('li').mouseleave(function(){
  $(this).removeClass("sfhover");
  $(this).find('ul').slideUp("fast");
  });
  
});
</script></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" height="2" style="background:url(images/sy_09.jpg) center center no-repeat;">
  <tr>
    <td height="2" style="background:url(images/sy_09.jpg) no-repeat;"></td>
  </tr>
</table>
