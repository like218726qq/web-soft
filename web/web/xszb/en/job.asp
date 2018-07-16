<!--#include file="top.asp"-->
<table width="980" height="154" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0px auto;">
  <tr>
    <td style="padding-top:2px; padding-bottom:1px; background:url(images/n_banner2.jpg) center center no-repeat;"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" style="background:#9f6300;">&nbsp;</td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170" align="center" valign="top"><!--#include file="contact_left.asp"--></td>
    <td width="810" valign="top"><table width="810" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="30" style="padding-left:20px; color:#d19231;"><div class="nei_bigclass" >Recruitment</div></td>
      </tr>
      <tr>
        <td height="20" style="padding-left:20px;">&nbsp;</td>
      </tr>
    </table>
    <div class="min_height">
      <table width="810" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="ny_main_rt_f fl" valign="top">
           <div class="about_zbody">
           <%
	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select *  from job  where pass='yes' and lang='en' order by px desc,id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		pagenum=8
		rs.pagesize=pagenum
		counter=rs.recordcount
		pagezong=rs.pagecount
		pageno=replace(trim(request.querystring("page")),"'","")
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
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="job_tab" style=" margin:0px auto;">
  <tr>
    <td width="19" ><span style="font-size:18px; font-weight:bold; color:#C60;"> &nbsp;&nbsp;·</span></td>
    <td width="532"><a href="job_show.asp?id=<%=rs("id")%>">Post:<%=rs("title")%></a></td>
    <td width="99" style="color:#666;" align="right"><%=rs("wtime")%></td>
  </tr>
</table>
        	
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
<div style="height:10px;"></div>
<%if pagenum<>"" then call listpage_num(pra) end if%>
</div>

          </td>
        </tr>
    </table>
    </div>
    </td>
  </tr>
</table>


 <!--#include file="foot.asp"-->