///-------------------------------------------------------------------------
//jQuery弹出窗口 By Await [2009-11-22]
//--------------------------------------------------------------------------
/*参数：[可选参数在调用时可写可不写,其他为必写]
----------------------------------------------------------------------------
    title:	窗口标题                                                 会员登录提醒
  content:  内容(可选内容为){ text | id | img | url | iframe }       url:get?/ajaxwindow/test.aspx
    width:	内容宽度                                                 380
   height:	内容高度                                                 110
	 drag:  是否可以拖动(ture为是,false为否)                         true
     time:	自动关闭等待的时间，为空是则不自动关闭                   ''
   showbg:	[可选参数]设置是否显示遮罩层(0为不显示,1为显示)          true
  cssName:  [可选参数]附加class名称                                  text
 ------------------------------------------------------------------------*/
 //示例:
 //------------------------------------------------------------------------
 //simpleWindown("例子","text:例子","500","400","true","3000","0","exa")
 //------------------------------------------------------------------------
var showWindown = true;
var templateSrc = ""; //设置loading.gif路径
function tipsWindown(title,content,width,height,drag,time,showbg,cssName) {
	$("#windown-box").remove(); //请除内容
	var width = width>= 950?this.width=950:this.width=width;	    //设置最大窗口宽度
	var height = height>= 380?this.height=380:this.height=height;  //设置最大窗口高度
	if(showWindown == true) {
		var simpleWindown_html = new String;
			simpleWindown_html = "<div id=\"windownbg\" style=\"height:"+$(document).height()+"px;filter:alpha(opacity=0);opacity:0;z-index: 999901\"></div>";
			simpleWindown_html += "<div id=\"windown-box\">";
			simpleWindown_html += "<div id=\"windown-title\"><h2></h2><span id=\"windown-close\"></span></div>";
			simpleWindown_html += "<div id=\"windown-content-border\"><div id=\"windown-content\"></div></div>"; 
			simpleWindown_html += "</div>";
			$("body").append(simpleWindown_html);
			show = false;
	}
	contentType = content.substring(0,content.indexOf(":"));
	content = content.substring(content.indexOf(":")+1,content.length);
	switch(contentType) {
		case "text":
		$("#windown-content").html(content);
		break;
		case "id":
		$("#windown-content").html($("#"+content+"").html());
		break;
		case "img":
		$("#windown-content").ajaxStart(function() {
			$(this).html("<img src='"+templateSrc+"image/loading.gif' class='loading' />");
		});
		$.ajax({
			error:function(){
				$("#windown-content").html("<p class='windown-error'>加载数据出错...</p>");
			},
			success:function(html){
				$("#windown-content").html("<img src="+content+" alt='' />");
			}
		});
		break;
		case "url":
		var content_array=content.split("?");
		$("#windown-content").ajaxStart(function(){
			$(this).html("<img src='"+templateSrc+"image/loading.gif' class='loading' />");
		});
		$.ajax({
			type:content_array[0],
			url:content_array[1],
			data:content_array[2],
			error:function(){
				$("#windown-content").html("<p class='windown-error'>加载数据出错...</p>");
			},
			success:function(html){
				$("#windown-content").html(html);
			}
		});
		break;
		case "iframe":
		$("#windown-content").ajaxStart(function(){
			$(this).html("<img src='"+templateSrc+"image/loading.gif' class='loading' />");
		});
		$.ajax({
			error:function(){
				$("#windown-content").html("<p class='windown-error'>加载数据出错...</p>");
			},
			success:function(html){
				$("#windown-content").html("<iframe src=\""+content+"\" width=\"100%\" height=\""+parseInt(height)+"px"+"\" scrolling=\"auto\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\"></iframe>");
			}
		});
	}
	$("#windown-title h2").html(title);
	if(showbg == "true") {$("#windownbg").show();}else {$("#windownbg").remove();};
	$("#windownbg").animate({opacity:"0.5"},"normal");//设置透明度
	$("#windown-box").show();
	if( height >= 527 ) {
		$("#windown-title").css({width:(parseInt(width)+22)+"px"});
		$("#windown-content").css({width:(parseInt(width)+17)+"px",height:height+"px"});
	}else {
		$("#windown-title").css({width:(parseInt(width)+10)+"px"});
		$("#windown-content").css({width:width+"px",height:height+"px"});
	}
	var	cw = document.documentElement.clientWidth,ch = document.documentElement.clientHeight,est = document.documentElement.scrollTop; 
	var _version = $.browser.version;
	if ( _version == 6.0 ) {
		$("#windown-box").css({left:"50%",top:(parseInt((ch)/2)+est)+"px",marginTop: -((parseInt(height)+53)/2)+"px",marginLeft:-((parseInt(width)+32)/2)+"px",zIndex: "999999"});
	}else {
		$("#windown-box").css({left:"50%",top:"50%",marginTop:-((parseInt(height)+53)/2)+"px",marginLeft:-((parseInt(width)+32)/2)+"px",zIndex: "999999"});
	};
	var Drag_ID = document.getElementById("windown-box"),DragHead = document.getElementById("windown-title");
		
	var moveX = 0,moveY = 0,moveTop,moveLeft = 0,moveable = false;
		if ( _version == 6.0 ) {
			moveTop = est;
		}else {
			moveTop = 0;
		}
	var	sw = Drag_ID.scrollWidth,sh = Drag_ID.scrollHeight;
		DragHead.onmouseover = function(e) {
			if(drag == "true"){DragHead.style.cursor = "move";}else{DragHead.style.cursor = "default";}
		};
		DragHead.onmousedown = function(e) {
		if(drag == "true"){moveable = true;}else{moveable = false;}
		e = window.event?window.event:e;
		var ol = Drag_ID.offsetLeft, ot = Drag_ID.offsetTop-moveTop;
		moveX = e.clientX-ol;
		moveY = e.clientY-ot;
		document.onmousemove = function(e) {
				if (moveable) {
				e = window.event?window.event:e;
				var x = e.clientX - moveX;
				var y = e.clientY - moveY;
					if ( x > 0 &&( x + sw < cw) && y > 0 && (y + sh < ch) ) {
						Drag_ID.style.left = x + "px";
						Drag_ID.style.top = parseInt(y+moveTop) + "px";
						Drag_ID.style.margin = "auto";
						}
					}
				}
		document.onmouseup = function () {moveable = false;};
		Drag_ID.onselectstart = function(e){return false;}
	}
	$("#windown-content").attr("class","windown-"+cssName);
	var closeWindown = function() {
		$("#windownbg").remove();
		$("#windown-box").fadeOut("slow",function(){$(this).remove();});
	}
	if( time == "" || typeof(time) == "undefined") {
		$("#windown-close").click(function() {
			$("#windownbg").remove();
			$("#windown-box").fadeOut("slow",function(){$(this).remove();});
		});
	}else { 
		setTimeout(closeWindown,time);
	}
}

