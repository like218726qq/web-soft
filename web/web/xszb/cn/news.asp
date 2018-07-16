<!--#include file="top.asp"-->
<%
	lm=request("lm")
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
			dao=""&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
	else
		sql="select top 1 id_lm,title_lm from info_lm where id_lm=6 order by px desc,id_lm desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if not rs.eof then
			lm=rs("id_lm")
			title_lm=rs("title_lm")
			dao=""&title_lm
			sq=" and lm="&lm&""
			pra="&lm="&lm&""
		end if
		rs.close
		set rs=nothing
	end if
%>
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner3.jpg) center center no-repeat;"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><table width="145" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="30" class="cpxl">新闻资讯 /</td>
      </tr>
      <tr>
        <td><!--#include file="search.asp"-->
</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="ny_nav">
            <ul>
      <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id_lm,title_lm from info_lm where fid=6 order by px desc,id_lm desc"
	rs.open sql,conn,1,1
	while not rs.eof
%>
            	<li><a href="news.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></li>
<%  rs.movenext
    wend
	rs.close
	set rs=nothing
%>


            </ul>
        
        </td>
      </tr>
    </table></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass"><%=dao%></div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
    <div class="min_height">
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top">
          <%
	set rs=server.CreateObject("adodb.recordset")
	sql="select id,title,color_font,wtime,z_body,img_sl from info_co where pass='yes' "&sq&" order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=8
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
    <table width="760" border="0" cellspacing="0" cellpadding="0" class="news_box">
                      <tr>
                        <td width="80"><img src="../<%=rs("img_sl")%>" width="70" height="70"></td>
                        <td width="607" valign="top">
                        <div><span style="font-size:18px; font-weight:bold; color:#C60;">·</span>&nbsp;&nbsp;<a href="news_show.asp?id=<%=rs("id")%>" class="news_title"><%=rs("title")%></a></div>
                        <div style="line-height:25px; height:50px; overflow:hidden;"><%=left(rs("z_body"),100)%>&nbsp;&nbsp;<a href="news_show.asp?id=<%=rs("id")%>" style="color:#C60;">详细>></a></div>
                        </td>
                        <td width="103" valign="top" align="right" style="color:#666;"><%=formatdate(rs("wtime"))%></td>
                      </tr>
                    </table>
<%
		a=a+1
		rs.movenext
		wend
	end if
	rs.close
	set rs=nothing
%>
<div style="height:10px;"></div>
<%if pagenum<>"" then call listpage(pra) end if%>
          </td>
        </tr>
    </table>
    </div>
    </td>
  </tr>
</table>
<!--#include file="foot.asp"-->