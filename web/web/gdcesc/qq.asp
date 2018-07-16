<div id="QQFloat" style="Z-INDEX:100000;right:5px;padding-top:100px;VISIBILITY:visible;WIDTH:107px;POSITION:absolute;TOP:100px;HEIGHT:100px;">
<!--div id="QQFloat" style="Z-INDEX:20;LEFT:895px;VISIBILITY:visible;WIDTH:106px;POSITION:absolute;TOP:300px;HEIGHT:300px;"-->
<table border="0" width="107" cellspacing="0" cellpadding="0" style="font-size:13px;">
  <tr> 
    <td valign="middle" width="107" height="61" background="qq/kefu_up.gif"></td>
  </tr>
    <tr><td height="5" background="qq/kefu_middle.gif" ></td>
  </tr>

  <tr> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="25">留学咨询顾问</td> 
  </tr>
  <tr> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="25"><a target="_blank" href="tencent://message/?uin=2475472054&Site=zskenbo.cn&Menu=yes"><img border="0" SRC=http://wpa.qq.com/pa?p=1:2475472054:4 alt="服务在线"><span class="qq">Tracy</span></a>    </td> 
  </tr>
  <tr> 
    <td valign="middle" align="center"  background="qq/kefu_middle.gif" height="25">语言培训顾问</td> 
  </tr>
  <tr> 
    <td valign="middle" align="center" background="qq/kefu_middle.gif" height="25"><a target="_blank" href="tencent://message/?uin=2454254975&Site=zskenbo.cn&Menu=yes"><img border="0" SRC=http://wpa.qq.com/pa?p=1:2454254975:4 alt="伊老师">&nbsp;<span class="qq">&nbsp;伊老师</span></a>    </td> 
  </tr>

  <tr><td height="2" background="qq/kefu_middle.gif" ></td>
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
var tips; var theTop = 20/*这是默认高度,越大越往下*/; var old = theTop;
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