<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="js/tbhb.js" ></script>

<link rel="stylesheet" type="text/css" href="css/tipswindown.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/tipswindown.js"></script>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">   
DD_belatedPNG.fix('.sub_0,.contact,.btnprev,');
</script>
<style type="text/css">
</style>
<div class="box-1">
  <div class="top">
    <div class="logo"><img src="images/ind_02a.jpg" /></div>
    <div class="right-top">
      <div class="search">
      
       <form id="sform" name="sform" method="get" action="product_show.asp">
       <table border="0" cellpadding="0" cellspacing="0">
       <tr><td style=" width:40px; height:20px;"></td><td style=" width:157px; height:20px;"><select name="id">
            <option value="" selected>所有产品</option>
            <%
			
            '添加信息时显示分类过程
            Set rsa= Server.CreateObject("ADODB.Recordset")
            sql="select id,title from pro_co order by px desc,id desc"
            rsa.open sql,conn,1,1
            while not rsa.eof 	
                i=""
                response.write"<OPTION value='"&rsa("id")&"'>• "&rsa("title")&"</OPTION>"&chr(10)
                rsa.movenext
            wend
            rsa.close
            set rsa=nothing
            
            
            %>
         </select></td><td style=" width:42px; " align="center"><input type="image" src="images/ind_12.png" style=" width:52px; height:13px;" align="" value=查询 name="Submit" /></td><td style=" width:30px"></td></tr>
       </table> </form>
      </div>
      <div class="language">
        <ul>
          <li>
          <%
		    if session("person")<>"" then
			    response.write "欢迎," + session("person") + "<a href='person_loginout.asp'>,退出</a>"
				
		    else
			    response.write ""
            end if
		  %>
          </li>
          <li><a href="../en/index.asp">[English]</a></li>
          <li><a href="index.asp">[简体中文]</a></li>
        </ul>
      </div>
    </div>
    <!--end right-top-->
    <div class="clear"></div>
      <div class="nav">
      <ul id="navtop">
    <li class="mainlevel" id="mainlevel_01"><a class="navtopa" href="index.asp">&nbsp;</a>
        <ul id="sub_01">
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_02"><a href="#">&nbsp;</a>
        <ul id="sub_02" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
              <li><a href="abou_t.asp">关于我们</a></li>
         <li><a href="team.asp">团队协作</a></li>
		 <li><a href="culture.asp">企业文化</a></li>
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_03"><a href="#">&nbsp;</a>
        <ul id="sub_03" class="sub_0" style=" background:url(images/topli_bg.png) left top no-repeat;">
         <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
          
          <li><a href="categry_view.asp?dlm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
         
         <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>   
            
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_04"><a href="#">&nbsp;</a>
        <ul id="sub_04" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
        <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            <li><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
 <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_05"><a href="download.asp">&nbsp;</a>
        <ul id="sub_05" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
       
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_06"><a href="#">&nbsp;</a>
        <ul id="sub_06" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
            <li><a href="contact.asp?id=4">联系我们</a></li>
            <li><a href="site.asp">站点地图</a></li>
            <li><a href="contact.asp?id=6">人才招聘</a> </li>
        </ul>
  </li>
    <div class="clear"></div>
</ul>
<script>
$(document).ready(function(){
  
  $('li.mainlevel').mousemove(function(){
  $(this).find('ul').slideDown();//you can give it a speed
  });
  $('li.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("fast");
  });
  
});
</script>
      </div>
  </div>
  <!--end top-->
  <div class="clear"></div>
  
</div>

