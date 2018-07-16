<!--#include file="conn.asp"-->

<%
id=request("id")
	per=2
	t=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
<script language="javascript">
function check(){
	var datehm=document.form1.datehm;
	var person_js=document.form1.person_js;
	var title=document.form1.title;
	if (datehm.value==""){
		alert("时间不能少")
		datehm.focus()
		return false
	}
		if (person_js.value==""){
		alert("请选择教师")
		person_js.focus()
		return false
	}
	if (title.value==""){
		alert("请选择课题")
		title.focus()
		return false
	}


}
</script>
 <script src="Calendar.js"></script>
<Script LANGUAGE="JavaScript">
 var months = new Array("一", "二", "三","四", "五", "六", "七", "八", "九","十", "十一", "十二");
 var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,30, 31, 30, 31);
 var days = new Array("日","一", "二", "三","四", "五", "六");
 var classTemp;
 var today=new getToday();
 var year=today.year;
 var month=today.month;
 var newCal; 

 function getDays(month, year) {
  if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) ||(0 == year % 400) ? 29 : 28;
  else return daysInMonth[month];
 }

 function getToday() {
  this.now = new Date();
  this.year = this.now.getFullYear();
  this.month = this.now.getMonth();
  this.day = this.now.getDate();
 }

 function Calendar() {
  newCal = new Date(year,month,1);
  today = new getToday();   
  var day = -1;
  var startDay = newCal.getDay();
  var endDay=getDays(newCal.getMonth(), newCal.getFullYear());
  var daily = 0;
  if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
  {
   day = today.day;
  }
  var caltable = document.all.caltable.tBodies.calendar;
  var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());

  for (var intWeek = 0; intWeek < caltable.rows.length;intWeek++)
   for (var intDay = 0;intDay < caltable.rows[intWeek].cells.length;intDay++)
   {
    var cell = caltable.rows[intWeek].cells[intDay];
    var montemp=(newCal.getMonth()+1)<10?("0"+(newCal.getMonth()+1)):(newCal.getMonth()+1);         
    if ((intDay == startDay) && (0 == daily)){ daily = 1;}
    var daytemp=daily<10?("0"+daily):(daily);
    var d="<"+newCal.getFullYear()+"-"+montemp+"-"+daytemp+">";
    if(day==daily) cell.className="DayNow";
    else if(intDay==6) cell.className = "DaySat";
    else if (intDay==0) cell.className ="DaySun";
    else cell.className="Day";
    if ((daily > 0) && (daily <= intDaysInMonth))
    {
     cell.innerText = daily;
     daily++;
    } else
    {
     cell.className="CalendarTD";
     cell.innerText = "";
    }
  }
  document.all.year.value=year;
  document.all.month.value=month+1;
 }

 function subMonth()
 {
  if ((month-1)<0)
  {
   month=11;
   year=year-1;
  } else
  {
   month=month-1;
  }
  Calendar();
 }

 function addMonth()
 {
  if((month+1)>11)
  {
   month=0;
   year=year+1;
  } else
  {
   month=month+1;
  }
  Calendar();
 }

 function setDate() 
 {
  if (document.all.month.value<1||document.all.month.value>12)
  {
   alert("月的有效范围在1-12之间!");
   return;
  }
  year=Math.ceil(document.all.year.value);
  month=Math.ceil(document.all.month.value-1);
  Calendar();
 }
</Script>

<Script>
function buttonOver()
{
 var obj = window.event.srcElement;
 obj.runtimeStyle.cssText = "background-color:#FFFFFF";
// obj.className="Hover";
}

function buttonOut()
{
 var obj = window.event.srcElement;
 window.setTimeout(function(){obj.runtimeStyle.cssText = "";},300);
}
</Script>

