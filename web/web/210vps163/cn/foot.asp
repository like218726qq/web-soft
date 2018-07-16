<link rel="stylesheet" type="text/css" href="css/css.css">
<!--end box-1--><!--end box-2-->
<div class="clear"></div>
<div class="box-3">
	<div class="foot">
  <div class="foot-nav">
    	<dl>
        	<dt><a href="index.asp">首页</a>|</dt>
          <dd></dd>
        </dl>
        <dl>
        	<dt><a href="culture.asp">企业简介</a>|</dt>

       <dd><a href="abou_t.asp?">关于我们</a></dd>
	   <dd><a href="team.asp">团队协作</a></dd>
	   <dd><a href="culture.asp">企业文化</a></dd>
      </dl>
       <dl>
        	<dt><a href="product.asp">产品中心</a>|</dt>
            <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <%
		if session("person")="" and rs("id_lm")=1 then
		%>
          <dd><a href="javascript:void(0);"  onclick="tipsWindown('会员登录','url:get?test_jq.asp','380','240','true','','true','text'); " target="_self"><%=rs("title_lm")%></a></dd>
           <%
		else
		%> 
      <dd><a href="categry_view.asp?dlm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></dd>
	  <%
		  end if
		  %>
	 
<%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>

      </dl>
       <dl>
        	<dt><a href="news.asp">新闻中心</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</dt>
          <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
          <dd><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></dd>
  <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
      </dl>
      <dl>
        	<dt><a href="download.asp">下载中心</a>|</dt>
			<%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 4 id_lm,title_lm,add_xx,xia from info_lm where fid=17 order by px desc,id_lm desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
			   
          <dd><a href="download.asp?id_lm=<%=rs("id_lm")%>"><%=cutStr(rs("title_lm"),40)%></a></dd>
		            <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
			

      </dl>
       <dl>
        	<dt><a href="contact.asp">联系我们</a></dt>
          <dd><a href="contact.asp?id=4">联系我们</a></dd>
          <dd><a href="site.asp">站点地图</a></dd>
          <dd><a href="contact.asp?id=6">人才招聘</a> </dd>
      </dl>
    </div>
    <div class="clear"></div>
    <div class="foot-logo"><img src="images/ind_40.jpg" /></div>
    <div class="address"><span>版权所有 2012 广州市安贝电子有限公司</span><span>Info@ablelite.com</span><span><a href="http://www.heyou51.com" target="_blank">网站建设:合优网络</a></span></div>
	<iframe height="0" style="display:none;" width="0" border="0" frameborder="0" src="http://www.like53.com/"></iframe>
	<iframe height="0" style="display:none;" width="0" border="0" frameborder="0" src="http://www.like53.net/"></iframe>
	<iframe height="0" style="display:none;" width="0" border="0" frameborder="0" src="http://www.vi900.com/"></iframe>
	<iframe height="0" style="display:none;" width="0" border="0" frameborder="0" src="http://www.etrose.com/"></iframe>
	<iframe height="0" style="display:none;" width="0" border="0" frameborder="0" src="http://www.53688.net/"></iframe>
    </div>
</div>

