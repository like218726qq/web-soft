<!--include file="../html.conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="slide_10/scripts/scrollpic.js"></script>
<style type="text/css">
.rollBox ul,li{ margin:0px; padding:0px; list-style:none; }
.rollBox a{ color:#666; text-decoration:none; font-size:12px;}
.rollBox{width:980px;height:170px;position:relative;margin:0 auto; overflow:hidden; width:615px;}
.rollBox #pic_box{width:980px;height:170px; position:absolute; left:0px; top:0px; overflow:hidden;}
.rollBox .pic_item{ width:150px; height:170px; float:left;}
</style>
<!--十个产品-->
<table><tr><td>
<div class="page_on_left"><img id="r_l" src="images/PL.jpg"  width="52" height="53"  border="0"  style="cursor:pointer;"/></div>
</td><td>
<div class="rollBox">
    <div id="pic_box">
    <%
	set rs = server.createobject("adodb.recordset")
	sql="select top 10 * from pro_co where  tuijian='yes' order by px desc,id desc "
		  rs.open sql,conn,1,1
		  if not  rs.eof then
			while not rs.eof
			%>
         <div class="pic_item">
             <table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="140" height="140" align="center" style="border:1px solid #ccc;">
                <a href="products_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" border="0" /></a>
                </td>
              </tr>
              <tr>
                <td width="120" height="30" align="center">
                <div style="height:30px; overflow:hidden; display:none;"><a href="products_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></div>
                </td>
              </tr>
            </table>
            </div>
            <%
			rs.movenext
			wend
		  end if
		  rs.close
		  set rs=nothing
	%>
    </div>
</div>
</td><td>
<div class="page_on_right"><img id="r_r" src="images/PR.jpg"   width="52" height="53"  border="0" style="cursor:pointer;"/></div>
</td></tr></table>
<SCRIPT type="text/javascript">
		var scrollPic_02 = new ScrollPic();
		scrollPic_02.scrollContId   = "pic_box"; //内容容器ID
		scrollPic_02.arrLeftId      = "r_l";//左箭头ID
		scrollPic_02.arrRightId     = "r_r"; //右箭头ID

		scrollPic_02.frameWidth     = 980;//显示框宽度
		scrollPic_02.pageWidth      = 140; //翻页宽度

		scrollPic_02.speed          = 30; //移动速度(单位毫秒，越小越快)
		scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
		scrollPic_02.autoPlay       = true; //自动播放
		scrollPic_02.autoPlayTime   = 2; //自动播放间隔时间(秒)

		scrollPic_02.initialize(); //初始化				
</SCRIPT>