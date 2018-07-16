<div id="QQFloat" style="Z-INDEX:100000;right:1px;padding-top:200px;VISIBILITY:visible;WIDTH:107px;POSITION:absolute;TOP:100px;HEIGHT:100px;">
<!--div id="QQFloat" style="Z-INDEX:20;LEFT:895px;VISIBILITY:visible;WIDTH:106px;POSITION:absolute;TOP:300px;HEIGHT:300px;"-->
<table border="0" width="107" cellspacing="0" cellpadding="0" style="font-size:13px;">
<tr>
		<td valign="middle" width="107" height="61" background="qq/kefu_up.gif"></td>
	</tr>
	<tr>
		<td height="5" background="qq/kefu_middle.gif" ></td>
	</tr>
	<tr>
		<td valign="middle"  background="qq/kefu_middle.gif" height="25">
<table  border="0" cellspacing="0" cellpadding="2" style="margin-left:10px;">
  <tr>
    <td width="25" align="right" style="padding-right:3px;"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2841051566&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2841051566:52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></td>
    <td><a  href="http://wpa.qq.com/msgrd?v=3&uin=2841051566&site=qq&menu=yes" target="_blank"><span class="qq">在线客服</span></a></td>
  </tr>
  <tr>
    <td width="25" align="right" style="padding-right:3px;"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2841051566&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2841051566:52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></td>
    <td><a  href="http://wpa.qq.com/msgrd?v=3&uin=2841051566&site=qq&menu=yes" target="_blank"><span class="qq">在线客服</span></a></td>
  </tr>
  
</table>      </td>
	</tr>
	<tr>
		<td height="2" background="qq/kefu_middle.gif" ></td>
	</tr>
	<tr>
		<td background="qq/kefu_middle.gif"></td>
	</tr>
	<tr>
		<td background="qq/kefu_down.gif" width="107" height="28"></td>
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

initFloatTips();
</script>