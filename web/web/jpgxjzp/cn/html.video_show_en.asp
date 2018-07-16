<style>
.table{ width:100%;}
.link{ border-bottom:1px dotted #dcdcdc;}
.title{ font-size:15px; height:32px; line-height:32px; font-weight:bold;}
/* 最小寬度 */
.min_width{min-width:300px;
/* sets max-width for IE */
_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");
}
/* 最大寬度 */
.max_width{
max-width:600px;
/* sets max-width for IE */
_width:expression(document.body.clientWidth > 600 ? "600px" : "auto");
}
/* 最小高度 */
.min_height{
min-height:200px;
/* sets min-height for IE */
_height:expression(this.scrollHeight < 200 ? "200px" : "auto");
}

/* 最大高度 */
.max_height{
max-height:400px;
/* sets max-height for IE */
_height:expression(this.scrollHeight > 400 ? "400px" : "auto");
}
/* 最大最小寬度 */
.min_and_max_width{
min-width:300px;
max-width:600px;
/* sets min-width & max-width for IE */
_width: expression(
  document.body.clientWidth < 300 ? "300px" :
	( document.body.clientWidth > 600 ? "600px" : "auto")
);
}
/* 最大最小高度 */
.min_and_max_height{
min-height:200px;
max-height:400px;
/* sets min-height & max-height for IE */
_height: expression(
  this.scrollHeight < 200 ? "200px" :
	( this.scrollHeight > 400 ? "400px" : "auto")
);
}  
</style>
<%if img_sl="" then img_sl="images/2009072917363773499.jpg"  end if 
img_sl="images/2009072917363773499.jpg"
%>
<table class="table">
	<tr><td align="center"><div class="title"><%=title%></div></td></tr>
	<tr><td align="right"><div class="link"><%=wtime%></div></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td align="center"><div style="display:none;">
				<link rel="stylesheet" href="../js/MagicZoom.css" type="text/css"/>
				<script type="text/javascript" src="../js/mz-packed.js"></script>
				<a href="../<%=img_sl%>" class="MagicZoom" 
				rel="zoom-width: 300px; zoom-height: 250px; zoom-position: right;">          
				 <img src="../<%=img_sl%>" onerror="img_error(this,'../images/2009072917363773499.jpg')"/>
				</a>
				<img src="../<%=img_sl%>" onerror="img_error(this,'../images/2009072917363773499.jpg')"   class="MagicZoomLoading max_width" alt="Loading Zoom, please wait"/>
	</div></td></tr>
    <tr>
            <td align="center" style="">
            <script type="text/javascript" src="../js/jwplayer.js"></script>
<DIV class=JWVideo id=jwplayer style="BACKGROUND: none transparent scroll repeat 0% 0%">
    <DIV id=player1></DIV>
</DIV>
<%
if vid_sl="" then
vid_sl="/js/video.flv"
else
vid_sl=""&vid_sl
end if
%>
<SCRIPT type=text/javascript>
var temp=(""+window.location).substr(0,(""+window.location).lastIndexOf('/'));
var temp=temp.substr(0,temp.lastIndexOf('/'));
//alert(temp);
			jwplayer("player1").setup({
			  skin: "",                      //填写皮肤swf文件的直链地址
			  flashplayer: "../js/player.swf",     //播放器地址
			  width: 450,
			  height:400,
			  stretching: "uniform",         //视频延展方式 uniform:锁定高宽比（默认），以黑色填充空白部分;exactfit:不锁定高宽比填满屏幕;fill:锁定高宽比填满屏幕;none:不延展;
			  controlbar:"bottom",           //控制面板放置位置：底部bottom（默认）、覆盖over、无none。
			  autostart:false,               //自动播放，默认无false
  			 // file: "<%=server.mappath("js/video.flv")%>"
			 file: temp+"<%=vid_sl%>"
			});
</SCRIPT>
            </td>
            </tr>
	<tr><td align="left"><div><%=z_body%></div></td></tr>
	<tr><td align="center"><div>
		<%if pre_id<>"" then%><a href=""></a>&nbsp;<a href="pro.asp?id=<%=pre_id%>">Pre</a><%end if%>
		&nbsp;&nbsp;
		<%if next_id<>"" then%><a href=""></a>&nbsp;<a href="pro.asp?id=<%=next_id%>">Next</a><%end if%>
	</div></td>
	<tr><td align="right"><div>[ <a href="video.asp">Video</a> ]&nbsp;&nbsp;[ <a href="javascript:history.go(-1)">Back</a> ]</div></td></tr>
</table>