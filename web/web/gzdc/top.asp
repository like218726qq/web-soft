<style>
ul,li{ margin:0px; padding:0px; list-style:none;}
a{text-decoration:none;}

#nav { } 
#nav li {float: left; height:38px; font-weight:700;color:#000;  }
#nav li a{ display: block; width: 97px; color:#000; text-align:center;line-height:38px;} 
#nav li a:hover {color:#FFFFFF; background-color:#bfa737; height:38px;}
 
#nav li ul {background:#FFF;left: -999em;position: absolute; width:97px; opacity:0.60;filter:alpha(opacity=70);} 
#nav li ul li a {display:block; width: 97px;text-align:center;line-height:38px;} 
#nav li ul li a:hover {color:#FFF;text-decoration:none;font-weight:bold;background:#bfa737;}

#nav li:hover ul {left: auto;}
#nav li.sfhover ul {left: auto;}
</style>
<script type=text/javascript>
<!--
function menuFix() {
    var sfEls = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<sfEls.length; i++) {
        sfEls[i].onmouseover=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseDown=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onMouseUp=function() {
        this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        sfEls[i].onmouseout=function() {
        this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
"");
        }
    }
}
window.onload=menuFix;
//-->
</script>
<script type="text/javascript"> 
function addBookmark(title,url) { 
if (window.sidebar) { 
window.sidebar.addPanel(title,url,""); 
} else if( document.all ) { 
window.external.AddFavorite(url,title); 
} else if( window.opera && window.print ) { 
return true; 
}} 

function setHome(url) 
{ 
if (document.all){ 
document.body.style.behavior='url(#default#homepage)'; 
document.body.setHomePage(url); 
}else if (window.sidebar){ 
if(window.netscape){ 
try{ 
netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
}catch (e){ 
alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true" ); 
}} 
if(window.confirm("你确定要设置"+url+"为首页吗？")==1){ 
var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
prefs.setCharPref('browser.startup.homepage',url); 
}}} 
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" background="images/jmwy_02.jpg" height="122">
  <tr>
    <td width="658"></td>
    <td width="342" align="right">
			<table border="0" cellpadding="0" cellspacing="0" height="122">
        	<tr><td valign="top" height="40"><img src="images/sc.jpg" height="40" border="0" usemap="#Map5"/></td>
   	   		 </tr>
                    </table>
    </td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/nav.jpg">
    	<table border="0" cellpadding="0" cellspacing="0">
        	<tr>
            	<td>
                	<ul id="nav">
                      <li ><a href="index.asp">首页</a></li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="about.asp?id=1">走进港置</a>
                        
                            <ul>
                              <%
                                        set rs=server.CreateObject("adodb.recordset")
                                        sql="select id,title from tol_co where lm=2 order by px desc,id desc"
                                        rs.open sql,conn,1,1
                                        while not rs.eof
                                    %>
                              <li><a href="about.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
                              <%
                                rs.movenext
                                wend
                                rs.close
                                set rs=nothing
                             %>
                            </ul>
                      </li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="business.asp">经营范围</a>
                            <ul>
                             <%
                                    set rs=server.CreateObject("adodb.recordset")
                                    sql="select id,title from tol_co where lm=3 order by px desc,id desc"
                                    rs.open sql,conn,1,1
                                    while not rs.eof
                                %>
                              <li><a href="business.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
                             <%
                                rs.movenext
                                wend
                                rs.close
                                set rs=nothing
                             %>
                            </ul>
                      </li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="product1.asp">房源超市</a>
                         
                            <ul>
                              <li><a href="product_cs.asp">出租房源</a></li>
                              <li><a href="product.asp">出售房源</a></li>
                              <li><a href="free.asp">免佣金房源</a></li>
                            </ul>
                     
                      </li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="job.asp">人才招聘</a>
                            <ul>
                              <li><a href="job.asp">职位招聘</a></li>
                              <li><a href="job_yp.asp">简历投递</a></li>
                              <li><a href="Personnel.asp">人才观念</a></li>
                            </ul>
                      </li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="project.asp">合作项目</a></li>
                      <li style="width:8px;"><img src="images/x.jpg" width="8"/></li>
                      <li><a href="contact.asp">联系我们</a>
                            <ul>
                              <li><a href="contact.asp">联系我们</a></li>
                              <li><a href="message.asp" >留言板</a></li>
                            </ul>
                      </li>
                    </ul>
                </td>
                <td width="275"></td>
            </tr>
        </table>
    	
    </td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center" style="padding-bottom:14px; padding-top:11px;">
    <%
	set rs=server.CreateObject("ADODB.recordset")
	rs.open "select top 5 * from info_co where lm=7 order by px desc,id desc",conn,1,1
	if not rs.eof then
		a=1
		while not rs.eof
			if a=1 then
				files=rs("img_sl")
				texts=rs("title")
				a=2
			else
				files=files&"|"&rs("img_sl")
				texts=texts&"|"&rs("title")
			end if
		rs.movenext
		wend
	%>
	<script>
		var swf_width=978;
		var swf_height=293;
		var files = "<%=files%>";
		var links = "";
		var texts = "";
		// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
		var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"
		
		document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
		document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
		document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
		document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
		document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
		</script>
        <%
			end if
			rs.close
			set rs=nothing
		%>
    </td>
  </tr>
</table>
<map name="Map">
<area shape="rect" coords="14,3,74,31" href="index.asp"><area shape="rect" coords="107,8,196,33" href="about.asp"><area shape="rect" coords="214,9,284,29" href="business.asp"><area shape="rect" coords="314,6,377,28" href="product.asp">
<area shape="rect" coords="413,8,484,28" href="project.asp"><area shape="rect" coords="515,4,598,28" href="job.asp"><area shape="rect" coords="608,7,686,30" href="contact.asp"></map>

<map name="Map5" id="Map5">
<area shape="rect" coords="173,2,229,24"  href="javascript:;" onclick="window.external.AddFavorite(location.href, document.title);" /><area shape="rect" coords="249,2,302,24"  href="javascript:;" onClick="this.style.behavior='url(#default#homepage)'; this.setHomePage(location.href);" />
</map>