<style>
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
#nav_wrap{margin:0px auto;}
#nav li{ text-align:center;font-size:12px;}

/*New Nav Style*/
#nav_wrap { width:710px; overflow:hidden;  }
#nav{height:30px; position:relative; width:690px; margin:0 auto; }
#nav .l{ background:url(images/navnbg.gif) no-repeat 0px 0px; height:39px; width:2px; float:left}
#nav .r{ background:url(images/navnbg.gif) no-repeat -4px 0px; height:39px; width:2px; float:right}
#nav .bt_qnav { float:right; }	
#nav .bt_qnav a{ width:31px; height:29px; line-height:39px;display:block;padding:9px 2px 0 0;}
#nav .c{ float:left;margin:0;padding:0}

#nav li { float:left; list-style:none; }
#nav li .v a{width:93px; *width:80px;height:39px; line-height:33px; display:block; color:#FFF; background:url(images/navnbg.gif) no-repeat -87px 6px; float:left; font-family:"Microsoft Yahei";}
#nav li .v a:hover,#nav li .v .sele{color:#ff0000;}
#nav .kind_menu { height:29px;*height:29px; line-height:25px;vertical-align:middle; position:absolute; top:26px;*top:29px; left:70px; width:550px;text-align:left; display:none; color:#333333; }
#nav .kind_menu a {color:#333333;}
#nav .kind_menu a:hover { color:#FF0000;}

	
#tmenu{ background:url(images/nav_bg1.gif) repeat-x bottom; height:25px; }

</style>
<SCRIPT src="js/jquery.js" type=text/javascript></SCRIPT>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#000000">
	<tr>
    	<td align="center" height="120px">
            <table border="0" cellpadding="0" cellspacing="0" width="1000px" bgcolor="#000000">
                <tr>
                    <td width="294" rowspan="2"><a href="index.asp"><img src="images/ind_02.jpg" height="98" /></a></td>
                    <td width="706" height="48" align="right">
                    <form action="product.asp" method="post" name="form1">
          				<table width="334" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="109" align="center" style="color:#FFFFFF"><a href="index.asp" class="a1">中文</a> | <a href="en/" class="a1">English</a></td>
                                <td width="170" align="right"><input type="text" name="keyword" style="background-image:url(images/ind_05.jpg); border:0px; height:19px; width:138px; line-height:20px; padding-left:10px; color:#666666" value="请输入关键字" onclick="this.value=''"/></td>
                              	<td width="55" align="right"><input type="image" name="submit" src="images/ind_06.jpg" /></td>
                        	</tr>
                      	</table>
                     </form>
                    </td>
              </tr>
              <tr>
              	<td>
                	
