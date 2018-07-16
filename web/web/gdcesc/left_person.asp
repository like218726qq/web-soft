

<div class="weibo">
  <div class="wbl_title"><%if session("person")<>"" or session("person1")<>"" then%>我的会员中心My homepage<%else%>学习中心注册 Registration  <%end if%></div>
  <div style="width:240px; margin-left:10px;margin-top:10px; float:left; display:inline;">
  	<table border="0" cellpadding="0" cellspacing="0" width="240">
    	<tr>
        	<td>
              <%if session("person")<>"" or  session("person1")<>"" then%>
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
                   <TR>
                    <TD height=24 style="padding-left:10px;"> <a style="color:#ff0000; font-weight:bold; font-size:14px;"><%=session("person")%><%=session("person1")%>，欢迎您 Welcome!</a>  <a href="person_loginout.asp" style="color:#0093dd; font-weight:bold; font-size:14px;">[安全退出 Log off]</a></TD>
                  </TR>
                </table>
                <%end if%>
                
                
              <%if session("person")<>"" then%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0 class="right_person">
                
                  <TR>
                    <TD height=24><a href="person_home.asp" <%if per=1 then%> class="cur" <%end if%>>会员中心首页</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="yuyue.asp" <%if per=2 then%> class="cur" <%end if%>>预约课程</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="yuyue_already.asp" <%if per=3 then%> class="cur" <%end if%>>我的已预约课程</a></TD>
                  </TR>
               <!--   <TR>
                    <TD height=24><a href="#" < % if per=4 then%> class="cur" < %end if%>>我的上课记录和学习进度</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="#" < %if per=5 then%> class="cur" < %end if%>>我的自学中心</a></TD>
                  </TR>-->
                  <TR>
                    <TD height=24><a href="order.asp" <%if per=6 then%> class="cur" <%end if%>>购买课程</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="person.asp" <%if per=7 then%> class="cur" <%end if%>>个人账户管理</a></TD>
                  </TR>
                  <%if g=1 then%>
                  <TR>
                    <TD height=24><a href="person_order_default.asp" style="padding-left:20px; font-size:14px;" <%if m=3 then%> class="cur" <%end if%>>└ 订单管理</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="person_pwd_edit.asp" style="padding-left:20px; font-size:14px;" <%if m=1 then%> class="cur" <%end if%>>└ 修改密码</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="person_zl_edit.asp" style="padding-left:20px; font-size:14px;" <%if m=2 then%> class="cur" <%end if%>>└ 资料修改</a></TD>
                  </TR>
                  <%end if%>
                  <TR>
                    <TD height=24><a href="kefu.asp" <%if per=8 then%> class="cur" <%end if%>>客服中心</a></TD>
                  </TR>
              </TABLE>
              <%elseif session("person1")<>"" then%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0 class="right_person">
                  <TR>
                    <TD height=24><a href="person_home_js.asp" <%if per=1 then%> class="cur" <%end if%>>会员中心首页Home page</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="write_js.asp" <%if per=2 then%> class="cur" <%end if%>>写作修改列表Writing Revision</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="yuyue_js.asp" <%if per=4 then%> class="cur" <%end if%>>预约课程Oral Class schedule</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="person_js.asp" <%if per=3 then%> class="cur" <%end if%>>个人账户管理My Account</a></TD>
                  </TR>
                  <%if g=1 then%>
                  <TR>
                    <TD height=24><a href="person_pwd_edit_js.asp" style="padding-left:20px; font-size:14px;" <%if m=1 then%> class="cur" <%end if%>>└ 修改密码</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="person_zl_edit_js.asp" style="padding-left:20px; font-size:14px;" <%if m=2 then%> class="cur" <%end if%>>└ 资料修改</a></TD>
                  </TR>
                  <%end if%>
              </TABLE>
              <%else%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0>
                  <FORM id="frmlogin" name="frmlogin" onSubmit="return checkForm('frmlogin')"  action="teach.asp?act=post" method="post" >
                  <TR>
                    <TD class=font_bot  height=35>用户名 Username： </TD>
                    <TD width=180 height=35><INPUT id="username" name="username" style="WIDTH: 140px; background-color:#FFFFFF;" size="25" maxlength="20" checkStr="用户名" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD class=font_bot height=35>密    码Password：</TD>
                    <TD height=35><INPUT id="password" name="password"  type="password"  style="WIDTH: 140px; background-color:#FFFFFF;s" size="25" maxlength="20" checkStr="密码" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD  class=font_bo height=15 colspan="2" style="padding-left:20px;"><input type="radio" name="sex" value="学生" checked="checked" />学 生Student<input  name="sex" value="教师" type="radio" class="sex" />教 师Teacher</TD>
                  </TR>
                  <TR>
                    <TD height=35>&nbsp;</TD>
                    <TD  height=35>
                    <INPUT type=image src="images/login.jpg" value=提交 name=Submit>&nbsp;&nbsp;<IMG src="images/reg.jpg" border=0 style="cursor:pointer;" onclick="location='person_reg.asp'"></TD>
                 </TR></FORM>
              </TABLE>
              <%end if%>
              
          </TD>
          </TR>
          </TABLE>
            </td>
        </tr>
    </table>
  </div>
  <div class="clear"></div>
  <div class="news_ul mar42">
  <script type="text/javascript" src="scripts/MSClass.js"></script>
  
    
  </div>	

  <div class="don"></div>
</div>