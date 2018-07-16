<style>
.table{ width:95%; margin:20px auto;}
.link{ border-bottom:1px dotted #dcdcdc;}
.title{ font-size:15px; height:32px; line-height:32px; font-weight:bold;  }
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
<%info()%>
<table class="table">
	<tr><td align="center"><div class="title"><%=title%></div></td></tr>
	<tr><td align="right"><div class="link"><%=wtime%></div></td></tr>
	<tr><td>&nbsp;</td></tr>
    <%if img_sl<>"" then %>
	<tr><td align="center"><div style=" display:none;">
				<link rel="stylesheet" href="js/MagicZoom.css" type="text/css"/>
				<script type="text/javascript" src="js/mz-packed.js"></script>
				<a href="../<%=img_sl%>" class="MagicZoom" 
				rel="zoom-width: 300px; zoom-height: 250px; zoom-position: right;">          
				 <img src="../<%=img_sl%>" onerror="img_error(this,'../images/i_52.jpg')" class="max_width"/>
				</a>
				<img src="../<%=img_sl%>" onerror="img_error(this,'../images/i_52.jpg')" style="display:none;"   class="MagicZoomLoading" alt="Loading Zoom, please wait"/>
	</div></td></tr>
    <%end if%>
    <tr>
            <td align="center">
            <script type="text/javascript" src="js/jwplayer.js"></script>
<DIV class=JWVideo id=jwplayer style="BACKGROUND: none transparent scroll repeat 0% 0%; display:none;">
    <DIV id=player1></DIV>
</DIV>
<%
if vid_sl="" then vid_sl="/js/video.flv" end if
%>
<SCRIPT type=text/javascript>
			jwplayer("player1").setup({
			  skin: "",                      //填写皮肤swf文件的直链地址
			  flashplayer: "js/player.swf",     //播放器地址
			  width: 450,
			  height:400,
			  stretching: "uniform",         //视频延展方式 uniform:锁定高宽比（默认），以黑色填充空白部分;exactfit:不锁定高宽比填满屏幕;fill:锁定高宽比填满屏幕;none:不延展;
			  controlbar:"bottom",           //控制面板放置位置：底部bottom（默认）、覆盖over、无none。
			  autostart:false,               //自动播放，默认无false
  			 // file: "<%=server.mappath("js/video.flv")%>"
			 file: (""+window.location).substr(0,(""+window.location).lastIndexOf('/'))+"<%=vid_sl%>"
			});
</SCRIPT>
            </td>
            </tr>
	<tr><td align="left"><div style="padding:20px 10px;"><%=z_body%></div></td></tr>
	<tr><td align="left"><div>
		<%if pre_id<>"" then%><a href=""></a>&nbsp;<a href="?id=<%=pre_id%>">上一篇:<%=pre_title%></a><%end if%>
		
		<%if next_id<>"" then%><br/><a href=""></a>&nbsp;<a href="?id=<%=next_id%>">下一篇:<%=next_title%></a><%end if%>
	</div></td>
	<tr><td align="right"><div>[ <a href="javascript:history.go(-1)">返回</a> ]</div></td></tr>
</table>