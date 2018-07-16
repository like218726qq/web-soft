<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="html.conn.asp"-->
<%info_co(34)%>
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
    	<div class="mainto">
        	<!--#include file="index.top.asp"-->
            <!--#include file="index.menu.asp"-->
            <div class="content">
            <!--#include file="index.left.asp"-->
            	<div class="pcontR">
                	<div class="pban">
                    <img src="images/<%=url_filename%>.jpg" width="792" height="204" />
                    </div>
                    <div class="ptit">
                    <a href="index.asp">首页</a>》》<a href="map.asp">网站地图</a>
                   
                    </div>
                    
                     <div class="pR2">
                    	<h4>
                        	<b>网站地图</b>
                            <strong>Site map</strong>
                     	 </h4>
                    <div class="about">
                    <style>
					.about ul{ padding-left:40px; margin:auto;}
					.about ul li{ padding:auto ; margin:atuo; list-style:outside square; font-size:13px;}
					.about ul li ul li{ list-style:circle; font-size:12px;}
					.about ul li ul li ul li{ list-style:decimal; font-size:11px;}
					</style>
							<ul style="margin-left:100px;">
                            	<li><a href="about.asp">关于我们</a></li>
                                <li><a href="products.asp">产品展示</a>
                                	<ul>
									<%
                                    set rs = server.createobject("adodb.recordset")
                                          sql="select  * from pro_lm where fid=0 order by px desc,id_lm desc "
                                          rs.open sql,conn,1,1
                                          if not  rs.eof then
                                          while not rs.eof
                                            %>
                                            <li>
                                            <a href="products.asp?fid=<%=rs("id_lm")%>&tag=0"><%=rs("title_lm")%></a>
                                                <ul style="display:none;">
                                                <%
                                                set rsa = server.createobject("adodb.recordset")
                                                      sqla="select  * from pro_lm where fid="&rs("id_lm")&" order by px desc,id_lm desc "
                                                      rsa.open sqla,conn,1,1
                                                      if not  rsa.eof then
                                                      while not rsa.eof
                                                        %>
                                                        <li>
                                                        <a href="products.asp?fid=<%=rs("id_lm")%>&fid2=<%=rsa("id_lm")%>&tag=1"><%=rsa("title_lm")%></a>
                                                        </li>
                                                        <%
                                                      rsa.movenext
                                                      wend	
                                                      end if
                                                      rsa.close
                                                      set rsa=nothing
                                                %>
                                                </ul>
                                            </li>
                                            <%
                                          rs.movenext
                                          wend	
                                          end if
                                          rs.close
                                          set rs=nothing
                                    %>
                                    </ul>
                                </li>
                                <li><a href="job.asp">人才招聘</a></li>
                                <li><a href="message.asp">客户留言</a></li>
                                <li><a href="contact.asp">联系我们</a></li>
                                <li><a href="news.asp">新闻中心</a></li>
                                <li><a href="map.asp">网站地图</a></li>
                            </ul>
                      </div>
                        
                    </div>
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
