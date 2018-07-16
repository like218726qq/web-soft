<style>
.table{ width:100%; margin:0px auto; line-height:20px;}
.link{ border-bottom:1px dotted #dcdcdc;}
.title2{ font-size:15px; height:32px; line-height:32px; font-weight:bold; text-align:center;  }
.min_width{min-width:300px;_width:expression(document.body.clientWidth < 300 ? "300px" : "auto");}
.max_width{max-width:600px;_width:expression(document.body.clientWidth > 600 ? "600px" : "auto");}
.min_height{min-height:200px;_height:expression(this.scrollHeight < 200 ? "200px" : "auto");}
.max_height{max-height:400px;_height:expression(this.scrollHeight > 400 ? "400px" : "auto");}
.min_and_max_width{min-width:300px;max-width:600px;
_width: expression(
  document.body.clientWidth < 300 ? "300px" :
	( document.body.clientWidth > 600 ? "600px" : "auto")
);}
.min_and_max_height{min-height:200px;max-height:400px;
_height: expression(
  this.scrollHeight < 200 ? "200px" :
	( this.scrollHeight > 400 ? "400px" : "auto")
);}  
</style>
<%info()%>
<table class="table">
	<tr><td align="center"><div class="title2"><%=title%></div></td></tr>
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
	<tr><td align="left">
    <link type="text/css" rel="stylesheet" href="slide_04/css/scroll.css" />
<script src="slide_04/scripts/scroll.js"></script>
    <div 11class="a dumascroll b" 
style="width:100%; 11height:150px; padding:5px;line-height:170%; overflow:hidden;11text-indent:2em;">
    <%=z_body%>
    </div>
    </td></tr>
	<tr><td align="left"><div>
		<%if pre_id<>"" then%><a href=""></a>&nbsp;<a href="?id=<%=pre_id%>">上一篇:<%=pre_title%></a><%end if%>
		
		<%if next_id<>"" then%><br/><a href=""></a>&nbsp;<a href="?id=<%=next_id%>">下一篇:<%=next_title%></a><%end if%>
	</div></td>
	<tr><td align="right"><div>[ <a href="javascript:history.go(-1)">返回</a> ]</div></td></tr>
</table>