<!--#include file="conn.asp"-->
<%n=1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->


<div id="main">
   <!--banner-->
   <div id="banner">
   <%
	set rs=server.CreateObject("ADODB.recordset")
	rs.open "select * from info_co where lm=48 and pass='yes' order by px desc,id desc",conn,1,1
	if not rs.eof then
		a=1
		while not rs.eof
			if a=1 then
				files=rs("img_sl")
				links=rs("link_url")
				texts=rs("title")
				a=2
			else
				files=files&"|"&rs("img_sl")
				links=links&"|"&rs("link_url")
				texts=texts&"|"&rs("title")
			end if
		rs.movenext
		wend
	%>

      <script>
    	var swf_width=734;
		var swf_height=365;
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
   </div>
<!--微博栏-->
   <div class="wbl">
          <div class="weibo">
              <div class="clear"></div>
             <!--#include file="left_wb.asp"-->
          </div>
       </div>
   <div class="clear"></div>
   <!--加拿大-->
   <div class="marpar green">
      <div class="title"><a href="jnd.asp"><img src="images/index_08.jpg" /></a><span><img src="images/index_09.jpg" /></span></div>
      <a href="jnd.asp"><img src="images/index_10.jpg" /></a>
      
      <div class="mpul">
        <div id="MarqueeDiv2" style="width:300px; height:120px; ">
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=6 or lm in (select id_lm from info_lm where fid=6) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
            </div>
            <script type="text/javascript">
                var rollBox2= new Marquee("MarqueeDiv2",0,5,300,120,180,0,0,150);
            </script>
      </div>
      
</div>
   <!--美国-->
   <div class="marpar zise mar4">
      <div class="title"><a href="usa.asp"><img src="images/index_12.jpg" /></a><span><img src="images/index_11.jpg" /></span></div>
      <a href="usa.asp"><img src="images/index_13.jpg" /></a>
       <div class="mpul">
          <div id="MarqueeDiv3" style="width:300px; height:120px; ">
            <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=13 or lm in (select id_lm from info_lm where fid=13) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
         </div>
            <script type="text/javascript">
                var rollBox3= new Marquee("MarqueeDiv3",0,5,300,120,180,0,0,150);
            </script>
      </div>
</div>
   <!--英国-->
   <div class="marpar huse mar4">
      <div class="title"><a href="eng.asp"><img src="images/index_15.jpg" /></a><span><img src="images/index_14.jpg" /></span></div>
      <a href="eng.asp"><img src="images/index_16.jpg" /></a>
           <div class="mpul">
          <div id="MarqueeDiv4" style="width:300px; height:120px; ">
            <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=20 or lm in (select id_lm from info_lm where fid=20) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
            </div>
            <script type="text/javascript">
                var rollBox4= new Marquee("MarqueeDiv4",0,5,300,120,180,0,0,150);
            </script>
      </div>
</div>
   <!--澳洲-->
   <div class="marpar mehse">
      <div class="title"><a href="oz.asp"><img src="images/index_18.jpg" /></a><span><img src="images/index_17.jpg" /></span></div>
      <a href="oz.asp"><img src="images/index_19.jpg" /></a>
           <div class="mpul">
          <div id="MarqueeDiv5" style="width:300px; height:120px; ">
            <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=27 or lm in (select id_lm from info_lm where fid=27) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
            </div>
            <script type="text/javascript">
                var rollBox5= new Marquee("MarqueeDiv5",0,5,300,120,180,0,0,150);
            </script>
      </div>
</div>
   <!--德国-->
   <div class="marpar zhhse mar4">
      <div class="title"><a href="dg.asp"><img src="images/index_21.jpg" /></a><span><img src="images/index_20.jpg" /></span></div>
      <a href="dg.asp"><img src="images/index_22.jpg" /></a>
           <div class="mpul">
          <div id="MarqueeDiv6" style="width:300px; height:120px; ">
            <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=34 or lm in (select id_lm from info_lm where fid=34) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
            </div>
            <script type="text/javascript">
                var rollBox6= new Marquee("MarqueeDiv6",0,5,300,120,180,0,0,150);
            </script>
      </div>
</div>
   <!--亚洲-->
   <div class="marpar chse mar4">
      <div class="title"><a href="yz.asp"><img src="images/index_24.jpg" /></a><span><img src="images/index_23.jpg" /></span></div>
      <a href="yz.asp"><img src="images/index_25.jpg" /></a>
           <div class="mpul">
          <div id="MarqueeDiv7" style="width:300px; height:120px; ">
            <table border="0" cellpadding="0" cellspacing="0" align="center" width="300">
                <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 20 * from info_co where lm=41 or lm in (select id_lm from info_lm where fid=41) and hot='yes' and pass='yes'  order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof
                %>
              <tr>
                <td align="left" ><a href="index_show.asp?id=<%=rs("id")%>">·<%=rs("title")%></a></td>
              </tr>
                <%
                    rs.movenext
                    wend
                    rs.close
                    set rs=nothing
                %>
            </table>
            </div>
            <script type="text/javascript">
                var rollBox7= new Marquee("MarqueeDiv7",0,5,300,120,180,0,0,150);
            </script>
      </div>
</div>
   <div class="clear"></div>
</div>
<div id="footer">
<!--#include file="bottom.asp"-->
</div>
</body>
</html>
