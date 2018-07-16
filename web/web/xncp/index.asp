<!--#include file="conn.asp"-->
<%k=1%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=site_title%></title> 
<meta name="keywords" content="<%=site_key%>" />
<meta name="description" content="<%=site_des%>"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="scripts/scrollpic.js"></script>
<script src="scripts/jquery-1.7.1.min.js"></script>
<style type="text/css">
ul,li{ margin:0px; padding:0px; list-style:none; }
a{ color:#666; text-decoration:none;}

.rollBox{width:910px;height:190px;position:relative;margin:0 auto;}
.rollBox #pic_box{
	width:910px;
	height:190px;
	position:absolute;
	left:5px;
	top:-3px;
	overflow:hidden;
}
.rollBox .pic_item{ width:204px; height:190px; float:left; margin-right:17px;}
.rollBox .page_on_left { position:absolute; left:-30px; top:40px;text-align: center;cursor: pointer; z-index:1000;}
.rollBox .page_on_right {position:absolute; right:-30px; top:40px;text-align: center;cursor: pointer; z-index:1000;}
</style>
</head>

<body>
	<!--#include file="top.asp"-->
	<div class="main">
    	<!--#include file="banner.asp"-->
    	<div class="content">
        	<div class="cont1">
            	<h4>公司简介<b>About us</b></h4>
                <div class="cont1con">
                    <p> <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=4"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write (rehtml(getstr(rs("z_body"),224)))
	end if
	rs.close
	set rs=nothing