<DIV id=nav_wrap>
<DIV id=nav>
<DIV class=l></DIV>
<UL class=c>
  <LI><SPAN class=v><A href="index.asp" class="a1">首页</A></SPAN></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="about.asp" class="a1">雅镭品牌</a></SPAN> 
  <DIV class=kind_menu style="left:5px">
  <table border="0" cellpadding="0" cellspacing="0" style=" background:url(images/top1_03.jpg) center no-repeat">
      <tr>
          <%
            set rs=server.CreateObject("adodb.recordset")
			set rs1=server.CreateObject("adodb.recordset")
            sql="select id,title from tol_co where lm=1 order by px desc,id asc"
            rs.open sql,conn,1,1
			rs1.open sql,conn,1,1
            while not rs.eof
			rs1.movenext
          %>
            <td height="17px" width="100px" align="center"><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
            <%if not rs1.eof then%><td height="17px" width="2px" align="center">|</td><%end if%>
          <%
            rs.movenext
            wend
            rs.close
			rs1.close
            set rs=nothing
          %>
      </tr>
  </table>
  </DIV></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="product.asp" class="a1">产品中心</a></SPAN> 
  <DIV class=kind_menu style="left:100px">
  <table border="0" cellpadding="0" cellspacing="0" style=" background:url(images/top1_03.jpg) center no-repeat">
      <tr>
		  <%
            set rs=server.CreateObject("adodb.recordset")
            set rs1=server.CreateObject("adodb.recordset")
            sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm asc"
            rs.open sql,conn,1,1
            rs1.open sql,conn,1,1
            while not rs.eof
            rs1.movenext
          %>
                <td height="17px" width="100px" align="center"><a href="product.asp?lm=<%=rs("id_lm")%>" class="a1"><%=rs("title_lm")%></a></td>
                <%if not rs1.eof then%><td height="17px" width="2px" align="center">|</td><%end if%>
          <%
            rs.movenext
            wend
            rs.close
            rs1.close
            set rs=nothing
          %>
      </tr>
  </table>
  </DIV></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="wgzx.asp" class="a1">网购中心</a></SPAN> 
  <DIV class=kind_menu style="left:100px">
  <table border="0" cellpadding="0" cellspacing="0" style=" background:url(images/top1_03.jpg) center no-repeat">
      <tr>
		  <%
            sql="select * from info_co where lm=6 order by px desc, id asc"
            set rs=conn.execute(sql)
            set rs1=conn.execute(sql)
            do while not rs.eof 
            rs1.movenext
          %>
           		<td height="17px" width="120px" align="center"><a href="<%=rs("link_url")%>" style="width:150px"><%=rs("title")%></a></td>
                <%if not rs1.eof then%><td height="17px" width="2px" align="center">|</td><%end if%>
          <%
            rs.movenext
            loop
            rs.close
          %>
  	  </tr>
  </table>
  </DIV></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="yinxiao.asp" class="a1">营销中心</a></SPAN> 
  <DIV class=kind_menu style="left:120px">
  <table border="0" cellpadding="0" cellspacing="0" style=" background:url(images/top1_03.jpg) center no-repeat">
      <tr>
		  <%
            set rs=server.CreateObject("adodb.recordset")
            sql="select id,title from tol_co where lm=3 order by px desc,id asc"
            rs.open sql,conn,1,1
            while not rs.eof
          %>
          	<td height="17px" width="100px" align="center"><a href="yinxiao.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
            <td height="17px" width="2px" align="center">|</td>
          <%
            rs.movenext
            wend
            rs.close
            set rs=nothing
          %>
          <td height="17px" width="100px" align="center"><a href="shenqing.asp">代理申请</a></td>
      </tr>
  </table>
  </DIV></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="service.asp" class="a1">服务支持</a></SPAN> 
  <DIV class=kind_menu  style="left:120px">
  <table border="0" cellpadding="0" cellspacing="0" style=" background:url(images/top1_03.jpg) center no-repeat">
      <tr>
  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=5 order by px desc,id asc"
	rs.open sql,conn,1,1
	while not rs.eof
  %>
  		<td height="17px" width="100px" align="center"><a href="service.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
            <td height="17px" width="2px" align="center">|</td>
  <%
	rs.movenext
	wend
	rs.close
	set rs=nothing
  %>
  
   <td height="17px" width="100px" align="center"><a href="download.asp">在线下载</a></td>
      </tr>
  </table>
  </DIV></LI>
  <li><SPAN class=v><a style="width:1px">|</a></SPAN></li>
  <LI><SPAN class=v><a href="#" class="a1">呀嘎啦社区</a></SPAN></LI>
  </UL>
<DIV class=r></DIV>
</DIV><!--nav-->
<DIV id=tmenu></DIV>
</DIV><!--nav_wrap-->
<SCRIPT type=text/javascript>
    var site_url = window.location.href.toLowerCase();	
	/*switch (true) {		
		default :
			$("#nav li").attr("class","");
			$("#nav li").eq(0).attr("class","nav_lishw");
			$(".nav_lishw .v a").attr("class","sele");
			$(".nav_lishw .kind_menu").show();
	} */
	$("#nav li").hover(
		function(){
			$("#nav .kind_menu").hide(); 
			$("#nav li .v .sele").attr("class","shutAhover");
			$(this).attr("id","nav_hover")
			$("#nav_hover .v a").attr("class","sele");
			$("#nav_hover .kind_menu").show(); 
		},
		function(){
			
			if($(this).attr("class") != "nav_lishw"){
				$("#nav_hover .v .sele").attr("class","");
				$("#nav_hover .kind_menu").hide(); 
			}
			$(this).attr("id","")
			$("#nav li .v .shutAhover").attr("class","sele");
			
		}
	);
	
</SCRIPT>
                </td>
              </tr>
            </table>
        </td>
    </tr>
</table>