<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" mce_src="js/DD_belatedPNG.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script> <![endif]-->
<table width="1120" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left">
      <table width="1002" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="0" height="64"></td>
        <td valign="bottom" >
        <div id="FrontColumns_navigation01-1324947504060" >
        <div class="nav" id="d2menubar_FrontColumns_navigation01-1324947504060">
        <ul>
       <li><a href="index.asp" class="b1" ></a></li>
       <li><a href="about.asp" class="b2" rel="summenu_FrontColumns_navigation01-1324947504060_2b9d4657-9b44-4bba-8040-6be51ba7b35b"></a></li>
       <li><a href="news.asp" class="b3" rel="summenu_FrontColumns_navigation01-1324947504060_b038860b-134f-43e1-928f-aaa7e74cb12d"></a></li>
       <li><a href="products.asp" class="b4" rel="summenu_FrontColumns_navigation01-1324947504060_4f5d299b-3c36-4a5d-9e68-561c96da3a26" ></a></li>
       <li><a href="service.asp" class="b5" rel="summenu_FrontColumns_navigation01-1324947504060_d4e4655c-45af-42e2-9f83-146deaa32fa1" ></a></li>
       <li><a href="contact.asp" class="b6" rel="summenu_FrontColumns_navigation01-1324947504060_b759d83a-5e89-4cbd-8f0b-5bc9864c53cc" ></a></li>
    </ul></div>
     <ul id="summenu_FrontColumns_navigation01-1324947504060_2b9d4657-9b44-4bba-8040-6be51ba7b35b" class="ddsubmenustyle">

                      <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=1 order by px desc,id desc"
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
                      <ul id="summenu_FrontColumns_navigation01-1324947504060_b038860b-134f-43e1-928f-aaa7e74cb12d" class="ddsubmenustyle">
                      <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=1 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

<li><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>

<%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>
                      </ul>
                        <ul id="summenu_FrontColumns_navigation01-1324947504060_4f5d299b-3c36-4a5d-9e68-561c96da3a26" class="ddsubmenustyle">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>

    <li><a href="products.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>

<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%> 
                      </ul>
                      <ul id="summenu_FrontColumns_navigation01-1324947504060_b759d83a-5e89-4cbd-8f0b-5bc9864c53cc" class="ddsubmenustyle">     
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=2 order by px desc,id desc"
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
                      <ul id="summenu_FrontColumns_navigation01-1324947504060_d4e4655c-45af-42e2-9f83-146deaa32fa1" class="ddsubmenustyle">      <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title from tol_co where lm=3 order by px desc,id desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
<li><a href="service.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
    rs.movenext
	wend
	rs.close
	set rs=nothing
%> 
                      </ul>
    </div>
    
        </td>
        <td width="0" valign="top"></td>
      </tr>
      <tr>
        <td height="36"></td>
        <td><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="155"  height="50" align="center" valign="middle"><div id="quick-nav" onmouseover="menu_drop('menu','block');" onmouseout="menu_drop('menu','none');">
	    <a href="#" onfocus="menu_drop('menu','block');" class="quick-a w_finder_h" ga="love/current16/neck/quick">快速导航</a>
	     <div id="menu">
		      <div id="menu-link">
				 
					<a id="link_mobile" href="products.asp" onClick="stat(this);">手机</a> 
					<a id="link_mobilex903" href='products.asp'></a>   
					<a id="link_mobilet703" href='products.asp'></a>   
					<a id="link_mobilea129" href='products.asp'></a>
					
				 	<a id="link_proreg" href="products.asp" onClick="stat(this);">产品注册</a> 
					<a id="link_verofi" href="products.asp" onClick="stat(this);">配件防伪查询</a>
					<a id="link_online" href="products.asp" onClick="stat(this);">在线购买</a>
					<a id="link_store" href="products.asp" onClick="stat(this);">全国专卖店</a>
					      
					<a id="link_network" href="service.asp" onClick="stat(this);">售后网点</a>
					<a id="link_faq" href="service.asp" onClick="stat(this);">常见问题</a>
					<a id="link_glossary" href="service.asp" onClick="stat(this);">专业词汇表</a>
					<a id="link_service" href="service.asp" onClick="stat(this);">服务政策</a>
					    	 
					<a id="link_smartmobile" href="news.asp" onClick="stat(this);">智能机资源</a>
					<a id="link_theme" href="news.asp" onClick="stat(this);">手机主题库</a>
					<a id="link_pc" href="news.asp">PC套件</a> 
					<a id="link_book" href="news.asp" onClick="stat(this);">产品说明书</a>
					<a id="link_soft" href="news.asp" onClick="stat(this);">手机软件</a>
					<a id="link_around" href="news.asp" onClick="stat(this);">趣味周边</a>
					
					<a id="link_real" href="jobs.asp" onClick="stat(this);" target="_blank">Real品牌展示</a>
					<a id="link_ulike" href="jobs.asp" onClick="stat(this);"  target="_blank">Ulike品牌展示</a>
					<a id="link_union" href="jobs.asp" onClick="stat(this);"  target="_blank">高校社团联盟</a>
					<a id="link_cumpus" href="jobs.asp" target="_blank" onClick="stat(this);" >OPPO人才招聘</a>
			</div>
			<div id="menu_bg"></div>
	    </div>
	</div></td>
            <td width="306"></td>
            <td width="288">
            <td width="253"  style="background:url(images/dh-_08.png) left no-repeat;"><table width="249" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="82" align="center" valign="middle" style=" padding-top:5px; line-height:5px;"><span class="STYLE1"><a href="person_reg.asp">注册</a> | <a href="person_login.asp">登录</a></span></td><form id="form1" name="form1" method="post" action="product.asp">
                <td width="115" align="right" valign="middle" style=" padding-top:5px; line-height:5px;"><input name="keyword" type="text" id="keyword" size="13" /></td>
                <td width="52" height="25" align="center" valign="middle">
                  <input type="submit" name="button" style=" background-image:url(images/btn.jpg); width:26px; height:21px; cursor:pointer" id="button" value="　" />                </td>
                </form>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    
    </td>
  </tr>
</table>