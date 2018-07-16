<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>港置地产代理(深圳)有限公司桂芳园分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="14">&nbsp;</td>
    <td width="302" valign="top"><table width="301" border="0" cellpadding="0" cellspacing="0" class="bk">
      <tr>
        <td><img src="images/jmwy_11.jpg" width="303" height="28" border="0" usemap="#Map2" /></td>
      </tr>
      <tr>
        <td align="center" style="padding:6px 0px 8px 0px;">
        <%
			set rs=server.CreateObject("ADODB.recordset")
			rs.open "select  title,img_sl,link_url from info_co where lm=1 and tuijian='yes' and pass='yes' order by px desc,id desc",conn,1,1
			if not rs.eof then
				a=1
				while not rs.eof
					if a=1 then
						files=rs("img_sl")
						a=2
					else
						files=files&"|"&rs("img_sl")
					end if
				rs.movenext
				wend
			%>
				<script>
				var swf_width=243;
				var swf_height=172;
				var files = "<%=files%>";
				var links = "";
				var texts = "";
				// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
				var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"
				
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
			%>
        
        
        </td>
      </tr>

    </table>
      <table width="300" border="0" align="center" cellpadding="0" cellspacing="0" class="bk" style="margin-top:13px; margin-bottom:13px;">
        <tr>
          <td><img src="images/jmwy_32.jpg" width="301" height="28" border="0" usemap="#Map3" /></td>
        </tr>
        <tr>
          <td><table width="302" border="0" align="center" cellpadding="0" cellspacing="0" class="fy" style="color:#525353; margin-bottom:9px;">
            <tr>
              <td align="center" style="color:#ff0000; line-height:35px;">房源地址</td>
              <td align="center" style="color:#ff0000; line-height:35px;">面积</td>
              <td align="center" style="color:#ff0000; line-height:35px;">价格</td>
              <td align="center" style="color:#ff0000; line-height:35px;">日期</td>
            </tr>
            <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select top 10 * from pro_co1 where pass='yes'  order by px desc,id desc"
				rs.open sql,conn,1,1
				while not rs.eof
			%>
            <tr>
              <td align="center" class="lj"> <a href="product_cs_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              <td align="center"><%=rs("pro_danwei")%></td>
              <td align="center"><%=rs("pro_money")%>元/月</td>
              <td align="center">[<%=formatdate(rs("wtime"))%>]</td>
            </tr>
            <%
				rs.movenext
				wend
				rs.close
				set rs=nothing
			%>
          </table></td>
        </tr>
      </table>
      <!--#include file="left_news.asp"-->
      </td>
    <td width="15">&nbsp;</td>
    <td width="653" valign="top"><table width="653" border="0" cellpadding="0" cellspacing="0" class="bk">
      <tr>
        <td background="images/jmwy_16.jpg"><table width="653" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="191"><img src="images/jmwy_14.jpg" width="191" height="28" /></td>
            <td align="right" style="padding-right:10px;"><a href="free.asp"><img src="images/jmwy_19.jpg" width="49" height="11" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td style="padding-top:22px;"><table border="0" align="center" cellpadding="0" cellspacing="0" class="fy">
          <tr>
          <%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select top 8 * from info_co where lm=2 and tuijian='yes' and pass='yes' "&sq&" order by px desc,id desc"
				rs.open sql,conn,1,1
				if not rs.eof then
				a=1
				while not rs.eof 
			%>
            <td width="156" height="165" align="center" valign="top"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="126" height="96" class="cpbk"><a href="free_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0"/></a></td>
              </tr>
              <tr>
                <td height="50" align="center" class="cpfy" style="line-height:18px;">
                	<table border="0" cellpadding="0" cellspacing="0">
                    	  <tr>
                              <td align="center" style="padding-top:5px;"><a href="free_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                            </tr>
                            <tr>
                              <td align="center"><%=rs("f_body")%><br />
                                <%=rs("info_from")%></td>
                            </tr>
                            <tr>
                              <td align="center" style="color:#d72815; font-weight:bold;"> <%=rs("info_author")%></td>
                            </tr>
                    </table>
                </td>
              </tr>
            </table></td>
             <%
				if a mod 4=0 then response.Write "<tr></tr>"
					a=a+1
					rs.movenext
					wend
				end if	
				rs.close
				set rs=nothing
			%>
          </tr>
        </table>
          </td>
      </tr>
    </table>
      <table width="653" border="0" cellpadding="0" cellspacing="0" class="bk" style="margin-top:10px;">
        <tr>
          <td background="images/jmwy_16.jpg"><table width="653" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="191"><img src="images/jmwy_35.jpg" width="191" height="28" /></td>
              <td align="right" style="padding-right:10px;"><a href="product.asp"><img src="images/jmwy_19.jpg" width="49" height="11" border="0" /></a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td style="padding-top:19px;"><table border="0" align="center" cellpadding="0" cellspacing="0" class="cpfy" style="line-height:18px; color:464646;">
            <tr>
               <%	
				set rs=server.CreateObject("adodb.recordset")
				sql="select top 8 * from pro_co where tuijian='yes' and pass='yes'  order by px desc,id desc"
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
					pageno=clng(pageno)
					rs.absolutepage=pageno
					a=1
					while not rs.eof and a<=pagenum
				%>
              <td width="160" height="182" align="center" valign="top">
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="130" height="92"><a href="product_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0"/></a></td>
                </tr>
                <tr>
                  <td align="center" style="padding-top:5px;"><a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                </tr>
                <tr>
                  <td align="center"><%=rs("pro_danwei")%><br />
                    <%=rs("pro_guige")%></td>
                </tr>
                <tr>
                  <td align="center" style="color:#d72815; font-weight:bold;"> <%=rs("pro_money")%></td>
                </tr>
              </table>
              </td>
              <%
				if a mod 4=0 then response.Write "<tr></tr>"
					a=a+1
					rs.movenext
					wend
				end if	
				rs.close
				set rs=nothing
			%>
            </tr>
          </table>
         
         </td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="14">&nbsp;</td>
    <td style="padding-top:13px; padding-bottom:20px;"><table width="972" border="0" cellpadding="0" cellspacing="0" class="bk">
      <tr>
        <td background="images/jmwy_16.jpg"><table width="972" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="191"><img src="images/jmwy_43.jpg" width="191" height="28" /></td>
            <td align="right"><span style="padding-right:10px;"><a href="star.asp"><img src="images/jmwy_19.jpg" width="49" height="11"  border="0"/></a></span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td style="padding-top:17px; padding-left:15px;"><table border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
          <%
				set rs=server.CreateObject("adodb.recordset")
				sql="select top 4 * from pro_co2 where tuijian='yes' and pass='yes'  order by px desc,id desc"
				rs.open sql,conn,1,1
				while not rs.eof
			%>
            <td width="250" height="131" valign="top"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="90" height="104"><a href="star_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>"  border="0" /></a></td>
                <td style="line-height:20px; padding-left:7px;"><table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" width="140">
                    	<tr>
                        	<td colspan="2" align="left" valign="middle" class="lj"><a href="star_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                        </tr>
                    	<tr>
                        	<td width="39">职务：</td>
                        	<td width="101"><%=rs("pro_danwei")%></td>
                        </tr>
                    	<tr>
                        	<td>区域：</td><td><%=rs("pro_color")%></td>
                        </tr>
                    	<tr>
                        	<td colspan="2" valign="top"><img src="images/jmwy_50.jpg"  /><%=rs("pro_guige")%></td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
            <%
				rs.movenext
				wend
				rs.close
				set rs=nothing
			%>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
<map name="Map2" id="Map2"><area shape="rect" coords="237,2,294,27" href="project.asp" /></map>
<map name="Map3" id="Map3"><area shape="rect" coords="243,4,295,25" href="product_cs.asp" /></map>
<!--#include file="botton.asp"-->
</body>
</html>
