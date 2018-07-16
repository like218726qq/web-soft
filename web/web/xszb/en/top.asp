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
    <td width="333" height="88"><img src="images/sy_05.jpg" width="333" height="70" /></td>
    <td width="69">&nbsp;</td>
    <td width="578"><table width="555" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" align="right" style="background:url(images/an_02.jpg) no-repeat right; padding-right:40px;"><a href="../cn/index.asp" style="color:#CCC;">中文</a></td>
      </tr>
      <tr>
        <td height="64">
        
   <ul id="nav">
    <li><a href="index.asp" style="width:72px;" >HOME</a></li>
    <li><a href="about.asp">About Us</a>
        <ul style="">
              <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select lm,id,title,px from tol_co where lm=4 order by px desc,id desc"
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
    <li><a href="product.asp">Products</a>
        <ul>  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm_en from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm_en")%></a></li>
    <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
  </li>
    <li><a href="news.asp?lm=26">News</a>
        <ul>
			
                 <li><a href="news.asp?lm=26">Company News</a></li>
                <li><a href="news.asp?lm=25"> Industry News</a></li>
           
        </ul>
  </li>
    <li><a href="question.asp">Technology</a>
        <ul>
            <li><a href="question.asp">FAQ</a></li>
            <li><a href="down.asp">Download</a></li>
            <li><a href="shouhou.asp">Website</a></li>
        </ul>
  </li>
    <li><a href="contact.asp">Contact</a>
        <ul>
            <li><a href="job.asp">Recruitment</a></li>
            <li><a href="messages.asp">Message</a></li>
            <li><a href="contact.asp">Contact</a></li>
            <li><a href="map.asp">Map</a></li>
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
