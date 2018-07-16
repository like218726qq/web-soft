<!--#include file="conn.asp"--> 
<%
	if request("id_lm")<>"" then
	   g_value=request("id_lm")
	end if


	lm=g_value
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			sql="select id_lm,title_lm from info_lm where id_lm="&lm&""
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
				lm=rs("id_lm")
				title_lm=rs("title_lm")
			end if
			rs.close
			set rs=nothing
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
		sql="select top 1 id_lm,title_lm from info_lm where fid=17 order by px desc,id_lm desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=" &gt; "&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=zhong0%></title>
<meta content="<%=zhong1%>" http-equiv="keywords" />
<meta content="<%=zhong2%>" http-equiv="description" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">   
DD_belatedPNG.fix('.doc_img,');
</script>
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
</head>
<body>
<!--#include file="top_1backup.asp"--> 
<div class="bannerback">
<!--开始-->
 <%
                 set rs=server.CreateObject("adodb.recordset")
                 sql="select top 1 * from info_co where lm=30 order by px desc,id desc"
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
  <!--#include file="pro_categry.asp"-->
  </div>
    <!--end pro-left-bar-->
    <div class="pro-right-bar">
   	  <div class="proT"><p>下载中心 <%=dao%></p></div>
      <div class="proM">
       <table border="0" cellpadding="0" align="center" cellspacing="0">
       <tr>
        <td style=" width:440px; height:100px;" align="center" valign="top"><p class="ny3-intro">
        	　此处可下载各灯型的活页，DMX通道表，流明资料，CAD尺寸图，软件等资料，点击右边的窗口选择灯型即可。
        </p>
		</td>
		<td style=" width:240px; height:100px;" align="center" valign="top">
		<!--下拉-->
		<table border="0" cellpadding="0" align="center" cellspacing="0">
       <tr>
        <td style=" width:230px; height:40px;" align="center" valign="top"></td></tr>
		<tr>
        <td style=" width:230px; height:30px;" align="left" valign="top">文件类型:</td></tr>
		  <tr>
        <td style=" width:230px; height:30px;" align="left" valign="top">
		<!--筛选-->
		<FORM method=post name=regform action="download.asp">

		<select name="id_lm" style=" width:180px; border:1px #cccccc solid;" onChange="this.form.submit()">

            <option value="" selected>==所有分类==</option>
            <%
			
            '添加信息时显示栏目过程
            Set rsa= Server.CreateObject("ADODB.Recordset")
            sql="select id_lm,title_lm,add_xx,xia from info_lm where fid=17 order by px desc,id_lm desc"
            rsa.open sql,conn,1,1
            while not rsa.eof 	
                i=""
                response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
                rsa.movenext
            wend
            rsa.close
            set rsa=nothing
            %>
         </select></FORM>
		 <!--筛选-->
		</td></tr>
		</table>
		<!--下拉-->
		</td>
		</tr>
		</table>
		
		<!--开始-->
      <table border="0" cellpadding="0" align="center" cellspacing="0">
	   <tr><td style=" height:40px" colspan="3" align="left">你选择的型号<%=dao%></td></tr>
	  <tr><td style=" height:30px" colspan="3">&nbsp;</td></tr>
  <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime,dow_sl,vid_sl,lm from info_co where pass='yes' "&sq&" order by px desc,id desc"
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
        <td style=" width:300px; padding-left:4px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=rs("title")%></td>
		<td style=" width:230px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=formatdate(rs("wtime"))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% if session("person")="" and rs("lm")=37 then%>
仅供会员下载
<%else%>
<a href="downs.asp?id=<%=rs("id")%>"><img src="images/download.png" width="16" height="16" alt="" title="click down" /></a>
【<a href="shipin.asp?id=<%=rs("id")%>">视频</a>】<%end if%>
</td></td></tr>
        <tr><td colspan="3" style="height:20px;">&nbsp;</td></tr>
       <%
	      else
	   %>
       <td style=" width:34px; height:34px; border-bottom:1px #CCC dotted; background:url(images/d_video.png) left no-repeat; " title="视频" class="doc_img" 

align="center" valign="bottom"></td>
       <td style=" width:390px; padding-left:4px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><a href="shipin.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td><td style=" width:140px;  border-bottom:1px #CCC dotted;" align="left" valign="bottom"><%=formatdate(rs("wtime"))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="downv.asp?id=<%=rs("id")%>"><img src="images/download.png" width="16" height="16" alt="" title="click down" /></a>&nbsp;【<a href="shipin.asp?id=<%=rs("id")%>">视频</a>】</td></td></tr>
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
      <!--结束-->
      </td></tr>
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
