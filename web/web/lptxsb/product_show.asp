<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		z_body_c=rs("z_body_c")
		z_body_f=rs("z_body_f")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
%>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/quicknav.css" />
<script type="text/javascript" src="c/common.js?v=2012081522"></script>
<style type="text/css">
<!--
.STYLE1 {
	color: #a49a9a;
	font-size: 14px;
}
.STYLE8 {
	color: #27B5A6;
	font-weight: bold;
	font-size:16px;
}
#focus{width:1002px;height:302px;text-align:left;}
#focus div{position:absolute;width:1002px;height:302px;overflow:hidden;}
#focus img{width:1002px;height:302px;}
#focus #focus_img{display:none;}
#focus_show{ float:left; margin-right:0px;}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><Td align="center">
<!--#include file="top.asp"-->
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div id="focus">
    <div id="focus_bg"></div>
    <div id="focus_show"></div>
    <div id="focus_img">
<div name="focus_img" id="focus_1">images/ny-01_09.jpg|product_show.asp?id=5&lm=1|I600</div>

<div name="focus_img" id="focus_2">images/ny-02_09.jpg|product_show.asp?id=10&lm=1|I580</div>

<div name="focus_img" id="focus_3">images/ny-03_09.jpg|product_show.asp?id=7&lm=1|I500</div>

<div name="focus_img" id="focus_4">images/ny-04_09.jpg|product_show.asp?id=5&lm=1|I600</div>
    </div>
    <script type="text/javascript" src="js/focus.js"></script>
  </div></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="878"><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46" align="center" valign="middle" style=" background:url(images/neiye-k_11.jpg) left no-repeat "><table width="1002" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="61" height="30" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="941" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 产品中心 > <%=title%></span><div class="pro_class">
                <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from pro_lm where fid=0 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
	if lm=rs("id_lm") then
%>

<a class="Findon" href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a>
<%else%>
       			  <a href="product.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a>
<%
end if
	rs.movenext
	wend
	rs.close
	set rs=nothing
%>
      </div>
              <span class="STYLE8">产品中心</span></td>
          </tr>
            <tr><td colspan="2"><img src="images/neiye-zx_33.jpg" /></td>
            </tr>
        </table>
        
        </td>
      </tr>
      <tr>
        <td height="811" align="left" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
        <div class="show">
<script language="javascript">
function $(id){
return document.getElementById(id);
}
function xxk(num,id,ii,iii)
{
//alert(ii);
var dq;
 for(var i=1;i<=num;i++)
 {
   if(i==id){
  dq=$(ii+i).className='sec'; //当前选项
  $(iii+i).style.display="block";
   }
   else
   {
   dq=$(ii+i).className='sec1';
   $(iii+i).style.display="none";
   }
 }
}
</script>
        <div class="ly-tb" style="line-height:150%; width:960px;height:auto;">
        <div class="news">
          <ul>
            <li bgcolor="#FFFFFF"  id="t1" class="sec1" onclick="xxk(4,1,'t','tt')">产品特征</li>
            <li bgcolor="#FFFFFF" id="t2" class="sec1" onclick="xxk(4,2,'t','tt')">规格参数</li>
            <li id="t3" class="sec" onclick="xxk(4,3,'t','tt')">图片展示</li>
            <li bgcolor="#FFFFFF" id="t4" class="sec1" onclick="xxk(4,4,'t','tt')">服务支持</li>
          </ul>
          <div class="clear"></div>
          <div class="zjly">
            <div id="tt1" class="news_ly none">
              <%=z_body%>
			<div class="clear"></div>
            </div>
            <div id="tt2" class="news_ly none">
<%=z_body_c%>
<div class="clear"></div>
            </div>
            <div id="tt3" class="news_ly">
