var currentBGContainer;
function onSwfLoadedHandler()
{
	var oppoPresentFlashBanner = document.getElementById("oppoPresentBanner")
	var ua = navigator.userAgent.toLowerCase(); 
	var navigatorIs = "";
	if(ua.indexOf("firefox")>0)
	{
		navigatorIs = "Firefox";
	}
	//oppoPresentFlashBanner.getNavigatorOnRun(navigatorIs);
}
function echoModifyBodyBG(bgIndex){
	//alert("bgIndex="+bgIndex)
	var leftPos = Math.floor((document.body.clientWidth-1300)/2);
	//var newValue = 'resource/www/res/bg'+bgIndex+'.png';
	var newValue = document.getElementById('index_flash_bg_'+bgIndex).innerHTML;
	changeBGOpacity_id = setInterval(changeBGOpacity,10);
	opacityNewValue = 0.1;
	var c1 = document.getElementById("coverBG_1")
	var c2 = document.getElementById("coverBG_2")
	//c1.style.left = leftPos;
	//c2.style.left = leftPos;
	if(currentBGContainer == c1)
	{
		currentBGContainer = c2;
		c2.style.backgroundImage = "url("+newValue+")";
		c2.style.filter='Alpha(Opacity='+(opacityNewValue*100)+')'; 
		c2.style.opacity=opacityNewValue;
		c1.style.filter='Alpha(Opacity=100)'; 
		c1.style.opacity=1;
	}else{
		currentBGContainer = c1;
		c1.style.backgroundImage = "url("+newValue+")";
		c1.style.filter='Alpha(Opacity='+(opacityNewValue*100)+')'; 
		c1.style.opacity=opacityNewValue;
		c2.style.filter='Alpha(Opacity=100)'; 
		c2.style.opacity=1;
	}
}
function changeBGOpacity(){
	opacityNewValue+=0.1;
	if(opacityNewValue>=1){
		opacityNewValue=1;
		clearInterval(changeBGOpacity_id);
	}
	var c1 = document.getElementById("coverBG_1")
	var c2 = document.getElementById("coverBG_2")
	if(currentBGContainer == c2)
	{
		c2.style.filter='Alpha(Opacity='+(opacityNewValue*100)+')'; 
		c2.style.opacity=opacityNewValue;
		c1.style.filter='Alpha(Opacity='+((1-opacityNewValue)*100)+')'; 
		c1.style.opacity=1-opacityNewValue;
	}else{
		c1.style.filter='Alpha(Opacity='+(opacityNewValue*100)+')'; 
		c1.style.opacity=opacityNewValue;
		c2.style.filter='Alpha(Opacity='+((1-opacityNewValue)*100)+')'; 
		c2.style.opacity=1-opacityNewValue;
	}
}

function wheel(event){
	var delta = 0;
	if (!event) /* For IE. */
		event = window.event;
	if (event.wheelDelta) 
	{ 
		/* IE或者Opera. */
		delta = event.wheelDelta / 120;
		/** 在Opera9中，事件处理不同于IE
		*/
		if (window.opera)
		{
			delta = -delta;
		}
	} else if (event.detail) { /** 兼容Mozilla. */
	/** In Mozilla, sign of delta is different than in IE.
	* Also, delta is multiple of 3.
	*/
		delta = -event.detail / 3;
	}
	/** 如果 增量不等于0则触发
	* 主要功能为测试滚轮向上滚或者是向下
	*/
	var oppoPresentFlashBanner = document.getElementById("oppoPresentBanner")
	oppoPresentFlashBanner.style.cursor='hand'; 
	if (delta)
	{
		oppoPresentFlashBanner.handleMouseWheel(delta);
	}
	if(event.preventDefault)
	{
		event.preventDefault();	
	}
	event.returnValue = false;
}
