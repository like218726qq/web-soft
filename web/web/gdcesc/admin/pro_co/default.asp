<!--#include file="../inc.asp"-->
<%

'检查登录
checklogin

'连接数据库
openconn

'提取和验证传递参数
id_lm=trim(replace(request("id_lm"),"'",""))
keyword=bsql(html(trim(request("keyword"))))

'获取当前分类下所有的分类的id
if id_lm<>"" then
	if not checknum(id_lm) then
		call msg("参数错误","")
	else
		set rs=server.CreateObject("adodb.recordset")
		sql="select id_lm,xia from pro_lm where id_lm="&id_lm&""
		rs.open sql,conn,1,1
		if not rs.eof  then
			tt=""
			tt=" a.lm="&rs("id_lm")&""	
			call xialm(rs("id_lm"),tt)
		end if
		rs.close
		set rs=nothing
		
		sub xialm(fid,tt)
		set rsb=server.CreateObject("adodb.recordset")
		sql="select id_lm,xia,add_xx from pro_lm  where fid="&fid&" order by px desc,id_lm desc"
		rsb.open sql,conn,1,1
		while not rsb.eof
			tt=tt&" or a.lm="&rsb("id_lm")&"" 
			call xialm(rsb("id_lm"),tt)
			rsb.movenext
		wend
		rsb.close
		set rsb=nothing
		end sub
		
		if tt<>"" then 
			sq=" and ("&tt&") "
			pra="&id_lm="&id_lm&""
		end if
	end if
end if

'关键字搜索
if keyword<>"" then
	sq=sq&" and a.title like '%"&keyword&"%'"
	pra=pra&"&keyword="&server.URLEncode(keyword)&""
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>信息管理首页</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href="../css/admin_style.css"  type="text/css" rel="stylesheet">
<script language="javascript" src="../scripts/function.js"></script>
</head>
<body >
<DIV id=popImageLayer style="VISIBILITY: hidden; WIDTH: 267px; CURSOR: hand; POSITION: absolute; HEIGHT: 260px; background-image:url(../images/bbg.gif); z-index: 100;" align=center  name="popImageLayer"  ></DIV>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">  
    <tr class="topbg">    
        <td  colspan="2"  align="center">
            产品中心管理----管理首页
        </td>  
    </tr> 
    <tr class="tdbg">    
        <td width="70" height="26" ><strong>管理导航：</strong></td>
        <td ><a href="default.asp">产品管理首页</a>&nbsp;|&nbsp;<a href="add.asp">添加产品</a></td>
    </tr>
</table>
<BR>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
    <TR class="tdbg3" >
      <TD width="70"  valign="top"><strong>产品检索：</strong></TD>
      <TD><form id="sform" name="sform" method="get" action="default.asp">
           <select name="id_lm">
            <option value="" selected>所有分类</option>
            <%
			
            '添加信息时显示分类过程
            Set rsa= Server.CreateObject("ADODB.Recordset")
            sql="select id_lm,title_lm,add_xx,xia from pro_lm where fid=0 order by px desc,id_lm desc"
            rsa.open sql,conn,1,1
            while not rsa.eof 	
                i=""
                response.write"<OPTION value='"&rsa("id_lm")&"'>• "&rsa("title_lm")&"</OPTION>"&chr(10)
                call addinfo(rsa("id_lm"),i)
                rsa.movenext
            wend
            rsa.close
            set rsa=nothing
            
            sub addinfo(fid,i)
            i=i&"&nbsp;"
            sql="select id_lm,title_lm,add_xx,xia from pro_lm where fid="&fid&" order by px desc,id_lm desc"
            Set rsb= Server.CreateObject("ADODB.Recordset")
            rsb.open sql,conn,1,1
            while not rsb.eof
                response.write"<option value='"&rsb("id_lm")&"'>"&i&" 　|—"&rsb("title_lm")&"</option>"&chr(10)
                call addinfo(rsb("id_lm"),i&" 　|&nbsp;")
                rsb.movenext
            wend
            rsb.close
            set rsb=nothing
            end sub
            %>
         </select>
         <script language="javascript">
		 document.getElementById("id_lm").value="<%=id_lm%>";
         </script>
         <input name="keyword" type="text" id="keyword" size="15" maxlength="50"  value="<%=keyword%>"/>
         <input type="submit" name="button" id="button" value="检索" />
        </form>
      </TD>
    </TR>
  </TBODY>
</TABLE>

<br />

