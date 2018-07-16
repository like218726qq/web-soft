<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="title.asp"--> 
<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<%
	id=request("id")
	if id<>"" and checknum(id) then
		sql="select * from tol_co where id="&id&""
	else
		sql="select top 1 * from tol_co where lm=3 order by px desc,id asc"
	end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		id=rs("id")
		title=rs("title")
		z_body=rs("z_body")
	end if
	rs.close
	set rs=nothing
	
	act = request("act")
	if act="save" then
		wl=request.Form("wl")
		st=request.Form("st")
		fw=request.Form("fanwei")
		xm=request.Form("name")
		tel=request.Form("tel")
		mail=request.Form("mail")
		UserName=request.Form("UserName")
		address=request.Form("address")
		link1=request.Form("link1")
		link2=request.Form("link2")
		zm1=request.Form("zm1")
		zm2=request.Form("zm2")
		
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from sq"
		rs.open sql,conn,1,3
		rs.addnew()
			rs("wl")=wl
			rs("st")=st
			rs("fw")=fw
			rs("xm")=xm
			rs("tel")=tel
			rs("mail")=mail
			rs("UserName")=UserName
			rs("address")=address
			rs("link1")=link1
			rs("link2")=link2
			rs("zm1")=zm1
			rs("zm2")=zm2
			rs("chakan")="no"
		rs.update()
		rs.close()
		set rs=nothing
		
		call msg("已成功提交申请，请等待管理员的审核","location='shenqing.asp'")
	end if
%>
<body>
<!--#include file="top1.asp"--> 
<table  border="0" cellpadding="0" cellspacing="0" width="1000px" align="center">
<tr>
	<td>
<script>
var swf_width=995;
var swf_height=230;
var files = '<%
	dim temp
	sql="select * from info_co where lm=15 and pass='yes' order by px desc,id asc"
	set rs=conn.execute(sql)
	do while not rs.eof
		temp=temp&rs("img_sl")&"|"
	rs.movenext
	loop
	rs.close
	temp=mid(temp,1,len(temp)-1)
	response.Write(temp)
