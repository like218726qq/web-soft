<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('.ydcon img,.ydcon input img,.ban,.ban li img');
</script>
</head>
<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="slide.3d.asp"-->
	<div class="body_bg">
    	<div class="line"></div>   
        <div class="listcon">
            <div class="listL">
            	<h4>学校设施</h4>
                <div class="Lcon">
                	<ul>
                    <%call info_lm_nav(40,"shool.asp")%>
                    </ul>
                </div>
            </div>
            <div class="listR">
            	<h5>您当前的位置：<a href="index.asp">首页</a> >> <a href="shool.asp">学校设施</a> >> <%=info_lm_title(request.QueryString("fid"))%> >>  </h5>
                <div class="Rcon">
                <style>
				.img0{ width:165px; height:106px; overflow:hidden; margin:5px auto 10px auto;}
				.txt0{ width:165px; height:25px; line-height:25px; overflow:hidden; margin:0 auto; text-align:center;}
				.img1{ width:105px; height:140px; overflow:hidden; margin:5px auto 8px auto;}
				.txt1{ width:105px; height:25px; line-height:25px; overflow:hidden; margin:0 auto; text-align:center;}
				</style>
                	<ul class="nobg" style="height:auto;">
                    <%ffid=request("fid")
					if ffid="45" then
					%>
                    <!--#include file="../html.video.asp"-->
                    <%else%>
                    <!--#include file="../html.shool.asp"-->
                    <%end if%>
                    </ul>
                     
                </div>
            	<div class="Rbut"><img src="images/listRbut.jpg" width="769" height="4" /></div>
            </div>
              <!--#include file="../html.page.asp"-->
        </div>
    </div>
<!--#include file="../index.end.asp"-->
</body>
</html>
