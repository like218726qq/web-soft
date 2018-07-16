<div id="QQFloat" style="Z-INDEX:100000;right:5px;padding-top:20px;VISIBILITY:visible;WIDTH:133px;POSITION:absolute;TOP:100px;HEIGHT:100px;">
<!--div id="QQFloat" style="Z-INDEX:20;LEFT:895px;VISIBILITY:visible;WIDTH:106px;POSITION:absolute;TOP:300px;HEIGHT:300px;"-->
<table border="0" width="133" cellspacing="0" cellpadding="0" style="font-size:13px;">
  <tr> 
    <td valign="top" align="right" width="133" height="61" background="qq/kefu_up.gif"><img src="qq/close.jpg" onclick="closeQQfolat(1)" /></td>
  </tr>
    <tr><td height="5" background="qq/kefu_middle.gif" ></td>
  </tr>
  	<tr>
  		<td valign="middle" align="center" background="qq/kefu_middle.gif" height="35"><a href="msnim:chat?contact=Torchliteco@hotmail.com" target="_blank" class="a_tit"><img src="qq/005.gif" border="0" align="absmiddle">&nbsp;MSN</a></td>
  		</tr>
<tr> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="35"><a href="msnim:chat?contact=homkom@hotmail.com" target="_blank"></a> <a target="_blank" href="tencent://message/?uin=1668368671&Site=zskenbo.cn&Menu=yes" class="a_tit"><img border="0" src=http://wpa.qq.com/pa?p=1:1668368671:4 alt="在线咨询1" />&nbsp;<span class="qq">&nbsp;在线咨询</span></a></td> 
  </tr>
  <tr style="display:none;"> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="35"><a href="msnim:chat?contact=homkom@hotmail.com" target="_blank"></a> <a target="_blank" href="tencent://message/?uin=2374988600&Site=zskenbo.cn&Menu=yes" class="a_tit"><img border="0" src=http://wpa.qq.com/pa?p=1:2374988600:4 alt="在线咨询2" />&nbsp;<span class="qq">&nbsp;在线咨询</span></a></td> 
  </tr>
    <tr style="display:none;"> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="35"><a href="msnim:chat?contact=homkom@hotmail.com" target="_blank"></a> <a target="_blank" href="tencent://message/?uin=1498845725&Site=zskenbo.cn&Menu=yes" class="a_tit"><img border="0" src=http://wpa.qq.com/pa?p=1:1498845725:4 alt="在线咨询3" />&nbsp;<span class="qq">&nbsp;在线咨询</span></a></td> 
  </tr>
  </tr>
   
  <tr style="display:none"> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="30">0755-23328882</td> 
  </tr>
  <tr style="display:none"> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="25"><a target="_blank" href="tencent://message/?uin=1301362885&Site=zskenbo.cn&Menu=yes"></a>13527161995</td> 
  </tr>
  <tr> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="10"><a href="callto://Torchliteco"> <img src="qq/skype.jpg" width="90" border="0" /></a>
	<a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&amp;uid=xycssb&amp;site=cntaobao&amp;s=1&amp;charset=utf-8"></a></td> 
  </tr>
  <tr><td height="2" background="qq/kefu_middle.gif" ></td>
  </tr>
  <tr> 
    <td background="qq/kefu_middle.gif"></td>
  </tr>
  <tr> 
    <td background="qq/kefu_down.gif" width="133" height="28"></td>
  </tr>
</table>
</div>
<script type="text/javascript">
//<![CDATA[
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

function closeQQfolat(n){
	if(n==1)
	{
		document.getElementById("QQFloat").style.display='none';
		document.getElementById("close1").style.display='';
	}
 }

initFloatTips();
</script>