<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	lm=request("lm")
	if lm<>"" then
		if not checknum(lm) then
			call msg("Parameter error","")
		else
			lm=clng(lm)
			sql="select id_lm,title_lm from info_lm where id_lm="&lm&""
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
			end if
			rs.close
			set rs=nothing
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
		sql="select top 1 id_lm,title_lm from info_lm where fid=28 order by px desc,id_lm asc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
%>
<body>
<!--#include file="top1.asp"--> 
<table  border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
<tr>
	<td>
<script>
var swf_width=995;
var swf_height=230;
var files = '<%
	dim temp
	sql="select * from info_co where lm=18 and pass='yes' order by px desc,id asc"
	set rs=conn.execute(sql)
	do while not rs.eof
		temp=temp&"../"&rs("img_sl")&"|"
	rs.movenext
	loop
	rs.close
	temp=mid(temp,1,len(temp)-1)
	response.Write(temp)
%>';
var links = "";
var texts = "";
// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque"><param name="wmode" value="transparent" />');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">News</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select id_lm,title_lm from info_lm where fid=28 order by px desc,id_lm asc"
					rs.open sql,conn,1,1
					while not rs.eof
				%>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></td>
              	</tr>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing
				%>
                 <tr>
                	<td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                   <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="video.asp">Video Center</a></td>
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
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">Current Location：<a href="index.asp">Home</a> > <a href="news.asp">News</a> <%=dao%></td>
                </tr>
          </table>
          <%
		  	sql="select top 1 * from info_co where pass='yes' and hot='yes' and lm="&lm&" order by px desc, id desc"
			set rs=conn.execute(sql)
			if not rs.eof then 
		  %>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:20px">
                <tr>
                    <td width="38%">
                        <img src="../<%=rs("img_sl")%>" width="218" height="160" />                    </td>
                  	<td width="62%" style="line-height:20px">
                   	<h2><%=mid(rs("title"),1,18)%></h2>
                        <%=rs("f_body")%><br /><br />
                        <a href="news_show.asp?id=<%=rs("id")%>">&lt;.......More.......&gt;</a>
                  </td>
              </tr>
           </table>
           <%
		   		end if
				rs.close
		   %>
           <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:20px; margin-bottom:20px">
           <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select id,title,color_font,wtime from info_co where pass='yes' "&sq&" order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					pagenum=15
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
					rs.absolutepage=pageno
					a=1
					while not rs.eof and a<=pagenum
			%>
				<tr>
                	<td width="3%" height="30px" align="center" style="border-bottom:1px dashed #CCCCCC"><img src="images/news_10.jpg" /></td>
                    <td width="86%" style="border-bottom:1px dashed #CCCCCC"><a href="news_show.asp?id=<%=rs("id")%>"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a></td>
                    <td width="11%" align="left" style="border-bottom:1px dashed #CCCCCC">[<%=formatdate(rs("wtime"))%>] </td>
           	 	</tr>
			<%
					a=a+1
					rs.movenext
					wend
				end if
				rs.close
				set rs=nothing
			%>
           </table>
           <%if pagenum<>"" then call listpage(pra) end if%>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
