<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="html.conn.asp"-->
<!--#include file="html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	<div class="Top"></div>
	<div class="main">
    	<!--内页部分start-->
    	<div class="mainto">
        	<!--#include file="index.top.asp"-->
        	<!--#include file="index.menu.asp"-->
            <!--#include file="index.slide.asp"-->
            <div class="content">
            	<div class="contL">
                	<div class="Ltop"><img src="images/Ltop.jpg" width="152" height="15" /></div>
                    <div class="Lcon">
                    	<div class="Lt">
                        	<b>产品中心</b>
                            <strong>Products</strong>
                        </div>
                        <div class="clear"></div>
                        <!--#include file="menu_left_01.asp"-->
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                    <div class="Lbut"><img src="images/Lbut.jpg" width="152" height="15" /></div>
                	<div class="Limg"><a href='http://jprubber.cn.1688.com/' target='_blank'><img src="images/contimg.jpg" width="152" height="95" /></a></div>
                </div>
            	
            	<div class="contR">
                	<div class="R1">
                    	<div class="company">
                        	<h4>
                            	<b>公司简介</b>
                            	<strong>About Us</strong>
                                <a href="about.asp"><img src="images/more_37.jpg" width="86" height="22" /></a>
                            </h4>
                            <p><%=site_can2%>
                            	
                            </p>
                        </div>
                        <div class="contact">
                        	<h4>
                            	<b>联系我们</b>
                            	<strong>Contact Us</strong>
                            </h4>
                            <div class="contactp">
                            	<%=site_can3%>
                            	
                            </div>
                        </div>
                    </div>
                    <div class="R2">
                    	<h4>
                        	<b>产品展示</b>
                            <strong>Products</strong>
                            <a href="products.asp"><img src="images/more_37.jpg" width="86" height="22" /></a>
                        </h4>
                    	<div class="R2con">
                        	<div class="R2L"><img src="images/R2L.jpg" width="25" height="153" /></div>
                            <div class="R2por">
                            <!--#include file="slide_10.asp"-->
                            </div>
                            <div class="R2R"><img src="images/R2R.jpg" width="25" height="153" /></div>
                    	</div>
                    </div>
                	<div class="R3">
                    	<div class="R3L">
                        	<h4>
                            	<b>公司新闻</b>
                            	<strong>Company News</strong>
                                <a href="news.asp?fid=42"><img src="images/more_37.jpg" width="86" height="22" /></a>
                            </h4>
                            <div class="R3Lcon">
                            	<ul>
                                <%call index_info_tuijian(42,4,"news_show.asp")%>
                                </ul>
                            </div>
                        </div>
                    	<div class="R3R R3f">
                            <h4>
                            <b>行业新闻</b>
                            <strong>Ndustry News</strong>
                            <a href="news.asp?fid=41"><img src="images/more_37.jpg" width="86" height="22" /></a>
                            </h4>
                            <div class="R3Lcon">
                            	<ul>
                                	<%call index_info_tuijian(41,4,"news_show.asp")%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="R4">
                    	<h4>最热询价</h4>
                    	<div class="R4con">
                        	<div class="R4L"><img src="images/R4L.jpg" width="12" height="46" /></div>
                            <div class="R4M">
                            <%call links(35)%>
                            </div>
                            <div class="R4R"><img src="images/R4R.jpg" width="12" height="46" /></div>
                        </div>
                    </div>
                 
                </div>         
            </div>
            <div class="clear"></div>
            <div class="yq">
            	<h5>友情链接</h5>
            	<div class="yqcon">
                	<div class="yqL"><img src="images/yqL.jpg" width="12" height="59" /></div>
                    <div class="yqM">
                    <table width="100%" align="left"><tr>
                    <%call links2(52)%>
                    </tr></table>
                    </div>
                    <div class="yqR"><img src="images/yqR.jpg" width="12" height="59" /></div>
                </div>
            </div>
        </div> 
        <!--内页部分end-->  
        <div class="clear"></div>
        <div class="But"><img src="images/But.jpg" width="1010" height="22" /></div>  
    </div> 
<!--#include file="index.end.asp"-->	
</body>
</html>
