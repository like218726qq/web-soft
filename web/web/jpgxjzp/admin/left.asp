<!--#include file="inc.asp"-->
<%
chklogin
opeconn()
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
html,BODY {SCROLLBAR-FACE-COLOR: #65A8E5;SCROLLBAR-HIGHLIGHT-COLOR: #65A8E5;SCROLLBAR-SHADOW-COLOR: #BDD6EE;SCROLLBAR-3DLIGHT-COLOR: #ffffff;SCROLLBAR-ARROW-COLOR: #ffffff;SCROLLBAR-TRACK-COLOR:#BDD6EE;SCROLLBAR-DARKSHADOW-COLOR: #65A8E5; font-family:Arial, Helvetica, sans-serif;}
body{background: #fbfbfb url(images/aa_left1.gif) no-repeat left top; margin:0px; width:181px; height:100%; font-size:12px;}
ul,li{list-style:none; margin:0px; padding:0px;}
a {COLOR: #000000;  TEXT-DECORATION: none}
a:link {COLOR: #000000;  TEXT-DECORATION: none}
a:visited {COLOR: #000000;  TEXT-DECORATION: none}
a:active {COLOR: #000000;  TEXT-DECORATION: none}
a:hover {COLOR: #000000; TEXT-DECORATION: underline}
#left_main{ width:158px; border-left:1px solid #808080;border-right:1px solid #808080;border-bottom:1px solid #808080;margin:0px 0 0 8px; background-color:#f8f8f8;}
#left_main h3{ padding:0 0 0 8px; margin:0px; height:25px; line-height:25px; font-size:12px; color:#494949; background:url(images/title_bg_show.gif) no-repeat left top;}
#left_main ul{ padding:5px 0 5px;}
#left_main ul li{ background:url(images/project2.gif) no-repeat 6px 2px; padding:3px 0 1px 26px;}
#left_main ul .li_01{background:url(images/news_catch_up.gif) no-repeat 6px 2px;}
#left_main ul .li_02{background:url(images/mail_send_all.gif) no-repeat 6px 2px;}
#left_main ul .li_02 a{ color:#FF0000; font-weight:bold;}
#left_main ul .li_03{background:url(images/favorites.gif) no-repeat 6px 2px;}
</style>
<script src="scripts/function.js"></script>
</head>
<body>
<div style="height:9px;"></div>
<div id="left_main">
	<!--<h3>资料管理</h3>
    <ul>
    	<li><a href="tol_lm/default.asp" target="mainFrame">资料栏目管理</a> <a href="tol_lm/add.asp"  target="mainFrame"  style="display:none;">| 添加</a></li>
        <%
		call admin_left_nav("tol_lm",7,"tol_co")
		%>
    </ul>-->
	<h3>信息管理</h3>
    <ul>
    	<li><a href="info_lm/default.asp" target="mainFrame">信息栏目管理</a> <a href="info_lm/add.asp"  target="mainFrame" style=" display:none;">| 添加</a></li>
        <li style="background:none;">--中文版--</li> 
        <%call admin_left_nav("info_lm",10,"info_co")%> 
       <!-- <li style="background:none; 1display:none; ">--英文版--</li> -->
        <%'call admin_left_nav("info_lm",33,"info_co")%>   
    </ul>
	<h3>产品管理</h3>
    <ul>
    	<li><a href="pro_lm/default.asp" target="mainFrame">产品分类管理</a> | <a href="pro_lm/add.asp" target="mainFrame" 1style="display:none;">添加</a></li>
        <li><a href="pro_co/default.asp" target="mainFrame">产品信息管理</a> | <a href="pro_co/add.asp" target="mainFrame">添加</a></li>
       <%'call admin_left_nav("pro_lm",0,"pro_co")%> 
        <!--<li><a href="pro_order/default.asp" target="mainFrame">产品订购管理</a></li>-->
    </ul>
    <h3 style="display:none;">会员管理</h3>
    <ul style="display:none;">
        <li class="li_03"><a href="person/default.asp" target="mainFrame">会员资料管理</a> | <a href="person/add.asp" target="mainFrame">添加</a></li>
    </ul>
    <h3 11style="display:none;">招聘管理</h3>
    <ul 11style="display:none;">
        <li class="li_03"><a href="job/default.asp" target="mainFrame">人才招聘管理</a> | <a href="job/add.asp" target="mainFrame">添加</a></li>
        <li class="li_03"><a href="job/default_yp.asp" target="mainFrame">应聘简历管理</a></li>
    </ul>
    <h3 style="display:none;">留言管理</h3>
    <ul style="display:none;">
        <li class="li_03"><a href="book/default.asp" target="mainFrame">留言信息管理</a></li>
    </ul>
    <!--<h3>在线申请</h3>
    <ul>
        <li class="li_03"><a href="book2/default.asp" target="mainFrame">在线申请管理</a></li>
    </ul>-->
    <h3 >网站设置</h3>
    <ul >
        <li class="li_03"><a href="setup/edit.asp" target="mainFrame">网站设置</a></li>
    </ul>
    <h3 >在线客服</h3>
    <ul >
        <li class="li_03"><a href="ser_co/default.asp" target="mainFrame">在线客服管理</a></li>
    </ul>
     <h3>图片替换</h3>
    <ul>
        <li class="li_03"><a href="tu_co/default.asp" target="mainFrame">图片替换</a></li>
    </ul>
    <h3>工具下载</h3>
    <ul>
        <li class="li_03"><a href="../images/ACDSee v8.0.39.rar" target="_blank">图片批量压缩工具.rar</a></li>
        <li class="li_03"><a 1href="#" target="_blank">搜狗浏览器.rar</a></li>
        
    </ul>
	<h3>Instant Messenger</h3>
    <ul>
    	<li class="li_01">
			<SCRIPT LANGUAGE="JavaScript">
				<!--
				document.write("Javascript 可执行") 
				//-->
            </SCRIPT>
            <noscript>Javascript 不执行</noscript>
        </li>
    	<li class="li_01">
			<SCRIPT LANGUAGE="JavaScript">   
				<!--  
				function chkFlash() {
					var isIE = (navigator.appVersion.indexOf("MSIE") >= 0);
					var hasFlash = true;
				
					if(isIE) {
						try{
							var objFlash = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
						} catch(e) {
							hasFlash = false;
						}
					} else {
						if(!navigator.plugins["Shockwave Flash"]) {
							hasFlash = false;
						}
					}
					return hasFlash;
				}
				(chkFlash)?document.write('Flash 插件已安装'):document.write('Flash 插件未安装');          
				//-->       
            </SCRIPT>
  		</li>
    </ul>
</div>
</body>
</html>