//20100624添加
function checklogin()
{
	$.post("ajaxwindow/usercookies.aspx",
	  function(data){
		data=data.replace(" ","");
		var str="";
		if(data>0)
		{
			$("#slideBtn_1").attr("href",'User/main.aspx');
			$("#slideBtn_1").attr("onclick","");
			
			$("#slideBtn_2").attr("href",'User/main.aspx');
			$("#slideBtn_2").attr("onclick","");
			
			$("#slideBtn_3").attr("href",'User/index.aspx');
			$("#slideBtn_3").attr("onclick","");
			
			$("#slideBtn_4").attr("href",'User/main.aspx');
			$("#slideBtn_4").attr("onclick","");			
					
		}		
	   }
	); 
}

function killErrors() { 
return true; 
} 
window.onerror = killErrors; 

/*alitab 
author:alicn-wd-ym 
这里是所有js实现,代码比较少,主要还是取巧,利用了classname的关系 
*/ 
var slideTabIndex=1; 
var sTabList = document.getElementById("slideBox").getElementsByTagName("li"); 
for(var i=0;i<sTabList.length;i++){ 
var obj = sTabList[i].getElementsByTagName("a")[0]; 
sTabList[i].getElementsByTagName("a")[0].id="slideBtn_"+(i+1); 
if (obj.addEventListener) { 
obj.addEventListener( "mouseover", overSlide, false ); 
} 
else if (obj.attachEvent) { 
obj.attachEvent( "onmouseover", overSlide ); 
} 
} 
function overSlide(e){ 
e = window.event || e; 
var srcElement = e.srcElement || e.target; 
var newTabIndex=srcElement.id.replace("slideBtn_",""); 
var pos = srcElement.parentNode.className; 
if(newTabIndex==""||pos.indexOf("_h")!=-1)return; 
document.getElementById("slideBtn_"+slideTabIndex).parentNode.className=document.getElementById("slideBtn_"+slideTabIndex).parentNode.className.replace("_h",""); 
document.getElementById("sc_"+slideTabIndex).className="hide"; 
document.getElementById("sc_"+newTabIndex).className="cont_"+pos; 
srcElement.parentNode.className = pos+"_h"; 
slideTabIndex=newTabIndex; 
}

checklogin();