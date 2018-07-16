<script type="text/javascript">

function on1()
{ 
    var d=document.getElementById("d");
	document.getElementById("d").style.background='url(images/tt/index_11_01.jpg)';
	document.getElementById("t1").style.background='url(images/tt/index_11_02.jpg)';
	document.getElementById("t2").style.background='url(images/tt/index_11_03.jpg)';
	document.getElementById("t3").style.background='url(images/tt/h_04.jpg)';
	document.getElementById("t4").style.background='url(images/tt/h_05.jpg)';
}

function on2()
{ 
    var d=document.getElementById("d");
	document.getElementById("d").style.background='url(images/tt/h_01.jpg)';
	document.getElementById("t1").style.background='url(images/tt/h_02.jpg)';
	document.getElementById("t2").style.background='url(images/tt/h_03.jpg)';
	document.getElementById("t3").style.background='url(images/tt/h_04.jpg)';
	document.getElementById("t4").style.background='url(images/tt/h_05.jpg)';
}
function on3()
{ 
    var d=document.getElementById("d");
	document.getElementById("d").style.background='url(images/tt/cy_01.jpg)';
	document.getElementById("t1").style.background='url(images/tt/h_02.jpg)';
	document.getElementById("t2").style.background='url(images/tt/index_11_03.jpg)';
	document.getElementById("t3").style.background='url(images/tt/cy_03.jpg)';
	document.getElementById("t4").style.background='url(images/tt/h_05.jpg)';
}

function on4()
{ 
    var d=document.getElementById("d");
	document.getElementById("d").style.background='url(images/tt/c_01.jpg)';
	document.getElementById("t1").style.background='url(images/tt/h_02.jpg)';
	document.getElementById("t2").style.background='url(images/tt/index_11_03.jpg)';
	document.getElementById("t3").style.background='url(images/tt/h_04.jpg)';
	document.getElementById("t4").style.background='url(images/tt/c_03.jpg)';
}
</script>
<table width="960" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="237" height="139" valign="top"><img src="images/logo.jpg" width="237" height="139" /></td>
                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><div align="right"></div></td>
                  </tr>
                  <tr>
                    <td height="47"></td>
                  </tr>
                  <tr>
                 <td valign="top" align="left"><div  style="background:url(images/index_091.gif) no-repeat; width:609; height:53px; border:0px none solid;" >
					<div id="menu">
                           <ul>
                                <li class="aa"><A href="index.asp">首页</A></li>
                                         <li class="bb"><A href="about.asp">公司介绍</A> 
                                                <ul>
                                                    <%
															set rs=server.CreateObject("adodb.recordset")
															
															sql="select id,title from tol_co where lm=7 order by px desc,id desc"
															rs.open sql,conn,1,1
															while not rs.eof
													 %>
													<li><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
													 <%
														rs.movenext
														wend
														rs.close
														set rs=nothing
													%>
                                                </ul>
                                         </li>
                                 		 
                                        <li class="cc"><A href="server.asp">服务项目</A> 
                                                <ul>
                                                     <%
															set rs=server.CreateObject("adodb.recordset")
															sql="select * from info_co where lm=42 order by px desc,id desc"
															rs.open sql,conn,1,1
															while not rs.eof
													%>
                                                    <li><a href="product.asp?id=<%=rs("id")%>" ><%=rs("title")%></a></li>
                                                        	
													 <%	rs.movenext
														wend
														rs.close
														set rs=nothing
													%>
                                                </ul>
                                        </li>
                                         <li class="dd"><A href="news.asp">新闻中心</A> 
                                                <ul>
                                                       <%
															set rs=server.CreateObject("adodb.recordset")
															sql="select * from info_lm where fid=2 order by px desc,id_lm desc"
															rs.open sql,conn,1,1
															while not rs.eof
													%>
                                                    <li><a href="news.asp?id_lm=<%=rs("id_lm")%>" ><%=rs("title_lm")%></a></li>
                                                        	
													 <%	rs.movenext
														wend
														rs.close
														set rs=nothing
													%>
                                                </ul>
                                        </li>
                                        <li class="ee"><A href="zcfg.asp">政策法规</A> 
                                               <ul>
                                                     <%
															set rs=server.CreateObject("adodb.recordset")
															sql="select * from info_lm where fid=32  order by px desc,id_lm desc"
															rs.open sql,conn,1,1
															while not rs.eof
													%>
                                                    <li><a href="zcfg.asp?id_lm=<%=rs("id_lm")%>" ><%=rs("title_lm")%></a></li>
                                                        	
													 <%	rs.movenext
														wend
														rs.close
														set rs=nothing
													%>
                                                </ul>
                                         </li>
                                        
                                         <li class="ff"><A href="bszn.asp">办事指南</A> 
                                                <ul>
                                                     <!--< %
															set rs=server.CreateObject("adodb.recordset")
															sql="select id,title from tol_co where lm=6 order by px desc,id desc"
															rs.open sql,conn,1,1
															while not rs.eof
													 %>
													<li><a href="bszn.asp?id=< %=rs("id")%>">< %=rs("title")%></a></li>
													 < %
														rs.movenext
														wend
														rs.close
														set rs=nothing
													%>-->
                                                </ul>
                                        </li>
                                         <li class="gg"><A href="contact.asp">联系我们</A> 
                                                <ul>
                                                    <li><A href="message.asp">客户留言</A></li>
                                                     <%
															set rs=server.CreateObject("adodb.recordset")
															sql="select id,title from tol_co where id=1 order by px desc,id desc"
															rs.open sql,conn,1,1
															while not rs.eof
													 %>
													<li><a href="contact.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
													 <%
														rs.movenext
														wend
														rs.close
														set rs=nothing
													%>
                                                </ul>
                                        </li>
							</ul>

					</div>
					</div>
                    <script type=text/javascript>
