<!--#include file="conn.asp"-->
<%
	a=3
	id=request("id")
	if id="" or not checknum(id) then
		call msg("Parameter error","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from info_co where id="&id&"  and pass='yes' "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("The information does not exist or has been deleted","")
	else
		rs("read_num")=rs("read_num")+1
		rs.update()
		
		lm=rs("lm")
		title=rs("title")
		wtime=rs("wtime")
		read_num=rs("read_num")
		z_body=rs("z_body")
		img_sl=rs("img_sl")
	end if
	rs.close
	set rs=nothing
	
	set rsa=server.CreateObject("adodb.recordset")
	sql="select title_lm from info_lm where id_lm="&lm&" "
	rsa.open sql,conn,1,1
	if not rsa.eof then
		dao=" &gt;&gt; "&rsa("title_lm")
	end if
	rsa.close
	set rsa=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Torchlite Lighting Co. LTD</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="213" valign="top">
      <!--#include file="left_pro.asp"-->
	  <!--#include file="left_con.asp"-->
    </td>
    <td width="15" height="100">&nbsp;</td>
    <td width="774" valign="top" bgcolor="#f8f8f8"><table width="774" border="0" cellpadding="0" cellspacing="0" background="images/products_03.jpg">
      <tr>
        <td width="42" height="33">&nbsp;</td>
        <td width="105" class="zhans">Recommended</td>
        <td width="627" align="right" class="weiz" style="padding-right:20px;">Location：<a href="index.asp">Home</a> &gt;&gt; <a href="hot_pro.asp">Recommended Products</a> &gt;&gt; <%=title%></td>
      </tr>
    </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding-top:8px; padding-left:11px;">
            <div style="padding:15px; line-height:180%; padding-top:25px;">
				<%
                if img_sl<>"" then
                %>
                <div style="text-align:center; width:100%;">
                    <img src="../<%=getbpic(img_sl,"d")%>" onload="if (this.width>550){this.height=550*this.height/this.width;this.width=550;}" />
                </div> 
                <%
                end if
                %>
                <div style="line-height:30px; text-align:center;">
                	<span>
					<%
                         set rs=server.CreateObject("adodb.recordset")
                         sql="select id from info_co where pass='yes' and lm=5 order by px desc,id desc"
                         rs.open sql,conn,1,1
                         if not rs.eof then
                         counter=rs.recordcount
                         do while not rs.eof
                            if rs("id")=cint(id) then
                                rs.MovePrevious
                                if not rs.bof then
                   %>
                    <a href="hot_pro_show.asp?ID=<%=rs("ID")%>"><img src="images/up.gif" border="0" align="absmiddle" /></a>
                    <%
                        end if
                        rs.movenext
                        rs.movenext
                    %>
                    </span>        
                    <span style="padding:0px 20px;"><strong style="font-size:14px"><nobr><%=title%></nobr></strong></span><span>
                        <%
                     if not rs.eof then  
                    %>
            <a href="hot_pro_show.asp?ID=<%=rs("ID")%>"><img src="images/down.gif" border="0" align="absmiddle" /></a>
                    <%
                     end if
                    exit do
                    end if
                     rs.movenext
                     loop
                     rs.movefirst
                     end if
                     rs.close
                     set rs=nothing
                    %>
                    </span>
                </div>
                <%=z_body%>
                <div class="back" style="text-align:right;"><a style="color:#000000;" href="hot_pro.asp">[Return]</a></div>
            </div>
          </td>
        </tr>
      </table>
      <table width="774" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
