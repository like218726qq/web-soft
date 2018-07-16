<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/MSClass.js"></script>
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
             
                <li class="oms n1"  id="n1" onmouseover="showdiv1(1)">硕士</li>
                <li class="n2" id="n2" onmouseover="showdiv1(2)">高中</li>
                
             </ul>
             <a href="yz_ss.asp">更多>></a>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
          <!------------------------------------>
              <div id="new1">
                 <!--学校列表-->
                 <ul class="xylb">
					 <%
                        set rs=server.CreateObject("adodb.recordset")
                        sql="select top 3 * from info_co where lm=42 and tuijian='yes' and pass='yes' order by px desc,id desc"
                        rs.open sql,conn,1,1
                        while not rs.eof 
                    %>
                    <li><a href="yz_ss_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" /></a><br />
                  <a href="yz_ss_show.asp?id=<%=rs("id")%>"> <%=rs("title")%></a></li>
                     <%
						rs.movenext
						wend
						rs.close
						set rs=nothing 
					%>
                 </ul>
                <div class="clear"></div>
                 <!--学校列表-->
                 <ul class="xylb2">
                 	<%
                        set rs=server.CreateObject("adodb.recordset")
                        sql="select top 12 * from info_co where lm=42 and tuijian='no' and pass='yes' order by px desc,id desc"
                        rs.open sql,conn,1,1
                        while not rs.eof 
                    %>
                   <li><a href="yz_ss_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),13)%></a></li>
                   	<%
						rs.movenext
						wend
						rs.close
						set rs=nothing 
					%>
                 </ul>
                 <div class="clear"></div>
             </div>
         <!----------------------->
               <div  id="new2" style="display:none">
                                <!--学校列表-->
                 <ul class="xylb" >
					 <%
                        set rs=server.CreateObject("adodb.recordset")
                        sql="select top 3 * from info_co where lm=43 and tuijian='yes' and pass='yes' order by px desc,id desc"
                        rs.open sql,conn,1,1
                        while not rs.eof 
                    %>
                    <li><a href="yz_gz_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" /></a><br /><a href="yz_gz_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
                     <%
						rs.movenext
						wend
						rs.close
						set rs=nothing 
					%>
                 </ul>
                 <div class="clear"></div>
                 <!--学校列表-->
                 <ul class="xylb2">
                 	<%
                        set rs=server.CreateObject("adodb.recordset")
                        sql="select top 12 * from info_co where lm=43 and tuijian='no' and pass='yes' order by px desc,id desc"
                        rs.open sql,conn,1,1
                        while not rs.eof 
                    %>
                   <li><a href="yz_gz_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),13)%></a></li>
                   	<%
						rs.movenext
						wend
						rs.close
						set rs=nothing 
					%>
                 </ul>
                 <div class="clear"></div>
             </div>
              <!---------------------->
              
              
          </div>
       </div>
       
       <div class="mle_par">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">申请攻略</li>
             </ul>
             <a href="yz_sq.asp">更多>></a>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--文章-->
             <div class="wz">
             	<%
					set rs=server.CreateObject("adodb.recordset")
					sql="select top 1 * from info_co where lm=44 and tuijian='yes' and pass='yes' order by px desc,id desc"
					rs.open sql,conn,1,1
					while not rs.eof 
				%>
                <img src="images/ny_08.jpg" />
                <span><%=rs("title")%></span><br />
               <%=getstr(rs("f_body"),150)%><a href="yz_sq_show.asp?id=<%=rs("id")%>">[详细]</a>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing 
				%>
             </div>
             <div class="clear"></div>
             <!--学校列表-->
              <div class="wz_ul1">
                 <div id="MarqueeDiv2" style="width:335px; height:180px; ">
                     <table border="0" cellpadding="0" cellspacing="0" align="center" width="335">
                        <%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select top 20 * from info_co where lm=44 and tuijian='no' and pass='yes' order by px desc,id desc"
                            rs.open sql,conn,1,1
                            while not rs.eof
                        %>
                      <tr>
                        <td align="left" style="line-height:22px;" ><a href="yz_sq_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),48)%></a></td>
                      </tr>
                        <%
                            rs.movenext
                            wend
                            rs.close
                            set rs=nothing
                        %>
                    </table>
                </div>
				<script type="text/javascript">
                    var rollBox2= new Marquee("MarqueeDiv2",0,5,338,180,180,0,0,150);
                </script>
             </div>
             
           
             <div class="clear"></div>
          </div>
       </div>
       <div class="mle_par">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                 <li class="oms f1"  id="f1" onmouseover="showdiv2(1)">学生故事</li>
                <li class="f2" id="f2" onmouseover="showdiv2(2)">老师心声</li>
             </ul>
             <a href="yz_xs.asp">更多>></a>
          </div>
          <div class="clear"></div>
          
          <!-------------------------------------------------------------------->
          <div  id="fw1">
          <div class="mle_cont">
             <!--文章-->
             <div class="wz">
              <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select  top 1 * from info_co where lm=45 and tuijian='yes' and pass='yes' order by px desc,id desc"
					rs.open sql,conn,1,1
					while not rs.eof 
				%>
                <img src="<%=rs("img_sl")%>" />
                <span><%=rs("title")%></span><br />
                <%=getstr(rs("f_body"),150)%><a href="yz_xs_show.asp?id=<%=rs("id")%>">[详细]</a>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing 
				%>
             </div>
             <div class="clear"></div>
             <!--学校列表-->
               <div class="wz_ul1">
                 <div id="MarqueeDiv3" style="width:335px; height:180px; ">
                     <table border="0" cellpadding="0" cellspacing="0" align="center" width="335">
                        <%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select top 20 * from info_co where lm=45 and tuijian='no' and pass='yes' order by px desc,id desc"
                            rs.open sql,conn,1,1
                            while not rs.eof
                        %>
                      <tr>
                        <td align="left" style="line-height:22px;" ><a href="yz_xs_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),48)%></a></td>
                      </tr>
                        <%
                            rs.movenext
                            wend
                            rs.close
                            set rs=nothing
                        %>
                    </table>
                </div>
				<script type="text/javascript">
                    var rollBox3= new Marquee("MarqueeDiv3",0,5,338,180,180,0,0,150);
                </script>
             </div>
          
             <div class="clear"></div>
          </div>
          </div>
          
          
          <div  id="fw2" style="display:none">
          <div class="mle_cont">
             <!--文章-->
             <div class="wz">
              <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select  top 1 * from info_co where lm=46 and tuijian='yes' and pass='yes' order by px desc,id desc"
					rs.open sql,conn,1,1
					while not rs.eof 
				%>
                <img src="<%=rs("img_sl")%>" />
                <span><%=rs("title")%></span><br />
                <%=getstr(rs("f_body"),150)%><a href="yz_ls_show.asp?id=<%=rs("id")%>">[详细]</a>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing 
				%>
             </div>
             <div class="clear"></div>
             <!--学校列表-->
             <div class="wz_ul1">
                 <div id="MarqueeDiv4" style="width:335px; height:180px; ">
                     <table border="0" cellpadding="0" cellspacing="0" align="center" width="335">
                        <%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select top 20 * from info_co where lm=46 and tuijian='no' and pass='yes' order by px desc,id desc"
                            rs.open sql,conn,1,1
                            while not rs.eof
                        %>
                      <tr>
                        <td align="left" style="line-height:22px;" ><a href="yz_ls_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),48)%></a></td>
                      </tr>
                        <%
                            rs.movenext
                            wend
                            rs.close
                            set rs=nothing
                        %>
                    </table>
                </div>
				<script type="text/javascript">
                    var rollBox4= new Marquee("MarqueeDiv4",0,5,338,180,180,0,0,150);
                </script>
             </div>

             <div class="clear"></div>
          </div>
          </div>
          <!------------------------------------------------------------------>
          
       </div>
       <div class="mle_par">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">留学生活</li>
             </ul>
             <a href="yz_lx.asp">更多>></a>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--文章-->
             <div class="wz">
				 <%
                    set rs=server.CreateObject("adodb.recordset")
                    sql="select top 1 * from info_co where lm=47 and tuijian='yes' and pass='yes' order by px desc,id desc"
                    rs.open sql,conn,1,1
                    while not rs.eof 
                %>
                <img src="<%=rs("img_sl")%>" />
                <span><%=rs("title")%></span><br />
               <%=getstr(rs("f_body"),130)%><a href="yz_lx_show.asp?id=<%=rs("id")%>">[详细]</a>
				<%
					rs.movenext
					wend
					rs.close
					set rs=nothing 
				%>

             </div>
             <div class="clear"></div>
             <!--学校列表-->
               <div class="wz_ul1">
                 <div id="MarqueeDiv5" style="width:335px; height:180px; ">
                     <table border="0" cellpadding="0" cellspacing="0" align="center" width="335">
                        <%
                            set rs=server.CreateObject("adodb.recordset")
                            sql="select top 20 * from info_co where lm=47 and tuijian='no' and pass='yes' order by px desc,id desc"
                            rs.open sql,conn,1,1
                            while not rs.eof
                        %>
                      <tr>
                        <td align="left" style="line-height:22px;" ><a href="yz_lx_show.asp?id=<%=rs("id")%>">·<%=getstr(rs("title"),48)%></a></td>
                      </tr>
                        <%
                            rs.movenext
                            wend
                            rs.close
                            set rs=nothing
                        %>
                    </table>
                </div>
				<script type="text/javascript">
                    var rollBox5= new Marquee("MarqueeDiv5",0,5,338,180,180,0,0,150);
                </script>
             </div>
             
           
             <div class="clear"></div>
          </div>
       </div>
   </div>
   
   <!--内页右边-->
   <div class="main_right">
       <!--微博栏-->
      <div class="wbl">
          <!--#include file="left_wb.asp"-->
       </div>
       <div class="clear"></div>
        <!--图片-->
        <!--#include file="left_bottom1.asp"-->
   </div>
   <div class="clear"></div>
</div>
<script language="javascript">
	function showdiv1(n){
		for(i=1;i<3;i++){
			if (n==i){
				document.getElementById("n"+i).className="n1";
				document.getElementById("new"+i).style.display="block";
			}
			else{
				document.getElementById("n"+i).className="n2";
				document.getElementById("new"+i).style.display="none";
			}
		}
	}
	function showdiv2(f){
		for(i=1;i<3;i++){
			if (f==i){
				document.getElementById("f"+i).className="f1";
				document.getElementById("fw"+i).style.display="block";
			}
			else{
				document.getElementById("f"+i).className="f2";
				document.getElementById("fw"+i).style.display="none";
			}
		}
	}
</script>
<div id="footer">
<!--#include file="bottom.asp"-->
</div>
</body>
</html>
