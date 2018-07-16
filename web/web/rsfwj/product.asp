<!--#include file="top.asp" -->
<script type="text/javascript" src="js/imgRule.js"></script>
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
		pra=""
	end if
	
	if keyword<>"" then
		dao=" &gt; 搜索结果"
		sq=" and title like'%"&keyword&"%'"
		pra="&keyword="&server.URLEncode(keyword)&""
	end if 
%><!--banner-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td width="239" valign="top"><!--#include file="pro_left.asp"-->
    
    
      <table width="239" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="239" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/products_dianh.jpg" width="239" height="74" /></td>
        </tr>
      </table></td>
    <td width="36" height="100">&nbsp;</td>
    <td valign="top"><table width="707" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="379" height="29"><strong>产品展示</strong></td>
        <td width="328" align="right" class="weiz" style="padding-right:15px;">您当前位置：<a href="#">首页</a> &gt;&gt; <a href="#">产品中心</a></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/products_tiao.jpg" width="707" height="1" /></td>
      </tr>
    </table>
      <table width="707" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
        <%	
    set rs=server.CreateObject("adodb.recordset")
    sql="select id,title,img_sl from pro_co where pass='yes' "&sq&" order by px desc,id desc"
    rs.open sql,conn,1,1
    if not rs.eof then
        pagenum=12
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
          <td width="184"><table border="0" cellpadding="0" cellspacing="0" class="bk">
            <tr>
              <td width="157" height="133" valign="middle" align="center"><a href="product_show.asp?id=<%=rs("id")%>"><img src="<%=rs("img_sl")%>" onload="javascript:ImgUniformZoom(this,157,133);" /></a></td>
            </tr>
            <tr>
              <td height="30" align="center"> <a href="product_show.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
            </tr>
          </table>
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="157">&nbsp;</td>
              </tr>
            </table></td>
<%
            if a mod 4 = 0 then response.Write("</tr><tr>")
            a=a+1
        rs.movenext
        wend
	else
		response.Write("<td>暂无相关信息~！</td>")
    end if	
    rs.close
    set rs=nothing
%>
        </tr>

    </table>
      <table width="707" height="26" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <div class="page"><%if pagenum<>"" then call listpage(pra) end if%></div></td>
  </tr>
</table>
 
        <!--#include file="foot.asp" -->