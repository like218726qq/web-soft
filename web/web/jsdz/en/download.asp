<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=5 order by px desc,id asc"
	end if
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
<table  border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
<tr>
	<td>
<script>
var swf_width=995;
var swf_height=230;
var files = '<%
	dim temp
	sql="select * from info_co where lm=17 and pass='yes' order by px desc,id asc"
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
               	  <b style="font-size:14px; color:#FFFFFF">Service Support</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select id,title from tol_co where lm=6 order by px desc,id asc"
					rs.open sql,conn,1,1
					while not rs.eof
				%>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="service.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              	</tr>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing
				%>
                <tr>
                	<td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                   <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="download.asp">Download</a></td>
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
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">Current Location：<a href="index.asp">Home</a> > <a href="service.asp">Service Support</a> > DownLoad</td>
                </tr>
          </table>
          <div style="margin-top:20px; margin-bottom:20px; line-height:25px">
          	<table border="0" cellpadding="0" cellspacing="0" width="90%">
          		<tr>
            		<%
						sql="select * from info_lm where fid=24"
						set rs=conn.execute(sql)
						i=1
						do while not rs.eof
					%>
                    	<td width="150px">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style=" cursor:pointer" onclick="show('<%=i%>')">
                                <tr>
                                    <td width="5%" align="right"><img src="<%if i=1 then%>images/down_03.jpg<%else%>images/down_09.jpg<%end if%>" id="img1<%=i%>" /></td>
                                    <td width="99%" style="background-image:url(<%if i=1 then%>images/down_05.jpg<%else%>images/down_11.jpg<%end if%>); color:#FFFFFF" align="center"; id="td1<%=i%>"><%=rs("title_lm")%></td>
                                    <td width="5%"><img src="<%if i=1 then%>images/down_07.jpg<%else%>images/down_13.jpg<%end if%>" id="img2<%=i%>" /></td>
                                </tr>
                            </table>
                        </td>
                <%
						i=i+1
						rs.movenext
						loop
						rs.close
					%>
                    <td>&nbsp;</td>
            	</tr>
          	</table>
            <table border="0" cellpadding="0" cellspacing="0" width="98%" style="border:1px solid #968177">
  <tr>
                	<td>
                    <%
						sql="select * from info_lm where fid=24"
						set rs=conn.execute(sql)
						i=1
						do while not rs.eof
					%>
                    	<table border="0" cellpadding="0" cellspacing="1" width="95%" style="margin:20px; <%if i<>1 then%>display:none<%end if%>" bgcolor="#CCCCCC" id="table<%=i%>">
                   	  		<tr style="background-color:#FFFFFF">
                            	<td width="10%" height="30px" align="center">No.</td>
                       			<td width="20%" align="center">Product Name</td>
                          		<td width="13%" align="center">Product Model</td>
                          		<td width="13%" align="center">File Type</td>
                       			<td width="31%" align="center">Remark</td>
                          		<td width="13%" align="center">Download</td>
                          	</tr>
                            <%
								sql="select * from info_co where lm="&rs("id_lm")&" and pass='yes' order by px desc, id desc"
								set rs1=conn.execute(sql)
								do while not rs1.eof
							%>
                            <tr style="background-color:#FFFFFF">
                            	<td width="10%" height="30px" align="center"><%=rs1("id")%></td>
                       			<td width="20%" align="center"><%=rs1("dow_pro")%></td>
                          		<td width="13%" align="center"><%=rs1("dow_xh")%></td>
                          		<td width="13%" align="center"><%=rs1("dow_name")%></td>
                       			<td width="31%" align="center"><%=rs1("dow_bz")%></td>
                          		<td width="13%" align="center"><a href="down.asp?filename=../<%=rs1("dow_sl")%>">Click download</a></td>
                          	</tr>
                            <%
								rs1.movenext
								loop
								rs1.close
							%>
                      </table>
                    <%
						i=i+1
						rs.movenext
						loop 
						rs.close
					%>
                  	</td>
                </tr>
            </table>
          </div>
          <script language="javascript" type="text/javascript">
		  	function show(id){
				for(i=1; i<<%=i%>; i++){
					document.getElementById("img1"+i).src='images/down_09.jpg';
					document.getElementById("img2"+i).src='images/down_13.jpg';
					document.getElementById("td1"+i).style.backgroundImage = "url(images/down_11.jpg)";
					document.getElementById("table"+i).style.display="none"
				}
				document.getElementById("img1"+id).src='images/down_03.jpg';
				document.getElementById("img2"+id).src='images/down_07.jpg';
				document.getElementById("td1"+id).style.backgroundImage = "url(images/down_05.jpg)";
				document.getElementById("table"+id).style.display="block"
			}
		  </script>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
