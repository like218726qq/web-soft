<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong(0)%></title>
<meta content="<%=zhong(1)%>" http-equiv="keywords" />
<meta content="<%=zhong(2)%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="header.asp"-->
<!--#banner-->

<!--middle-->
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="9" valign="top"><img src="images/product1_10.jpg" width="9" height="47" /></td>
    <td width="248" align="right" valign="top" bgcolor="#FFFFFF"><table width="248" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" align="center" class="nei_fenl">商品リスト</td>
      </tr>
    </table>
      <table width="242" border="0" cellpadding="0" cellspacing="0" background="images/product1_fenl_beij.jpg">
        <tr>
          <td valign="top" style="padding-top:12px;">
          <!--product menu-->
          <!--#include file="left_pro.asp"-->
            <table width="242" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
            <!--contact-->
            <!--#include file="left_cont.asp"-->
          </td>
        </tr>
      </table></td>
    <td width="18" height="100" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="733" valign="top" bgcolor="#FFFFFF"><table width="733" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" class="zhans">ケースショー</td>
      </tr>
    </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>

          <td><img src="images/product1_shang.jpg" width="733" height="4" /></td>
        </tr>
        <%if ttt<>"" then%>
            <tr><td style="height:30px; line-height:30px; text-align:left; font-weight:bold; text-indent:5px; background:url(images/product1_zhong.jpg)">
             <%=ttt%>
            </td></tr>
          <%end if%>
        <tr>
          <td background="images/product1_zhong.jpg" style="padding-top:19px; padding-left:41px; padding-bottom:8px; height:615px;" valign="top">
          <link type="text/css" href="fancybox/jquery.fancybox.css" rel="stylesheet" />
<script type="text/javascript" src="fancybox/jquery.min.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("a[rel=boxgroup]").fancybox({
			'padding'            : 10,           //浏览框内边距，和css中的padding一个意思,默认10 
			'margin'             : 20,           //浏览框外边距，和css中的margin一个意思，默认20
			'overlayShow'	     : true,        //如果为true，则显示遮罩层
			'overlayColor'		 : '#000',       //遮罩层的背景颜色
			'overlayOpacity'     : 0.3,          //遮罩层的透明度（范围0-1）,默认为0.3
			'transitionIn'	     : 'elastic',    //设置打开弹出来效果. 可以设置为 'elastic', 'fade' 或 'none'
            'transitionOut'	     : 'elastic',    //设置关闭收回去效果. 可以设置为 'elastic', 'fade' 或 'none'
			'speedIn'            : 300,			 //fade 和 elastic 动画切换的时间间隔, 以毫秒为单位
			'speedOut'           : 300,			 //fade 和 elastic 动画切换的时间间隔, 以毫秒为单位
			'changeSpeed'        : 300,          //切换时fancybox尺寸的变化时间间隔（即变化的速度），以毫秒为单位 
			'changeFade'         :'fast',        //切换时内容淡入淡出的时间间隔（即变化的速度）
			'showCloseButton'    : true,         //如果为true，则显示关闭按钮
			'hideOnOverlayClick' : true,         //如果为true则点击遮罩层关闭fancybox,默认为true 
			'hideOnContentClick' : false,         //如果为true则点击播放内容关闭fancybox,默认为false
			'titleShow'          : true,         //如果为true，则显示标题,默认为true 
			'titlePosition'      : 'over',       //设置标题显示的位置.可以设置成 'outside', 'inside' 或 'over',默认为outside  
			'titleFormat'        : function(title, currentArray, currentIndex, currentOpts) {return ('<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>');}//可以自定义标题的格式,默认为null
		});
    });
</script>

          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <%	
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,img_sl from info_co where pass='yes' and lm=16 order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=9
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
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>

              <td <%if a mod 3<>0 then%>width="236"<%end if%>><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="imgt" valign="middle" align="center">
                  <a rel="boxgroup" href="../<%=getbpic(rs("img_sl"),"d")%>" title="<%=rs("title")%>">
                  <% if rs("img_sl")<>"" then%>
                  <img src="../<%=rs("img_sl")%>"/>
                  <%else%>
                  <img src="images/nopic.jpg" width="189" height="189" />
                  <%end if%>
                  </a></td>
                </tr>
                <tr>
                  <td height="30" align="center" class="news_font1">
                  <a rel="boxgroup" href="../<%=getbpic(rs("img_sl"),"d")%>"><%=rs("title")%></a>
                  </td>
                </tr>
              </table></td>
              <%if a mod 3=0 then
			     response.Write("</tr><tr>")
			    end if
			  %>
              <%
					a=a+1
					rs.movenext
					wend
			    else
				    response.Write("<div style='width:600px; margin-top:60px; text-align:center'>情報更新...</div>")
				end if	
				rs.close
				set rs=nothing
			%>
            </tr>
          </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><%if pagenum<>"" then call listpage_num(pra) end if%></td>
              </tr>
            </table>
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="images/product1_xia.jpg" width="733" height="5" /></td>
        </tr>
      </table></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</table>
<table width="1006" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--footer-->
<!--#include file="footer.asp"-->
</body>
</html>
