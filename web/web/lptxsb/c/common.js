/* common js */

var starttime = new Date().getTime(); 

function menu_drop(menuId, display)
{
	$id(menuId).style.display=display;
}

function $id(id)
{
	return document.getElementById(id);
}

function mobile_filter()
{

    var w= $('#show_text_inc').width();
    var h = $('#show_text_inc').height();
    var ps = getPageSize();
    var m_w = ps[0] , m_h = ps[1];
    var v_w = ps[2], v_h= ps[3] ;

    $('#overlay').css("width",  m_w + 'px').css("height", m_h + 'px' ).show().animate({opacity:0.5}, 200, 'easeInQuad', function(){
	if($.browser.msie6)
	{
		var sc = getPageScroll();
		var scy = sc[1] ;
		$('#show_text_inc').css("top",(v_h-h)/2+scy ).css("left",(v_w - w)/2 ).show();
	 }
	 else
	 {
		 $('#show_text_inc').css("top",(v_h-h)/2 ).css("left",(v_w - w)/2 ).show();
	 }

    });
}

function hidefilter()
{
	$('#overlay').css("opacity", 0 ).hide();
	$('#show_text_inc').hide();
	//$('#show_text_inc').css("opacity", 0 );
}
function submit_filter()
{
	$('#filter_form').submit() ;
}


