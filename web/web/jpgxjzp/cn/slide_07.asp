<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery-1.6.min.js"></script>
<!--<style>
img{ border:none;}
.con3con ul{ padding:0; margin:0; width:auto;}
.con3con ul li{ padding:0; margin:0; float:left; list-style:none; width:193px; overflow:hidden;}
</style>
<div class="cont3">
    <div class="cont3con">
    	<table><tr><td>
        <div class="con3L"><img src="images/con3L.jpg" width="39" height="92" style="cursor:pointer;" /></div>
        </td><td>
        <div class="con3con" style="width:800px; height:154px; overflow:hidden; ">
            <ul>
                <li><a href="#"><img src="images/index_51.jpg" width="193" height="154" /><br />P4.8室内全彩led显示屏</a></li>
                <li><a href="#"><img src="images/index_51.jpg" width="193" height="154" /><br />P3室内全彩led显示屏高清压铸铝箱</a></li>
                <li><a href="#"><img src="images/index_51.jpg" width="193" height="154" /><br />室内P10全彩LED显示屏</a></li>
                <li class="nomargin"><a href="#"><img src="images/index_51.jpg" width="193" height="154"  /><br />P6.0室内全彩八扫RGB三合一单元板</a></li>
            </ul>
        </div>
        </td><td>
        <div class="con3R"><img src="images/con3R.jpg" width="39" height="92"  style="cursor:pointer;"/></div> 
        </td></tr></table>
    </div>
</div>
<style>
.con3con ul{ padding:0; margin:0; overflow:hidden;}
.con3con ul li{ padding:0; margin:0; text-align:center; float:left; line-height:25px; margin-left:5px;}
</style>-->
<script>
index_pro(".con3L",".con3R",".con3con ul","li");
function index_pro(index_pro_l,index_pro_r,index_pro_c,index_pro_c_img){
$(function() {	
var width=$(index_pro_c+" "+index_pro_c_img).eq(0).width();//每个图片宽度
var height=$(index_pro_c+" "+index_pro_c_img).eq(0).height();
//alert(width);
//width=document.body.clientWidth;
var Movement_speed=650;//滚动速度
var Movement_time=5000;//滚动间隔时间
var slideX = {
	thisUl: $(index_pro_c),
	btnLeft: $(index_pro_l),
	btnRight: $(index_pro_r),
	thisLi: $(index_pro_c+' '+index_pro_c_img),
	init: function () {
		slideX.thisUl.width(slideX.thisLi.length * width);
		slideX.thisUl.height(height);
		slideX.slideAuto();
		slideX.btnLeft.click(slideX.slideLeft).hover(slideX.slideStop, slideX.slideAutoL);
		slideX.btnRight.click(slideX.slideRight).hover(slideX.slideStop, slideX.slideAutoR);
		slideX.thisUl.hover(slideX.slideStop, slideX.slideAuto);
	},
	slideRight: function () {
		slideX.btnLeft.unbind('click', slideX.slideLeft);
		slideX.thisUl.find(index_pro_c_img+':last').prependTo(slideX.thisUl);
		
		slideX.thisUl.css('marginLeft', 0-width);
		slideX.thisUl.animate({ 'marginLeft': 0 }, Movement_speed, function () {
			slideX.btnLeft.bind('click', slideX.slideLeft);
		});
		return false;
	},
	slideLeft: function () {
		slideX.btnRight.unbind('click', slideX.slideRight);
		slideX.thisUl.animate({ 'marginLeft': 0-width}, Movement_speed, function () {
			slideX.thisUl.css('marginLeft', '0');
			slideX.thisUl.find(index_pro_c_img+':first').appendTo(slideX.thisUl);
			slideX.btnRight.bind('click', slideX.slideRight);
		});
		return false;
	},
	slideAuto: function () {slideX.intervalId = window.setInterval(slideX.slideLeft, Movement_time);},
	slideAutoL: function () {slideX.intervalId = window.setInterval(slideX.slideLeft, Movement_time);},
	slideAutoR: function () {slideX.intervalId = window.setInterval(slideX.slideRight, Movement_time);},
	slideStop: function () {window.clearInterval(slideX.intervalId);}
}
$(document).ready(function () {	slideX.init();})
});	
}
</script>