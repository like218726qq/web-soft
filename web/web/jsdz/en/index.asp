<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" src="js/MSClass.js"></script>
<LINK rel=stylesheet type=text/css href="js/thl.css">
</head>
<body>
<!--#include file="top1.asp"--> 
<SCRIPT type=text/javascript src="js/jquery-1.7.2.min.js"></SCRIPT>
<SCRIPT type=text/javascript src="js/contentslider.js"></SCRIPT>
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
        	<a name="#FFF" id="flash<%=i%>" href="<%=rs("link_url")%>" style="display:block;background:url(../<%=getbpic(rs("img_sl"),"d")%>) repeat-x center"></a>
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

<table width="1000px" height="128" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    	<td width="35" valign="top"><img src="images/ind_25.jpg" style="margin-top:25px" /></td>
        <td width="925" height="100px" valign="top">
       	  <div class="flash_bar" style="height:90px">
          	<%
				sql="select * from info_co where lm=11 and pass='yes' order by px desc,id asc"
				set rs=conn.execute(sql)
				i=1
				do while not rs.eof
			%>
            	 <div class="<%if i=1 then%>dq<%else%>no<%end if%>"  id="f<%=i%>" onmousemove="changeflash(<%=i%>)" style="width:185px; height:90px text-align:center;" >
                 <IMG src="../<%=rs("img_sl")%>" width=150 height=65 onmousemove="test(this)" onmouseout="testOut(this)"></div>
			<%
				i=i+1
				rs.movenext
				loop
				rs.close
			%>
        </div>
      </td>
        <td width="40" valign="top"><img src="images/ind_28.jpg"  style="margin-top:25px" /></td>
  </tr>
</table>
<script language="javascript" type="text/javascript">
function test(obj)
{
	obj.style.width='200'
	obj.style.height='80'
	obj.style. marginTop="-8"
}
function testOut(obj)
{
	obj.style.width='160'
	obj.style.height='70'
	obj.style. marginTop="0"
}
</script>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-bottom:10px;">
	<tr>
    	<td width="337" valign="top">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr style=" background-image:url(images/ind_42.jpg)">
                	<td width="6%"><img src="images/ind_39.jpg" /></td>
                    <td width="78%" style="color:#FFFFFF; font-size:14px"><b>News</b></td>
                    <td width="16%"><a href="news.asp?lm=39" class="a1">More >></a></td>
                </tr>
                <tr>
                	<td colspan="3" style=" line-height:25px;border:1px solid #CCCCCC" height="170px">
						<%
                            sql="select top 1 * from info_co where lm=29 or lm=30 or lm=31 and pass='yes' and hot='yes' order by px desc,id desc"
                            set rs=conn.execute(sql)
                            if not rs.eof then
                        %>
                        <a href="news_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" style="float:left; margin:5px;" width="138" height="136" /></a>
                        <%
                            end if
                            rs.close
                        %>
                        <%
							sql="select top 6 * from info_co where lm=29 or lm=30 or lm=31 and pass='yes' and tuijian='yes' order by px desc,id desc"
							set rs=conn.execute(sql)
							do while not rs.eof
						%>
                        <a href="news_show.asp?id=<%=rs("id")%>" style="display:block; height:25px"><img src="images/ind_47.jpg" />&nbsp;<%=getstr(rs("title"),26)%></a>
                        <%
							rs.movenext
							loop
							rs.close
						%>
                    </td>
                </tr>
            </table>
      </td>
        <td width="7"></td>
        <td width="340" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
            	<tr style=" background-image:url(images/ind_42.jpg)">
                	<td width="8%"><img src="images/ind_39.jpg" /></td>
                    <td width="74%" style="color:#FFFFFF; font-size:14px"><b>Product</b></td>
                    <td width="18%" align="right"><a href="product.asp" class="a1">More >>&nbsp;&nbsp;</a></td>
              </tr>
                <tr>
                	<td colspan="3" style="border:1px solid #CCCCCC">
                    	<table border="0" cellpadding="0" cellspacing="0"align="center">
                            <tr>
                               	<td width="340">
                                  	<table width="337" border="0" cellpadding="0" cellspacing="0">
                                   	  <tr>
                                   		<td width="24" height="45" align="center"><img src="images/ind_25.jpg" width="25" id="r_r"  /></td>
                           		  <td>     
                       						<div id="MarqueeDiv" style="width:270px; height:170px; ">   
                          						<table height="170" border="0" cellpadding="0" cellspacing="0">
           							  <tr>
														<%	
                                                            set rs=server.CreateObject("adodb.recordset")
                                                            sql="select id,title_en,img_sl from pro_co where pass='yes' and tuijian='yes' order by px desc,id desc"
                                                            rs.open sql,conn,1,1
                                                            if not rs.eof then
                                                                a=1
                                                                while not rs.eof 
                                                        %>                                     
                                                  		<td width="130" height="108" style="padding-left:20px; line-height:20px" align="center">
                                                        <a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" width="130px" /></a><br />
														<a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title_en")%></a></td>
                                                        <%
                                                                a=a+1
                                                                rs.movenext
                                                                wend
                                                            end if	
                                                            rs.close
                                                            set rs=nothing
                                                        %>  
                                                  </tr>
                                             </table>                
                                    </div>           
                                     </td>    
                                        <td  width="25" height="45" align="center" ><img src="images/ind_28.jpg" width="25" id="r_l" /></td>
                                     </tr>
                                  </table>
                              </td>
                           </tr>
                         </table>  
                    </td>
                </tr>
            </table>
        </td>
        <td width="6"></td>
        <td width="340" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
            	<tr style=" background-image:url(images/ind_42.jpg)">
                	<td width="8%"><img src="images/ind_39.jpg" /></td>
                    <td width="76%" style="color:#FFFFFF; font-size:14px"><b>Industry information</b></td>
                    <td width="16%"><a href="news.asp?lm=32" class="a1">More >></a></td>
                </tr>
                <tr>
                	<td colspan="3" style=" line-height:25px;border:1px solid #CCCCCC" height="170px" valign="top">
                    	<table border="0" cellpadding="0" cellspacing="0" width="100%" >
                        <%
							sql="select top 6 * from info_co where lm=32 and pass='yes' and tuijian='yes' order by px desc,id desc"
							set rs=conn.execute(sql)
							do while not rs.eof
						%>
           	  			  	<tr>
                            	<td width="8%" align="center"><img src="images/ind_47.jpg" /></td>
                           	  <td width="69%"><a href="news_show.asp?id=<%=rs("id")%>"><%=getstr(rs("title"),30)%>...</a></td>
                           	  <td width="23%" align="right"><%=formatdate(rs("wtime"))%>&nbsp;</td>
                          	</tr>
                        <%
							rs.movenext
							loop
							rs.close
						%>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
  </tr>
</table>
<!--#include file="bottom.asp"--> 

<script type="text/javascript">
var rollBox= new Marquee("MarqueeDiv",2,0.1,290,170,20,2000,1000,301);
document.getElementById("r_l").onclick=function(){rollBox.Run("left")};
document.getElementById("r_r").onclick=function(){rollBox.Run("right")};
</script>
<LINK href="images/qq/qq.css" type=text/css rel=stylesheet>
<SCRIPT src="images/qq/ServiceQQ.htm"></SCRIPT>
</body>
</html>