%>';
var links = "";
var texts = "";
// 0xffffff:文字颜色|1:文字位置|0x0066ff:文字背景颜色|60:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|8:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口
var swf_config = "|2|||0xFFFFFF|0xFF6600||5|2|1|_blank"

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'" IsShowBtn="0" >');
document.write('<param name="movie" value="images/bcastr.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque"><param name="wmode" value="transparent" />');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'" >');
document.write('<embed src="images/bcastr.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+swf_config+'"  menu="false" quality="high" width="'+swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="1000px" align="center" style="margin-top:10px">
<tr>
    	<td valign="top" style="background:url(images/news_06.jpg) bottom repeat-x;border:1px solid #CCCCCC; border-top:none">
        	<table border="0" cellpadding="0" cellspacing="0" width="100%">
  				<tr style="background-image:url(images/ind_42.jpg)">
               	  <td width="5%">
               	  <img src="images/ind_39.jpg" />                    </td>
                    <td width="95%">
               	  <b style="font-size:14px; color:#FFFFFF">营销中心</b></td>
                </tr>
                <tr><td height="10px" colspan="2"></td></tr>
                <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select id,title from tol_co where lm=3 order by px desc,id asc"
					rs.open sql,conn,1,1
					while not rs.eof
				%>
                <tr>
               	  <td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                  <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="yinxiao.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
              	</tr>
                <%
					rs.movenext
					wend
					rs.close
					set rs=nothing
				%>
                 <tr>
                	<td style="border-bottom:1px dashed #CCCCCC" height="30px">&nbsp;</td>
                   <td align="left" style="border-bottom:1px dashed #CCCCCC; padding-left:20px"><img src="images/ind_47.jpg" />&nbsp;<a href="shenqing.asp">代理申请</a></td>
              	</tr>
                <tr>
                	<td height="142px"></td>
                    <td height="142px"></td>
                </tr>
          </table>
   	  	</td>
   	  <td width="20px"></td>
      	<td valign="top" width="760px">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0px">
                <tr>
                  <td height="30px" style="background-image:url(images/news1_03.jpg)">当前位置：<a href="index.asp">首页</a> > <a href="yinxiao.asp">营销中心</a> > 在线申请</td>
                </tr>
          </table>
          <div style="margin-top:20px; margin-bottom:20px; line-height:25px">
          <table border="0" cellpadding="0" cellspacing="0" width="99%">
          	<tr>
            	<td height="65" align="center" style="line-height:40px;">
           	  <h2 style=" margin-bottom:0px; padding-bottom:0px">网络销售渠道代理申请表</h2>              </td>
    </tr>
            <tr>
            	<td>
                	非常感谢您选择雅镭因此我们希望能互相了解后建立“双赢”的合作关系。请你在阅读后真实、详细填写以下资料：                </td>
            </tr>
            <tr>
            	<td>
                <form action="shenqing.asp?act=save" method="post" name="form11">
                  <table border="0" cellpadding="0" cellspacing="1" width="100%" style="background-color:#ebebeb; border:1px solid #000; border-bottom:none">
                    <tr>
                      <td align="center" colspan="6" style="font-size:16px" height="40px"><b>客户基本资料</b></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td height="40px" width="95" align="center">申请区域</td>
                      <td width="116">&nbsp;
                        <input type="checkbox" name="wl" value="网络销售渠道" />
                        网络销售渠道</td>
                      <td width="108"><input type="checkbox" name="st" value="实体销售渠道" />
                        实体销售渠道</td>
                      <td width="132" align="center">区域范围</td>
                      <td colspan="2">&nbsp;
                          <input type="text" name="fanwei" style="width:240px" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td height="40px" width="95" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
                      <td width="116">&nbsp;
                      <input type="text" name="name" style="width:80px" /></td>
                      <td width="108" align="center">联系手机</td>
                      <td width="132">&nbsp;
                      <input type="text" name="tel" style="width:110px" /></td>
                      <td width="68" align="center">电子邮箱</td>
                      <td width="224">&nbsp;
                      <input type="text" name="mail" style="width:170px" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td  height="40px" width="95" align="center">客户名称</td>
                      <td colspan="5">&nbsp;
                          <input type="text" name="UserName" style="width:600px" /></td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                      <td width="95" height="40px" align="center">通讯/收货地址</td>
                      <td colspan="5">&nbsp;
                          <input type="text" name="address" style="width:600px" /></td>
                    </tr>
                  </table>
                  <table border="0" cellpadding="0" cellspacing="1" width="100%" style="background-color:#ebebeb; border:1px solid #000; border-top:none">
       	  <tr>
                        	<td align="center" colspan="6" style="font-size:16px" height="40px"><b>经营基本资料</b></td>
                        </tr>
                    	<tr style="background-color:#FFFFFF">
                        	<td width="14%" rowspan="4" align="center">销售渠道</td>
                          <td width="13%" rowspan="2" align="center">网络渠道</td>
                          <td width="14%" height="30" align="center">直营店</td>
                          <td width="59%">&nbsp;链接地址
                          <input type="text" name="link1" style="width:340px" /></td>
                    </tr>
                        <tr style="background-color:#FFFFFF">
                            <td height="30" align="center">分销店</td>
                          	<td>&nbsp;链接地址
                       	  <input type="text" name="link2" style="width:340px" /></td>
                    </tr>
                        <tr style="background-color:#FFFFFF">
                            <td rowspan="2" align="center">实体渠道</td>
                          <td height="30" align="center">连锁专卖</td>
                          <td>&nbsp;<input type="text" name="zm1" style="width:395px" /></td>
                        </tr>
                         <tr style="background-color:#FFFFFF">
                            <td height="30" align="center">柜台专面</td>
                           <td>&nbsp;<input type="text" name="zm2" style="width:395px" /></td>
                        </tr>
                         <tr style="background-color:#FFFFFF">
                            <td colspan="5" align="center" height="35"><input type="submit"  value=" 提交 "/>&nbsp;<input type="submit"  value=" 重置 "/></td>
                        </tr>
                    </table>
               </form></td>
            </tr>
          </table>
         
          
          </div>
    </td>
    </tr>
</table>
<!--#include file="bottom.asp"--> 
</body>
</html>
