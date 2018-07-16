<div class="nav">
    <div class="navL">
        <ul>
            <li class="li1"><a href="index.asp" style=" display:block; height:100%; width:100%;background:url(images/nav1_15.jpg) no-repeat center center;"><img src="images/nav1_15.jpg" width="14" height="15" style=" visibility:hidden;"/></a></li>
            <li><a href="about.asp">关于我们</a></li>
            <li><a href="products.asp">产品展示</a></li>
            <li><a href="job.asp">人才招聘</a></li>
            <li><a href="message.asp">客户留言</a></li>
            <li><a href="contact.asp">联系我们</a></li>
            <li><a href="news.asp">新闻中心</a></li>                                                                    
        </ul>
    </div>
    <div class="search">
    <form action="products.asp" method="post">
        <input type="text" class="t1" value="Search..." onfocus="this.value='';" name="keyword"/> <input type="submit" value="" class="but" />
    </form>    
    </div>
</div>
<style>
#nav{}
#nav li{ text-align:left; padding:0;} 
#nav li a{display:block;text-align:center;}
#nav li ul { display:none;position: absolute;opacity:0.75;filter:alpha(opacity=75); 
background-color:#3EA0EB; width:113px;}
#nav li ul li{ float:none; margin:0px; padding:0;}/*覆盖上面的#nav li*/
#nav li ul li a{width:113px;height:32px;line-height:32px;display:block;text-align:center;
color:#fff; text-decoration:none; border-bottom:1px solid #dcdcdc; }/*覆盖上面的#nav li a*/
#nav li ul li a:hover {text-decoration:none;font-weight:normal;}
#nav li.sfhover ul {left:auto;}
#nav li.sfhover a{background:url(../images/nav_h.jpg) no-repeat left top; color:#fff;}
#nav li.sfhover ul li a{background:none;}
</style>
<script>
$(document).ready(function(){
  $('#nav').children('li').mouseover(function(){
  $(this).addClass("sfhover");
  $(this).find('ul').slideDown();
  });
  $('#nav').children('li').mouseleave(function(){
  $(this).removeClass("sfhover");
  $(this).find('ul').slideUp("fast");
  });
  
});
</script>