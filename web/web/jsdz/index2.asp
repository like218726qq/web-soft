<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
</head>

<body>
<link rel="stylesheet" type="text/css" href="style/lanrenzhijia.css" media="all" />
<script type="text/javascript" src="script/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){					   
$(".item1").hover(function(){$("#tit_fc1").slideDown("normal");	}, function() {$("#tit_fc1").slideUp("fast");});				
$(".item2").hover(function(){$("#tit_fc2").slideDown("normal");	}, function() {$("#tit_fc2").slideUp("fast");});
$(".item3").hover(function(){$("#tit_fc3").slideDown("normal");	}, function() {$("#tit_fc3").slideUp("fast");});
$(".item4").hover(function(){$("#tit_fc4").slideDown("normal");	}, function() {$("#tit_fc4").slideUp("fast");});
$(".item5").hover(function(){$("#tit_fc5").slideDown("normal");	}, function() {$("#tit_fc5").slideUp("fast");});
});			   
var currentindex=1;
$("#flashBg").css("background-color",$("#flash1").attr("name"));
function changeflash(i) {	
currentindex=i;
for (j=1;j<=5;j++){  //此处的3代表你想要添加的幻灯片的数量与下面的5相呼应
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
    currentindex=currentindex>=5?1:currentindex+1;//此处的3代表幻灯片循环遍历的次数
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
      <div id="flash" style="min-width:1000px"> 
      	<%
			sql="select top 5 * from info_co where lm=11 and pass='yes' order by px desc,id asc"
			set rs=conn.execute(sql)
			i=1
			do while not rs.eof
		%>
        	<a name="#FFF" id="flash<%=i%>" href="<%=rs("link_url")%>" style="display:block;background:url(<%=getbpic(rs("img_sl"),"d")%>) repeat-x center"></a>
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

<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
	<tr>
    	<td width="35"><img src="images/ind_25.jpg" /></td>
        <td width="925" height="100px">
       	  <div class="flash_bar" style="height:90px">
          	<%
				sql="select * from info_co where lm=11 and pass='yes' order by px desc,id asc"
				set rs=conn.execute(sql)
				i=1
				do while not rs.eof
			%>
            	 <div class="<%if i=1 then%>dq<%else%>no<%end if%>"  id="f<%=i%>" onmousemove="changeflash(<%=i%>)" style="width:185px; height:90px text-align:center;" >
                 <IMG src="<%=rs("img_sl")%>" width=150 height=65 onmousemove="test(this)" onmouseout="testOut(this)"></div>
			<%
				i=i+1
				rs.movenext
				loop
				rs.close
			%>
        </div>
      </td>
        <td width="40"><img src="images/ind_28.jpg" /></td>
  </tr>
</table>
<script language="javascript" type="text/javascript">
function test(obj)
{
	obj.style.width='200'
	obj.style.height='80'
	obj.style. marginTop="-10"
}
function testOut(obj)
{
	obj.style.width='160'
	obj.style.height='70'
	obj.style. marginTop="0"
}
</script>
</body>
</html>
