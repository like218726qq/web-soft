<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="html.conn.asp"-->
<!--#include file="html.title.asp"-->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('.plit');
</script>
</head>

<body>
	<div class="Top"></div>
    
	<div class="main">
    	<!--内页部分start-->
    	<div class="mainto" >
        	<!--#include file="index.top.asp"-->
            <!--#include file="index.menu.asp"-->
            <div class="content">
            	<!--#include file="index.left.asp"-->
            	
            	<div class="pcontR" >
                	<div class="pban">
                    <img src="images/<%=url_filename%>.jpg" width="792" height="204" />
                    </div>
                    <div class="ptit">
                    <a href="index.asp">首页</a>》》<a href="products.asp">产品展示</a>》》<%=pro_lm_title(request.QueryString("fid"))%>
                    <%
					fid2=request.QueryString("fid2")
					if fid2<>"" then
					response.Write " 》》"&pro_lm_title(fid2)
					end if
					%>
                    </div>
                    
                     <div class="pR2">
                    	<h4>
                        	<b>产品展示</b>
                            <strong>Products</strong>
                     	 </h4>
                    <div class="PPcon">
                                	<ul>
                                    <!--#include file="html.products.asp"-->
                                    </ul>
                                </div>
                        
                    </div>
                	<div class="clear"></div>
                    <!--#include file="html.page_num.asp"-->
                    <div class="clear"></div>
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
                  <div class="clear"></div>   
               <div class="pyq">
            	<h5>友情链接</h5>
            	<div class="pyqcon">
                	<div class="yqL"><img src="images/yqL.jpg" width="12" height="59" /></div>
                    <div class="pyqM">
                    <table width="100%" align="left"><tr>
                    	<%call links2(52)%>
                     </tr></table>   
                    </div>
                    <div class="yqR"><img src="images/yqR.jpg" width="12" height="59" /></div>
                </div>
            </div>
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