<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%

id=trim(request.QueryString("id"))

if id<>"" then
  if not isnumeric(id) then
    call msg("参数错误","")
  else
    id=clng(id)
  end if
end if

set rs=server.CreateObject("adodb.recordset")
rs.open "select * from info_co where pass='yes' and id="&id&" order by px desc,id desc",conn,1,2
  rs("read_num")=rs("read_num")+1
  rs.update()
  n_title=rs("title")
  n_wtime=rs("wtime")
  n_read_num=rs("read_num")
  n_z_body=rs("z_body")
rs.close
set rs=nothing
%>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<div id="main">
		<!--#include file="banner.asp"-->
    <div id="indProList">
    	<p class="indProTitle1">产品类别</p>
        <div class="indPlist">
        	<p class="indPimg"><%
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
%></p>
            <ul class="indPlist1">
            	  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
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
      <div id="indPro">
        	<p class="nindProTitle">新闻中心</p>
            <div style="padding:15px; line-height:180%; padding-top:25px;_height:400px;min-height:400px;">
             <table width="98%" align="center" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="line-height:180%; padding:10px 0 5px 0;" align="center" valign="bottom"><span style="font-size:14px;"><%=n_title%></span></td>
                </tr>
                <tr>
                    <td height="20" align="right" style="border-top:1px dotted #C7C7C7;font-size:12px;">发布日期:<%=FormatDateTime(n_wtime,2)%> &nbsp;  | &nbsp; 阅读:<%=n_read_num%></td>
                </tr>
                <tr>
                  <td><table width="98%" align="center">
                    <tr>
                      <td style="font-size:12px; padding-top:3px; line-height:22px;"><%=n_z_body%></td>
                    </tr>
                  </table></td>
                </tr>
                <tr><td height="10px"></td></tr>
                <tr>
                    <td height="30" align="right" style="padding-right:20px;"><a href="javascript:history.go(-1)">[ 返回 ]</a></td>
                </tr>
              </table>
            </div>
       <div class="clear"></div>
<!--<div class="page" style="text-align:right;"><a href="javascript:history.back();">[回复]</a></div>-->
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--#include file="foot.asp"-->
</body>
</html>
