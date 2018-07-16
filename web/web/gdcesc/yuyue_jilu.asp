<!--#include file="conn.asp"-->
<% 	
	per=3
	t=1
	
	
	id=request("id")
	if id="" or not checknum(id) then
		call msg("参数错误","")
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from pro_order where id="&id&"  "
	rs.open sql,conn,1,3
	if rs.eof then
		call msg("该信息不存在或已删除","")
	else
		jianjie=rs("jianjie")
		mubiao=rs("mubiao")
		title_lm=rs("title_lm")
		danci=rs("danci")
		wtime=rs("wtime")
		taolun=rs("taolun")
		leixing=rs("leixing")
		title=rs("title")
		datehm=rs("datehm")
		pinglun=rs("pinglun")
		send_xs=rs("send_xs")

	end if
	rs.update
	rs.close
	set rs=nothing
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header-->
<!--#include file="top.asp"-->
<!--#include file="nav_teach.asp"-->


<div id="main">
   <!--内页左边-->
   <div class="main_left">
       <div class="mle_par1">
          <div class="mle_title">
             <img src="images/ny_02.jpg" />
             <ul>
                <li class="oms">课程记录</li>
             </ul>
          </div>
          <div class="clear"></div>
          <div class="mle_cont">
             <!--学校列表-->
             
             <div class="clear"></div>
             <div class="xylb2_1">
             	<table border="0" cellpadding="0" cellspacing="0" width="705" height="540">
                	<tr>
                    	<td valign="top">
                        	<table  cellpadding="0" cellspacing="0" align="center" width="690" style=" border-collapse:collapse; margin:5px;">
                            	<tr>
                                	<td>
                                    	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px;">
                                        	<tr>
                                            	<td style="padding-left:10px; background-color:#77cef9; height:26px; line-height:26px;font-family:'微软雅黑'; width:120px; ">日期（Date）：</td>
                                            	<td class="jl_neirong" style="border:#CCCCCC 1px solid;" width="570"><%=datehm%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            	<tr>
                                	<td>
                                    	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px;">
                                        	<tr>
                                            	<td style="padding-left:10px; background-color:#77cef9; height:26px; line-height:26px;font-family:'微软雅黑'; width:120px; ">课程类型（Type）：</td>
                                            	<td class="jl_neirong" style="border:#CCCCCC 1px solid;" width="570"><%=title_lm%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            	<tr>
                                	<td>
                                    	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px;">
                                        	<tr>
                                            	<td style="padding-left:10px; background-color:#77cef9; height:26px; line-height:26px;font-family:'微软雅黑'; width:120px;">标题（Topic）：</td>
                                            	<td class="jl_neirong" style="border:#CCCCCC 1px solid;" width="570"><%=title%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            	<tr>
                                	<td class="jl">话题简介（Topic Description）：</td>
                                </tr>
                            	<tr>
                                	<td height="80" valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690"><%=jianjie%></td>
                                </tr>
                            	<tr>
                                	<td class="jl">学习目标（Learning Objectives）：</td>
                                </tr>
                            	<tr>
                                	<td height="120" valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690"><%=mubiao%></td>
                                </tr>
                            	<tr>
                                	<td class="jl">主要表达和单词（Useful words and Expression）：</td>
                                </tr>
                            	<tr>
                                	<td height="120" valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690"><%=taolun%></td>
                                </tr>
                            	<tr>
                                	<td class="jl">今天问题和讨论（Question & Discussion）：</td>
                                </tr>
                            	<tr>
                                	<td height="120" valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690"><%=jianjie%></td>
                                </tr>
                            	<tr>
                                	<td class="jl">讲师评语（Lecturer comments）：</td>
                                </tr>
                            	<tr>
                                	<td height="120" valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690"><%=pinglun%></td>
                                </tr>
                            	<tr>
                                	<td  valign="top" class="jl_neirong"  style="border:#CCCCCC 1px solid;" width="690">
                                    <form action="yuyue_xs_editt.asp" name="form" method="post" onSubmit="return check()">
									<input type="hidden" name="id"  id="id" value="<%=id%>">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                    	<tR>
                                        	<tD width="80">
                                            <input type="radio" name="send_xs" value="no" <%if send_xs="no" then response.write " checked=""checked""" end if%>/> 未授课
<input type="radio" name="send_xs" value="yes" <%if send_xs="yes" then response.write " checked=""checked""" end if%>/> 已授课
                                            </tD>
                                        	<tD width="100">
                                            	<INPUT type="submit" id="b1" name="b1"   value="确定 " > 
                                            </tD>
                                        </tR>
                                    </table>
                                    </form>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table> 
             </div>
           
             <div class="clear"></div>
          </div>
       </div>
       
       
       
   </div>
   
   <!--内页右边-->
   <div class="main_right">
       <!--微博栏-->
       <div class="wbl">
          <!--#include file="left_person.asp"-->
       </div>
       <div class="clear"></div>
        <!--图片-->
        <!--#include file="left_bottom.asp"-->   
   </div>
   <div class="clear"></div>
</div>
<div id="footer">
	<!--#include file="bottom.asp"-->
</div>
</body>
</html>
