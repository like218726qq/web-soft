<!--#include file="conn.asp"-->
<%a=1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Torchlite Lighting Co. LTD</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
      <table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="message.asp"><img src="images/liuy.jpg" width="213" height="66" border="0" /></a></td>
        </tr>
      </table>
      <table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td background="images/fenl_beij.jpg">&nbsp;</td>
        </tr>
      </table>
      <table width="213" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="job.asp"><img src="images/zhaop.jpg" width="213" height="51" border="0"/></a></td>
        </tr>
      </table>
      <table width="213" height="48" border="0" cellpadding="0" cellspacing="0" background="images/fenl_beij.jpg">
        <tr>
          <td height="25" valign="bottom"><img src="images/fenl_di.jpg" width="213" height="4" /></td>
        </tr>
      </table></td>
    <td width="14" height="100">&nbsp;</td>
    <td width="545" valign="top" bgcolor="#f8f8f8"><table width="545" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="545" border="0" cellpadding="0" cellspacing="0" background="images/about.jpg">
          <tr>
            <td width="459" height="33">&nbsp;</td>
            <td width="86" align="center"><a href="about.asp" class="an"><img src="images/index_73.jpg" width="54" height="15" /></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td valign="top" class="about_font" style="padding-top:15px; padding-left:5px;">
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 1 id,title,img_sl from info_co where lm=6 order by px desc,id desc"
			rs.open sql,conn,1,1
			if not rs.eof then
				while not rs.eof
		%>
        <img src="../<%=rs("img_sl")%>" width="140" height="127" class="about_tu" />
        <%
				rs.movenext
				wend
			else
			response.Write("No information!")
			end if
			rs.close
			set rs=nothing
		%>
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from tol_co where id=7"
			rs.open sql,conn,1,1
			if not rs.eof then
				response.write rs("z_body")
			end if
			rs.close
			set rs=nothing
		%>
        </td>
      </tr>
    </table>
      <table width="545" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="545" border="0" cellpadding="0" cellspacing="0" background="images/news.jpg">
            <tr>
              <td width="459" height="33">&nbsp;</td>
              <td width="86" align="center"><a href="news.asp" class="an"><img src="images/index_73.jpg" width="54" height="15" /></a></td>
            </tr>
          </table></td>
        </tr>
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 1 id,title,z_body,wtime from info_co where hot='yes' and lm=4 order by px desc,id desc"
			rs.open sql,conn,1,1
			if not rs.eof then
				while not rs.eof
		%>
        <tr>
          <td class="news_font" style="padding-top:8px; padding-left:8px;">
          <span class="news_font" style="padding-top:8px; padding-left:8px;"><span class="news_font" style="padding-top:8px; padding-left:8px;"><img src="images/news_tu.jpg" width="84" height="68" class="about_tu" /></span></span><a href="news_show.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=getstr(rs("title"),70)%></a><br />
            <%=left(rs("z_body"),130)%></td>
        </tr>
        <%
				rs.movenext
				wend
			else
			response.Write("No information!")
			end if
			rs.close
			set rs=nothing
		%>
        <tr>
          <td style="padding-left:8px;">
             <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select top 4 id,title,z_body,wtime from info_co where tuijian='yes' and lm=4 order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
					while not rs.eof
			%>
            <table width="517" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="36" class="news_beij"><a href="news_show.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=getstr(rs("title"),70)%></a>&nbsp;&nbsp;<%=formatdate(rs("wtime"))%></td>
              </tr>
            </table>
			 <%
				a=a+1
				rs.movenext
				wend
			else
			response.Write("No information!")
			end if
			rs.close
			set rs=nothing
		%>
          </td>
        </tr>
      </table>
    </td>
    <td width="15">&nbsp;</td>
    <td width="215" valign="top"><table width="215" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="215" border="0" cellpadding="0" cellspacing="0" background="images/zuix_prod.jpg">
          <tr>
            <td width="159" height="32" class="tuij">Recommended</td>
            <td width="56" class="tuij_more"><a style="color:#FF6000;" href="hot_pro.asp">more+</a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="160" align="center" background="images/zuix_zhong.jpg">
        		<%
set rs=server.createobject("adodb.recordset")
sql="select top 3 * from info_co where pass='yes' and tuijian='yes' and lm=5 order by px desc,id desc"
rs.open sql,conn
dim strhtml
strhtml=""
  do while not rs.eof
	if strhtml="" then
	  strhtml="../"&getbpic(rs("img_sl"),"d")
	  link="hot_pro_show.asp?id="&rs("id")
	else
	  strhtml=strhtml&"|"&"../"&getbpic(rs("img_sl"),"d")
	  link=link&"|"&"hot_pro_show.asp?id="&rs("id")
	end if
  rs.movenext
  loop
rs.close
set rs=nothing
%>
<script type="text/javascript">
var swf_width=200;
var swf_height=144;
var files = "<%=strhtml%>";
var links = "<%=link%>";
var texts = "";
// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
var swf_config = "|2|||0xFFFFFF|0xFF6600||5|0|1|_blank"

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
document.write('<param name="movie" value="bcastr.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
document.write('<embed src="bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>	
        </td>
      </tr>
    </table>
      <table width="215" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="12"></td>
        </tr>
      </table>
      <table width="215" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="35" background="images/contact.jpg" class="font_" style="padding-left:40px;">Contact Us</td>
        </tr>
        <tr>
          <td class="cont_beij" style="padding-top:20px; padding-left:19px; padding-bottom:25px;">
          	 <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from tol_co where id=9"
			rs.open sql,conn,1,1
			if not rs.eof then
				response.write rs("z_body")
			end if
			rs.close
			set rs=nothing
		%>
          </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
