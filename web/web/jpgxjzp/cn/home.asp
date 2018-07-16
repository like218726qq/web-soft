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
    	  <div class="clear"></div>
            <div class="content">
            <!--左侧-->
                <div class="contL">
                	<div class="news">
                    	<h4><a href="news.asp?fid=42"><img src="images/more.jpg" width="45" height="20" /></a></h4>
                        <div class="newcon">
                        	<ul>
                            <%call index_news_tuijian(42,8)%>
                            </ul>
                        </div>
                    </div>
                    <div class="hflj">
                    	<h4><a href="news.asp?fid=41"><img src="images/more.jpg" width="45" height="20" /></a></h4>
                         <div class="hfcon">
                        	<ul>
                            <%call index_news_tuijian(41,7)%>
                            </ul>
                        </div>
                    </div>
                	<div class="ymzx">
                    	<h4><a href="students.asp"><img src="images/more.jpg" width="45" height="20" /></a></h4>
                    	<div class="ymzxcon">
                        	<div class="cont">
                            	<ul>
                                <%call index_info_tuijian(37,2,"students.asp")%>
                                </ul>
                            </div>
                            <div class="conb">
                            	<ul>
                                	<%call index_info_hot(37,2,"students.asp")%>
                                  </ul>
                            </div>
                        </div>
                    </div>
                <div class="lxfs">
                	<h4><a href="contact.asp"><img src="images/more.jpg" width="45" height="20"  title="联系我们"/></a></h4>
                	<div class="lxfscon">
                    <%=site_can1%>
                    </div>
                </div>
                <div class="zs">
                	<a href="join.asp"><img src="images/zs.jpg" width="299" height="82" title="招生简章"/></a>
                </div>
                </div>
<!--右侧-->
                <div class="contR">
                	<div class="gy">
                    	<h4><a href="about.asp"><img src="images/more2.jpg" width="45" height="20" title="联系我们"/></a></h4>
                    	<div class="gycon">
                        	<div class="gycont">
                            	<img src="../<%=tu_co(3,"cn/images/gyimg.jpg")%>" width="193" height="142" />
                            	<div class="gycontt">
                                	<%=site_can2%>
                                    <a href="about.asp">>>详细</a>
                                </div>
                            </div>
                        </div>
                    </div>
                	<div class="jsdw">
                    	<h4><a href="about.asp"><img src="images/more2.jpg" width="45" height="20" /></a></h4>
                    	<div class="jsdwcon">
                        	<ul>
                            <%
							function index_info_tuijian2(lm,num,url)
									set rs = server.createobject("adodb.recordset")
									  sql="select top "&num&" * from info_co where lm in("&lm&") and tuijian='yes' order by px desc,id desc "
									  rs.open sql,conn,1,1
									  if not  rs.eof then
										while not rs.eof
										%>
									  <li><a href="<%=url%>?id=<%=rs("id")%>"><img src="../<%=rs("img_sl")%>" width="119" height="95" /><br /><p><b><%=rs("title")%></b><%=rs("f_body")%></p></a></li>	
										<%
										rs.movenext
										wend
									  end if
									  rs.close
									  set rs=nothing
							end function
							%>
                             <%call index_info_tuijian2(38,12,"teachers.asp")%>
                            </ul>
                        </div>	
                    </div>
                	<div class="fwzl">
                    	<h4><a href="service.asp"><img src="images/more2.jpg" width="45" height="20" title="服务中心"/></a></h4>
                        <div class="fwzlcon">                        	
                        	<ul>
                            	<li>
                                <%
								set rs = server.createobject("adodb.recordset")
									  sql="select top 1 * from info_co where lm in(55) and hot='yes' order by px desc,id desc "
									  rs.open sql,conn,1,1
									  if not  rs.eof then
										while not rs.eof
										%>
										<div class="licon">
                                    	<div class="liT">
                                        	<img src="../<%=rs("img_sl")%>" width="167" height="107" />
                                            <div class="Tcon">
                                            	<p class="redd"><%=rs("title")%></p>
                                                <p>时间：<%=fdate(rs("wtime"))%></p>
                                                <p>关键词：<%=rs("keys")%></p>
                                            </div>
                                        </div>
                                        <div class="liB">
                                        <%=rs("f_body")%>
                                        </div>
                                    </div>
										<%
										rs.movenext
										wend
									  end if
									  rs.close
									  set rs=nothing
								%>
                                </li>
                            	<li class="onn">
                                <%
								set rs = server.createobject("adodb.recordset")
									  sql="select top 1 * from info_co where lm in(55) and tuijian='yes' order by px desc,id desc "
									  rs.open sql,conn,1,1
									  if not  rs.eof then
										while not rs.eof
										%>
										<div class="liconn">
                                    	<img src="../<%=rs("img_sl")%>" width="167" height="107" />
                                        <p class="redd"><%=rs("title")%></p>
                                        <br />
                                       <%=rs("f_body")%>
                                    </div>
										<%
										rs.movenext
										wend
									  end if
									  rs.close
									  set rs=nothing
								%>
                                	
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
<div class="clear"></div>
</div>   
<!--#include file="../index.end.asp"-->    
</body>
</html>
