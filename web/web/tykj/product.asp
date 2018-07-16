<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->

<table width="320" border="0" cellspacing="0" cellpadding="0" align="center" style="border:1px solid #CCC">
  <tr>
    <td width="95" valign="top" style="padding-left:5px;border:1px solid #CCC"><!--#include file="left.asp"--></td>
    <td valign="top" align="center"><table width="200" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td align="center">
                                        <table border="0" cellspacing="0" cellpadding="0" class="gallery" align="center">
                                        <tr>
<%	
	xlm=request("xlm")
	dlm=request("dlm")
	set rs=server.CreateObject("adodb.recordset")
	if xlm<>"" then 
	sql="select id,title,img_sl from pro_co where pass='yes' and lm="&xlm&" order by px desc,id desc"
	elseif dlm<>"" then 
	sql="select id,title,img_sl from pro_co where pass='yes' and lm in(select id_lm from pro_lm where fid="&dlm&") or lm="&dlm&" order by px desc,id desc"
	else
	sql="select id,title,img_sl from pro_co where  lm in (select id_lm from pro_lm where fid in(select id_lm from  pro_lm where fid=0)) and pass='yes'  order by px desc,id desc"
	end if
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=3
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

                                        <td align="center">
                                            <table width="100%" border="0" cellspacing="10" cellpadding="0" align="center" style="border-bottom:1px solid #CCC">
                                              <tr>
                                                <td width="143" height="143" align="center"><img src="<%=rs("img_sl")%>" width="154" height="120" border="0" /></td>
                                              </tr>
                                              <tr>
                                                <td align="center"><%=left(rs("title"),8)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="disproducts.asp?id=<%=rs("id")%>">更多</a></td>
                                              </tr>
                                          </table>
                                          </td>
                                        <%
											if a mod 1=0 then 
												response.write "<tr></tr>"
											end if
											a=a+1
											rs.movenext
											wend
                                            end if
                                            rs.close
                                            set rs=nothing
                                        %>
                                          </tr>
                                          
                                        </table></td>
      </tr>
        <tr>
        <td colspan="2" height="30" align="center"><div style="margin:0 auto;width:160px;"><%if pagenum<>"" then call listpage_num(page) end if%></div></td>
      </tr>
    </table></td>
  </tr>

</table>

<!--#include file="foot.asp"-->
