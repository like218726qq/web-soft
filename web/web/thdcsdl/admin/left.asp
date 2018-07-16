<!--#include file="inc.asp"-->
<%
chklogin
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
html,BODY { 	
	SCROLLBAR-FACE-COLOR: #65A8E5;
	SCROLLBAR-HIGHLIGHT-COLOR: #65A8E5;
	SCROLLBAR-SHADOW-COLOR: #BDD6EE;
	SCROLLBAR-3DLIGHT-COLOR: #ffffff;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR:#BDD6EE;
	SCROLLBAR-DARKSHADOW-COLOR: #65A8E5;
	background-image:url(images/aa_left1.gif);
	background-position:top;
	background-repeat:repeat-x;
}
td {
	font-size: 12px;
	text-decoration: none;
}

A {
	COLOR: #000000;  TEXT-DECORATION: none
}
A:link {
	COLOR: #000000;  TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000;  TEXT-DECORATION: none
}
A:active {
	COLOR: #000000;  TEXT-DECORATION: none
}
A:hover {
	COLOR: #000000; TEXT-DECORATION: underline
}

.bg {
	background-attachment: fixed;
	background-image: url(images/aa_left1.gif);
	background-repeat: no-repeat;
	background-position: left top;
}
.bg2 {
	background-attachment: fixed;
	background-image: url(images/aa_left2.gif);
	background-repeat: repeat-x;
	background-position: left top;
	background-color: #FBFBFB;
}
body{ margin:0px; text-algin:center;}
body.menu  { background:#383757; margin:0px;font-size:8pt; }
table.menu  { border:0px;   font-size:8pt;margin:0px 0px 0px 8px; }
td.menu  {  font-size:8pt; }
img.menu  { vertical-align:bottom; border:0px; }
a.menu  {   font-size:8pt; color:#215DC6; text-decoration:none; }
a:hover.menu  { font-size:8pt;color:#428EFF;  }
.sec_menu  { border-left:1px solid gray; border-right:1px solid gray; border-bottom:1px solid gray; overflow:hidden; background:#f8f8f8; width:156px;}
.menu_title  {  font-size:8pt }
.menu_title span  { position:relative; top:2px; left:8px; color:#494949; font-weight:bold; font-size:9pt}
.menu_title2  {  font-size:8pt }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; cursor:hand;  font-size:9pt}
.tabb{position:relative;top:5px; margin-left:6px;}
-->
</style>
<script src="function.js"></script>
</head>
<body>

<table width="158" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  height="8"></td>
  </tr>
</table>

	<table cellpadding=0 cellspacing=0 width=158  class="menu" >
	  <tr style="cursor:hand;"> 
		<td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle1> 
		  <span>资料管理</span> </td>
	  </tr>
	  <tr><td>

	<div class=sec_menu  id=menu1 > 
	<table cellpadding=0 cellspacing=0 align=left class="tabb">
		<tr > 
		  <!--<td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="tol_lm/default.asp" target="mainFrame">资料栏目管理</a> | <a href="tol_lm/add.asp"  target="mainFrame">添加</a></td>-->
		</tr>
        <tr> 
		  <td height="20"><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="tol_co/default.asp" target="mainFrame">资料内容管理</a><!-- | <a href="tol_co/add.asp"  target="mainFrame">添加</a>--></td>
		</tr>
		 <tr> 
		<td height=10></td>
	  </tr>
	</table>
	</div>
</td></tr>
	</table>
	<table cellpadding=0 cellspacing=0 width=158  class="menu" >
	  <tr style="cursor:hand;"> 
		<td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle2> 
		  <span>信息管理</span> </td>
	  </tr>
	  <tr><td>

	<div class=sec_menu  id=menu2 > 
	<table cellpadding=0 cellspacing=0 align=left class="tabb">
    
    
		<!--<tr> 
		  <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="info_lm/default.asp" target="mainFrame">信息栏目管理</a> | <a href="info_lm/add.asp"  target="mainFrame">添加</a></td>
		</tr>-->
        
        
        <tr> 
		  <td height="20"><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="info_co/default.asp" target="mainFrame">信息内容管理</a> | <a href="info_co/add.asp"  target="mainFrame">添加</a></td>
		</tr>
		 <tr> 
		<td height=10></td>
	  </tr>
	</table>
	</div>
</td></tr>
	</table>
<!--<table cellpadding=0 cellspacing=0 width=158  class="menu">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle3> 
      <span>项目管理</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu3> 
        <table cellpadding=0 cellspacing=0 align=left class="tabb">
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="pro_lm/default.asp" target="mainFrame">项目分类管理</a> | <a href="pro_lm/add.asp" target="mainFrame">添加</a></td>
          </tr>
		  <tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="pro_co/default.asp" target="mainFrame">项目信息管理</a> | <a href="pro_co/add.asp" target="mainFrame">添加</a></td>
          </tr>
		<!--<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="pro_order/default.asp" target="mainFrame">产品订购管理</a></td>
          </tr>-->

    <!--         <tr> 
            <td height=10></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>-->
<!--
<table cellpadding=0 cellspacing=0 width=158  class="menu">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle4> 
      <span>会员管理</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu4> 
        <table cellpadding=0 cellspacing=0 align=left  class="tabb">
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="person/default.asp" target="mainFrame">会员资料管理</a></td>
          </tr>
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="person/add.asp" target="mainFrame">会员资料添加</a></td>
          </tr>
             <tr> 
            <td height=8></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
-->

<table cellpadding=0 cellspacing=0 width=158  class="menu" style="display:none">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle4> 
      <span>招聘管理</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu4> 
        <table cellpadding=0 cellspacing=0 align=left class="tabb">
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="job/default.asp" target="mainFrame">招聘信息管理</a> | <a href="job/add.asp" target="mainFrame">添加</a> </td>
          </tr>
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="job/default_yp.asp" target="mainFrame">职位应聘管理</a> </td>
          </tr>
	
             <tr> 
            <td height=8></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>


<table cellpadding=0 cellspacing=0 width=158 class="menu">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle5> 
      <span>留言管理</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu5> 
        <table cellpadding=0 cellspacing=0 align=left class="tabb">
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="book/default.asp" target="mainFrame">客户留言管理</a></td>
          </tr>
             <tr> 
            <td height=8></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
<!--
<table cellpadding=0 cellspacing=0 width=158 class="menu">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle6> 
      <span>流量统计管理</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu6> 
        <table cellpadding=0 cellspacing=0 align=left class="tabb">
		<tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="count/" target="mainFrame">网站流量统计</a></td>
          </tr>
             <tr> 
            <td height=8></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
 
<table cellpadding=0 cellspacing=0 width=158 class="menu">
  <tr style="cursor:hand;"> 
    <td height=25 class=menu_title background=images/title_bg_hide.gif id=menuTitle6> 
      <span>网站配置</span></td>
  </tr>
  <tr> 
    <td> <div class=sec_menu id=menu6> 
        <table cellpadding=0 cellspacing=0 align=left class="tabb">
        		  <tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="ser_co/default.asp" target="mainFrame">在线客服管理</a> | <a href="ser_co/add.asp" target="mainFrame">添加</a></td>
          </tr>
		  <tr> 
            <td height=20><img src=images/project2.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="setup/edit.asp" target="mainFrame">网站基本配置</a></td>
          </tr>
			
		  <tr> 
            <td height=20><img src=images/icon_course.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;<a href="count" target="mainFrame">网站流量统计</a></td>
          </tr>
		  
		  <tr> 
            <td height=20><img src=images/icon_course.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;  
			<a href="master/default.asp" target="mainFrame">管理员管理</a></td>
          </tr>
		   <tr> 
            <td height=20><img src=images/icon_course.gif align="absmiddle" border="0" width="16" height="16" alt="Click to go there">&nbsp;  
			<a href="master/add.asp" target="mainFrame">添加管理员</a></td>
          </tr>
		  
             <tr> 
            <td height=8></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table> -->
 
</body>
</html>
<SCRIPT LANGUAGE="Javascript" > 
<!--
var menuinit=new Array(50),vers;//(don't change this)
for(i=0;i<51;i++)menuinit[i]=new Array(3);//(don't change this)
////////////////////////////////////////////////////////////////////////////////////////
//
vers="XP Style Menu SP2(V2002.12.10.1452 NEW_CORE_DEV_BETA build 69)";
//
//Improved by: swnet(swnet@263.net)
//Original by: Zhong Zhong
//
//Note: best work with MS IE5/6, also looks fine on Netscape/Mozilla but without 
//      visualized effect.
//
//*THIS CODE IS UNDER GUN GPL LICENCE*
////////////////////////////////////Setting Section////////////////////////////////////
//
var onemenu = 0; //open one menu at same time.1 is yes, 0 is no. default=1.
var speedmout = 50; //menu show speed(1~100;default=50) *the large the fast, but also come with more bump.
var speedmin = 50; //menu hide speed(1~100;default=50)
var developversion = true; //when false block all script error if any.

//setting of which menu should be showen. In this example you have 4 menu, which you can switch between "show" and "not show"
//if you want to add extra one, you should follow this order: "menuinit[n][1]=;" (in [a][b], b must be '1', a is the serial number of menu)
menuinit[1][1]="show";
menuinit[2][1]="show";
menuinit[3][1]="show";
menuinit[4][1]="show";
menuinit[5][1]="show";
menuinit[6][1]="show";
menuinit[7][1]="show";
menuinit[8][1]="show";



////////////////////////!!!DO NOT CHANGE BELOW THIS LINE!!!!/////////////////////////////
//
var da=new Date();
var browser=new BrowserDetectLite();
var fstrun=1;
var op="";
var whichContinue="";
var whichOpen="";
var opp=0;
var opd=0;
var opc=0;
var sc=1;sd=1;
var mnunum=0;
var cacheObj,cacheMaxh,cacheObj2;

//----------------------------------------------------------------------------------------
function menuShow(obj,maxh,obj2)
{
var da=new Date();
if(fstrun==1){
 op="show";
 mountmfunc(0,0,0);
 obj2.background="images/title_bg_hide.gif";
 obj.style.pixelHeight=2;
 obj.style.display='block'; 
 opc=6.18*(speedmout*0.01); //step length
 opp=Math.round(opc); //rounded step length
 opd=(maxh/opp)/100; //times
 sc=1;sd=opd;
 fstrun=0;
 cacheObj=obj;cacheMaxh=maxh;cacheObj2=obj2;
}else{
 if(op!="show") return false;
}
  if(obj.style.pixelHeight<maxh-opp)
  {
           if(opd>1){//for slow speed
              if(sd-sc<1){obj.filters.alpha.opacity+=1;sd+=opd;}
              sc++;
            }else{//for fast speed
              obj.filters.alpha.opacity+=Math.ceil(1/opd);
            }
            
        obj.style.pixelHeight+=opp;
	cacheObj=obj;cacheMaxh=maxh;cacheObj2=obj2;
	setTimeout('menuShow(cacheObj,cacheMaxh,cacheObj2)','5');
  }else{
        obj.style.pixelHeight=maxh;
        obj.filters.alpha.opacity=100;
        fstrun=1;
        op="";
        sc=1;sd=1;
        mountmfunc(1,1,1);
        return true;
  }

}

//----------------------------------------------------------------------------------------
function menuHide(obj,maxh,obj2)
{
da=new Date();
if(fstrun==1){
 op="hide";
 mountmfunc(0,0,0);
 obj2.background="images/title_bg_show.gif";
 opc=6.18*(speedmout*0.01); //step length
 opp=Math.round(opc); 
 opd=((maxh-3)/opp)/100;
 sc=1;sd=opd;
 fstrun=0;
 cacheObj=obj;cacheMaxh=maxh;cacheObj2=obj2;
}else{
 if(op!="hide") return false;
}
  if(obj.style.pixelHeight-opp>1)
  { 
	    if(opd>1){
              if(sd-sc<1){obj.filters.alpha.opacity-=1;sd+=opd;}
              sc++;
            }else{
               obj.filters.alpha.opacity-=Math.ceil(1/opd)*0.38;
            }
            obj.style.pixelHeight-=opp;
	setTimeout('menuHide(cacheObj,cacheMaxh,cacheObj2)','5');
  }else{
        obj.style.pixelHeight=1;
        obj.style.display='none';
        obj.filters.alpha.opacity=0;
        fstrun=1;
        op="";
        sc=1;sd=1;
        mountmfunc(1,1,1);
        if(whichContinue && onemenu==1) whichContinue.click();
        return true;
  }
}

//----------------------------------------------------------------------------------------
function menuChange(obj,maxh,obj2)
{
  if(obj.style.pixelHeight>1)
  {
    menuHide(obj,maxh,obj2);
	whichOpen='';       
  }
  else
    if(whichOpen)
	{
	  whichContinue=obj2;
          whichOpen.click();
	}
	else
	{
	  menuShow(obj,maxh,obj2);
	  if(onemenu==1)whichOpen=obj2;
	  whichContinue='';
	}

}

//----------------------------------------------------------------------------------------
function mountmfunc(clk,mi,mo){
//var=1 mount, var=0 disable var=2 do nothing
//clk=mouse click function
//mi=mouse over function
//mo=mouse out function
if(clk==1){document.onclick=monclick;}else if(clk==0){document.onclick="return false;";}else{}
if(mi==1){document.onmousemove=monmouseover;}else if(mi==0){document.onmousemove="return false;";}else{}
if(mo==1){document.onmouseout=monmouseout;}else if(mo==0){document.onmouseout="return false;";}else{}

for(i=1;i<mnunum;i++){
eval("document.all.menuTitle"+i+".className='menu_title';");
}
}

//----------------------------------------------------------------------------------------
//[Public]
var regex=new RegExp("menuTitle\d*","i");
var regex1=new RegExp("[0-9]*$","i");
var boo=0;

//----------------------------------------------------------------------------------------
function monmouseover(){
if(event.srcElement.tagName!="TD" || boo==1) return false;
if(regex.test(event.srcElement.id)){
event.srcElement.className="menu_title2";
boo=1;
}
}

//----------------------------------------------------------------------------------------
function monmouseout(){
if(event.srcElement.tagName!="TD") return false;
if(regex.test(event.srcElement.id)){
event.srcElement.className="menu_title";
boo=0;
}
}

//----------------------------------------------------------------------------------------
function monclick(){
if(!browser.isIE5up || browser.isIE55) return true;
if(event.srcElement.tagName=="A") return true;

if(event.srcElement.tagName=="SPAN"){
if(regex.test(event.srcElement.parentNode.id)){
b=event.srcElement.parentNode.id.match(regex1);
codex="menuChange(menu" + b + "," + eval("menuinit[" + b + "][2]") + "," + event.srcElement.parentNode.id+ ")";
eval(codex);
}
}
if(regex.test(event.srcElement.id)){
b=event.srcElement.id.match(regex1);
codex="menuChange(menu" + b + "," + eval("menuinit[" + b + "][2]") + "," + event.srcElement.id+ ")";
eval(codex);
}
}

//----------------------------------------------------------------------------------------
function init(){
if (document.readyState!="complete") return false;
if(!browser.isIE5up || browser.isIE55) return false;
if(!developversion)window.onerror = function(){window.onerror = blockError;return true;};

var mccount=0;
var showornot;
reg=new RegExp("menu[0-9]{1,2}","i");
reg1=new RegExp("[0-9]*$","i");

for(i=0;i<document.all.length;i++){

if(reg.test(document.all[i].id)){
mnunum++;

s=document.all[i].id.match(reg1);
k=eval("document.all.menu" + s + ".children[0].offsetHeight"); //code to get the height
eval("menuinit[s][2]=k");

for(n=0;n<document.all[i].childNodes.length;n++){
if(document.all[i].childNodes.item(n).tagName=="SPAN"){
//document.all[i].childNodes.item(n).
}
}

eval("showornot=menuinit[s][1]");

switch (showornot){
case "show":
if(++mccount>1 && onemenu==1)alert("You do not supposed put on 2 active menu while 'onemenu' on. Check your setting or turn 'onemenu' to '0'");
if(onemenu==1)eval("whichOpen=menuTitle" + s);
document.all[i].style.filter+="alpha(Opacity=100)";
document.all[i].style.overflow="hidden";
document.all[i].style.height=k;
document.all[i].style.display="block";
eval('document.all.menuTitle'+mnunum+'.background="images/title_bg_hide.gif"');
break;
case "not show":
document.all[i].style.filter+="alpha(Opacity=0)";
document.all[i].style.overflow="hidden";
document.all[i].style.height="1";
document.all[i].style.display="none";
eval('document.all.menuTitle'+mnunum+'.background="images/title_bg_show.gif"');
break;
default: 
alert("Expect 'show' or 'not show' in setting section!");
}

}
}
}

//----------------------------------------------------------------------------------------
function xpmenucmd(op,arg1,arg2){
if (document.readyState!="complete") return false;
switch(op){

case "null":
break;

case "show":
if(arg1!=undefined && arg1>0 && arg1<=mnunum){

if(onemenu){
for(i=1;i<=mnunum;i++){
if(i==arg1){
eval('document.all.menu'+arg1+'.filters.alpha.opacity=100');
eval('document.all.menu'+arg1+'.style.height="'+menuinit[arg1][2]+'"');
eval('document.all.menu'+arg1+'.style.display="block"');
eval('document.all.menuTitle'+arg1+'.background="images/title_bg_hide.gif"');
eval('whichOpen=document.all.menuTitle'+arg1);
}else{
eval('document.all.menu'+i+'.filters.alpha.opacity=0');
eval('document.all.menu'+i+'.style.height="1"');
eval('document.all.menu'+i+'.style.display="none"');
eval('document.all.menuTitle'+i+'.background="images/title_bg_show.gif"');
}
}
}else{
eval('document.all.menu'+arg1+'.filters.alpha.opacity=100');
eval('document.all.menu'+arg1+'.style.height="'+menuinit[arg1][2]+'"');
eval('document.all.menu'+arg1+'.style.display="block"');
eval('document.all.menuTitle'+arg1+'.background="images/title_bg_hide.gif"');
}

}
break;

case "hide":
if(arg1!=undefined && arg1>0 && arg1<=mnunum){

eval('document.all.menu'+arg1+'.filters.alpha.opacity=0');
eval('document.all.menu'+arg1+'.style.height="1"');
eval('document.all.menu'+arg1+'.style.display="none"');
eval('document.all.menuTitle'+arg1+'.background="images/title_bg_show.gif"');
whichContinue='';
whichOpen='';
}
break;

case "set mode":
 switch(arg1){
 case "s":
 onemenu=1;
 xpmenucmd("hide all");
 break;
 case "m":
 onemenu=0;
 whichOpen="";
 break;
 default:
 alert("arg1 error!\n\ne.g. xpmenucmd('set mode','[ m | s ]')");
 return false;
 }
return true;
break;

case "query mode":
 switch(onemenu){
 case 1:
 return "s";
 break;
 case 0:
 return "m"
 break;
 default:
 alert("something was wrong. onemenu must either be 1 or 0!");
 }
break;

case "show all":
if(!onemenu){
for(i=1;i<=mnunum;i++){
eval('document.all.menu'+i+'.filters.alpha.opacity=100');
eval('document.all.menu'+i+'.style.height="'+menuinit[i][2]+'"');
eval('document.all.menu'+i+'.style.display="block"');
eval('document.all.menuTitle'+i+'.background="images/title_bg_hide.gif"');
}
whichContinue='';
whichOpen='';

}else{
alert("you can only use this command in multi-menu mode!");
}

break;

case "hide all":
for(i=1;i<=mnunum;i++){
eval('document.all.menu'+i+'.filters.alpha.opacity=0');
eval('document.all.menu'+i+'.style.height="1"');
eval('document.all.menu'+i+'.style.display="none"');
eval('document.all.menuTitle'+i+'.background="images/title_bg_show.gif"');
}
whichContinue='';
whichOpen='';

break;

case "query value":
return eval(arg1);
break;

case "exec javascript":
return eval(arg1);
break;

case "set value":
return eval(arg1+"="+arg2);
break;

case "show version":
var regex=/\((.*)\)/;
alert("XP Style Menu\n\n"+regex.exec(vers)[1]);
break;

default:
alert("Don't understood your command.\n\ne.g. xpmenucmd('command','arg1','arg2')");
}
return true;
}

//----------------------------------------------------------------------------------------

if(browser.isNS6up || browser.isIE5up){
mountmfunc(1,1,1);
}else{
mountmfunc(1,2,2);
}

document.onreadystatechange = init; //Let's go!

//That's the end of my code.
//========================================================================================

//Browser detect script by Chris Nott
//(NEEDED!DO NOT DEL.)
function BrowserDetectLite() {
	var ua = navigator.userAgent.toLowerCase(); 

	// browser name
	this.isGecko     = (ua.indexOf('gecko') != -1);
	this.isMozilla   = (this.isGecko && ua.indexOf("gecko/") + 14 == ua.length);
	this.isNS        = ( (this.isGecko) ? (ua.indexOf('netscape') != -1) : ( (ua.indexOf('mozilla') != -1) && (ua.indexOf('spoofer') == -1) && (ua.indexOf('compatible') == -1) && (ua.indexOf('opera') == -1) && (ua.indexOf('webtv') == -1) && (ua.indexOf('hotjava') == -1) ) );
	this.isIE        = ( (ua.indexOf("msie") != -1) && (ua.indexOf("opera") == -1) && (ua.indexOf("webtv") == -1) ); 
	this.isOpera     = (ua.indexOf("opera") != -1); 
	this.isKonqueror = (ua.indexOf("konqueror") != -1); 
	this.isIcab      = (ua.indexOf("icab") != -1); 
	this.isAol       = (ua.indexOf("aol") != -1); 
	this.isWebtv     = (ua.indexOf("webtv") != -1); 
	
	// spoofing and compatible browsers
	this.isIECompatible = ( (ua.indexOf("msie") != -1) && !this.isIE);
	this.isNSCompatible = ( (ua.indexOf("mozilla") != -1) && !this.isNS && !this.isMozilla);
	
	// browser version
	this.versionMinor = parseFloat(navigator.appVersion); 
	
	// correct version number
	if (this.isNS && this.isGecko) {
		this.versionMinor = parseFloat( ua.substring( ua.lastIndexOf('/') + 1 ) );
	}
	else if (this.isIE && this.versionMinor >= 4) {
		this.versionMinor = parseFloat( ua.substring( ua.indexOf('msie ') + 5 ) );
	}
	else if (this.isOpera) {
		if (ua.indexOf('opera/') != -1) {
			this.versionMinor = parseFloat( ua.substring( ua.indexOf('opera/') + 6 ) );
		}
		else {
			this.versionMinor = parseFloat( ua.substring( ua.indexOf('opera ') + 6 ) );
		}
	}
	else if (this.isKonqueror) {
		this.versionMinor = parseFloat( ua.substring( ua.indexOf('konqueror/') + 10 ) );
	}
	else if (this.isIcab) {
		if (ua.indexOf('icab/') != -1) {
			this.versionMinor = parseFloat( ua.substring( ua.indexOf('icab/') + 6 ) );
		}
		else {
			this.versionMinor = parseFloat( ua.substring( ua.indexOf('icab ') + 6 ) );
		}
	}
	else if (this.isWebtv) {
		this.versionMinor = parseFloat( ua.substring( ua.indexOf('webtv/') + 6 ) );
	}
	
	this.versionMajor = parseInt(this.versionMinor); 
	this.geckoVersion = ( (this.isGecko) ? ua.substring( (ua.lastIndexOf('gecko/') + 6), (ua.lastIndexOf('gecko/') + 14) ) : -1 );
	
	// dom support
   this.isDOM1 = (document.getElementById);
	this.isDOM2Event = (document.addEventListener && document.removeEventListener);
   
   // css compatibility mode
   this.mode = document.compatMode ? document.compatMode : 'BackCompat';

	// platform
	this.isWin   = (ua.indexOf('win') != -1);
	this.isWin32 = (this.isWin && ( ua.indexOf('95') != -1 || ua.indexOf('98') != -1 || ua.indexOf('nt') != -1 || ua.indexOf('win32') != -1 || ua.indexOf('32bit') != -1) );
	this.isMac   = (ua.indexOf('mac') != -1);
	this.isUnix  = (ua.indexOf('unix') != -1 || ua.indexOf('linux') != -1 || ua.indexOf('sunos') != -1 || ua.indexOf('bsd') != -1 || ua.indexOf('x11') != -1)
	
	// specific browser shortcuts
	this.isNS4x = (this.isNS && this.versionMajor == 4);
	this.isNS40x = (this.isNS4x && this.versionMinor < 4.5);
	this.isNS47x = (this.isNS4x && this.versionMinor >= 4.7);
	this.isNS4up = (this.isNS && this.versionMinor >= 4);
	this.isNS6x = (this.isNS && this.versionMajor == 6);
	this.isNS6up = (this.isNS && this.versionMajor >= 6);
	
	this.isIE4x = (this.isIE && this.versionMajor == 4);
	this.isIE4up = (this.isIE && this.versionMajor >= 4);
	this.isIE5x = (this.isIE && this.versionMajor == 5);
	this.isIE55 = (this.isIE && this.versionMinor == 5.5);
	this.isIE5up = (this.isIE && this.versionMajor >= 5);
	this.isIE6x = (this.isIE && this.versionMajor == 6);
	this.isIE6up = (this.isIE && this.versionMajor >= 6);
	
	this.isIE4xMac = (this.isIE4x && this.isMac);
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

<!--End XP Style Menu-->
</script>