<Style>
Input {font-family: verdana;font-size: 9pt;text-decoration: none;background-color: #FFFFFF;height: 20px;border: 1px solid #666666;color:#000000;}

.Calendar {font-family: verdana;text-decoration: none;width: 270px; height:270px;background-color: #C0D0E8;font-size: 9pt;border:0px dotted #1C6FA5;}
.CalendarTD {font-family: verdana;font-size: 7pt;color: #000000;background-color:#f6f6f6;height: 20px;width:11%;text-align: center;}

.Title {font-family: verdana;font-size: 11pt;font-weight: normal;height: 24px;text-align: center;color: #333333;text-decoration: none;background-color: #A4B9D7;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-bottom-style:1px;border-top-color: #999999;border-right-color: #999999;border-bottom-color: #999999;border-left-color: #999999;}

.Day {font-family: verdana;font-size: 7pt;color:#243F65;background-color: #E5E9F2;height: 20px;width:11%;text-align: center;}
.DaySat {font-family: verdana;font-size: 7pt;color:#FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DaySun {font-family: verdana;font-size: 7pt;color: #FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DayNow {font-family: verdana;font-size: 7pt;font-weight: bold;color: #000000;background-color: #FFFFFF;height: 20px;text-align: center;}

.DayTitle {font-family: verdana;font-size: 9pt;color: #000000;background-color: #C0D0E8;height: 20px;width:11%;text-align: center;}
.DaySatTitle {font-family: verdana;font-size: 9pt;color:#FF0000;text-decoration: none;background-color:#C0D0E8;text-align: center;height: 20px;width: 12%;}
.DaySunTitle {font-family: verdana;font-size: 9pt;color: #FF0000;text-decoration: none;background-color: #C0D0E8;text-align: center;height: 20px;width: 12%;}
.DayButton {font-family: Webdings;font-size: 9pt;font-weight: bold;color: #243F65;cursor:hand;text-decoration: none;}
</Style>

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
                <li class="oms">预约课程</li>
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
                        	<table border="0" cellpadding="0" cellspacing="0" width="100%" >
                            	<tr>
                                	<td  style="padding-left:20px" width="270">
                                       <!--日历表开始-->
                                       <table border="0" cellpadding="0" cellspacing="1" class="Calendar" id="caltable">
                                        <thead>
                                             <tr align="center" valign="middle"> 
                                              <td colspan="7" class="Title">
                                               <a href="javaScript:subMonth();" title="上一月" Class="DayButton">3</a> <input name="year" type="text" size="4" maxlength="4" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 年 <input name="month" type="text" size="1" maxlength="2" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 月 <a href="JavaScript:addMonth();" title="下一月" Class="DayButton">4</a>
                                              </td>
                                             </tr>
                                             <tr align="center" valign="middle"> 
                                              <Script LANGUAGE="JavaScript">  
                                               document.write("<TD class=DaySunTitle id=diary >" + days[0] + "</TD>"); 
                                               for (var intLoop = 1; intLoop < days.length-1;intLoop++) 
                                                document.write("<TD class=DayTitle id=diary>" + days[intLoop] + "</TD>"); 
                                                document.write("<TD class=DaySatTitle id=diary>" + days[intLoop] + "</TD>"); 
                                              </Script>
                                             </TR> 
                                            </thead>
                                            <TBODY border=1 cellspacing="0" cellpadding="0" ID="calendar" ALIGN=CENTER ONCLICK="getDiary()">
                                             <Script LANGUAGE="JavaScript">
                                              for (var intWeeks = 0; intWeeks < 6; intWeeks++)
                                              {
                                               document.write("<TR style='cursor:hand'>");
                                               for (var intDays = 0; intDays < days.length;intDays++) document.write("<TD class=CalendarTD onMouseover='buttonOver();' onMouseOut='buttonOut();'></TD>");
                                               document.write("</TR>");
                                              } 
                                             </Script>
                                            </TBODY>
                                            </TABLE>
                                            <Script  LANGUAGE="JavaScript">
                                             Calendar();
                                            </Script>
                                      <!--日历表结束-->
                                    </td>
                                    <td valign="top" style="padding:8px;">
                                    	<%
												set rs=server.CreateObject("adodb.recordset")
												sql="select * from tol_co where id=13"
												rs.open sql,conn,1,1
												if not rs.eof then
													response.write rs("z_body")
												end if
												rs.close
												set rs=nothing
											%>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" >
                                <tr>
                                	<td style="padding:20px 0 10px 20px;" valign="top">
                                    	<table  cellpadding="0" cellspacing="0" width="680" style="border-collapse:inherit; border:1px solid #999999;" height="350">
                                        <form action="order_add.asp" method="post" name="form1"  onSubmit="return check()">
                                        <input type="hidden" id="id" name="id" value="<%=id%>" style="display:none;" />
                                        <input  name="send_zt" type="hidden" value="no" />
                                        <input  name="send_xs" type="hidden" value="no" />
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">预约时间：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;"><input type="text" name="datehm"  onClick="setDayHM(this);"></td>
                                            </tr>
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择老师：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <select name="person_js">
                                                    <option value="" selected>请选择教师</option>
                                                     <%
                                                        '连接数据库
                                                        
                                                        set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from person1 "
                                                        rs1.open sql,conn,1,1
                                                        while not rs1.eof
                                                    %> 
                                                    <option value="<%=rs1("id")%>"><%=rs1("username")%></option>
                                                      <%
                                                        rs1.movenext
                                                        wend
                                                        rs1.close
                                                        set rs1=nothing
                                                    %>
                                                 </select>
                                                </td>
                                            </tr>
                                            <script type="text/javascript">
												$(document).ready(function(){
													$("#title").change(function(){
														
														$(".a_div").hide();
														var nid=document.getElementById("title").value;
														document.getElementById("a_div"+nid).style.display='';
													});
												});
												
											</script>

                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择课题：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <%
													set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs1.open sql,conn,1,1
														counts=rs1.recordcount
														
														idd=rs1("id")
												%>
                                                <select name="title" id="title">
                                                    <option value="" selected >请选择课题</option>
                                                   
                                                     <%
                                                        '连接数据库
                                                        while not rs1.eof
                                                    %> 
                                                    <option value="<%=rs1("id")%>" ><%=rs1("title")%></option>
                                                     <%
															rs1.movenext
												 	    wend
                                                    %> 

                                                 </select>
                                                 <%
                                                        rs1.close
                                                        set rs1=nothing
												 %>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan="2" valign="top" style="padding:8px;" id="a_div">
                                                
                                                	 <%
                                                        '连接数据库
                                                        
                                                        set rs2=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs2.open sql,conn,1,1
														a=1
                                                        while not rs2.eof
                                                    %> 
                                                    
                                                  		 <div id="a_div<%=rs2("id")%>" class="a_div" <%if a<>1 then%> style="display:none;"<%end if%>><%=rs2("z_body")%></div>
                                                     <%
													 		a=a+1
                                                        	rs2.movenext
                                                        wend
                                                        rs2.close
                                                        set rs2=nothing
                                                    %>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td valign="middle" align="center" width="98%" colspan="2" height="40" ><input type="image" src="images/yuyue2.jpg"   border="0"  style="width:202px; height:36px; border:0px;"  /> </td>
                                            </tr>
                                          </form>
                                        </table>
                                    </td>
                                    <td></td>
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









<!--#include file="conn.asp"-->

<%
id=request("id")
	per=2
	t=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
<script language="javascript">
function check(){
	var datehm=document.form1.datehm;
	var person_js=document.form1.person_js;
	var title=document.form1.title;
	if (datehm.value==""){
		alert("时间不能少")
		datehm.focus()
		return false
	}
		if (person_js.value==""){
		alert("请选择教师")
		person_js.focus()
		return false
	}
	if (title.value==""){
		alert("请选择课题")
		title.focus()
		return false
	}


}
</script>
 <script src="Calendar.js"></script>
<Script LANGUAGE="JavaScript">
 var months = new Array("一", "二", "三","四", "五", "六", "七", "八", "九","十", "十一", "十二");
 var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,30, 31, 30, 31);
 var days = new Array("日","一", "二", "三","四", "五", "六");
 var classTemp;
 var today=new getToday();
 var year=today.year;
 var month=today.month;
 var newCal; 

 function getDays(month, year) {
  if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) ||(0 == year % 400) ? 29 : 28;
  else return daysInMonth[month];
 }

 function getToday() {
  this.now = new Date();
  this.year = this.now.getFullYear();
  this.month = this.now.getMonth();
  this.day = this.now.getDate();
 }

 function Calendar() {
  newCal = new Date(year,month,1);
  today = new getToday();   
  var day = -1;
  var startDay = newCal.getDay();
  var endDay=getDays(newCal.getMonth(), newCal.getFullYear());
  var daily = 0;
  if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
  {
   day = today.day;
  }
  var caltable = document.all.caltable.tBodies.calendar;
  var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());

  for (var intWeek = 0; intWeek < caltable.rows.length;intWeek++)
   for (var intDay = 0;intDay < caltable.rows[intWeek].cells.length;intDay++)
   {
    var cell = caltable.rows[intWeek].cells[intDay];
    var montemp=(newCal.getMonth()+1)<10?("0"+(newCal.getMonth()+1)):(newCal.getMonth()+1);         
    if ((intDay == startDay) && (0 == daily)){ daily = 1;}
    var daytemp=daily<10?("0"+daily):(daily);
    var d="<"+newCal.getFullYear()+"-"+montemp+"-"+daytemp+">";
    if(day==daily) cell.className="DayNow";
    else if(intDay==6) cell.className = "DaySat";
    else if (intDay==0) cell.className ="DaySun";
    else cell.className="Day";
    if ((daily > 0) && (daily <= intDaysInMonth))
    {
     cell.innerText = daily;
     daily++;
    } else
    {
     cell.className="CalendarTD";
     cell.innerText = "";
    }
  }
  document.all.year.value=year;
  document.all.month.value=month+1;
 }

 function subMonth()
 {
  if ((month-1)<0)
  {
   month=11;
   year=year-1;
  } else
  {
   month=month-1;
  }
  Calendar();
 }

 function addMonth()
 {
  if((month+1)>11)
  {
   month=0;
   year=year+1;
  } else
  {
   month=month+1;
  }
  Calendar();
 }

 function setDate() 
 {
  if (document.all.month.value<1||document.all.month.value>12)
  {
   alert("月的有效范围在1-12之间!");
   return;
  }
  year=Math.ceil(document.all.year.value);
  month=Math.ceil(document.all.month.value-1);
  Calendar();
 }
</Script>

<Script>
function buttonOver()
{
 var obj = window.event.srcElement;
 obj.runtimeStyle.cssText = "background-color:#FFFFFF";
// obj.className="Hover";
}

function buttonOut()
{
 var obj = window.event.srcElement;
 window.setTimeout(function(){obj.runtimeStyle.cssText = "";},300);
}
</Script>

<Style>
Input {font-family: verdana;font-size: 9pt;text-decoration: none;background-color: #FFFFFF;height: 20px;border: 1px solid #666666;color:#000000;}

.Calendar {font-family: verdana;text-decoration: none;width: 270px; height:270px;background-color: #C0D0E8;font-size: 9pt;border:0px dotted #1C6FA5;}
.CalendarTD {font-family: verdana;font-size: 7pt;color: #000000;background-color:#f6f6f6;height: 20px;width:11%;text-align: center;}

.Title {font-family: verdana;font-size: 11pt;font-weight: normal;height: 24px;text-align: center;color: #333333;text-decoration: none;background-color: #A4B9D7;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-bottom-style:1px;border-top-color: #999999;border-right-color: #999999;border-bottom-color: #999999;border-left-color: #999999;}

.Day {font-family: verdana;font-size: 7pt;color:#243F65;background-color: #E5E9F2;height: 20px;width:11%;text-align: center;}
.DaySat {font-family: verdana;font-size: 7pt;color:#FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DaySun {font-family: verdana;font-size: 7pt;color: #FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DayNow {font-family: verdana;font-size: 7pt;font-weight: bold;color: #000000;background-color: #FFFFFF;height: 20px;text-align: center;}

.DayTitle {font-family: verdana;font-size: 9pt;color: #000000;background-color: #C0D0E8;height: 20px;width:11%;text-align: center;}
.DaySatTitle {font-family: verdana;font-size: 9pt;color:#FF0000;text-decoration: none;background-color:#C0D0E8;text-align: center;height: 20px;width: 12%;}
.DaySunTitle {font-family: verdana;font-size: 9pt;color: #FF0000;text-decoration: none;background-color: #C0D0E8;text-align: center;height: 20px;width: 12%;}
.DayButton {font-family: Webdings;font-size: 9pt;font-weight: bold;color: #243F65;cursor:hand;text-decoration: none;}
</Style>

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
                <li class="oms">预约课程</li>
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
                        	<table border="0" cellpadding="0" cellspacing="0" width="100%" >
                            	<tr>
                                	<td  style="padding-left:20px" width="270">
                                       <!--日历表开始-->
                                       <table border="0" cellpadding="0" cellspacing="1" class="Calendar" id="caltable">
                                        <thead>
                                             <tr align="center" valign="middle"> 
                                              <td colspan="7" class="Title">
                                               <a href="javaScript:subMonth();" title="上一月" Class="DayButton">3</a> <input name="year" type="text" size="4" maxlength="4" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 年 <input name="month" type="text" size="1" maxlength="2" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 月 <a href="JavaScript:addMonth();" title="下一月" Class="DayButton">4</a>
                                              </td>
                                             </tr>
                                             <tr align="center" valign="middle"> 
                                              <Script LANGUAGE="JavaScript">  
                                               document.write("<TD class=DaySunTitle id=diary >" + days[0] + "</TD>"); 
                                               for (var intLoop = 1; intLoop < days.length-1;intLoop++) 
                                                document.write("<TD class=DayTitle id=diary>" + days[intLoop] + "</TD>"); 
                                                document.write("<TD class=DaySatTitle id=diary>" + days[intLoop] + "</TD>"); 
                                              </Script>
                                             </TR> 
                                            </thead>
                                            <TBODY border=1 cellspacing="0" cellpadding="0" ID="calendar" ALIGN=CENTER ONCLICK="getDiary()">
                                             <Script LANGUAGE="JavaScript">
                                              for (var intWeeks = 0; intWeeks < 6; intWeeks++)
                                              {
                                               document.write("<TR style='cursor:hand'>");
                                               for (var intDays = 0; intDays < days.length;intDays++) document.write("<TD class=CalendarTD onMouseover='buttonOver();' onMouseOut='buttonOut();'></TD>");
                                               document.write("</TR>");
                                              } 
                                             </Script>
                                            </TBODY>
                                            </TABLE>
                                            <Script  LANGUAGE="JavaScript">
                                             Calendar();
                                            </Script>
                                      <!--日历表结束-->
                                    </td>
                                    <td valign="top" style="padding:8px;">
                                    	<%
												set rs=server.CreateObject("adodb.recordset")
												sql="select * from tol_co where id=13"
												rs.open sql,conn,1,1
												if not rs.eof then
													response.write rs("z_body")
												end if
												rs.close
												set rs=nothing
											%>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" >
                                <tr>
                                	<td style="padding:20px 0 10px 20px;" valign="top">
                                    	<table  cellpadding="0" cellspacing="0" width="680" style="border-collapse:inherit; border:1px solid #999999;" height="350">
                                        <form action="order_add.asp" method="post" name="form1"  onSubmit="return check()">
                                        <input type="hidden" id="id" name="id" value="<%=id%>" style="display:none;" />
                                        <input  name="send_zt" type="hidden" value="no" />
                                        <input  name="send_xs" type="hidden" value="no" />
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">预约时间：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;"><input type="text" name="datehm"  onClick="setDayHM(this);"></td>
                                            </tr>
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择老师：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <select name="person_js">
                                                    <option value="" selected>请选择教师</option>
                                                     <%
                                                        '连接数据库
                                                        
                                                        set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from person1 "
                                                        rs1.open sql,conn,1,1
                                                        while not rs1.eof
                                                    %> 
                                                    <option value="<%=rs1("id")%>"><%=rs1("username")%></option>
                                                      <%
                                                        rs1.movenext
                                                        wend
                                                        rs1.close
                                                        set rs1=nothing
                                                    %>
                                                 </select>
                                                </td>
                                            </tr>
                                            <script type="text/javascript">
												$(document).ready(function(){
													$("#title").change(function(){
														//var a=$(this).val;
														$(".a_diva").hide();
														//$("#aa_"+a).show();
														alert($(this).parents("#title").find("option").index($(this)+1));
														//$("#a_div").find(".a_diva:eq("+$(this).parent("#title").find("option").index($(this)+1)+")").show();
													});
												});
												
												//function aa(c){
//												var nid=document.getElementById("title").value;
//												//alert(nid);
//											
//												for(i=1;i<=c;i++){
//													document.getElementById("aa_"+i).style.display='none';
//												}
//											
//												document.getElementById("aa_"+nid).style.display='';
//												}
											</script>

                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择课题：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <%
													set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs1.open sql,conn,1,1
														counts=rs1.recordcount
														
														idd=rs1("id")
												%>
                                                <select name="title" id="title">
                                                    <option value="" selected >请选择课题</option>
                                                   
                                                     <%
                                                        '连接数据库
                                                        while not rs1.eof
                                                    %> 
                                                    <option value="<%=rs1("id")%>" ><%=rs1("title")%></option>
                                                     <%
															rs1.movenext
												 	    wend
                                                    %> 

                                                 </select>
                                                 <%
                                                        rs1.close
                                                        set rs1=nothing
												 %>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan="2" valign="top" style="padding:8px;" id="a_div">
                                                
                                                	 <%
                                                        '连接数据库
                                                        
                                                        set rs2=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs2.open sql,conn,1,1
														a=1
                                                        while not rs2.eof
                                                    %> 
                                                    
                                                  		 <div class="a_diva" <%if a<>1 then%> style="display:none;"<%end if%>><%=rs2("z_body")%></div>
                                                     <%
													 		a=a+1
                                                        	rs2.movenext
                                                        wend
                                                        rs2.close
                                                        set rs2=nothing
                                                    %>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td valign="middle" align="center" width="98%" colspan="2" height="40" ><input type="image" src="images/yuyue2.jpg"   border="0"  style="width:202px; height:36px; border:0px;"  /> </td>
                                            </tr>
                                          </form>
                                        </table>
                                    </td>
                                    <td></td>
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




<!--#include file="conn.asp"-->

<%
id=request("id")
	per=2
	t=1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国教育服务中心有限公司广东分公司</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/person.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript src="scripts/checkform.js"></SCRIPT>
<script language="javascript">
function check(){
	var datehm=document.form1.datehm;
	var person_js=document.form1.person_js;
	var title=document.form1.title;
	if (datehm.value==""){
		alert("时间不能少")
		datehm.focus()
		return false
	}
		if (person_js.value==""){
		alert("请选择教师")
		person_js.focus()
		return false
	}
	if (title.value==""){
		alert("请选择课题")
		title.focus()
		return false
	}


}
</script>
 <script src="Calendar.js"></script>
<Script LANGUAGE="JavaScript">
 var months = new Array("一", "二", "三","四", "五", "六", "七", "八", "九","十", "十一", "十二");
 var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,30, 31, 30, 31);
 var days = new Array("日","一", "二", "三","四", "五", "六");
 var classTemp;
 var today=new getToday();
 var year=today.year;
 var month=today.month;
 var newCal; 

 function getDays(month, year) {
  if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) ||(0 == year % 400) ? 29 : 28;
  else return daysInMonth[month];
 }

 function getToday() {
  this.now = new Date();
  this.year = this.now.getFullYear();
  this.month = this.now.getMonth();
  this.day = this.now.getDate();
 }

 function Calendar() {
  newCal = new Date(year,month,1);
  today = new getToday();   
  var day = -1;
  var startDay = newCal.getDay();
  var endDay=getDays(newCal.getMonth(), newCal.getFullYear());
  var daily = 0;
  if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
  {
   day = today.day;
  }
  var caltable = document.all.caltable.tBodies.calendar;
  var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());

  for (var intWeek = 0; intWeek < caltable.rows.length;intWeek++)
   for (var intDay = 0;intDay < caltable.rows[intWeek].cells.length;intDay++)
   {
    var cell = caltable.rows[intWeek].cells[intDay];
    var montemp=(newCal.getMonth()+1)<10?("0"+(newCal.getMonth()+1)):(newCal.getMonth()+1);         
    if ((intDay == startDay) && (0 == daily)){ daily = 1;}
    var daytemp=daily<10?("0"+daily):(daily);
    var d="<"+newCal.getFullYear()+"-"+montemp+"-"+daytemp+">";
    if(day==daily) cell.className="DayNow";
    else if(intDay==6) cell.className = "DaySat";
    else if (intDay==0) cell.className ="DaySun";
    else cell.className="Day";
    if ((daily > 0) && (daily <= intDaysInMonth))
    {
     cell.innerText = daily;
     daily++;
    } else
    {
     cell.className="CalendarTD";
     cell.innerText = "";
    }
  }
  document.all.year.value=year;
  document.all.month.value=month+1;
 }

 function subMonth()
 {
  if ((month-1)<0)
  {
   month=11;
   year=year-1;
  } else
  {
   month=month-1;
  }
  Calendar();
 }

 function addMonth()
 {
  if((month+1)>11)
  {
   month=0;
   year=year+1;
  } else
  {
   month=month+1;
  }
  Calendar();
 }

 function setDate() 
 {
  if (document.all.month.value<1||document.all.month.value>12)
  {
   alert("月的有效范围在1-12之间!");
   return;
  }
  year=Math.ceil(document.all.year.value);
  month=Math.ceil(document.all.month.value-1);
  Calendar();
 }
</Script>

<Script>
function buttonOver()
{
 var obj = window.event.srcElement;
 obj.runtimeStyle.cssText = "background-color:#FFFFFF";
// obj.className="Hover";
}

function buttonOut()
{
 var obj = window.event.srcElement;
 window.setTimeout(function(){obj.runtimeStyle.cssText = "";},300);
}
</Script>

<Style>
Input {font-family: verdana;font-size: 9pt;text-decoration: none;background-color: #FFFFFF;height: 20px;border: 1px solid #666666;color:#000000;}

.Calendar {font-family: verdana;text-decoration: none;width: 270px; height:270px;background-color: #C0D0E8;font-size: 9pt;border:0px dotted #1C6FA5;}
.CalendarTD {font-family: verdana;font-size: 7pt;color: #000000;background-color:#f6f6f6;height: 20px;width:11%;text-align: center;}

.Title {font-family: verdana;font-size: 11pt;font-weight: normal;height: 24px;text-align: center;color: #333333;text-decoration: none;background-color: #A4B9D7;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-bottom-style:1px;border-top-color: #999999;border-right-color: #999999;border-bottom-color: #999999;border-left-color: #999999;}

.Day {font-family: verdana;font-size: 7pt;color:#243F65;background-color: #E5E9F2;height: 20px;width:11%;text-align: center;}
.DaySat {font-family: verdana;font-size: 7pt;color:#FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DaySun {font-family: verdana;font-size: 7pt;color: #FF0000;text-decoration: none;background-color:#E5E9F2;text-align: center;height: 18px;width: 12%;}
.DayNow {font-family: verdana;font-size: 7pt;font-weight: bold;color: #000000;background-color: #FFFFFF;height: 20px;text-align: center;}

.DayTitle {font-family: verdana;font-size: 9pt;color: #000000;background-color: #C0D0E8;height: 20px;width:11%;text-align: center;}
.DaySatTitle {font-family: verdana;font-size: 9pt;color:#FF0000;text-decoration: none;background-color:#C0D0E8;text-align: center;height: 20px;width: 12%;}
.DaySunTitle {font-family: verdana;font-size: 9pt;color: #FF0000;text-decoration: none;background-color: #C0D0E8;text-align: center;height: 20px;width: 12%;}
.DayButton {font-family: Webdings;font-size: 9pt;font-weight: bold;color: #243F65;cursor:hand;text-decoration: none;}
</Style>
<script type="text/javascript">
	function aa(c){
	var nid=document.getElementById("title").value;
	//alert(nid);

	for(i=1;i<=c;i++){
		document.getElementById("aa_"+i).style.display='none';
	}

	document.getElementById("aa_"+nid).style.display='';
	}
</script>

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
                <li class="oms">预约课程</li>
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
                        	<table border="0" cellpadding="0" cellspacing="0" width="100%" >
                            	<tr>
                                	<td  style="padding-left:20px" width="270">
                                       <!--日历表开始-->
                                       <table border="0" cellpadding="0" cellspacing="1" class="Calendar" id="caltable">
                                        <thead>
                                             <tr align="center" valign="middle"> 
                                              <td colspan="7" class="Title">
                                               <a href="javaScript:subMonth();" title="上一月" Class="DayButton">3</a> <input name="year" type="text" size="4" maxlength="4" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 年 <input name="month" type="text" size="1" maxlength="2" onKeyDown="if (event.keyCode==13)" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')"  onpaste="this.value=this.value.replace(/[^0-9]/g,'')"> 月 <a href="JavaScript:addMonth();" title="下一月" Class="DayButton">4</a>
                                              </td>
                                             </tr>
                                             <tr align="center" valign="middle"> 
                                              <Script LANGUAGE="JavaScript">  
                                               document.write("<TD class=DaySunTitle id=diary >" + days[0] + "</TD>"); 
                                               for (var intLoop = 1; intLoop < days.length-1;intLoop++) 
                                                document.write("<TD class=DayTitle id=diary>" + days[intLoop] + "</TD>"); 
                                                document.write("<TD class=DaySatTitle id=diary>" + days[intLoop] + "</TD>"); 
                                              </Script>
                                             </TR> 
                                            </thead>
                                            <TBODY border=1 cellspacing="0" cellpadding="0" ID="calendar" ALIGN=CENTER ONCLICK="getDiary()">
                                             <Script LANGUAGE="JavaScript">
                                              for (var intWeeks = 0; intWeeks < 6; intWeeks++)
                                              {
                                               document.write("<TR style='cursor:hand'>");
                                               for (var intDays = 0; intDays < days.length;intDays++) document.write("<TD class=CalendarTD onMouseover='buttonOver();' onMouseOut='buttonOut();'></TD>");
                                               document.write("</TR>");
                                              } 
                                             </Script>
                                            </TBODY>
                                            </TABLE>
                                            <Script  LANGUAGE="JavaScript">
                                             Calendar();
                                            </Script>
                                      <!--日历表结束-->
                                    </td>
                                    <td valign="top" style="padding:8px;">
                                    	<%
												set rs=server.CreateObject("adodb.recordset")
												sql="select * from tol_co where id=13"
												rs.open sql,conn,1,1
												if not rs.eof then
													response.write rs("z_body")
												end if
												rs.close
												set rs=nothing
											%>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" >
                                <tr>
                                	<td style="padding:20px 0 10px 20px;" valign="top">
                                    	<table  cellpadding="0" cellspacing="0" width="680" style="border-collapse:inherit; border:1px solid #999999;" height="350">
                                        <form action="order_add.asp" method="post" name="form1"  onSubmit="return check()">
                                        <input type="hidden" id="id" name="id" value="<%=id%>" style="display:none;" />
                                        <input  name="send_zt" type="hidden" value="no" />
                                        <input  name="send_xs" type="hidden" value="no" />
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">预约时间：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;"><input type="text" name="datehm"  onClick="setDayHM(this);"></td>
                                            </tr>
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择老师：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <select name="person_js">
                                                    <option value="" selected>请选择教师</option>
                                                     <%
                                                        '连接数据库
                                                        
                                                        set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from person1 "
                                                        rs1.open sql,conn,1,1
                                                        while not rs1.eof
                                                    %> 
                                                    <option value="<%=rs1("id")%>"><%=rs1("username")%></option>
                                                      <%
                                                        rs1.movenext
                                                        wend
                                                        rs1.close
                                                        set rs1=nothing
                                                    %>
                                                 </select>
                                                </td>
                                            </tr>
                                        	<tr>
                                            	<td style="color:#666; font-size:16px; background-color:#eaeaea; height:20px; width:100px;border-bottom:1px solid #999999;border-right:1px solid #999999;">选择课题：</td>
                                                <td style="padding:2px 0 2px 8px;border-bottom:1px solid #999999; width:580px;">
                                                <%
													set rs1=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs1.open sql,conn,1,1
														counts=rs1.recordcount
														
														idd=rs1("id")
												%>
                                                <select name="title" id="title" onchange="aa(<%=counts%>)">
                                                    <option value="" selected >请选择课题</option>
                                                   
                                                     <%
                                                        '连接数据库
                                                        
                                                        i=1
                                                        while not rs1.eof
                                                    %> 
                                                    
                                                    <option value="<%=i%>" ><%=rs1("title")%></option>
                                                     <%
                                                        	i=i+1
															rs1.movenext
												 	    wend
                                                    
                                                    %> 

                                                 </select>
                                                 <%
                                                        rs1.close
                                                        set rs1=nothing
												 %>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan="2" valign="top" style="padding:8px;" >
                                                
                                                	 <%
                                                        '连接数据库
                                                        
                                                        set rs2=server.CreateObject("adodb.recordset")
                                                         sql="select * from info_co_xz where lm=3 order by id desc "
                                                        rs2.open sql,conn,1,1
														a=1
                                                        while not rs2.eof
                                                    %> 
                                                  		 <div id="aa_<%=a%>"<%if a<>1 then%> style="display:none;"<%end if%>><%=rs2("z_body")%></div>
                                                     <%
													 		a=a+1
                                                        	rs2.movenext
                                                        wend
                                                        rs2.close
                                                        set rs2=nothing
                                                    %>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td valign="middle" align="center" width="98%" colspan="2" height="40" ><input type="image" src="images/yuyue2.jpg"   border="0"  style="width:202px; height:36px; border:0px;"  /> </td>
                                            </tr>
                                          </form>
                                        </table>
                                    </td>
                                    <td></td>
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
