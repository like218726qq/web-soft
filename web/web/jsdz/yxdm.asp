<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	sql="select top 1 * from info_co where lm=6 order by px desc, id desc"
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
<body>
<!--#include file="top1.asp"--> 
<SCRIPT type=text/javascript src="js/jquery-1.7.2.min.js"></SCRIPT>

<SCRIPT type=text/javascript src="js/contentslider.js"></SCRIPT>
<DIV style="TEXT-ALIGN: center" class=focus>
<DIV id=focus class=sliderwrapper>
<%
	sql="select * from info_co where lm=21 and pass='yes' order by px desc,id asc"
	set rs=conn.execute(sql)
	do while not rs.eof
%>
<DIV class=contentdiv><A href="<%=rs("link_url")%>" target=_blank><IMG src="<%=rs("img_sl")%>" height=400></A></DIV>
<%
	rs.movenext
	loop
	rs.close
%>
</DIV>

<DIV class=paginate_outbox style="display:none">
<DIV id=paginate-focus class="pagination section">
<I id=prev class=prev title=上一幅></I>
<DIV class=paginate_imgs >
<%
	sql="select * from info_co where lm=21 and pass='yes' order by px desc,id asc"
	set rs=conn.execute(sql)
	do while not rs.eof
%>
	<I class=toc style="width:170px; text-align:center;"><IMG src="<%=rs("img_sl")%>" width=160 height=70 onmousemove="test(this)" onmouseout="testOut(this)"><SPAN></SPAN></I>
<%
	rs.movenext
	loop
	rs.close
%>
</DIV><I id=next class=next title=下一幅></I></DIV></DIV></DIV>

<SCRIPT type=text/javascript>
//焦点图
featuredcontentslider.init({
id: "focus", //指定ID
contentsource: ["inline", ""], //有效值: ["inline", ""] 嵌入html or ["ajax", "path_to_file"] 嵌入utf-8文件
toc: "markup", //有效值: "#increment" 标记序号, "markup", ["markup1", "markup2", etc]标记具体内容
nextprev: ["", ""], //next_pre标记 ，如："上一条" "下一条"，设置为 "" 为不出现
revealtype: "mouseover", //鼠标事件有效值: "click" or "mouseover"
enablefade: [false, 0.15], // 切换褪色度 "true"or "false"
autorotate: [true, 3500], // 切换停留时间 "true"or "false"
onChange: function(previndex, curindex){ //触发处理； previndex 触发处理上一个记录； curindex 触发处理上一个记录 可以自定义函数控制；参考亲子网首页"亲子部落-相册"
}
});

function test(obj)
{
	obj.style.width='200'
	obj.style.height='80'
	obj.style. marginLeft="-20"
}
function testOut(obj)
{
	obj.style.width='160'
	obj.style.height='70'
	obj.style. marginLeft="0"
}
</SCRIPT>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">网购中心</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <%
					sql="select * from info_co where lm=6 order by px desc, id asc"
					set rs=conn.execute(sql)
					do while not rs.eof 
				%>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="<%=rs("link_url")%>"><%=rs("title")%></a></td>
              	</tr>
                <%
					rs.movenext
					loop
					rs.close
				%>
                <tr>
                	<td height="142px"></td>
                    <td height="142px"></td>
                </tr>
          </table>
   	  	</td>
   	  <td width="20px"></td>
      	<td valign="top" width="760px">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0px">
                <tr>
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">当前位置：首页 > 网购中心 > <%=title%></td>
                </tr>
          </table>
          <div style="margin-top:20px; margin-bottom:20px; margin-right:20px; line-height:25px"><%=z_body%></div>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