<!--
function menuFix() {
    var sfEls = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<sfEls.length; i++) {
        sfEls[i].onmouseover=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseDown=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseUp=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onmouseout=function() {
        this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
"");
        }
    }
}
window.onload=menuFix;
//-->
</script></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td></td>
          </tr>
        </table></td>
      </tr>
     <!-- <tr>
        <td id="d" style="background:url(images/tt/index_11_01.jpg)" width="960" height="277">
		</td>
      </tr>
	   <tr>
        <td  width="960" height="36">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" height="36">
	   <tr>
	   <td id="t1" align="center" width="25%" onmousemove="on1()" style="background:url(images/tt/index_11_02.jpg)" height="37"></td>
	   <td id="t2" width="25%" align="center" onmousemove="on2()" style="background:url(images/tt/index_11_03.jpg)" height="37"></td>
	   <td id="t3" width="25%" align="center" onmousemove="on3()" style="background:url(images/tt/h_04.jpg)" height="37"></td>
	   <td id="t4" width="25%" align="center" onmousemove="on4()" style="background:url(images/tt/h_05.jpg)" height="37"></td>
	   </tr></table>
      </td>
      </tr>-->
	  <tr>
        <td ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="960" height="313">
          <param name="movie" value="images/banner.swf" />
          <param name="quality" value="high" />
		  <param value="transparent" name="wmode" />
          <embed src="images/banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="960" height="313"></embed>
        </object></td>
      </tr>
      <tr>
        <td height="10"></td>
      </tr>
	  </table>
<map name="Map"><area shape="rect" coords="70,15,106,39" href="index.asp">
<area shape="rect" coords="147,17,207,39" href="about.asp">
<area shape="rect" coords="230,18,292,41" href="product.asp">
<area shape="rect" coords="317,16,382,39" href="news.asp">
<area shape="rect" coords="405,15,468,40" href="shouhao.asp">
<area shape="rect" coords="489,16,553,40" href="zhaoshuang.asp">
<area shape="rect" coords="573,15,638,40" href="contact.asp">
</map>
