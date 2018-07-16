<!--#include file="conn.asp"-->
 <%
				  	id=request.QueryString("id")
					if id="" then id=6
				  set rs=server.CreateObject("adodb.recordset")
				  rs.open "select * from tol_co where ID="&id,conn,1,1
				  if not rs.eof then
				z_body111=rs("z_body")
				  end if
				  rs.close
				  set rs=nothing
				  
				  if id="" or id=6 then
				  nav=1
				  elseif id=14 then
				  nav=2
				  elseif id=13 then
				  nav=3
				  end if
				  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>深圳市泰恒达财税代理有限公司</title>
<style type="text/css">
<!--
body {
	background: url(images/bg_.jpg) repeat-x bottom;
	background-color:#F4F4F4;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/syle.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	
	<tr><td align="center" valign="top"><!--#include file="top1.asp"--></td>
	</tr>
	  
	  
	  <!--main-->
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <!--left-->
            <td width="207" valign="top">
              <!--#include file="left.asp"-->			</td>
			
            <td width="10">&nbsp;</td>
			
			<!--right-->
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="181" valign="top" background="images/index_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="5"></td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="9">&nbsp;</td>
                        <td><img src="images/index_22.gif" width="725" height="25" /></td>
                        <td width="9">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="15"></td>
                  </tr>
                  <tr>
                    <td><!--<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="34"><div align="center"><img src="images/index_45.gif" width="14" height="21" /></div></td>
                        <td width="109" height="107"style="border:solid 1px #cccccc; padding:6px;"><img src="images/index_33.gif" width="109" height="107" /></td>
                        <td width="14">&nbsp;</td>
                        <td width="109" height="107"style="border:solid 1px #cccccc; padding:6px;"><img src="images/index_35.gif" width="109" height="107" /></td>
                        <td width="14">&nbsp;</td>
                        <td width="109" height="107"style="border:solid 1px #cccccc; padding:6px;"><img src="images/index_37.gif" width="109" height="107" /></td>
                        <td width="14">&nbsp;</td>
                        <td width="109" height="107"style="border:solid 1px #cccccc; padding:6px;"><img src="images/index_39.gif" width="109" height="107" /></td>
                        <td width="14">&nbsp;</td>
                        <td width="109" height="107"style="border:solid 1px #cccccc; padding:6px;"><img src="images/index_41.gif" width="109" height="107" /></td>
                        <td><div align="center"><img src="images/index_48.gif" width="14" height="21" /></div></td>
                      </tr>
                    </table>-->
					
					<!--#include file="go.asp"-->					</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr>
                <td height="225" valign="top" background="images/index_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td style="background:url(images/b_03.jpg) repeat-x" height="30">
					 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="as">
					 <tr>
					 <td width="105" height="33"  <%if nav=1 then response.write("style=""background:url(images/gg_03.jpg) no-repeat;""") else if nav<>1 then response.write("style=""background:url(images/g_03.jpg) no-repeat;""") end if%> >
					 <!--<a href="index.asp?id=6"></a>--></td> 
					<!-- <td width="105" <%if nav=2 then response.write("style=""background:url(images/q03.jpg) no-repeat""") else if nav<>2 then response.write("style=""background:url(images/q04.jpg) no-repeat;""") end if%>>
					 <a class="as" href="index.asp?id=14"></a></td>
					 <td width="105" <%if nav=3 then response.write("style=""background:url(images/h_03.jpg) no-repeat""") else if nav<>3 then response.write("style=""background:url(images/h_05.jpg) no-repeat;""") end if%>>
					 <a  class="as" href="index.asp?id=13"></a></td>-->
					 <td >&nbsp;</td>
					 </tr></table>
                      <!--<img src="images/index_16.jpg" width="743" height="29" border="0" usemap="#Map3" />--></td>
                  </tr>
                  <tr>
                    <td height="15"></td>
                  </tr>
				 
                  <tr>
                    <td>
					
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
					  <td style="font-size:12px; line-height:24px; padding-left:10px; padding-right:10px;">
					   <%=z_body111%>
				  
				  <a <%if nav<>1 then response.write("style=""display:none""") end if%> href="about.asp">[<span style="color:#ff0000">了解更多</span>]</a>	</div>					  </td>
                       <!-- <td width="11">&nbsp;</td>
                        <td width="565" class="boby">　　深圳市金丰田贸易有限公司，坐落于深圳市CBD中心地带，距深圳罗湖口岸仅10分钟路程。2010年<br />
                          成立以来以承接国内外电子元器件、广告、机电设备的购销及其他国内贸易，从事货物及技术的进出口业务为依托，开展国内和海外市场相关业务。<br />
                          　　
                          目前金丰田作为国际茶叶协会授权单位和2011国际超级小姐世界大赛中国区竞选指定产品，公司精选了王博纳米功能活水机、中国红茶叶集团保健茶叶、永定堂万应茶系列和法国、澳大利亚等知名红酒满足高端人士的需求。</td>
                        <td width="8">&nbsp;</td>
                        <td width="156" valign="top"><img src="images/index_63.jpg" width="150" height="100" /></td>-->
                      </tr>
                    </table>					</td>
                  </tr>
                 <!-- <tr>
                    <td class="boby">&nbsp;&nbsp; 　　金丰田致力于打造贸易产品健康之优选，既满足国内外消费者对健康的需求，又能体现金丰田公司对广大客户的关爱。我们所做每<br />
                     &nbsp;&nbsp;&nbsp; 一种产品都通过了详细的市场调研和分析，必须完全符合广大消费者的诉求，所以我们所做的所有工作都是：为......[了解更多详情]</td>
                  </tr>-->
                </table></td>
              </tr>
              <tr>
                <td height="30"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
	  
        <td height="80" class="boby">
		<!--#include file="bottom.asp"-->      </tr>
    </table></td>
  </tr>
</table>

<map name="Map3" id="Map3"><area shape="rect" coords="134,6,188,27" href="index.asp?id=14" />
<area shape="rect" coords="218,6,276,25" href="index.asp?id=13" /></map>

</body>
</html>
