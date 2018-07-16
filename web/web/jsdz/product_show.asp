<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		z_body_1=rs("z_body_1")
		z_body_2=rs("z_body_2")
		z_body_3=rs("z_body_3")
		z_body_4=rs("z_body_4")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
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
			sql="select top 3 * from info_co where lm=20 and pass='yes' order by px desc,id asc"
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
				sql="select top 3 * from info_co where lm=20 and pass='yes' order by px desc,id asc"
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
<div style=" margin-bottom:20px; line-height:25px">
	<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
    	<tr>
        	<td height="40px" style="line-height:40px">当前位置：<a href="index.asp">首页</a> > <a href="product.asp">产品中心</a> <%=dao%></td>
        </tr>
    	<tr>
        	<td height="40px"><font style="font-family:'微软雅黑'; font-size:20px; line-height:40px"><%=title%></font></td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
        <tr>
           	<td width="100px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('1')">
              <tr>
                        <td width="10%" align="right"><img src="images/down_03.jpg" id="img11" /></td>
                        <td width="81%" style="background-image:url(images/down_05.jpg); color:#FFFFFF" align="center"; id="td1">产品特征</td>
                        <td width="9%"><img src="images/down_07.jpg" id="img21" /></td>
                  </tr>
                </table>
       	  </td>
            <td width="100px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('2')">
                    <tr>
                        <td width="8%"><img src="images/down_09.jpg" id="img12" /></td>
                      <td width="84%" style="background-image:url(images/down_11.jpg); color:#FFFFFF" align="center"; id="td2">规格参数</td>
                      <td width="8%"><img src="images/down_13.jpg" id="img22" /></td>
                  </tr>
                </table>
         	</td>
            <td width="100px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('3')">
                    <tr>
                        <td width="8%"><img src="images/down_09.jpg" id="img13" /></td>
                      <td width="84%" style="background-image:url(images/down_11.jpg); color:#FFFFFF" align="center"; id="td3">产品实拍</td>
                        <td width="8%"><img src="images/down_13.jpg" id="img23" /></td>
                  </tr>
                </table>
         	</td>
            <td width="100px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('4')">
                    <tr>
                        <td width="8%"><img src="images/down_09.jpg"  id="img14"/></td>
                      <td width="84%" style="background-image:url(images/down_11.jpg); color:#FFFFFF" align="center"; id="td4">个性定制</td>
                      <td width="8%"><img src="images/down_13.jpg"  id="img24"/></td>
                  </tr>
                </table>
         	</td>
            <td width="100px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('5')">
                    <tr>
                        <td width="8%"><img src="images/down_09.jpg"  id="img15"/></td>
                      <td width="84%" style="background-image:url(images/down_11.jpg); color:#FFFFFF" align="center"; id="td5">立即购买</td>
                      <td width="8%"><img src="images/down_13.jpg"  id="img25"/></td>
                  </tr>
                </table>
         	</td>
        	<td>&nbsp;</td>
       	</tr>
   	</table>
   	<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="border:1px solid #CCCCCC">
    	<tr>
        	<td align="right"><!-- Baidu Button BEGIN -->
    <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" style="text-align:right; float:right">
        <span class="bds_more">分享到：</span>
        <a class="bds_qzone"></a>
        <a class="bds_tsina"></a>
        <a class="bds_tqq"></a>
        <a class="bds_renren"></a>
		<a class="shareCount"></a>
    </div>
<script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>
<!-- Baidu Button END --></td>
        </tr>
        <tr>
        	<td>
            	<div id="div1" style="margin:10px"><%=z_body%></div>
                <div id="div2" style="margin:10px; display:none"><%=z_body_1%></div>
                <div id="div3" style="margin:10px; display:none"><%=z_body_2%></div>
                <div id="div4" style="margin:10px; display:none"><%=z_body_3%></div>
                <div id="div5" style="margin:10px; display:none"><%=z_body_4%></div>
            </td>
        </tr>
    </table>
</div>
<script language="javascript" type="text/javascript">
	function show(id){
		for(i=1; i<6; i++){
			document.getElementById("img1"+i).src="images/down_09.jpg"
			document.getElementById("img2"+i).src="images/down_13.jpg"
			document.getElementById("td"+i).style.background="url(images/down_11.jpg)"
		}
		document.getElementById("img1"+id).src="images/down_03.jpg"
		document.getElementById("img2"+id).src="images/down_07.jpg"
		document.getElementById("td"+id).style.background="url(images/down_05.jpg)"
		
		for(i=1; i<6; i++){
			document.getElementById("div"+i).style.display="none"
		}
		document.getElementById("div"+id).style.display="block"
	}
</script>
<!--#include file="bottom.asp"--> 
</body>
</html>
