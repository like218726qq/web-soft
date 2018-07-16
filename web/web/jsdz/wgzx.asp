<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>

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
			sql="select top 3 * from info_co where lm=21 and pass='yes' order by px desc,id asc"
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
				sql="select top 3 * from info_co where lm=21 and pass='yes' order by px desc,id asc"
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
<table border="0" cellpadding="0" cellspacing="0" width="1005px" align="center" style="background:url(images/wg_03.jpg) no-repeat top">
	<tr><td height="80px"></td></tr>
	<tr>
    	<TD width="40PX">&nbsp;</TD>
        <%
			sql="select * from info_co where lm=6 order by px desc, id asc"
			set rs=conn.execute(sql)
			i=0
			do while not rs.eof 
			if i<>0 and i mod 3=0 then
				response.Write("<TD width='40PX'>&nbsp;</TD></tr><tr><TD width='40PX'>&nbsp;</TD>")
			end if
		%>
        	<td align="center" valign="bottom" width="300px"><a href="<%=rs("link_url")%>"><img src="<%=rs("img_sl")%>" style="margin-bottom:30px; margin-left:30px" onmousemove="test(this)" onmouseout="testOut(this)" /></a></td>
        <%
			i=i+1
			rs.movenext
			loop
			rs.close
		%>
        <TD width="40PX">&nbsp;</TD>
    </tr>
</table>
<script language="javascript" type="text/javascript">
function test(obj)
{
	obj.style.width='280'
	obj.style.height='120'
	obj.style. marginTop="-18"
	obj.style. marginLeft="25"
}
function testOut(obj)
{
	obj.style.width='238'
	obj.style.height='100'
	obj.style. marginTop="0"
	obj.style. marginLeft="30"
}
</script>
<!--#include file="bottom.asp"--> 
</body>
</html>