function getPageSize() {

	var xScroll, yScroll , pageWidth, pageHeight;
	if (window.innerHeight && window.scrollMaxY) {
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) {
		// all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else {
		// Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}

	var windowWidth, windowHeight;
	if (document.documentElement
			&& document.documentElement.clientHeight) {
		// Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) {
		// other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	} else if (self.innerHeight) {
		// all except Explorer
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	}

	// for small pages with total height less then height of the viewport
	if (yScroll < windowHeight) {
		pageHeight = windowHeight;
	} else {
		pageHeight = yScroll;
	}

	// for small pages with total width less then width of the viewport
	if (xScroll < windowWidth) {
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}

	var arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
	return arrayPageSize;
}
function getPageScroll() {
	var yScroll, xScroll;
	if (self.pageYOffset) {
		yScroll = self.pageYOffset;
		xScroll = self.pageXOffset;
	} else if (document.documentElement && document.documentElement.scrollTop) {
		// Explorer 6 Strict
		yScroll = document.documentElement.scrollTop;
		xScroll = document.documentElement.scrollLeft;
	} else if (document.body) {
		// all other Explorers
		yScroll = document.body.scrollTop;
		xScroll = document.body.scrollLeft;
	}

	var arrayPageScroll = new Array(xScroll, yScroll);
	// arrayPageScroll = new Array('',yScroll);
	return arrayPageScroll;
}


function isScroll()
{
		return  $(window).height() == $(document).height() ? false : true ;
}

 function scroll_position(id)
 {
		var o = $('#'+id) ;
		var offsetY = $(document).scrollTop() + $(window).height()/2 - o.height()  ;
		o.stop(true, false).animate({top:offsetY},{duration:500,queue:false});
		if($(document).scrollTop()==0)
		{
		    $('#go_top').hide();
		    $('#go_bottom').show();
		}
		else if($(document).scrollTop()==$('body').height() - $(window).height())
		{
		    $('#go_top').show();
		    $('#go_bottom').hide();
		}
		else
		{
		    o.find('a').show();
		}
		if(!isScroll())
		{
			$('#go_top_bottom').hide();
		}
		else
		{
			 $('#go_top_bottom').show();
		}
}
function scroll_to_pos(pos)
{
		var scrollY = 0 ;
		if(pos=='top')
		{
		    scrollY = 0;
		}
		else if(pos=='bottom')
		{
		    scrollY = $('body').height() - $(window).height() ;
		}
		$('html,body').animate({scrollTop: scrollY}, 800);
}


 
/*
$(function() {
		var userAgent = window.navigator.userAgent.toLowerCase();

		$.browser.msie8 = $.browser.msie && /msie 8\.0/i.test(userAgent);
		$.browser.msie7 = $.browser.msie && /msie 7\.0/i.test(userAgent);
		$.browser.msie6 = !$.browser.msie8 && !$.browser.msie7 && $.browser.msie && /msie 6\.0/i.test(userAgent);
});
*/


function correctPNG()  
{  
	if(navigator.appVersion.indexOf("MSIE")){
	 var arVersion = navigator.appVersion.split("MSIE");
     var version = parseFloat(arVersion[1]);
     if (version < 8)
     {
        
       for(var j=0; j<document.images.length; j++)
       {
           var img = document.images[j];
           var imgName = img.src.toUpperCase();
           if (imgName.substring(imgName.length-3, imgName.length) == "png")
           {
             var imgID = (img.id) ? "id='" + img.id + "' " : "";
             var imgClass = (img.className) ? "class='" + img.className + "' " : "";
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' ";
             var imgAlt = (img.alt) ? "alt='" + img.alt + "' " : "alt='" + img.title + "' ";
             var imgStyle = "display:inline-block;" + img.style.cssText;
             if (img.align == "left") imgStyle = "float:left;" + imgStyle;
             if (img.align == "right") imgStyle = "float:right;" + imgStyle;
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle;
             var strNewHTML = "<span " + imgID + imgClass + imgTitle +  " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\'" + img.src + "\', sizingMethod='scale');\"></span>";
             img.outerHTML = strNewHTML;
             j = j-1;
           }
       }
     }
    }    
}
 
 
$(document).ready(function(){
	correctPNG();
	get_breadnav();
	$(window).resize(function(){
		var pageSize = getPageSize();
		$('#go_top_bottom').css('left', ((pageSize[0] < 960) ? 960 : (pageSize[0]/2 + 480)));
		set_finder_pos(865, 420);
	});
	if($("#finder_ads").size() > 0){
		window.onscroll = function(){ set_finder_pos(865, 420); };
	}
			//weibo_menu();
	ga_outgoing_trackPageview('/outgoing/footer/weibo/xl', 'xl_ft');//全站footer的weibo
	ga_outgoing_trackPageview('/outgoing/footer/weibo/tx', 'tx_ft');
	ga_outgoing_trackPageview('/outgoing/img/link/content_bottom_left/newsimg_store', 'newsimg_store');//首页三个导航图片
	ga_outgoing_trackPageview('/outgoing/img/link/content_bottom_center/newsimg_oppostore', 'newsimg_oppostore');
	ga_outgoing_trackPageview('/outgoing/img/link/content_bottom_right/newsimg_nearme', 'newsimg_nearme');
	ga_outgoing_trackPageview('/outgoing/a/link/footer_left/leftpatten_a_cn', 'leftpatten_a_cn');
	ga_outgoing_trackPageview('/outgoing/a/link/footer_center/leftpatten_a_en', 'leftpatten_a_en');	
	ga_outgoing_trackPageview('/outgoing/a/link/footer_right/leftpatten_a_m', 'leftpatten_a_m');
	ga_outgoing_trackPageview('/outgoing/img/link/content_top_right/buyit', 'buyit');
		
});
    
function ga_outgoing_trackPageview(tmpaddr,tmpid){//给外链增加ga监测代码
	if(tmpid){
		$('#'+tmpid).bind('click', function(){
			ga_outgoing_trackPageview(tmpaddr);
		});
	}else{
		_gaq.push(['_trackPageview',tmpaddr]);
	}
}  

function do_dearch(val)
{
	
	if($.trim(val)=="" || $.trim(val)=="搜索...")
	{
		alert("请输入搜索关键字！");
		return false;
	}else{
		location.href="http://www.oppo.com/?q=search&search="+encodeURIComponent(val);
	}
}

function get_breadnav()
{
	 var	cur_href		= location.href;
	 var	nav_arr	=	new	Array();
	 var	cur_bread	=	"您的位置：";
	 
	 if(cur_href.indexOf("?")>-1)
	 {
		 var	cur_href_arr	=	cur_href.split("?");
		 var	cur_href_server	= cur_href_arr[0];
 
		 if(cur_href_arr[1]!="undefined" || cur_href_arr[1]!="")
		 {
			 var	cur_href_allparama	= cur_href_arr[1];
			  if(cur_href_allparama.indexOf("&")>-1)
			  {
			 	var	cur_href_sinparama	= cur_href_arr[1].split("&");
			 	var	cur_href_filepath	= cur_href_sinparama[0];
			  }else{
			  	var	cur_href_filepath	=  cur_href_arr[1];
			  }
		  }
	 }else{
	 	 cur_bread	=	cur_href.indexOf("www.oppo.com")>-1 ? "" : ""; //首页不显示面包屑
	 	 cur_bread	+=	cur_href.indexOf("theme.oppo.com")>-1 ? "<a href='"+cur_href+"'>主题库</a>" : "";
	 }
         if(cur_href_filepath!="" && cur_href_filepath!="undefined" && cur_href_filepath!=null){ //当不为空 执行以下
                 if(cur_href_filepath=="q=mobile")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 手机";}
                 if(cur_href_filepath=="q=mp3")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > MP3 / MP4";}
                 if(cur_href_filepath=="q=mobile/product/detail" || cur_href_filepath=="q=mobile/product/newtpl")
             			{
             				var	cur_name	=	cur_href_sinparama[1].replace("name=","");
             				new_cur_name = cur_name.substring(0, 1).toUpperCase() + cur_name.substring(1, cur_name.length).toLowerCase();
             				cur_bread	+=	"<a href='?q=index'>首页</a> > <a href='?q=mobile'>手机</a>  > <a href='?q=mobile/product/detail&name="+new_cur_name+"'>"+new_cur_name+"</a>";}
                 if(cur_href_filepath=="q=mp3/product/detail")
                        {
                 			var	cur_name	=	cur_href_sinparama[1].replace("name=","");
             				new_cur_name = cur_name.substring(0, 1).toUpperCase() + cur_name.substring(1, cur_name.length).toLowerCase();	
                         	cur_bread	+=	"<a href='?q=index'>首页</a> > <a href='?q=mp3'>MP3 / MP4</a>  > <a href='?q=mp3/product/detail&name="+new_cur_name+"'>"+new_cur_name+"</a>";}
                 if(cur_href_filepath=="q=ebook/product/detail")
                        { 
                        	var	cur_name	=	cur_href_sinparama[1].replace("name=","");
             				new_cur_name = cur_name.substring(0, 1).toUpperCase() + cur_name.substring(1, cur_name.length).toLowerCase();
                        	cur_bread	+=	"<a href='?q=index'>首页</a> > <a href='?q=ebook/product'>Ebook</a>  > <a href='?q=ebook/product/detail&name="+new_cur_name+"'>"+new_cur_name+"</a>";}
                 if(cur_href_filepath=="q=service/network")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>服务网点</a>";}
                 if(cur_href_filepath=="q=service/faq")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>常见问题</a>";}
                 if(cur_href_filepath=="q=service/glossary")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>专业词汇表</a>";}
                if(cur_href_filepath=="q=service/verification")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>配件查询 </a>";}
                if(cur_href_filepath=="q=service/feedback")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>用户投诉</a>";}
                if(cur_href_filepath=="q=service/uaprof")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>UA-PROF</a>";}
                if(cur_href_filepath=="q=service/contact")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>联系我们 </a>";}
                if(cur_href_filepath=="q=service/sitemap")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>网站地图 </a>";}
                if(cur_href_filepath=="q=service")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>服务政策</a>";}//
                 if(cur_href_filepath=="q=service/policy"||cur_href_filepath=="q=service/index/"||cur_href_filepath=="q=service/index/")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>服务政策</a>";}
                if(cur_href_filepath=="q=service/agreement")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>使用协议 </a>";}
                if(cur_href_filepath=="q=service/copyright")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>版权说明 </a>";}
                if(cur_href_filepath=="q=service/sellnet")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>经销商网点 </a>";}
                if(cur_href_filepath=="q=service/exchange2011")
                        {cur_bread	+=	"<a href='?q=index'>首页</a> > 服务  > <a href='?"+cur_href_filepath+"'>OPPO售后三周年庆 </a>";}
                if(cur_href_filepath=="q=service/oppostore")
            			{cur_bread	+=	"<a href='?q=index'>首页</a> > <a href='?q=service'>服务</a>  > 专卖店网点 ";}
                if(cur_href_filepath.indexOf("=software")>0)
                        {
                                cur_bread	=	$("#cur_bread").html();  

                        }

                if (cur_bread	==	"您的位置："){cur_bread	=	""} 
                $("#breadcrumbs").html(cur_bread);
         }
}

function set_search_txtbg(val)
{
	if(val==0){$("#search_txtbg").removeClass("search_txtbg_on");}
	if(val==1){$("#search_txtbg").addClass("search_txtbg_on");}
 
}

function weibo_menu(){
        $('#weibo li .xinlang').parent().bind('mouseover',function(){
                $(this).find('.xinlang').css('background-position','-189px 0');
                $('#weibo_xin').css('display','block');
        }).bind('mouseout',function(){
                $(this).find('.xinlang').css('background-position','0 0');
                $('#weibo_xin').css('display','none');
        });
        $('#weibo li .tenxun').parent().bind('mouseover',function(){
                $(this).find('.tenxun').css('background-position','-283px 0');
                $('#weibo_xun').css('display','block');
        }).bind('mouseout',function(){
                $(this).find('.tenxun').css('background-position','-94px 0');
                $('#weibo_xun').css('display','none');
        });
}

function show_finder_ads(ad_id, ad_type, ad_ext, ad_timeout, debug, timehash, cur_hours){
	if (ad_type == 0 || ad_type== ""){
		return false;	
	}
	
	if(debug && $("#finder_ads").size()>0){
		var ad_w = 865;
		var ad_h = 420;
		
		var ad_div = $("#finder_ads").css({"width": ad_w +"px","height":  ad_h + "px","position":"absolute","z-index":9999});
		var cur_src = "resource/www/finder/ad_" +ad_id+ "." + ad_ext + "?v=" + timehash;
		
		if(ad_type =="img"){
			
			var html = "<a href='http://store.opposhop.com.cn/valentine/index.htm' target='blank'><img src='" +cur_src+ "' style='width:"+ad_w+"px;height:"+ad_h+"px'/></a>";
			
		}else if(ad_type == "swf"){
			var html = '<object id="oppofinder_ad"  width="' +ad_w+ '" height="' +ad_h+ '" type="application/x-shockwave-flash" data="' +cur_src+ '">';
	        html += '<param value="Transparent" name="wmode">';
	        html += '<param value="always" name="allowScriptAccess">';
	        html += '<param value="' +cur_src+ '" name="movie">';
	        html += '<param value="high" name="quality">';
	        html += '<param value="always" name="allowScriptAccess">';
	        html += '<param value="true" name="allowFullScreen">';
	        html += '<param value="application/x-shockwave-flash" name="type">';
	        html += '<embed wmode="Transparent" src="' +cur_src+ '" quality="high" allowscriptaccess="always" allowFullScreen="true"  pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="' +ad_w+ '" height="' +ad_h+ '"></embed>';
	        html += '<a href="http://www.adobe.com/go/getflash">';
				html += '	<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获得 Adobe Flash Player" />';
			html += '</a>';
	        html += '</object>';
		}
		
		ad_div.html(html + "<div id='count_down'></div><a href='javascript:;' id='finder_close' onclick='javascript:close_div(\"finder_ads\")' class='w_finder_c' ga='love/current" +cur_hours+ "/float/close'></a>");
		ad_div.show();
		set_finder_pos(ad_w, ad_h, ad_id);
		
		// {{{ 记录自动播放完成的检测代码
			var alltimes_code = "love/currenttime" +cur_hours+ "/float/alltimes";
			_gaq.push(['_trackPageview', alltimes_code]); 
		// over }}}
		
 		if(ad_id == 3){
 			$("#finder_close")
				.addClass("finder_close" + ad_id)
				.html("跳过")
				.fadeIn(1000);
 		}else{
 			$("#finder_close")
				.addClass("finder_close" + ad_id)
				.css({"background-image":"url(resource/www/finder/skin/" +ad_id+ "/closeopen.png)"});
 		}
 		
		if(ad_timeout>0){
			show_count_down(ad_id, ad_timeout, "count_down", cur_hours);
		}
		/*
			白色 Finder 按钮监测代码初始化 
		*/
		w_finder_ch();
	}
}

function set_finder_pos(ad_w, ad_h, ad_id){
	 	if($("#finder_ads").size() == 0){
	 		return false;	
	 	}
		var pageinfo = getPageSize();
		var ps = getPageScroll();
		var win_w = pageinfo[2];
		var win_h = pageinfo[3];
		var ad_l = pageinfo[2] > ad_w ? parseInt((pageinfo[2]-ad_w)/2) : 0;
		var ad_t = ps[1] + 130;
 		$("#finder_ads").css({"left" : ad_l+"px","top" : ad_t+"px"});
	 	var isopacity = ad_id ==3 ? false : true;
	 	set_mask(1, isopacity);
}

 function close_div(div_id){
 	 $("#"+div_id).hide();
 	 set_mask(0);
 }
 
 function set_mask(oc,isopacity){
 	 if ($("#oppomask").size() > 0 && $("#finder_ads").css("display")=="none"){
 	 		 $("#oppomask").remove();
 	 }
 	  
 	 if(oc == 1 &&  $("#finder_ads").css("display")=="block"){
	 	 $("body").append("<div id='oppomask'></div>");
	 	 var mask = $("#oppomask");
	 	 var pageinfo = getPageSize();
	 	 mask.width(pageinfo[0]);
	 	 mask.height(pageinfo[1]);
 
		 if(!isopacity){
		 	 mask.css({"opacity" : "1", "filter" : "alpha(opacity=100)"});
		 }
	 }
 }
 
 function show_count_down(ad_id, t, d, cur_hours){
 	 var the_div = $("#" + d);
 	 var the_sec = t/1000;
 	 function start_count(){
 	 	 var skin = the_sec > 0 ? the_sec : 1;
 	 	 if(ad_id ==1){
 	 	 		the_div.html("<img src='resource/www/finder/skin/" +ad_id+ "/d_" +skin+ ".png' />");
	 	 	}else{
	 	 		the_div.html("0" + the_sec).css("top", "1px");
	 	 	}
 	 	 the_sec--;
 	 	 if(the_sec == -1){
			close_div("finder_ads");
			//记录自动播放完成的检测代码
			finish_code = "love/currenttime" +cur_hours+ "/float/finish";
			_gaq.push(['_trackPageview',finish_code]);
	
		}else{
			setTimeout(function(){start_count()}, 1000);
		};
 	 }
 	 setTimeout(function(){start_count()}, 1000); 	 
 	  
 }
 
 function w_finder_ch(){
 	 $(".w_finder_c").click(function(){
 	 	 set_gacode($(this), "ga");
 	 });
 	 $(".w_finder_h").hover(function(){
 	 	 set_gacode($(this), "ga");
 	 },function(){});
 }
 
  /*
  *  监测链接
  */
function set_gacode(obj, flag){
 	obj = $(obj);
 	flag = flag ? flag : "ga";
 	tmpaddr =  obj.attr(flag) ;
 	if (tmpaddr !== "" ) {
 		_gaq.push(['_trackPageview',tmpaddr]);
 	}
	
}

function sendGa(cur_hours){
	var endtime = new Date().getTime();
	var gacode = "love/currenttime" +cur_hours+ "/float/subtime/"+Math.ceil((endtime-starttime)/1000);
	_gaq.push(['_trackPageview',gacode]);
}