%><a href="about.asp?id=1">[了解详情]</a></p>
                </div>
            </div>
            <div class="cont1M">
            	<h4><a href="news.asp"><img src="images/index_50.jpg" width="33" height="6" /></a>新闻资讯<b>News</b></h4>
                <div class="cont1Mcon">
                	<div class="cont1M1">
                    	<div class="cont1Mimg"><img src="images/index_56_56.jpg" width="100" height="63" /></div>
                        <div class="cont1MR">
                        <%
							set rs=server.CreateObject("adodb.recordset")
							sql="select top 1 * from info_co where lm=2 or lm=1 and pass='yes'  order by px desc,id desc"
							rs.open sql,conn,1,1
							while not rs.eof 
						%>
                        	<h5><%=left(rs("title"),25)%></h5>
                            <p><%=left(rs("z_body"),40)%><%
								rs.movenext
								wend
								rs.close
								set rs=nothing 
							%><a href="news.asp">[了解详情]</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                   <div class="cont1Mn">
                   		<ul>
                        <%
							set rs=server.CreateObject("adodb.recordset")
							sql="select top 4 * from info_co where lm=2 or lm=1 and pass='yes' and tuijian='yes' order by px desc,id desc"
							rs.open sql,conn,1,1
							while not rs.eof 
						%>
                        	<li><a href="disnews.asp?id=<%=rs("id")%>"><span>[<%=formatdate(rs("wtime"))%>]</span><%=left(RS("title"),24)%></a></li>
                            <%
								rs.movenext
								wend
								rs.close
								set rs=nothing 
							%>
                        </ul>
                   </div> 
                    
                </div>
            </div>
            <div class="cont1R">
            	<h4><span><a href="contact.asp"><img src="images/index_50.jpg" width="33" height="6" /></a></span>联系我们<b>Contact Us</b></h4>
                <div class="cont1Rcon" style="line-height:180%;">
                	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=5"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>
                </div>
            </div>
            
            
            <div class="clear"></div>
            
            <div class="cont2">
        	<h4>
            	<span><a href="pro.asp"><img src="images/index_50.jpg" width="33" height="6" /></a></span>
                <script>
					$(function(){
						$('.aaa li a').click(function(){
							var id = $(this).attr('id');
							$('.aaa li a').removeClass('ato');
							$(this).addClass('ato');
						});
						
						$('#pronav1').click(function(){
							$('.pic_item').hide();
							$('.fl1').show();
						});
						
						$('#pronav2').click(function(){
							$('.pic_item').hide();
							$('.fl2').show();
						});
						
						
						$('#pronav3').click(function(){
							$('.pic_item').hide();
							$('.fl3').show();
						});
						$('#pronav4').click(function(){
							$('.pic_item').hide();
							$('.fl4').show();
						});
					});
				</script>
                <ul class="aaa">
                	<li><a  class="ato" style="cursor:pointer" id="pronav1">蔬菜</a></li>
                    <li><a  id="pronav2" style="cursor:pointer">水果</a></li>
                    <li><a  id="pronav3" style="cursor:pointer"> 肉类</a></li>  
                    <li><a  id="pronav4" style="cursor:pointer"> 海鲜类</a></li>
                </ul>
            </h4>
        	<div class="cont2con">
            <div class="rollBox">
    <div class="page_on_left"><img id="r_l" src="images/left.jpg" width="23" border="0" /></div>
    
    <div id="pic_box">
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 8 id,title,img_sl from pro_co where lm in (select id_lm from pro_lm where fid=4) and tuijian='yes' and pass='yes'  order by px desc,id desc"
			rs.open sql,conn,1,1
			while not rs.eof
		%>
        <div class="pic_item fl1">
             <table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="204" height="120" align="center" ><a href="dispro.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" border="0" width="180" height="120" style="border:3px solid #5b9600;"/></a></td>
              </tr>
              <tr>
                <td width="204" height="30" align="center"><a href="dispro.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              </tr>
            </table>
        </div> 
        <%
			rs.movenext
			wend
			rs.close
			set rs=nothing
		%>
        

        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 8 id,title,img_sl from pro_co where lm in (select id_lm from pro_lm where fid=5) and tuijian='yes' and pass='yes'  order by px desc,id desc"
			rs.open sql,conn,1,1
			while not rs.eof
		%>
        <div class="pic_item  fl2">
             <table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="204" height="120" align="center" ><a href="dispro.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" border="0" width="180" height="120" style="border:3px solid #5b9600;"/></a></td>
              </tr>
              <tr>
                <td width="204" height="30" align="center"><a href="dispro.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              </tr>
            </table>
        </div> 
        <%
			rs.movenext
			wend
			rs.close
			set rs=nothing
		%>

        

        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 8 id,title,img_sl from pro_co where lm in (select id_lm from pro_lm where fid=3) and tuijian='yes' and pass='yes'  order by px desc,id desc"
			rs.open sql,conn,1,1
			while not rs.eof
		%>
        <div class="pic_item  fl3">
             <table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="204" height="120" align="center" ><a href="dispro.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" border="0" width="180" height="120" style="border:3px solid #5b9600;"/></a></td>
              </tr>
              <tr>
                <td width="204" height="30" align="center"><a href="dispro.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              </tr>
            </table>
        </div> 
        <%
			rs.movenext
			wend
			rs.close
			set rs=nothing
		%>
        <%
			set rs=server.CreateObject("adodb.recordset")
			sql="select top 8 id,title,img_sl from pro_co where lm in (select id_lm from pro_lm where fid=2) and tuijian='yes' and pass='yes'  order by px desc,id desc"
			rs.open sql,conn,1,1
			while not rs.eof
		%>
        <div class="pic_item  fl4">
             <table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="204" height="120" align="center" ><a href="dispro.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" border="0" width="180" height="120" style="border:3px solid #5b9600;"/></a></td>
              </tr>
              <tr>
                <td width="204" height="30" align="center"><a href="dispro.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              </tr>
            </table>
        </div> 
        <%
			rs.movenext
			wend
			rs.close
			set rs=nothing
		%>
        </div>

    
    
    <div class="page_on_right"><img id="r_r" src="images/right.jpg"  width="23" border="0"/></div>
</div>
<SCRIPT type="text/javascript">
		var scrollPic_02 = new ScrollPic();
		scrollPic_02.scrollContId   = "pic_box"; //内容容器ID
		scrollPic_02.arrLeftId      = "r_l";//左箭头ID
		scrollPic_02.arrRightId     = "r_r"; //右箭头ID

		scrollPic_02.frameWidth     = 890;//显示框宽度
		scrollPic_02.pageWidth      = 221; //翻页宽度

		scrollPic_02.speed          = 30; //移动速度(单位毫秒，越小越快)
		scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
		scrollPic_02.autoPlay       = true; //自动播放
		scrollPic_02.autoPlayTime   = 2; //自动播放间隔时间(秒)

		scrollPic_02.initialize(); //初始化				
</SCRIPT>
            </div>
        
        </div>
            
        </div>
    	
    	
    </div>
    <div class="clear"></div>
	<!--#include file="foot.asp"-->
</body>
</html>
