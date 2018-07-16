<table width="960" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="237" height="139" valign="top"><img src="images/index_03.gif" width="237" height="139" /></td>
                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><div align="right"><img src="images/index_05.gif" width="150" height="21" border="0" usemap="#Map2" /></div></td>
                  </tr>
                  <tr>
                    <td height="47"></td>
                  </tr>
                  <tr>
                    <td valign="top" align="left"><div  style="background:url(images/index_091.gif) no-repeat; width:696px; height:53px;" >
					<div id="menu">  
	<ul > 
                                <li class="aa"><a href="index.asp">首页</a></li> 
								
								
                                <li class="bb"><a   href="about.asp">公司介绍<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  
                               	  <ul> 
                                    <%
						set rs=server.CreateObject("adodb.recordset")
						
						sql="select id,title from tol_co where lm=3  order by px desc,id desc"
						rs.open sql,conn,1,1
						if not rs.eof then
						while not rs.eof
					%>
                                    <li ><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
                                        <%
				
						rs.movenext
						wend
						end if
						rs.close
						set rs=nothing
					%>
                                  </ul>
								  <!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->  
                                </li> 
								
                                <li class="cc"><a href="product.asp">产品展示<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  <ul> 
                               	   <%
										
									set rs=server.CreateObject("adodb.recordset")
									sql="select * from pro_lm where fid=0 order by px desc,id_lm desc"
									rs.open sql,conn,1,1
									if not rs.eof then
										while not rs.eof 
								%>
                                  <li><a href="product.asp?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li> 
										 <%
				
						rs.movenext
						wend
						end if
						rs.close
						set rs=nothing
					%>
                                    </ul>
									<!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->   
                                </li> 
								
                                <li class="dd"><a href="news.asp">新闻中心<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  <ul> 
                               	  <%
					
					set rs=server.CreateObject("adodb.recordset")
					sql="select * from info_lm where fid=2 order by px desc,id_lm desc"
					rs.open sql,conn,1,1
					if not rs.eof then
						while not rs.eof 
				
					%>
                                      <li><a href="news.asp?fid=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
								  <%
				
						rs.movenext
						wend
						end if
						rs.close
						set rs=nothing
					%>
                                    </ul>
									<!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->  
                                </li> 							
                                <li class="ee"><a href="shouhao.asp">售后支持<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  <ul>
                         <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select * from info_lm where fid=15 order by px desc,id_lm desc"
					rs.open sql,conn,1,1
					if not rs.eof then
					while not  rs.eof 
				%>
                                      <li><a href="shouhao.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
										  <%
				
						rs.movenext
						wend
						end if
						rs.close
						set rs=nothing
					%>
                                    </ul>
									<!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->  
                                </li> 
								
                                  <li class="ff"><a href="zhaoshuang.asp">招商代理<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  
                                    <ul> 
                              <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select * from info_lm where fid=9 order by px desc,id_lm desc"
					rs.open sql,conn,1,1
					if not rs.eof then
						while not rs.eof 
				%>
                                      <li><a  href="zhaoshuang.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
										 <%
				
						rs.movenext
						wend
						end if
						rs.close
						set rs=nothing
					%>
                                    </ul>
									<!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->  
                                </li> 
								<li class="gg">
      <a href="contact.asp">联系我们<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]>
        <table>
          <tr>
            <td><![endif]-->  
              <ul>  
                  <li><a  href="contact.asp">联系我们</a></li>
				<li><a  href="message.asp">客户留言</a></li>
              </ul><!--[if lte IE 6]>
            </td>
          </tr>
        </table>
      </a><![endif]-->  
    </li>
                        </ul>
						</div>
					</div></td>
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
      <tr>
        <td><img src="images/pro.jpg" width="960" height="242"  /></td>
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
<map name="Map2" id="Map2">
<area shape="rect" coords="30,2,68,17" href="index.asp" />
<area shape="rect" coords="103,3,148,17" href="../en/index.asp" /></map>