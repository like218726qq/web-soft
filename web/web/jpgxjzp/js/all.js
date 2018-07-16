//脚本入口
function menuhover(){
$(".menu li").hover(
 	function(){$(this).addClass('click2');},
	function(){$(this).removeClass('click2');}
 );	
}
function checkmenu(){
 var menus=$('.menu li');
 for(var i=0;i<$(menus).length;i++){$(menus).eq(i).removeClass('click');}
 $(menus).eq(menunum).addClass('click');
}
//menu.asp
function menu(){
    $(".menu ul li").hover(
		function(){$(this).addClass("click");},
		function(){$(this).removeClass("click");}
	);
	$(".menu ul li").removeClass("click2");
	$(".menu ul li").eq(menuno).addClass("click2");
}
function left(){
  $(".index_l div").hover(
  	function(){$(this).addClass("click2");},
	function(){$(this).removeClass("click2");}
	);
}
//slide.asp
function slide(swf_width,swf_height,files,links,texts){
	//alert(files);
	//alert(links);
//var swf_width=swf_width;
//var swf_height=swf_height;
//var files = files;<!-- "images/banner3.jpg|images/banner1.jpg|images/banner2.jpg|images/banner.jpg";-->
//var links = links; <!--"#|#|#";-->
//var texts = texts;
var swf_config = "|2|||0xFFFFFF|0xc60303||3|2|1|_blank"
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
document.write('<param name="movie" value="js/bcastr.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
document.write('<embed src="js/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
}
//slide2()
function slide2(){
	var curr=0;
	var btn=$(".slide_btn .a");//alert(btn.length);
	var img=$(".slide_img .img");//alert(img.length);
	btn.each(function(i){
		$(this).click(function(){
			curr=i;
		  img.eq(i).fadeIn('slow').siblings(".img").hide();       
		  $(this).siblings(".a").removeClass("one").end().addClass('one');
		  return false;
		});
	});	
	var timer = setInterval(function(){
            auto = (curr + 1) %btn.length;
           btn.eq(auto).click();    
        },3000);btn.hover(      
            function(){   clearInterval(timer);}
			,
            function(){
                	timer=setInterval(function(){
                    auto = (curr + 1) % btn.length;btn.eq(auto).click();
                    },3000);
            });
	}
//index.asp
//index_new_hot()
function index_new_hot(){
	function upanimate(){
	$(".index_news_hot dl dd div").animate({"margin-top":-33},2000,function(){
		$(".index_news_hot dl dd div").css("margin-top","0px");
		$(".index_news_hot dl dd div").find("a:first").appendTo($(".index_news_hot dl dd div"));
		});
	}
	var timeid=window.setInterval(upanimate,3000);	
   $(".index_news_hot dl dd div").hover(
	   function(){
		   window.clearInterval(timeid);
		   },
	   function(){
		   timeid=window.setInterval(upanimate,3000);	
		   }
	   );
}	
//index_case
function marL(speed,tab,tab1,tab2){//向右滚动
//alert(tab.innerHTML);
//alert(tab1.innerHTML);
//alert(tab2.innerHTML);
	tab2.innerHTML=tab1.innerHTML;
	function MarqueeL(){
	if(tab2.offsetWidth-tab.scrollLeft<=0)
	tab.scrollLeft-=tab1.offsetWidth;
	else{tab.scrollLeft++;}
	}
	var MyMarL=setInterval(MarqueeL,speed);
	tab.onmouseover=function() {clearInterval(MyMarL)};
	tab.onmouseout=function() {MyMarL=setInterval(MarqueeL,speed)};	
}	
//index_pro()
function index_pro2(){	
var speeda=25; //数字越大速度越慢
var taba=document.getElementById("demox1");
var tab1a=document.getElementById("demo1x1");
var tab2a=document.getElementById("demo2x1");
tab2a.innerHTML=tab1a.innerHTML;
	function Marqueeb(){
	if(tab2a.offsetWidth-taba.scrollLeft<=0)
	taba.scrollLeft-=tab1a.offsetWidth
	else{taba.scrollLeft++;} 
	}
	function Marqueea(){
		if(taba.scrollLeft<=0)
	taba.scrollLeft+=tab2a.offsetWidth
	else{taba.scrollLeft--}
	}
	var MyMara;
	var MyMarb;
	$('.index_pro_l').click( function(){
		clearInterval(MyMara);
		clearInterval(MyMarb);
	    MyMarb=setInterval(Marqueeb,speeda);
        taba.onmouseover=function() {clearInterval(MyMarb)};
        taba.onmouseout=function() {MyMarb=setInterval(Marqueeb,speeda)};
		});
	$('.index_pro_r').click(function(){
		clearInterval(MyMarb);
		clearInterval(MyMara);
		MyMara=setInterval(Marqueea,speeda);
        taba.onmouseover=function() {clearInterval(MyMara)};
        taba.onmouseout=function() {MyMara=setInterval(Marqueea,speeda)};
		});
	$('.index_pro_r').click();
}

/*message.asp*/
function v_null(obj,msg){//验证非空。
	if(obj==null || obj.val()==""){alert(msg);obj.focus();return false;}
	else{return true;}
	}
function v_addr(obj){//验证邮件 
var email = obj.val(); 
　	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
flag = pattern.test(email);
　if(flag){return true;} 
　else{ 
	if(email==''){alert("邮件地址不能为空");obj.focus(); return false; }
	else{alert("邮件格式不对");obj.focus(); return false; }
	}
} 
function v_tel(obj){ //验证电话
var email = obj.val(); 
　	var pattern=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}[0-9]{11}$)/; 
flag = pattern.test(email);
　if(flag){return true;} 
　else{ 
	if(email==''){alert("电话号码不能为空");obj.focus(); return false; }
	else{alert("电话号码格式不对");obj.focus(); return false; }
	}
}	
function v_length(obj,minl,maxl,objname){
	var value=obj.val();
	if(value.length==0){obj.focus();alert(objname+"不能为空");return false;}
	if (value.length<minl){obj.focus();alert(objname+"长度不能小于"+minl);return false;}
	if(maxl!=null)
	if(value.length>maxl){obj.focus();alert(objname+"长度不能大于"+maxl);return false;}
	return true;
}
//公用
function setCollect(){
	sURL=window.location.href;
	sTitle=document.title;
	try{window.external.addFavorite(sURL, sTitle);}
	catch (e){
		try{window.sidebar.addPanel(sTitle, sURL, "");}
		catch (e){alert("加入收藏失败，请使用Ctrl+D进行添加");}
	 }
}
function setHome(obj){
	vrl=window.location;
	try{obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);}
	catch(e){
		if(window.netscape) {
			try {netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");}
			catch (e) {
alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入\"about:config\"并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',vrl);
		 }
	}
}
/*products.asp---left_nav*/
function left_nav_m(){
var objs=$("#left_nav_m  dt");
var cur=0;
for(var i=0;i<objs.length;i++){
	if(objs.eq(i).attr("class")=="hiddena"){
		objs.eq(i).next("dd").css("display","none");
	}else{
		cur=i;
	}
}
objs.eq(cur).closest('dd').css("display","block");
}	
//img的src 不存在则加载默认图片
function img_src_error(obj){
	obj.src="default.jpg";	
}
//首页公告
	function message_l(){
	$('.ad dl dd div').height($('.ad dl dd div a').length*$('.ad dl dd div a').height());
	$('.ad dl dd div').animate({ 'marginTop':-$('.ad dl dd div a').height()},500, function () {
	$('.ad dl dd div').css('marginTop', 0);
	$('.ad dl dd div').find('a:first').appendTo($('.ad dl dd div'));
	});
	}
	var message_l_id=window.setInterval(message_l,3000);
	$('.ad dl dd div').hover(
		function(){	window.clearInterval(message_l_id);	}
		,
		function(){message_l_id=window.setInterval(message_l,3000);}
		);


//验证表单
function checkNull(obj,str){
	if(obj.value==null || obj.value==""){alert(str);obj.focus(); return true;}
}
function checkLength(obj,minL,maxL,name){
	if(obj.value==null || obj.value==""){alert(name+"不能为空!");obj.focus();return true;}
	if(obj.value==null || obj.value.length<minL){alert(name+"的长度不能小于"+minL);obj.focus(); return true;}
	if(obj.value.length>maxL){alert(name+"的长度不大于"+maxL);obj.focus(); return true;}
}
function checkEmail(obj){
	if(obj.value==null || obj.value==""){alert("电子邮件不能为空!");obj.focus(); return true;}
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(!reg.test(obj.value)){alert("电子邮箱格式不正确!");obj.focus();return true;}
}
function checkEquel(obj1,obj2,name){
	if(obj1.value!=obj2.value){alert(name+"不匹配!");obj2.focus();return true;}
}
function checkPhone(obj){
	if(obj.value==null || obj.value==""){alert("电话号码不能为空!");obj.focus();return true;}
var reg=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1[0-9]{10}$)/; 
if(!reg.test(obj.value)){alert("电话号码格式不正确!");obj.focus();return true;}
}
function checkMobile(obj){
	if(obj.value==null || obj.value==""){alert("手机号码不能为空!");obj.focus();return true;}
	var reg=/(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
	if(!reg.test(obj.value)){alert("手机号码格式不正确!");obj.focus();return true;}
}
function checkZipCode(obj){
 	if(obj.value==null || obj.value==""){alert("区号不能为空!");obj.focus();return true;}
	var reg=/(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
	if(!reg.test(obj.value)){alert("区号格式不正确!");obj.focus();return true;}
}
function checkDate(obj,name){
 	if(obj.value==null || obj.value==""){alert(name+"不能为空!");obj.focus();return true;}
var reg=/((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/ig;
	if(!reg.test(obj.value)){alert("日期格式不正确!");obj.focus();return true;}
}
//img的src 不存在则加载默认图片
function img_error(obj){
	obj.src="default.jpg";
}
function img_error(obj,img){
	obj.src=img;
}
function img_load(img,width,height){
	var image=new Image(); 
	image.src=img.src; 
	if(image.width>0 && image.height>0)
	{
	  if(image.width>width)
	  {
		rate=image.height/image.width;
		newHeight=rate*width;
		img.width=width;
		img.height=newHeight;
	  } 
	}
	if(img.height>height)
	{
		rate=image.width/image.height;
		newWidth=rate*height;
		img.height=height;
		img.width=newWidth;
	}
	img.style.paddingTop=parseInt(height-img.height)/2+'px';
	img.style.paddingLeft=parseInt(width-img.width)/2+'px';
	//img.style.paddingLeft="20px";
	//alert(img.style.paddingLeft);
}
//首页产品
//index_tuijian_img(".RconL",".RconR",".Rcon ul","li");//引用
function index_tuijian_img(index_pro_l,index_pro_r,index_pro_c,index_pro_c_img){
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
//首页焦点图特效*/
function slide002(pic_width,pic_height,button_pos,stop_time,show_text,txtcolor,bgcolor,pics,links,texts){
//var pic_width=1001; //图片宽度
//var pic_height=225; //图片高度
//var button_pos=4; //按扭位置 1左 2右 3上 4下
//var stop_time=10000; //图片停留时间(1000为1秒钟)
//var show_text=0; //是否显示文字标签 1显示 0不显示
//var txtcolor="#000000"; //文字色
//var bgcolor="#F1EFEF"; //背景色
//var imag=new Array();
//var link=new Array();
//var text=new Array();
//imag[1]="images/index_12.jpg";
//link[1]="";
//text[1]="1";  
//imag[2]="images/index_13.jpg";
//link[2]="";
//text[2]="2";  
//imag[3]="images/index_14.jpg";
//link[3]="";
//text[3]="3";  
////可编辑内容结束
//var swf_height=show_text==1?pic_height+20:pic_height;
//var pics="", links="", texts="";
//for(var i=1; i<imag.length; i++){
//	pics=pics+("|"+imag[i]);
//	links=links+("|"+link[i]);
//	texts=texts+("|"+text[i]);
//}
//pics=pics.substring(1);
//links=links.substring(1);
//texts=texts.substring(1);
//pics="<%=slide_img_sl%>"
//links="<%=slide_link_url%>"
//texts="<%=slide_title%>"
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0" width="'+ pic_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="flash/focus.swf">');
document.write('<param name="quality" value="high"><param name="wmode" value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'">');
document.write('<embed src="flash/focus.swf" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'" quality="high" width="'+ pic_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');
}
//在线客服

function qq(){
var tips; var theTop = 65/*这是默认高度,越大越往下*/; var old = theTop;
function initFloatTips() {
  tips = document.getElementById('QQFloat');
  moveTips();
};
function moveTips() {
  var tt=30;
  if (window.innerHeight) {
    pos = window.pageYOffset
  }
  else if (document.documentElement && document.documentElement.scrollTop) {
    pos = document.documentElement.scrollTop
  }
  else if (document.body) {
    pos = document.body.scrollTop;
  }
  pos=pos-tips.offsetTop+theTop;
  pos=tips.offsetTop+pos/10;
 
  if (pos < theTop) pos = theTop;
  if (pos != old) {
    tips.style.top = pos+"px";
    tt=10;
  //alert(tips.style.top);
  }
  old = pos;
  setTimeout(moveTips,tt);
}
initFloatTips();
}
//动态时间
var dayarray=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六")
var montharray=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月")
function getthedate(){
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var hours=mydate.getHours()
var minutes=mydate.getMinutes()
var seconds=mydate.getSeconds()
var dn="AM"
if (hours>=12)
dn="PM"
if (hours>12){
//hours=hours-12
}
{
 d = new Date();
 Time24H = new Date();
 Time24H.setTime(d.getTime() + (d.getTimezoneOffset()*60000) + 3600000);
 InternetTime = Math.round((Time24H.getHours()*60+Time24H.getMinutes()) / 1.44);
 if (InternetTime < 10) InternetTime = '00'+InternetTime;
 else if (InternetTime < 100) InternetTime = '0'+InternetTime;
}
if (hours==0)
hours=12
if (minutes<=9)
minutes="0"+minutes
if (seconds<=9)
seconds="0"+seconds
//change font size here
var cdate=dayarray[day]+", "+montharray[month]+" "+daym+" "+year+" | "+hours+":"+minutes+":"+seconds+" "+dn+""
var cdate=year+"年 "+month+"月 "+mydate.getDate()+"日 "+dayarray[day]+" "+hours+":"+minutes+":"+seconds;
if (document.all)
document.all.clock.innerHTML=cdate
else if (document.getElementById)
document.getElementById("clock").innerHTML=cdate
else
document.write(cdate)
}
if (!document.all&&!document.getElementById)
getthedate()
function goforit(){
if (document.all||document.getElementById)
setInterval("getthedate()",1000)
}
//window.onload=goforit