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
      
       <form id="sform" name="sform" method="get" action="product.asp">
       <table border="0" cellpadding="0" cellspacing="0">
       <tr><td style=" width:40px; height:20px;"></td><td style=" width:157px; height:20px;"><input type="text" style=" color:#FFFFFF;" name="keyword" id="keyword" value="please input keywords!" onFocus="this.value=''" /></td><td style=" width:42px; " align="center"><input type="image" src="images/ind_12.png" style=" width:52px; height:13px;" align="" value=查询 name="Submit" /></td><td style=" width:30px"></td></tr>
       </table> </form>
      </div>
      <div class="language">
        <ul>
          <li>
          <%
		    if session("person")<>"" then
			    response.write "Welcome," + session("person") + "<a href='person_loginout.asp'>,Quit</a>"
				
		    else
			    response.write ""
            end if
		  %>
          </li>
          <li><a href="#">[English]</a></li>
          <li><a href="#">[简体中文]</a></li>
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
    
    <li class="mainlevel" id="mainlevel_02"><a href="">&nbsp;</a>
        <ul id="sub_02" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
            <li><a href="abou_t.asp?">About us</a></li>
         <li><a href="culture.asp?id=8">Teamwork </a></li>
		 <li><a href="culture.asp?id=9">Our Culture </a></li>
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_03"><a href="">&nbsp;</a>
        <ul id="sub_03" class="sub_0" style=" background:url(images/topli_bg.png) left top no-repeat;">
         <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm,title_lm_en from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
        <%
		if session("person")="" and rs("id_lm")=1 then
		%>
            <li><a href="javascript:void(0);"  onclick="tipsWindown('Login reminder','url:get?test_jq.asp','380','240','true','','true','text'); " target="_self"><%=rs("title_lm_en")%></a></li>
        <%
		else
		%>    
          <li><a href="categry_view.asp?dlm=<%=rs("id_lm")%>"><%=rs("title_lm_en")%></a></li>
          <%
		  end if
		  %>
         <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>   
            
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_04"><a href="">&nbsp;</a>
        <ul id="sub_04" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
        <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=16 order by px desc,id_lm desc"
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
    
    <li class="mainlevel" id="mainlevel_05"><a href="">&nbsp;</a>
        <ul id="sub_05" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
         <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=17 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>         
            <li><a href="download.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
            <%	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
        </ul>
  </li>
    
    <li class="mainlevel" id="mainlevel_06"><a href="">&nbsp;</a>
        <ul id="sub_06" class="sub_0" style="background:url(images/topli_bg.png) left top no-repeat;">
            <li><a href="contact.asp?id=10">Contact Us</a></li>
            <li><a href="site.asp">Site Map</a></li>
            <li><a href="contact.asp?id=12">Jobs</a> </li>
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
  <div class="banner">
  <!--开始-->
  

	<DIV id=slide-box>
		
		<DIV class=slide-content id=J_slide>
		  <div class=wrap>
		    <ul class=ks-switchable-content>
		      <li><img alt="" src="images/banner_04.jpg" /></li>
		      <li><img alt="" src="images/banner_02.jpg" /></li>
		      <li><img alt="" src="images/banner_03.jpg" /></li>
		      <li><img alt="" src="images/banner_01.jpg" /></li>
	        </ul>
	      </div>
		  <DIV class=ks-switchable-triggers>
			  <A class=prev id=J_prev href="javascript:void(0);">
			  <B class=corner></B><SPAN class="btnprev">&nbsp;</SPAN><B class=corner></B></A> 
			  <A class=next id=J_next href="javascript:void(0);">
	      <B class=corner></B><p class="btnprev">&nbsp;</p><B class=corner></B></A>			</DIV>
		</DIV>
		<B class=corner></B>	
        </DIV>


<SCRIPT type=text/javascript>
	var D=YAHOO.util.Dom, E=YAHOO.util.Event;

	KISSY().use("*", function(S) {
		var el = D.get('J_slide'),
			activeIndex = parseInt(el.getAttribute('data-active-index')) || 0;

		var carousel = new S.Carousel(el, {
			hasTriggers: false,
			navCls: 'ks-switchable-nav',
			contentCls: 'ks-switchable-content',
			activeTriggerCls: 'current',
			effect: "scrollx",
			steps: 1,
			viewSize: [901],
			activeIndex: activeIndex
		});
		
		E.on('J_prev', 'click', carousel.prev, carousel, true);
		E.on('J_next', 'click', carousel.next, carousel, true);
	});

	KISSY().use("*", function(S) {
		var el = D.get('J_shoppingGuide');
		if(!el){
			return;
		}
		var	activeIndex = parseInt(el.getAttribute('data-active-index')) || 0;

		var carousel = new S.Carousel(el, {
			navCls: 'ks-switchable-nav',
			contentCls: 'ks-switchable-content',
			activeTriggerCls: 'current',
			effect: "scrollx",
			steps: 4,
			viewSize: [901],
			activeIndex: activeIndex
		});
		
		E.on('J_shoppingGuidePrev', 'click', carousel.prev, carousel, true);
		E.on('J_shoppingGuideNext', 'click', carousel.next, carousel, true);
	});
</SCRIPT>
<div class="cont">
<table border="0" align="right" cellpadding="0" cellspacing="0">
<tr><td style=" height:33px;" colspan="4"></td></tr>
<tr><td style=" width:55px; height:55px;"><img src="images/f.png" alt="" /></td><td style=" width:55px; height:55px;"><img src="images/q.png" alt="" /></td><td style=" width:55px; height:55px;"><img src="images/s.png" alt="" /></td>
<td style=" width:55px; height:55px;"></td>
</tr>
</table>
</div>
  <!--结束-->
  </div>
</div>

