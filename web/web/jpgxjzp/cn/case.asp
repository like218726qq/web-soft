<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../html.conn.asp"-->
<!--#include file="../html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('.tm');
</script>
</head>
<body>
<!--#include file="../index.top.asp"-->
<!--#include file="../index.menu.asp"-->
<!--#include file="../index.slide_sub.asp"-->  
  <div class="listcon">
    	<div class="listtitle">
        	<p>您现在的位置：<a href="index.asp">首页</a> > <a href="case.asp">案例展示</a> >  <%=info_lm_title(request.QueryString("fid"))%></p>
        </div>
         <br/>
       <style>.listL h4 a span{ color:#fff;}</style>
  		<div class="listL">
			<h4>案例展示 》栏目导航</h4>
            <ul>
            <%call info_lm_nav(51,"case.asp")%>
             <li><a href="case.asp?fid=51" class="cc">案例展示</a></li>
            <div class="clear"></div>
            </ul>
        </div>
  		<div class="listR">
        	<ul style="height:auto;">
            <!--#include file="../html.case.asp"-->  
            </ul>
        </div>
        <div class="page">
        <!--#include file="../html.page_num.asp"-->  
        </div>
   <div class="clear"></div>         
  </div>

<!--#include file="../index.end.asp"-->
</body>
</html>