<FORM name=form1   action="make.asp" method=post>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" border=0>
    <TBODY>
      <TR class=title >
        <TD align=middle ><STRONG>选中</STRONG></TD>
        <TD align=middle><STRONG>ID</STRONG></TD>
        <TD ><STRONG>产品名称</STRONG></TD>
        <TD align=middle><STRONG>点击数</STRONG></TD>
        <td  align="center">排序</td>
        <TD align=center><STRONG>产品状态</STRONG></TD>
        <TD align=center><strong>修改</strong><!--|<strong>推荐</strong>| <strong>热点</strong>-->|<strong>屏蔽</strong>| <strong>删除</strong></TD>
      </TR>
        <%

        
        set rs=server.CreateObject("adodb.recordset")
        sql="select a.id,a.lm,a.title,a.img_sl,a.tuijian,a.hot,a.pass,a.read_num,a.px,b.title_lm from pro_co a,pro_lm b where a.lm=b.id_lm "&sq&" order by a.px desc,a.id desc"
        rs.open sql,conn,1,1
        if not rs.eof then
            pagenum=25
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
        end if
       while not rs.eof and a<=pagenum
       zt=""
       '推荐
       if rs("tuijian")="yes" then
           zt="<font class='tuijian'>推</font>&nbsp;"
       end if
       '热点
       if rs("hot")="yes" then
           zt=zt&"<font class='hot'>热</font>&nbsp;"
       end if
       '屏蔽
       if rs("pass")="yes" and rs("tuijian")="no" and rs("hot")="no" then
           zt=zt&"<font class='passyes'>正常</font>"
       elseif rs("pass")="no" then
           zt=zt&"<font class='passno'>屏蔽</font>"
       end if
       %>
    <TR class=tdbg onMouseOver="DoHL();" onMouseOut="DoLL();" onClick="DoSL();">
        <TD align=middle width=30 ><input type=checkbox name="id"  id="id"value="<%=rs("id")%>"  onClick="checkpx(<%=rs("id")%>)"></TD>
        <TD align=middle width="20"><%=rs("id")%></TD>
        <TD>
        <strong>[</strong><A href="default.asp?id_lm=<%=rs("lm")%>"><%=rs("title_lm")%></A><strong>]</strong><a href="edit.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
        <%
        if rs("img_sl")<>"" then 
            response.Write("<a href=../../"&rs("img_sl")&"  target=_blank><img src=../images/img.gif border=0 onmouseover=popImage(this,'../../"&rs("img_sl")&"'); onmouseout=hideLayer(); ></a>")
        end if
        %>
        </TD>
        <TD align=middle><%=rs("read_num")%></TD>
        <td align="center"><input name="<%=rs("id")%>" id="<%=rs("id")%>" type="text" value="<%=rs("px")%>" size="5" maxlength="10" disabled></td>
        <TD align=center><%=zt%></TD>
        <TD align=center> 
        <A href="edit.asp?id=<%=rs("id")%>" >修改</A>|
        <!--推荐
        <%if rs("tuijian")="yes" then%>
        <A href="make.asp?ac=tuijian1&id=<%=rs("id")%>">取消</A>|
        <%else%>
        <A href="make.asp?ac=tuijian2&id=<%=rs("id")%>">推荐</A>|
        <%end if%>
        -->
        
        <!--热点
        <%if rs("hot")="yes" then%>
        <A href="make.asp?ac=hot1&id=<%=rs("id")%>">取消</A>|
        <%else%>
        <A href="make.asp?ac=hot2&id=<%=rs("id")%>">热点</A>|
        <%end if%>
        -->
        
        <!--屏蔽-->
        <%if rs("pass")="yes" then%>
        <a href="make.asp?ac=ping1&id=<%=rs("id")%>">屏蔽</a>|
        <%else%>
        <a href="make.asp?ac=ping2&id=<%=rs("id")%>">取消</a>|
        <%end if%>
        
        <!--删除-->
        <A onClick="return confirm('提示:真的要删除此产品吗？');" href="make.asp?ac=del&id=<%=rs("id")%>">删除</A>
        </TD>
     </TR>
<%a=a+1
rs.movenext
wend
set rs=nothing
conn.close
set conn=nothing
%>

    </TBODY>
  </TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY><TR>
        <TD height=30 >
           &nbsp;&nbsp; &nbsp;&nbsp;<input name=chkall onClick=CheckAll(this.form,"yes")  type=button value='全选'>
            &nbsp;&nbsp;
          <input name=chkOthers onClick=CheckOthers(this.form,"yes")  type=button value='反选'>
         &nbsp; 
          <select name="ac">
          <option value="px">修改选中排序</option>
          <option value="ping1">屏蔽选中产品</option>
          <option value="ping2">取消屏蔽选中</option>
          <!--热点
          <option value="hot2">热点选中产品</option>
          <option value="hot1">取消热点选中</option>
          -->
         <!--推荐 
         <option value="tuijian2">推荐选中产品</option>
          <option value="tuijian1">取消推荐选中</option>
          -->
          <option value="del">删除选中产品</option>
          </select>
          &nbsp; 
        <input type="submit" value="确定操作" name="submit1"  onClick="return confirm('真的要执行操作吗?') ">				</TD>
        </TR>
      </TBODY>
  </TABLE>
</FORM>


<table width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="border:1px solid #2F78C8; ">
  <tr class=tdbg3>
    <td height="25" >
	<%
	if pagenum<>"" then 
		call listpage(pra)
	end if
	%>
	</td>
  </tr>
</table>
</body>
</html>