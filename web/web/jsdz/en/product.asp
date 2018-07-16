<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
<style type="text/css">
<!--
.STYLE1 {font-family: "Arial-PUA"}
-->
</style>
</head>
<%
	ejlx=html(request("ejlx"))
	ejfs=html(request("ejfs"))
	ejfg=html(request("ejfg"))
	ejxk=html(request("ejxk"))
	sjlx=html(request("sjlx"))
	sjpp=html(request("sjpp"))
	smlx=html(request("smlx"))
	if ejlx<>"" then
		if not checknum(ejlx) then
			call msg("Parameter error","")
		else
			sq=sq&" and ej_lx='"&ejlx&"'"
		end if
	end if
	if ejfs<>"" then
		if not checknum(ejfs) then
			call msg("Parameter error","")
		else
			sq=sq&" and ej_fs='"&ejfs&"'"
		end if
	end if
	if ejfg<>"" then
		if not checknum(ejfg) then
			call msg("Parameter error","")
		else
			sq=sq&" and ej_fg='"&ejfg&"'"
		end if
	end if
	if ejxk<>"" then
		if not checknum(ejxk) then
			call msg("Parameter error","")
		else
			sq=sq&" and ej_xk='"&ejxk&"'"
		end if
	end if
	if sjlx<>"" then
		if not checknum(sjlx) then
			call msg("Parameter error","")
		else
			sq=sq&" and sj_lx='"&sjlx&"'"
		end if
	end if
	if sjpp<>"" then
		if not checknum(sjpp) then
			call msg("Parameter error","")
		else
			sq=sq&" and sj_pp="&sjpp&""
		end if
	end if
	if smlx<>"" then
		if not checknum(smlx) then
			call msg("Parameter error","")
		else
			sq=sq&" and sm_lx="&smlx&""
		end if
	end if
	lm=request("lm")
	keyword=bsql(html(trim(request("keyword"))))
	
	if lm<>"" then
		if not checknum(lm) then
			call msg("Parameter error","")
		else
			lm=clng(lm)
			set rs=server.CreateObject("adodb.recordset")
			sql="select id_lm,fid,title_lm from pro_lm where id_lm="&lm&""
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
				dao=" &gt; "&title_lm
				sq=sq&" and lm="&lm&""
				pra="&lm="&lm&""
			end if
			rs.close
			set rs=nothing
		end if
	else
		sql="select id_lm,fid,title_lm from pro_lm order by id_lm asc"
		set rs=conn.execute(sql)
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=" &gt; "&title_lm
			sq=sq&" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	end if
	
	if keyword<>"" then
		dao=" &gt; Search Results"
		sq=sq&" and title like'%"&keyword&"%' or f_body  like'%"&keyword&"%' or z_body like '%"&keyword&"%' or  z_body_1 like '%"&keyword&"%' or z_body_2 like '%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
%>
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
<body>
<!--#include file="top1.asp"--> 
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
        <a name="#e0b98b" id="flash<%=i%>" href="<%=rs("link_url")%>" style="display:block;background:url(../<%=rs("img_sl")%>) repeat-x center"></a>
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
<div style="margin-top:20px; margin-bottom:20px; line-height:25px">
    <table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
        <tr>
          <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select id_lm,title_lm_en from pro_lm where fid=0 order by px desc,id_lm asc"
				rs.open sql,conn,1,1
				while not rs.eof
			%>
               	<td width="140px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('<%=i%>')">
                        <tr style="background-image:url(<%if lm=rs("id_lm") then%>images/down_05.jpg<%else%>images/down_11.jpg<%end if%>);">
                            <td width="10%" align="left"><img src="<%if lm=rs("id_lm") then%>images/down_03.jpg<%else%>images/down_09.jpg<%end if%>" /></td>
                            <td width="80%" style=" color:#FFFFFF" align="center";><a href="product.asp?lm=<%=rs("id_lm")%>" class="a1"><font style=" font-size:12px;<%if lm=rs("id_lm") then%>color:#fff<%end if%>"><%=rs("title_lm_en")%></font></a></td>
                            <td width="10%" align="right"><img src="<%if lm=rs("id_lm") then%>images/down_07.jpg<%else%>images/down_13.jpg<%end if%>" /></td>
                        </tr>
                    </table>
            	</td>
            <%
				rs.movenext
				wend
				rs.close
				set rs=nothing
			%>
        	<td>&nbsp;</td>
       	</tr>
   	</table>
   	<table border="0" cellpadding="0" cellspacing="0" width="1000px" style="border-top:1px solid #968177" align="center">
    	<tr>
        	<td width="211" height="10px"></td>
      </tr>
       	<tr>
           	<td valign="top">
            	<!--#include file="fanwei.asp"--> 
           	</td>
            <td width="789" valign="top">
  				<table border="0" cellpadding="0" cellspacing="0" width="100%">
                	<tr style="background-color:#FFFFFF">
                    	<td width="86%" align="right" style="color:#666666"><strong>Select View：</strong></td>
                    	<td width="14%" align="right" style="color:#666666">
                        <img src="images/2.jpg" border="0" usemap="#Map" />
                        <map name="Map" id="Map">
                          	<area shape="rect" coords="8,2,52,33" href="product2.asp" />
                        	<area shape="rect" coords="61,-3,102,35" href="product.asp" />
                        </map>
                        </td>
          			</tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                	<tr>
                     <%	
						set rs=server.CreateObject("adodb.recordset")
						sql="select * from pro_co where pass='yes' "&sq&" order by px desc,id desc"
						rs.open sql,conn,1,1
						if not rs.eof then
							pagenum=12
							rs.pagesize=pagenum
							counter=rs.recordcount
							pagezong=rs.pagecount
							pageno=trim(request.querystring("page"))
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
							i=0
							while not rs.eof and a<=pagenum
							if i<>0 and i mod 3=0 then
								response.Write("</tr><tr>")
							end if
					%>
						<td style=" border-bottom:1px dashed #000000">
                        	<table border="0" cellpadding="0" cellspacing="0" width="230px" style="margin:5px auto">
                            	<tr>
                                	<td align="center"><a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" /></a></td>
                                </tr>
                                <tr>
                                	<td align="center" style="font-size:18px; font-family:'微软雅黑'; font-weight:bold">
                                    <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title_en")%></a></td>
                                </tr>
                                <tr>
                                	<td align="center"><b><a href="product_show.asp?id=<%=rs("id")%>"><%=rs("pro_danwei")%></a></b></td>
                                </tr>
                            </table>
                        </td>								
					<%
							i=i+1
							a=a+1
							rs.movenext
							wend
						end if	
						rs.close
						set rs=nothing
					%>
                    </tr>
               </table>
               <div style="margin-top:10px">
				<%if pagenum<>"" then call listpageen(pra) end if%>
              </div>
           	</td>
   	  </tr>
   	</table>
</div>
<!--#include file="bottom.asp"--> 
</body>
</html>
