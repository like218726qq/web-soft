<!--[if IE 6]>
<script src="js/DD.min.js" mce_src="js/DD.min.js"></script>
<script type="text/javascript">     /* EXAMPLE */ 
  DD_belatedPNG.fix('div,img');  
   /* 将 .png_bg 改成你应用了透明PNG的CSS选择器,例如我例子中的'.trans'*/  
 </script> <![endif]--> 
<link rel="stylesheet" href="css/global.css">
<script src="js/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script>
$(function(){
	$('#slides').slides({
		preload: true,             //加载图片
		preloadImage: 'images/loading.gif', // 在加载图片时 显示的图片
		play: 3000,                //播放间隔
		pause: 1500,			   //点击上一个，下一个或导航栏时 出现暂停时间
		effect: 'fade, fade',      //可选效果，滚动：side,渐变：fade
		hoverPause: true,          //鼠标放在上面出现暂停
		generateNextPrev: true,    //是否有左右切换
		generatePagination: true  //是否有圆点
	});
});
</script>
<div class="ban"  align="center">
<div class="tops"><div class="top"></div></div>
<div class="top1"><!--<img src="images/banner.jpg" width="1002" height="274" border="0">-->
<div id="slides">
    <div class="slides_container">
        <div class="slide">
            <img src="images/banner1.jpg" width="1002" height="274" border="0"></div>
        <div class="slide">
            <img src="images/banner2.jpg" width="1002" height="274" border="0"></div>
        <div class="slide">
            <img src="images/banner3.jpg" width="1002" height="274" border="0"></div>
        <div class="slide">
            <img src="images/banner4.jpg" width="1002" height="274" border="0"></div>
    </div>
</div>
</div>
</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/nav_beij.jpg">
  <tr>
    <td align="center"><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="923" align="center">
        <div id="nav">
        <ul>
            <li><a href="index.asp" class="b1 <%if a=1 then%> cur1 <%end if%>"></a></li>
            <li><a href="about.asp" class="b2 <%if a=2 then%> cur2 <%end if%>"></a></li>
            <li><a href="product.asp" class="b3 <%if a=3 then%> cur3 <%end if%>"></a></li>
            <li><a href="new_pro.asp" class="b4 <%if a=4 then%> cur4 <%end if%>"></a></li>
            <li><a href="news.asp" class="b5 <%if a=5 then%> cur5 <%end if%>"></a></li>
            <li><a href="job.asp" class="b6 <%if a=6 then%> cur6 <%end if%>"></a></li>
            <li><a href="message.asp" class="b7 <%if a=7 then%> cur7 <%end if%>"></a></li>
            <li><a href="contact.asp" class="b8 <%if a=8 then%> cur8 <%end if%>"></a></li>
        </ul>
        </div>
        </td>
        <td width="79" align="center"><a href="../cn/index.asp" align="center" class="an" ><img src="images/yingw.jpg" width="60" height="17" border="0" /></a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="29"><img src="images/gund_zuo.jpg" width="29" height="208" /></td>
    <td background="images/gund_zhong.jpg">
    <style type="text/css">
		<!--
		#demo {
		overflow:hidden;
		width: 946px;
		margin:0px auto;
		}
		#demo img {
		}
		#indemo {
		float: left;
		width: 800%;
		}
		#demo1 {
		float: left;
		}
		#demo2 {
		float: left;
		}
		-->
		</style>
        <div id="demo">
        <div id="indemo">
        <div id="demo1">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
      	 <%
                set rs=server.CreateObject("adodb.recordset")
                sql="select top 8 * from pro_co where tuijian='yes' order by px desc, id desc"
                rs.open sql,conn,1,1
                if rs.eof then
                    response.Write("No Information！")
                else
                do while not rs.eof 
            %>
        <td width="193"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="border:3px #0166C0 solid;"><a href="product_show.asp?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" border="0" /></a></td>
          </tr>
        </table></td>
  		 <%
                rs.movenext
                loop
                end if
                rs.close
                set rs=nothing	
            %>
      </tr>
    </table>
     </div>
        <div id="demo2"></div>
        </div>
        </div>
        <script>
        <!--
        var speed=25; //数字越大速度越慢
        var tab=document.getElementById("demo");
        var tab1=document.getElementById("demo1");
        var tab2=document.getElementById("demo2");
        tab2.innerHTML=tab1.innerHTML;
        function Marquee(){
        if(tab2.offsetWidth-tab.scrollLeft<=0)
        tab.scrollLeft-=tab1.offsetWidth
        else{
        tab.scrollLeft++;
        }
        }
        var MyMar=setInterval(Marquee,speed);
        tab.onmouseover=function() {clearInterval(MyMar)};
        tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
        -->
        </script>   
    </td>
    <td width="27"><img src="images/gund_you.jpg" width="27" height="208" /></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13"></td>
  </tr>
</table>