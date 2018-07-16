<!--#include file="conn.asp"--> 
<%  
	id=request("id")
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from pro_co where id="&id&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		lmlm=rsa("lm")
	else 
	    lmlm=1	
	end if
	rsa.close
	set rsa=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select * from pro_lm where id_lm="&lmlm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		flmlm=rsa("fid")
	else 
	    flmlm=1	
	end if
	rsa.close
	set rsa=nothing
	
	
	
	
	dlm=request("dlm")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	    set rs=server.CreateObject("adodb.recordset")
		sql="select * from pro_co where id="&id&"  and pass='yes' "
		rs.open sql,conn,1,3
		lm=rs("lm")
		
	    
			if rs.eof then
				call msg("该信息不存在或已删除","")
			else
				rs("read_num")=rs("read_num")+1
				rs.update()
				'lm=rs("lm")
				title=rs("title")
				title_en=rs("title_en")
				wtime=rs("wtime")
				read_num=rs("read_num")
				z_body=rs("z_body")
				f_body=rs("f_body")
				img_sl=rs("img_sl")
				pro_danwei=rs("pro_danwei")
				pro_color=rs("pro_color")
				pro_money=rs("pro_money")
				pro_guige=rs("pro_guige")
			end if
		
		rs.close
		set rs=nothing
	
	
	
	
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from pro_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
		
	end if
	rsa.close
	set rsa=nothing
	
    set rsa=server.CreateObject("adodb.recordset")
	sql="select * from info_lm where title_lm='"&title_en&"' "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt; "&rsa("title_lm")
		lm2=rsa("id_lm")
	else 
	    lm2=1000000	
	end if
	rsa.close
	set rsa=nothing

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong0%></title>
<meta content="<%=zhong1%>" http-equiv="keywords" />
<meta content="<%=zhong2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
<script src="js/FancyZoom.js" language="JavaScript" type="text/javascript"></script>
<script src="js/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
<style>
.tab1 ,.tab2{width:667px;height:39px; background:url(images/ny2_40.jpg) left no-repeat;}
.tab1 ul ,.tab2 ul{margin:0;padding:0;}
.tab1 li,.tab2 li{float:left; width:111px; height:26px;text-align:center; padding-top:13px; font-weight:bold; color:#ffffff; cursor:pointer;}
.tab1 li.now,.tab2 li.now{color:#000000;background:#fff;  font-weight:bold;background:url(images/32323232323232323_46.jpg) left no-repeat; }
.tablist{width:627px;height:auto; padding:20px; padding-bottom:30px;font-size:14px; text-align:left; line-height:24px;display:none;}
.block{display:block;}
.red{color:#BD0A01;}
fieldset{width:378px;padding:10px;}
legend{background:#B0C0D1;padding:4px 10px;color:#fff;}
#c{margin-top:10px;}
.c1,.c2{width:378px;line-height:20px;}
.c1{color:#014CC9;}
.c2{color:#7E6095;display:none;}
h3{font-size:16px;padding:5px 0;}
</style>
<script type="text/javascript">
function tab(o, s, cb, ev){ //tab切换类
var $ = function(o){return document.getElementById(o)};
var css = o.split((s||'_'));
if(css.length!=4)return;
this.event = ev || 'onclick';
o = $(o);
if(o){
this.ITEM = [];
o.id = css[0];
var item = o.getElementsByTagName(css[1]);
var j=1;
for(var i=0;i<item.length;i++){
if(item[i].className.indexOf(css[2])>=0 || item[i].className.indexOf(css[3])>=0){
if(item[i].className == css[2])o['cur'] = item[i];
item[i].callBack = cb||function(){};
item[i]['css'] = css;
item[i]['link'] = o;
this.ITEM[j] = item[i];
item[i]['Index'] = j++;
item[i][this.event] = this.ACTIVE;
}
}
return o;
}
}
tab.prototype = {
ACTIVE:function(){
var $ = function(o){return document.getElementById(o)};
this['link']['cur'].className = this['css'][3];
this.className = this['css'][2];
try{
$(this['link']['id']+'_'+this['link']['cur']['Index']).style.display = 'none';
$(this['link']['id']+'_'+this['Index']).style.display = 'block';
}catch(e){}
this.callBack.call(this);
this['link']['cur'] = this;
}
}
</script>
</head>
<body  onLoad="setupZoom();tabqiehuan();">
<!--#include file="top_1backup.asp"--> 

<!--end box-1-->
<div class="box-2">
  <div class="main">
  <div class="pro-left-bar">
      <!--#include file="pro_categry.asp"-->
      </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT">
	  <table border="0" cellpadding="0" align="right" cellspacing="0">
	  <tr><td style=" width:490px; height:45px;" align="right"><a href="javascript:history.back();" style=" font-size:13px;">[返回]</a></td>
	  <td style=" width:30px; height:45px;" align="right">&nbsp;</td>
	  </tr>
	  </table>
   	  </div>
      <div class="proM">
      	<div  class="ny2-1">
       	  <div class="ny2-left" style=" overflow:hidden">
		  <table border="0" cellpadding="0" align="center" cellspacing="0">
		  <tr><td style="width:610px; height:400px; " align="center" valign="middle"><img src="../<%=getbpic(img_sl,"d")%>"  onload="if (this.width>400){this.height=this.width*this.height/400;this.width=400;"  alt="" /></td></tr>
		  </table>
		  </div>
       	  
<div class="clear"></div>
        </div>
		<!--小图-->
		<div  class="ny2-1small">
		<table border="0" cellpadding="0" align="center" cellspacing="0">
		<tr><td style=" width:660px; padding-top:10px; padding-bottom:10px;" align="left" >
		<div class="photoblock-many">
						 <%
	'一级分类
	set rsa=server.CreateObject("adodb.recordset")
	sql="select top 3 img_sl from pro_img where pro_id="&id&" order by id desc"
	rsa.open sql,conn,1,1
	while not rsa.eof
%>
	                   <a href="<%=getbpic(rsa("img_sl"),"d")%>" ><img src="../<%=rsa("img_sl")%>"  border="0" alt="" id="img-mwsf-14" class="photo" /></a>
 <%
	rsa.movenext
	wend
	rsa.close
	set rsa=nothing
%>     
	                      </div>
		</td>
		</tr>
		</table>
		</div>
		<!--小图-->
      	<!--end ny2-1-->
        <div class="clear"></div>
        <p class="ny2-intro">
           	<span><%=title%></span><br />
            　<%=f_body%>
           </p>
        <table border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td style=" width:690px; height:auto;" align="center">
		 <div class="tab2">
<ul id="test2_li_now_">
<li class="now">规格</li>
<li>尺寸图</li>
<li>流明图</li>
<li>通道图</li>
<li>相关产品</li>
<li>资料下载</li>
</ul>
</div>
<div>
<div id="test2_1" class="tablist block">
<span><%=z_body%></span>
</div>
<div id="test2_2" class="tablist">
<span><%=pro_danwei%></span>
</div>
<div id="test2_3" class="tablist">
<span><%=pro_color%></span>
</div>
<div id="test2_4" class="tablist">
<span><%=pro_guige%></span>
</div>
<div id="test2_5" class="tablist">
<span><%=pro_money%></span>
</div>
<div id="test2_6" class="tablist">
<!--现在-->
<table border="0" cellpadding="0" align="center" cellspacing="0">
	  <tr><td style=" height:30px" colspan="3">&nbsp;</td></tr>
  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime,dow_sl,vid_sl from info_co where lm="&lm2&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=10
		rs.pagesize=pagenum
		counter=rs.recordcount
		pagezong=rs.pagecount
		pageno=trim(request.querystring("page"))
		if pageno="" or not isnumeric(pageno) then 
			pageno=1
		end if
		if pageno<1 then
			pageno=1
		end if
		if pageno-pagezong>0 then 
			pageno=pagezong
		end if
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>

      <tr>
     <%
	      if rs("dow_sl")<>"" then
	 %>
        <td style=" width:34px; height:34px; border-bottom:1px #CCC dotted; background:url(images/d_doc.png) left no-repeat; " title="文件" class="doc_img" 

align="center" valign="bottom"></td>
        <td style=" width:390px; padding-left:4px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=rs("title")%></td><td style=" width:140px;  border

-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=formatdate(rs("wtime"))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="downs.asp?id=<%=rs("id")%>"><img 

src="images/download.png" width="16" height="16" alt="" title="click down" /></td></td></tr>
        <tr><td colspan="3" style="height:20px;">&nbsp;</td></tr>
       <%
	      else
	   %>
       <td style=" width:34px; height:34px; border-bottom:1px #CCC dotted; background:url(images/d_video.png) left no-repeat; " title="视频" class="doc_img" 

align="center" valign="bottom"></td>
       <td style=" width:390px; padding-left:4px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=rs("title")%></td><td style=" width:140px;  border-

bottom:1px #CCC dotted;" align="left" valign="bottom"><%=formatdate(rs("wtime"))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="downv.asp?id=<%=rs("id")%>"><img 

src="images/download.png" width="16" height="16" alt="" title="click down" /></td></td></tr>
        <tr><td colspan="3" style="height:20px;">&nbsp;</td></tr>
       <%
	      end if
	   %>
        
     <%
	    a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>   
      <tr>
        <td colspan="3" style=" height:30px;" align="center">&nbsp;</td></tr>
        <tr><td colspan="3" style=" height:30px;" align="center"><%if pagenum<>"" then call listpage(pra) end if%></td></tr>
      </table>
<!--现在-->
</div>
</div>
<br /><br /><br />
<h1>&nbsp; </h1>
<script type="text/javascript">
<!--window.onload = -->
function tabqiehuan(){
new tab('test1_li_now_', '_', null, 'onmouseover');
new tab('test2_li_now_');

}
  </script>
		
		</td></tr>
		</table>
           <!--end ny2-2-->
           <div class="ny2-line">
           <div class="divpro_de_detail_span"><a href="javascript:history.back();">[返回]</a></div><br/>

           </div>
      </div>
      <div class="clear"></div>
      <div class="proB"><img src="images/ny_28.jpg" /></div> 
    </div>
  </div>
  <!--end main-->
  <div class="clear"></div>
</div>
<div class="clear"></div>

<!--end box-2-->
<!--#include file="foot.asp"--> 
</body>
</html>
