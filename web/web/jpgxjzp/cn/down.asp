<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="../index.slide.asp"-->
	<div class="main">
        	<div class="listcon">
            	<div class="listconL">
                        <div class="listp">
                            <h4><img src="images/down.jpg" width="242" height="46" /></h4>
                                 <div class="listpcon">
                                    <ul>
                                    <div class="licon">
                                    <%call info_lm_nav(47,"down.asp")%>
                                    <a href="down.asp">下载中心</a>
                                    </div>
                                    </ul>
                                
                                </div>
                        </div>
                        <!--#include file="../index.left.asp"-->
                
                </div>
                <div class="listconR">
                
                	<div class="hh">
                    	<table width="100%"><tr><td>
                    	<div class="hhL">
                        	<h5><b>音科资讯</b>——倾听天籁之音......</h5>     
                        </div>
                        </td><td>
                        <div class="hhR" style="width:100%; text-align:right;">
                        <a href="index.asp">首页</a> >> <a href="down.asp">下载中心</a> >> <%=info_lm_title(request.QueryString("fid"))%>
                        </div>
                        </td></tr></table>
                    </div>
                    <div class="Rcon">
                    	<ul style="height:auto;">
                         <!--#include file="../html.down.asp"-->
                        </ul>
                    </div>
                	<div class="page">
                    	<!--#include file="../html.page.asp"-->
                    </div>
                </div>
            </div> 
    </div>
<!--#include file="../index.end.asp"-->
</body>
</html>