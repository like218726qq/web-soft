<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="setup.asp"-->
<%
	lm=request("lm")
	keyword=bsql(html(trim(request("keyword"))))
	if lm<>"" then
		if not checknum(lm) then
			call msg("参数错误","")
		else
			lm=clng(lm)
			set rs=server.CreateObject("adodb.recordset")
			sql="select id_lm,fid,title_lm from pro_lm where id_lm="&lm&""
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
	else
		dao=""
		sq=""
		title_lm="产品中心"
		pra=""
	end if
	
	if keyword<>"" then
		dao=" &gt; 搜索结果"
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
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
<tr>
<Td align="center">
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1002" height="302">
    <div id="focus">
    <div id="focus_bg"></div>
    <div id="focus_show"></div>
    <div id="focus_img">
<div name="focus_img" id="focus_1">images/ny-01_09.jpg|product_show.asp?id=5&lm=1|I600</div>

<div name="focus_img" id="focus_2">images/ny-02_09.jpg|product_show.asp?id=10&lm=1|I580</div>

<div name="focus_img" id="focus_3">images/ny-03_09.jpg|product_show.asp?id=7&lm=1|I500</div>

<div name="focus_img" id="focus_4">images/ny-04_09.jpg|product_show.asp?id=5&lm=1|I600</div>

    </div>
    <script type="text/javascript" src="js/focus.js"></script>
  </div>
    </td>
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
            <td width="61" height="36" align="right" valign="middle"><img src="images/ti.jpg" width="26" height="35" /></td>
            <td width="941" align="left" valign="middle" style="padding-right:30px;"><span style=" float:right">您所在的位置：首页 > 产品中心</span><div class="pro_class">
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
      </div><strong class="STYLE8">产品中心</strong></td>
          </tr>
            <tr><td colspan="2"><img src="images/neiye-zx_33.jpg" /></td>
            </tr>
        </table>
        
        </td>
      </tr>
      <tr>
        <td height="811" align="center" valign="top"  style=" background:url(images/neiye_36.jpg) left repeat-y; ">
                   <ul class="product">
             <%	
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,img_sl from pro_co where pass='yes' "&sq&" order by px desc,id desc"
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
		pageno=clng(pageno)
		rs.absolutepage=pageno
		a=1
		while not rs.eof and a<=pagenum
%>
            	<li align="center"><a href="product_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" width="90" height="176" /></a><br />
            	  <br />
             <a class="pr_ti" href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
		a=a+1
		rs.movenext
		wend
	end if	
	rs.close
	set rs=nothing
%>
            </ul>
            <div class="clear"></div>
<div class="page" style="text-align:center"><%if pagenum<>"" then call listpage(pra) end if%></div>
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
