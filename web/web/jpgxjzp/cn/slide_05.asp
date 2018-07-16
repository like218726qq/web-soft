<!--include file="../html.conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery-1.6.min.js"></script>
<script>
$(document).ready(function(){slide2();});
function slide2(){
	var curr=0;
	var btn=$(".slide_btn a");//alert(btn.length);
	var img=$(".slide_img .img");//alert(img.length);
	btn.each(function(i){
		$(this).click(function(){
			curr=i;
		  img.eq(i).fadeIn(4000).siblings(".img").fadeOut('slow');       
		  $(this).siblings("a").removeClass("one").end().addClass('one');
		  return false;
		});
	});	
	var timer = setInterval(function(){
            auto = (curr + 1) %btn.length;
			//alert(auto);
           btn.eq(auto).click();    
        },5000);btn.hover(      
            function(){   clearInterval(timer);}
			,
            function(){
                	timer=setInterval(function(){
                    auto = (curr + 1) % btn.length;btn.eq(auto).click();
                    },5000);
            });
	}
</script>
<div class="slide" style="height:auto; overflow:hidden; width:1002px; margin:0 auto;">
    <div style=" width:1002px; height:302px; overflow:hidden;background:url(1images/banner.jpg) center center no-repeat;" class="slide_img">
    <%
	lm0=16
	set rs = server.createobject("adodb.recordset")
	  sql="select  * from info_co where lm="&lm0&" order by px desc,id desc "
	  rs.open sql,conn,1,1
	  if not  rs.eof then
		while not rs.eof
			%>
            <div style="background:url(../<%=rs("img_sl")%>) center center no-repeat; height:302px;" class="img"></div>
            <%
		rs.movenext
		wend
	  end if
	  rs.close
	  set rs=nothing
	%>
    </div>
    <div class="slide_btn" style="1display:none; text-align:center; margin-top:-0px; height:27px; background:#d2d2d2;">
    <style>
	.slide_btn table tr td a{ color:#aaa; font-style:italic; cursor:pointer; font-size:12px; display:block; float:left; width:19px; height:27px; line-height:27px; background:url(images/ban_di_b.jpg) 0px -4px;;}
	.slide_btn table tr td .one{ color:#906; 11font-size:13px;background:url(images/ban_di_a.jpg) 0px -4px;}
	</style>
    <table style="margin:0 auto;"><tr><td valign="middle" align="center">
    <%
	set rs = server.createobject("adodb.recordset")
	  sql="select  * from info_co where lm="&lm0&" order by px desc,id desc "
	  rs.open sql,conn,1,1
	  if not  rs.eof then
	  a=1
		while not rs.eof
		temp=""
		if a=1 then temp=" class='one' " end if
		%>
         <a <%=temp%>><%'=a%></a>
        <%
		rs.movenext
		a=a+1
		wend
	  end if
	  rs.close
	  set rs=nothing
	%>
    </td></tr></table>    
    </div>
</div>