<!--#include file="conn.asp"--> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong0%></title>
<meta content="<%=zhong1%>" http-equiv="keywords" />
<meta content="<%=zhong2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
<style>
.tab1 ,.tab2{width:667px;height:39px;background:url(images/ny2_42.jpg) left no-repeat;}
.tab1 ul ,.tab2 ul{margin:0;padding:0;}
.tab1 li,.tab2 li{float:left; width:166px; height:29px;text-align:center; padding-top:10px; font-weight:bold; color:#ffffff; cursor:pointer;}
.tab1 li.now,.tab2 li.now{color:#000000;background:#fff;  font-weight:bold;background:url(images/bgbgbg.jpg) left no-repeat; }
.tablist{width:627px;height:auto; padding:20px;font-size:14px; text-align:left; line-height:24px;display:none;}
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
<body>
<!--#include file="top_1backup.asp"--> 
<div class="bannerback">
  <!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=27 order by px desc,id desc"
                 rs.open sql,conn,1,1
                 while not rs.eof
               %>
                    	<img src="../<%=rs("img_sl")%>" alt="" />
               <%
                  rs.movenext
                  wend
                  rs.close
                  set rs=nothing
               %>
<!--结束-->
  </div>
<!--end box-1-->
<div class="box-2">
  <div class="main">
    <div class="pro-left-bar">
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:424px; background:url(images/company_left.jpg) left top no-repeat; " valign="top">
	 
     <table border="0" cellpadding="0" cellspacing="0">
     <tr><td style=" width:288px; height:26px; ">&nbsp;</td></tr>
     <tr><td style=" width:288px; padding-bottom:30px; " valign="top">
     <div class="pro-Main-list">
 <br/>
            <ul class="n-list">
        <li><a href="abou_t.asp" class="p1">关于我们</a></li>
         <li><a href="team.asp"  class="p1">团队协作</a></li>
		 <li><a href="culture.asp"  class="p1">企业文化</a></li>
            </ul>
   
      <div class="clear"></div></div>
     </td></tr>
     <tr><td style=" width:288px; height:6px;"></td></tr>
     </table></td></tr>
	 <tr><td style=" width:288px; height:6px;"><img src="images/ny1_23.jpg" alt="" /></td></tr>
	 </table>
      <!--end proDwon-->
    </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	
      <div class="proM">
      <table border="0" cellpadding="0" align="center" cellspacing="0">
      <tr><td style=" width:660px; height:400px;" valign="top" align="center">
	   <div class="tab2">
<ul id="test2_li_now_">
<li class="now">品质</li>
<li>市场&销售</li>
<li>产品研发</li>
<li>采购</li>

</ul>
</div>
<div>
<div id="test2_1" class="tablist block">
<span><!--开始-->
<table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:620px; height:20px; font-weight:bold;">&nbsp;</td>
      </tr>
	   <tr><td style=" width:620px; height:29px; background:url(images/team_03.jpg) left top no-repeat;"></td></tr>
	     <tr><td style=" width:620px; height:29px; background:url(images/team_05.jpg) left repeat-y;">
		 <!--con0-->
	<table border="0" cellpadding="0" align="center" cellspacing="0">
      <tr><td style=" width:100px; padding-top:10px; padding-bottom:10px;" align="center" valign="middle">&nbsp;</td>
      <td  style=" width:500px; height:30px; font-size:14px; font-weight:bold;">&nbsp;</td>
      </tr>
	  
      <tr><td style=" width:100px; height:58px;" align="center" valign="top"><span style=" width:100px; padding-top:10px; padding-bottom:10px;"><img src="images/pj.jpg" alt=""  width="58" height="58"  /></span></td>
      <td  style=" width:500px; height:10px; font-size:12px; line-height:30px; " valign="top"> 
	  <!--开始-->
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=15"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>    

<!--结束--></td></tr>
	  </table>
         </td>
	     </tr>
		   <tr><td style=" width:620px; height:29px; background:url(images/team_06.jpg) left top no-repeat;"></td></tr>
	   </table>

<!--结束--></span>
</div>
<div id="test2_2" class="tablist">
<span><!--开始-->
<table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:620px; height:20px; font-weight:bold;">&nbsp;</td>
      </tr>
	   <tr><td style=" width:620px; height:29px; background:url(images/team_03.jpg) left top no-repeat;"></td></tr>
	     <tr><td style=" width:620px; height:29px; background:url(images/team_05.jpg) left repeat-y;">
		 <!--con0-->
	<table border="0" cellpadding="0" align="center" cellspacing="0">
      <tr><td style=" width:100px; padding-top:10px; padding-bottom:10px;" align="center" valign="middle"><span style=" width:100px; height:58px;"></span></td>
      <td  style=" width:500px; height:30px; font-size:14px; font-weight:bold;"><span style=" width:661px; height:40px; font-weight:bold;">
	  </span></td>
      </tr>
	  
      <tr><td style=" width:100px; height:58px;" align="center" valign="top"><img src="images/yx.jpg" alt=""  width="58" height="58"  />&nbsp;</td>
      <td  style=" width:500px; height:10px; font-size:12px; line-height:30px; " valign="top"> 
	  <!--开始-->
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=16"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>    

<!--结束--></td></tr>
	  </table>
         </td>
	     </tr>
		   <tr><td style=" width:620px; height:29px; background:url(images/team_06.jpg) left top no-repeat;"></td></tr>
	   </table>  
<!--结束--></span>
</div>
<div id="test2_3" class="tablist">
<span><!--开始-->
 <table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:620px; height:20px; font-weight:bold;">&nbsp;</td>
      </tr>
	   <tr><td style=" width:620px; height:29px; background:url(images/team_03.jpg) left top no-repeat;"></td></tr>
	     <tr><td style=" width:620px; height:29px; background:url(images/team_05.jpg) left repeat-y;">
		 <!--con0-->
	<table border="0" cellpadding="0" align="center" cellspacing="0">
      <tr><td style=" width:100px; padding-top:10px; padding-bottom:10px;" align="center" valign="middle"><span style=" width:100px; height:58px;"></span></td>
      <td  style=" width:500px; height:30px; font-size:14px; font-weight:bold;"><span style=" width:661px; height:40px; font-weight:bold;">
	  </span></td>
      </tr>
	  
      <tr><td style=" width:100px; height:58px;" align="center" valign="top"><img src="images/yf.jpg" alt=""  width="58" height="58"  />&nbsp;</td>
      <td  style=" width:500px; height:10px; font-size:12px; line-height:30px; " valign="top"> 
	  <!--开始-->
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=17"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>    

<!--结束--></td></tr>
	  </table>
         </td>
	     </tr>
		   <tr><td style=" width:620px; height:29px; background:url(images/team_06.jpg) left top no-repeat;"></td></tr>
	   </table>
<!--结束--></span>
</div>
<div id="test2_4" class="tablist">
<span><!--开始-->
<table border="0" cellpadding="0" cellspacing="0">
      <tr><td style=" width:620px; height:20px; font-weight:bold;">&nbsp;</td>
      </tr>
	   <tr><td style=" width:620px; height:29px; background:url(images/team_03.jpg) left top no-repeat;"></td></tr>
	     <tr><td style=" width:620px; height:29px; background:url(images/team_05.jpg) left repeat-y;">
		 <!--con0-->
	<table border="0" cellpadding="0" align="center" cellspacing="0">
      <tr><td style=" width:100px; padding-top:10px; padding-bottom:10px;" align="center" valign="middle"><span style=" width:100px; height:58px;"></span></td>
      <td  style=" width:500px; height:30px; font-size:14px; font-weight:bold;"><span style=" width:661px; height:40px; font-weight:bold;">
	  </span></td>
      </tr>
	  
      <tr><td style=" width:100px; height:58px;" align="center" valign="top"><img src="images/cg.jpg" alt="" width="58" height="58"  />&nbsp;</td>
      <td  style=" width:500px; height:10px; font-size:12px; line-height:30px; " valign="top"> 
	  <!--开始-->
 <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tol_co where id=18"
	rs.open sql,conn,1,1
	if not rs.eof then
		response.write rs("z_body")
	end if
	rs.close
	set rs=nothing
%>    

<!--结束--></td></tr>
	  </table>
         </td>
	     </tr>
		   <tr><td style=" width:620px; height:29px; background:url(images/team_06.jpg) left top no-repeat;"></td></tr>
	   </table>
<!--结束--></span>
</div>
</div>
<br /><br /><br />
<h1>&nbsp; </h1>
<script type="text/javascript">

window.onload = function(){
new tab('test1_li_now_', '_', null, 'onmouseover');
new tab('test2_li_now_');
new tab('test3_li_now_', '_', function(){
alert('您现在单的是第:'+this['Index']+'个!');
});
new tab('test4-input-input_tab1-input_tab2', '-');
}
  </script>
	  </td>
      </tr>
      </table>
      </div>
      <div class="proB"><img src="images/ny_28.jpg" /></div>
    </div>
  </div>
  <!--end main-->
  <div class="clear"></div>
</div>
<!--end box-2-->
<!--#include file="foot.asp"-->
</body>
</html>
