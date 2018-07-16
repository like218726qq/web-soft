

<div class="weibo">
  <div class="wbl_title">写作学习及在线修改</div>
  <div style="width:240px; margin-left:10px;margin-top:10px; float:left; display:inline;">
  	<table border="0" cellpadding="0" cellspacing="0" width="240">
    	<tr>
        	<td>
             
                
                
              <%if session("person")<>"" then%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0 class="right_person">
                
                 
                  <TR>
                    <TD height=24><a href="read.asp" <%if x=1 then%> class="cur" <%end if%>>雅思写作范文</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="write_xz.asp" <%if x=2 then%> class="cur" <%end if%>>在线写作</a></TD>
                  </TR>
                  <TR>
                    <TD height=24><a href="write.asp" <%if x=3 then%> class="cur" <%end if%>>写作记录</a></TD>
                  </TR>

              </TABLE>
              <%elseif session("person1")<>"" then%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0>
                  <FORM id="frmlogin" name="frmlogin" onSubmit="return checkForm('frmlogin')"  action="teach.asp?act=post" method="post" >
                  <TR>
                    <TD class=font_bot  height=35>用户名： </TD>
                    <TD width=180 height=35><INPUT id="username" name="username" style="WIDTH: 140px; background-color:#FFFFFF;" size="25" maxlength="20" checkStr="用户名" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD class=font_bot height=35>密    码：</TD>
                    <TD height=35><INPUT id="password" name="password"  type="password"  style="WIDTH: 140px; background-color:#FFFFFF;s" size="25" maxlength="20" checkStr="密码" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD class=font_bot height=15></TD>
                    <TD height=15><input type="radio" name="sex" value="学生" checked="checked" />学 生<input  name="sex" value="教师" type="radio" class="sex" />教 师</TD>
                  </TR>
                  <TR>
                    <TD height=35>&nbsp;</TD>
                    <TD  height=35>
                    <INPUT type=image src="images/login.jpg" value=提交 name=Submit>&nbsp;&nbsp;<IMG src="images/reg.jpg" border=0 style="cursor:pointer;" onclick="location='person_reg.asp'"></TD>
                 </TR></FORM>
              </TABLE>
              <%else%>
            	<TABLE cellSpacing=3 cellPadding=0 width="100%" align=center border=0>
                  <FORM id="frmlogin" name="frmlogin" onSubmit="return checkForm('frmlogin')"  action="teach.asp?act=post" method="post" >
                  <TR>
                    <TD class=font_bot  height=35>用户名： </TD>
                    <TD width=180 height=35><INPUT id="username" name="username" style="WIDTH: 140px; background-color:#FFFFFF;" size="25" maxlength="20" checkStr="用户名" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD class=font_bot height=35>密    码：</TD>
                    <TD height=35><INPUT id="password" name="password"  type="password"  style="WIDTH: 140px; background-color:#FFFFFF;s" size="25" maxlength="20" checkStr="密码" checkType="string,4,20" canEmpty="N"></TD>
                  </TR>
                  <TR>
                    <TD class=font_bot height=15></TD>
                    <TD height=15><input type="radio" name="sex" value="学生" checked="checked" />学 生<input  name="sex" value="教师" type="radio" class="sex" />教 师</TD>
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