<% 
   set rsp=server.createobject("adodb.recordset")
   sqlp="select top 1 * from pro_img where pro_id="&id&" order by id"
   rsp.open sqlp,conn,1,1
   if not rsp.eof then
   do while not rsp.eof %>
       <img src="<%=getbpic(rsp("img_sl"),"d")%>" name="picimg" width="940" id="picimg" />
       <%
   rsp.movenext
   loop
   else
   %>
   暂无图片
   <%
   end if
   rsp.close%>
       <table align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
        <tbody><tr>
          <td width="30" height="100" align="left" valign="middle"><img style="cursor:pointer"  src="images/le.jpg" onmouseover="scroll(-2)" onmouseout="scroll(0)" onmousedown="scroll(-3)" alt="" border="0" height="55" width="50"></a></td>
          <td width="430">
		  <script language="javascript">
function scroll(n)
{temp=n;
Out1.scrollLeft=Out1.scrollLeft+temp;
if (temp==0) return;
setTimeout("scroll(temp)",80);
}
      </script>
		<!-- <marquee scrollamount="2" direction="left">--> <div id="Out1" style="height:100px; width:810px;overflow: hidden">
            <table width="100" height="65" border="0" cellpadding="0" cellspacing="0">
              <tbody><tr align="left">
              <td width="2" height="60" align="left"></td>
<% 
   set rsp=server.createobject("adodb.recordset")
   sqlp="select * from pro_img where pro_id="&id&" order by id"
   rsp.open sqlp,conn,1,1
   if not rsp.eof then
   do while not rsp.eof %>
				<td width="100" height="60" align="left"><table align="left" border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td width="100" height="100" align="left" valign="middle"><img style="cursor:pointer" src="<%=rsp("img_sl")%>" alt="" onclick="javascript:document.getElementById('picimg').src='<%=getbpic(rsp("img_sl"),"d")%>'" border="0" height="80"></td>
                    </tr>
                </tbody></table></td>
				<td width="2">&nbsp;&nbsp;</td>
<%
   rsp.movenext
   loop
   else
   %>
   <span style="color:#FFF">暂无图片</span>
   <%
   end if

   rsp.close%>
   <td width="10" height="60" align="left"></td>
              </tr>
            </tbody></table>
	      </div><!--</marquee>--></td>
          <td align="right" valign="middle" width="30"><img style="cursor:pointer" src="images/ri.jpg" onmouseover="scroll(2)" onmouseout="scroll(0)" onmousedown="scroll(10)" alt="" border="0" height="55" width="50"></a></td>
        </tr>
      </tbody></table>
<div class="clear"></div>
            </div>
            <div id="tt4" class="news_ly none">
            <div class="item">
                        	<h2>说明书下载</h2>
			                <ul id="downloads">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,dow_sl,wtime from info_co where pass='yes' and lm=10 and title like'%"&title&"%' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		while not rs.eof
%>
                            <li><a href="<%=rs("dow_sl")%>" target="_blank"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a><%=rs("wtime")%></li>
                          <%
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>          </ul>
<div class="clear"></div>
			                <a href="down.asp" target="_blank" class="extra-link"><em class="download-x"></em>更多下载</a>
                            </div><div class="clear"></div>
                     <div class="item">
                            	<h2>相关信息</h2>
			                <ul id="news">
<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime from info_co where pass='yes' and lm in(3,4,8) and title like'%"&title&"%' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		while not rs.eof
%>
                            <li><a href="news_show.asp?id=<%=rs("id")%>" target="_blank"><font style="color:<%=rs("color_font")%>;"><%=rs("title")%></font></a><%=rs("wtime")%></li>
                          <%
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>          </ul>
<div class="clear"></div>
			                <a href="http://bbs.myoppo.com/forumdisplay.php?fid=217" target="_blank" class="extra-link"><em class="info-x"></em>更多信息</a>
                            
                            </div>
<div class="clear"></div>
            </div>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
        </div>
        </div>
    <div class="page" style="text-align:right;"><a href="javascript:history.back();">[返回]</a></div>   </div>   
        </td>
      </tr>
      <tr>
        <td height="21"><img src="images/neiye_55.jpg" width="1002" height="21" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><img src="images/lp_17.jpg" width="1002" height="1" /></td>
  </tr>
</table><table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</Td></tr></table>
</body>
</html>
