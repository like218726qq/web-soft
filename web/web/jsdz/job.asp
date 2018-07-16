<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
	if id<>"" then
		id=request("id")
	else
		id="1"
	end if
%>
<body>
<!--#include file="top1.asp"--> 
<link rel="stylesheet" type="text/css" href="style/lanrenzhijia1.css" media="all" />
<script type="text/javascript" src="script/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){					   
$(".item1").hover(function(){$("#tit_fc1").slideDown("normal");	}, function() {$("#tit_fc1").slideUp("fast");});				
$(".item2").hover(function(){$("#tit_fc2").slideDown("normal");	}, function() {$("#tit_fc2").slideUp("fast");});
$(".item3").hover(function(){$("#tit_fc3").slideDown("normal");	}, function() {$("#tit_fc3").slideUp("fast");});
<!--$(".item4").hover(function(){$("#tit_fc4").slideDown("normal");	}, function() {$("#tit_fc4").slideUp("fast");});-->
});			   
var currentindex=1;
$("#flashBg").css("background-color",$("#flash1").attr("name"));
function changeflash(i) {	
currentindex=i;
for (j=1;j<=3;j++){  //此处的3代表你想要添加的幻灯片的数量与下面的5相呼应
	if (j==i) 
	{$("#flash"+j).fadeIn("normal");
	$("#flash"+j).css("display","block");
	$("#f"+j).removeClass();
	$("#f"+j).addClass("dq");
	$("#flashBg").css("background-color",$("#flash"+j).attr("name"));
	}
	else
	{$("#flash"+j).css("display","none");
	$("#f"+j).removeClass();
	$("#f"+j).addClass("no");}
}}
function startAm(){
timerID = setInterval("timer_tick()",5000);//5000代表间隔时间设置
}
function stopAm(){
clearInterval(timerID);
}
function timer_tick() {
    currentindex=currentindex>=3?1:currentindex+1;//此处的3代表幻灯片循环遍历的次数
	changeflash(currentindex);}
$(document).ready(function(){
$(".flash_bar div").mouseover(function(){stopAm();}).mouseout(function(){startAm();});
startAm();
});

 //]]>
</script>
<div id="Slidebox"> 
  <div id="flashBg">
    <div id="flashLine">
      <div id="flash"> 
      	<%
			sql="select top 3 * from info_co where lm=22 and pass='yes' order by px desc,id asc"
			set rs=conn.execute(sql)
			i=1
			do while not rs.eof
		%>
        <a name="#e0b98b" id="flash<%=i%>" href="<%=rs("link_url")%>" style="display:block;background:url(<%=rs("img_sl")%>) repeat-x center"></a>
		<%
			i=i+1
			rs.movenext
			loop
			rs.close
		%>
        <div class="flash_bar">
        	<%
				sql="select top 3 * from info_co where lm=22 and pass='yes' order by px desc,id asc"
				set rs=conn.execute(sql)
				i=1
				do while not rs.eof
			%>
            	 <div class="<%if i=1 then%>dq<%else%>no<%end if%>"  id="f<%=i%>"></div>
			<%
				i=i+1
				rs.movenext
				loop
				rs.close
			%>
        </div>
      </div>
    </div>
  </div>
</div>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">雅镭招聘</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=1">社会招聘</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="job.asp?id=2">校园招聘</a></td>
              	</tr>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="yinpin.asp">在线注册</a></td>
              	</tr>
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
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">当前位置：<a href="index.asp">首页</a> > <a href="job.asp">雅镭招聘</a> <%=dao%></td>
                </tr>
          </table>
          <br />
          <%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and lang='cn' and lm='"&id&"' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=3
		rs.pagesize=pagenum
		counter=rs.recordcount
		pagezong=rs.pagecount
		pageno=replace(trim(request.querystring("page")),"'","")
		if pageno="" or not isnumeric(pageno) then 
			pageno=1
		end if
		if pageno<1 then
		    pageno=1
		end if
		if pageno-pagezong>0 then 
			pageno=pagezong
		end if
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
	while not rs.eof and a<=pagenum
	%>	
    <div style="border:1px solid #CCCCCC; padding-left:20px; padding-right:20px; padding-top:20px; margin-top:20px; line-height:22px; width:92%">
        <h3 style="margin:0px; padding:0px; margin-bottom:10px"><%=a%>、<%=rs("title")%></h3>
        <b>具体要求：</b><br />
        <%=rs("z_body")%>
        <div align="center" style="margin-bottom:20px"><a href="yinpin.asp?job_title=<%=rs("title")%>"><img src="images/1.jpg" /></a></div>
    </div>
	<%
        a=a+1
        rs.movenext
        wend
        rs.close
        set rs=nothing
     %>
	<br>
	<TABLE width="100%" border=0 align="center" cellPadding=1 cellSpacing=1 bgColor=#CCCCCC style="margin-bottom:10px">
	  <TR>
		<TD align=middle bgColor="#f4f4f4"><%call listpage(key) %></TD>
	  </TR>
</TABLE>
	<%
	end if
	%>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
