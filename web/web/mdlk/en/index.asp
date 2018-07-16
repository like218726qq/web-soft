<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<div id="main">
	<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">产品类别</p>
        <div class="indPlist">
        	<p class="indPimg">
            <%
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
%>
            </p>
            <ul class="indPlist1">
              <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 5 id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
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
    	<div id="indCompany">
        	<p class="indComT">公司简介</p>
            <ul class="indComM">
            	<li class="indComImg"><%
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
    var swf_width=179;
    var swf_height=177;
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
%></li>
                <li class="indComIntro"><% sql="select top 1 * from tol_co where lm=2 and id=7 order by px desc,id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
	%>
	<%=left(rs("z_body"),270)%>
<%
	end if
	rs.close
	set rs=nothing
	%>
                                     <span><a href="about.asp">更多&gt;&gt;</a></span> </li>
            </ul>
        </div>
        <div id="indContact">
        	<p class="indContactT">联系我们</p>
            <p class="indContactM"><span><img src="images/ind_16.jpg" /></span><% sql="select top 1 * from tol_co where lm=2 and id=6 order by px desc,id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
	%>
	<%=rs("z_body")%>
	<%
	end if
	rs.close
	set rs=nothing
	%></p>
        </div>
      <div id="indPro">
        	<p class="indProTitle">产品展示</p>
            <DIV class="indProMain" id=demo>	
                            <table cellPadding=0 align=center border=0 cellspace="0">
                              <tr> 
                                <td id=demo1 vAlign=top>
                                <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                                 
                                 <tr>
 <%
sql="select top 20 id,title,img_sl from pro_co where pass='yes' order by px desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof 
	   %>
                                 <td width="166" align="center" valign="middle">
            <ul>
            	<li><span class="indProImg"><a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" width="155" height="104" /></a></span><span class="indPorName"><a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></span></li>
            </ul></td>
<%
			  rs.movenext     
	  loop
	end if
	rs.close
	set rs=nothing%>
            
             </tr></table> 
      </td>
                                <td id=demo2 vAlign=top></td>
                              </tr>
                            </table>
                            <SCRIPT>
var speed=30
demo2.innerHTML=demo1.innerHTML
function Marquee1(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
} }
var MyMar1=setInterval(Marquee1,speed)
demo.onmouseover=function() {clearInterval(MyMar1)}
demo.onmouseout=function() {MyMar1=setInterval(Marquee1,speed)}
</SCRIPT>
</DIV>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
