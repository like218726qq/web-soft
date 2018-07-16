<link href="qq/qq.css" rel="stylesheet" type="text/css" />
<div class='QQbox' id='divQQbox' >
  <div class='Qlist' id='divOnline' onmouseout='hideMsgBox(event)' style='display : none'>
    <div class='t'><img src='qq/qq_top.jpg'></div>
    <div class='con'>
      <ul>
        <li class=odd><a href="http://wpa.qq.com/msgrd?v=3&uin=188225298&Site=508385316&Menu=yes" target="_blank">
        <img src="http://wpa.qq.com/pa?p=2:508385316:52" border="0" alt="客服一" />&nbsp;客服一</a></li>
        
         <li class=odd><a href="http://wpa.qq.com/msgrd?v=3&uin=188225298&Site=269580073&Menu=yes" target="_blank">
        <img src="http://wpa.qq.com/pa?p=2:269580073:52" border="0" alt="客服二" />&nbsp;客服二</a></li>
        
         <li class=odd><a href="http://wpa.qq.com/msgrd?v=3&uin=188225298&Site=2309863720&Menu=yes" target="_blank">
        <img src="http://wpa.qq.com/pa?p=2:2309863720:52" border="0" alt="客服三" />&nbsp;客服三</a></li>

         
        <li class=odd style="display:none;"> <a href="msnim:chat?contact=vime888@hotmail.com" title="MSN"><img src="qq/msn.png" alt="Call me!" width="50" style=" border: none;" /></a></li>

               
      </ul>
    </div>
    <div class='b'><img src='qq/qq_foot.jpg'></div>
  </div>
   <div id='divMenu'><div onmouseover='OnlineOver()' ><img src='qq/qq_1.png' class='press' alt='QQ客服热线'></div><a class='clos' onclick='Onlineclo()'><img src="qq/cll.jpg" width="13" /></a></div>
</div>
<script language="javascript">

var tips; var theTop = 145/*这是默认高度,越大越往下*/; var old = theTop;

function initFloatTips() {

tips = document.getElementById('divQQbox');

moveTips();

};

function moveTips() {

var tt=50;

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







function OnlineOver(){

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "block";

document.getElementById("divQQbox").style.width = "110px";

}

function OnlineOut(){

document.getElementById("divMenu").style.display = "block";

document.getElementById("divOnline").style.display = "none";



}


if(typeof(HTMLElement)!="undefined")    //给firefox定义contains()方法，ie下不起作用
{   
      HTMLElement.prototype.contains=function(obj)   
      {   
          while(obj!=null&&typeof(obj.tagName)!="undefind"){ //通过循环对比来判断是不是obj的父元素
   　　　　if(obj==this) return true;   
   　　　　obj=obj.parentNode;
   　　}   
          return false;   
      };   
}  
function Onlineclo(){

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "none";


}

function hideMsgBox(theEvent){ //theEvent用来传入事件，Firefox的方式

　 if (theEvent){

　 var browser=navigator.userAgent; //取得浏览器属性

　 if (browser.indexOf("Firefox")>0){ //如果是Firefox

　　 if (document.getElementById('divOnline').contains(theEvent.relatedTarget)) { //如果是子元素

　　 return; //结束函式

} 

} 

if (browser.indexOf("MSIE")>0){ //如果是IE

if (document.getElementById('divOnline').contains(event.toElement)) { //如果是子元素

return; //结束函式

}

}

}

/*要执行的操作*/

document.getElementById("divMenu").style.display = "block";

document.getElementById("divOnline").style.display = "none";

}</script>

