            	<%
					ScriptName = Request.ServerVariables("SCRIPT_NAME") 
					ScriptNames = split(ScriptName,"/")
					linkUrl = ScriptNames(ubound(ScriptNames))
				%>
				<%if lm="1" then%>
                <table border="0" cellpadding="0" cellspacing="1" width="200px" bgcolor="#000000">
                	<tr style="background-color:#FFFFFF">
                    	<td align="center" height="35px">
                        	<font style="font-size:16px; font-family:'微软雅黑'; font-weight:bold">Reduce the selection</font>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Product Type：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="80%" align="center" style="font-family:'Arial'">
                            	<tr <%if ejlx<>"1" then%>onmouseover="showimg('img1','111.jpg')" onmouseout="showimg('img1','erji_1.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejlx="1" then%>images/111.jpg<%else%>images/erji_1.jpg<%end if%>" id="img1" /></td>
                               	  <td width="65%"><a href="<%=linkUrl%>?ejlx=1&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejlx="1" then%> style="color:#FF0000"<%end if%>>earphone</a></td>
                       	  	  </tr>
                              	<tr <%if ejlx<>"2" then%>onmouseover="showimg('img2','er_2.jpg')" onmouseout="showimg('img2','er_22.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejlx="2" then%>images/er_2.jpg<%else%>images/er_22.jpg<%end if%>" id="img2"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=2&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejlx="2" then%> style="color:#FF0000"<%end if%>>Headset</a></td>
                           	  </tr>
                              	<tr <%if ejlx<>"3" then%>onmouseover="showimg('img3','er_3.jpg')" onmouseout="showimg('img3','er_33.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejlx="3" then%>images/er_3.jpg<%else%>images/er_33.jpg<%end if%>" id="img3"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=3&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejlx="3" then%> style="color:#FF0000"<%end if%>>Earplug</a></td>
                           	  </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Ways to wear：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="80%" align="center" style="font-family:'Arial'">
                            	<tr <%if ejfs<>"1" then%>onmouseover="showimg('img4','er_4.jpg')" onmouseout="showimg('img4','er_44.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejfs="1" then%>images/er_4.jpg<%else%>images/er_44.jpg<%end if%>" id="img4"  /></td>
                               	  <td width="65%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=1&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejfs="1" then%> style="color:#FF0000"<%end if%>>Headset</a></td>
                       	  	  </tr>
                              	<tr <%if ejfs<>"2" then%>onmouseover="showimg('img5','er_5.jpg')" onmouseout="showimg('img5','er_55.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejfs="2" then%>images/er_5.jpg<%else%>images/er_55.jpg<%end if%>" id="img5"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=2&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejfs="2" then%> style="color:#FF0000"<%end if%>>Earbud</a></td>
                           	  </tr>
                              	<tr <%if ejfs<>"3" then%>onmouseover="showimg('img6','er_6.jpg')" onmouseout="showimg('img6','er_66.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejfs="3" then%>images/er_6.jpg<%else%>images/er_66.jpg<%end if%>" id="img6"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=3&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejfs="3" then%> style="color:#FF0000"<%end if%>>Apple In-Ear</a></td>
                           	  </tr>
                              	<tr <%if ejfs<>"4" then%>onmouseover="showimg('img7','er_7.jpg')" onmouseout="showimg('img7','er_77.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejfs="4" then%>images/er_7.jpg<%else%>images/er_77.jpg<%end if%>" id="img7"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=4&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejfs="4" then%> style="color:#FF0000"<%end if%>>Earhook</a></td>
                           	  </tr>
                              	<tr <%if ejfs<>"5" then%>onmouseover="showimg('img8','er_8.jpg')" onmouseout="showimg('img8','er_88.jpg')"<%end if%>>
                                	<td width="35%" align="center" height="45px"><img src="<%if ejfs="5" then%>images/er_8.jpg<%else%>images/er_88.jpg<%end if%>" id="img8"  /></td>
                                  <td width="65%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=5&ejfg=<%=ejfg%>&ejxk=<%=ejxk%>" <%if ejfs="5" then%> style="color:#FF0000"<%end if%>>Neckband</a></td>
                           	  </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Style positioning：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="92%" align="center" style="font-family:'Arial'">
<tr>
                                	<td width="15%" align="center" height="45px"><input type="checkbox" name="wl" value="1" <%if ejfg="1" then%> checked="checked"<%end if%> /></td>
            <td width="85%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=1&ejxk=<%=ejxk%>" <%if ejfg="1" then%> style="color:#FF0000"<%end if%>>Fashion headset</a></td>
                              </tr>
                              <tr>
                                	<td width="15%" align="center" height="45px"><input type="checkbox" name="wl" value="2" <%if ejfg="2" then%> checked="checked"<%end if%> /></td>
                                <td width="85%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=2&ejxk=<%=ejxk%>" <%if ejfg="2" then%> style="color:#FF0000"<%end if%>>Sports headphones</a></td>
                              </tr>
                              <tr>
                                	<td width="15%" align="center" height="45px"><input type="checkbox" name="wl" value="3" <%if ejfg="3" then%> checked="checked"<%end if%> /></td>
                                <td width="85%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=3&ejxk=<%=ejxk%>" <%if ejfg="3" then%> style="color:#FF0000"<%end if%>>Gaming Headset</a></td>
                              </tr>
                              <tr>
                                	<td width="15%" align="center" height="45px"><input type="checkbox" name="wl" value="4" <%if ejfg="4" then%> checked="checked"<%end if%> /></td>
                                <td width="85%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=4&ejxk=<%=ejxk%>" <%if ejfg="4" then%> style="color:#FF0000"<%end if%>>Gaming Headset</a></td>
                              </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">By-wire Category：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="96%" align="center" style="font-family:'Arial'">
<tr>
                                	<td width="16%" align="center" height="45px"><input type="checkbox" name="xk" value="1" <%if ejxk="1" then%> checked="checked"<%end if%> /></td>
            <td width="84%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=1" <%if ejxk="1" then%> style="color:#FF0000"<%end if%>>Apple-wire</a></td>
                              </tr>
                              <tr>
                                	<td width="16%" align="center" height="45px"><input type="checkbox" name="xk" value="2" <%if ejxk="2" then%> checked="checked"<%end if%> /></td>
                                <td width="84%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=2" <%if ejxk="2" then%> style="color:#FF0000"<%end if%>>Line volume control</a></td>
                              </tr>
                              <tr>
                                	<td width="16%" align="center" height="45px"><input type="checkbox" name="xk" value="3" <%if ejxk="3" then%> checked="checked"<%end if%> /></td>
                                <td width="84%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=3" <%if ejxk="3" then%> style="color:#FF0000"<%end if%>>Call by-wire</a></td>
                              </tr>
                              <tr>
                                	<td width="16%" align="center" height="45px"><input type="checkbox" name="xk" value="4" <%if ejxk="4" then%> checked="checked"<%end if%> /></td>
                                <td width="84%"><a href="<%=linkUrl%>?ejlx=<%=ejlx%>&ejfs=<%=ejfs%>&ejfg=<%=ejfg%>&ejxk=4" <%if ejxk="4" then%> style="color:#FF0000"<%end if%>>Wireless controller</a></td>
                              </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                </table>
                <%elseif lm="2" then%>
				<table border="0" cellpadding="0" cellspacing="1" width="200px" bgcolor="#000000">
                	<tr style="background-color:#FFFFFF">
                    	<td align="center" height="35px">
                        	<font style="font-size:16px; font-family:'微软雅黑'; font-weight:bold">Reduce the selection</font>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Product Type：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="93%" align="center" style="font-family:'Arial'">
<tr <%if sjlx<>"1" then%>onmouseover="showimg('sj1','sji_11.jpg')" onmouseout="showimg('sj1','sji_1.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjlx="1" then%>images/sji_11.jpg<%else%>images/sji_1.jpg<%end if%>" id="sj1" /></td>
            <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=1&sjpp=<%=sjpp%>" <%if sjlx="1" then%> style="color:#FF0000"<%end if%>>Protective shell</a></td>
                              </tr>
                              <tr <%if sjlx<>"2" then%>onmouseover="showimg('sj2','sji_22.jpg')" onmouseout="showimg('sj2','sji_2.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjlx="2" then%>images/sji_22.jpg<%else%>images/sji_2.jpg<%end if%>" id="sj2" /></td>
                                <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=2&sjpp=<%=sjpp%>" <%if sjlx="2" then%> style="color:#FF0000"<%end if%>>Protective film</a></td>
                              </tr>
                              <tr <%if sjlx<>"3" then%>onmouseover="showimg('sj3','sji_33.jpg')" onmouseout="showimg('sj3','sji_3.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjlx="3" then%>images/sji_33.jpg<%else%>images/sji_3.jpg<%end if%>" id="sj3" /></td>
                                <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=3&sjpp=<%=sjpp%>" <%if sjlx="3" then%> style="color:#FF0000"<%end if%>>Data lines</a></td>
                              </tr>
                              <tr <%if sjlx<>"4" then%>onmouseover="showimg('sj4','sji_44.jpg')" onmouseout="showimg('sj4','sji_4.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjlx="4" then%>images/sji_44.jpg<%else%>images/sji_4.jpg<%end if%>" id="sj4" /></td>
                                <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=4&sjpp=<%=sjpp%>" <%if sjlx="4" then%> style="color:#FF0000"<%end if%>>Other</a></td>
                              </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Mobile phone brands：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="93%" align="center" style="font-family:'Arial'">
<tr <%if sjpp<>"1" then%>onmouseover="showimg('pp1','sji_55.jpg')" onmouseout="showimg('pp1','sji_5.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjpp="1" then%>images/sji_55.jpg<%else%>images/sji_5.jpg<%end if%>" id="pp1" /></td>
            <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=<%=sjlx%>&sjpp=1" <%if sjpp="1" then%> style="color:#FF0000"<%end if%>>Apple Accessories</a></td>
                              </tr>
                              <tr <%if sjpp<>"2" then%>onmouseover="showimg('pp2','sji_66.jpg')" onmouseout="showimg('pp2','sji_6.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjpp="2" then%>images/sji_66.jpg<%else%>images/sji_6.jpg<%end if%>" id="pp2" /></td>
                                <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=<%=sjlx%>&sjpp=2" <%if sjpp="2" then%> style="color:#FF0000"<%end if%>>Samsung accessories</a></td>
                              </tr>
                              <tr <%if sjpp<>"3" then%>onmouseover="showimg('pp3','sji_77.jpg')" onmouseout="showimg('pp3','sji_7.jpg')"<%end if%>>
                                	<td width="27%" align="center" height="45px"><img src="<%if sjpp="3" then%>images/sji_77.jpg<%else%>images/sji_7.jpg<%end if%>" id="pp3" /></td>
                                <td width="73%"><a href="<%=linkUrl%>?lm=2&sjlx=<%=sjlx%>&sjpp=3" <%if sjpp="3" then%> style="color:#FF0000"<%end if%>>Other</a></td>
                              </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                </table>
                <%elseif lm="3" then%>
				<table border="0" cellpadding="0" cellspacing="1" width="200px" bgcolor="#000000">
                	<tr style="background-color:#FFFFFF">
                    	<td align="center" height="35px">
                        	<font style="font-size:16px; font-family:'微软雅黑'; font-weight:bold">Reduce the selection</font>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF">
                    	<td>
                        <div style="margin:10px;font-size:14px; font-family:'微软雅黑'; font-weight:bold">
                        	<font style="font-size:14px;">Product Type：</font><br />
                            <table border="0" cellpadding="0" cellspacing="0" width="90%" align="center" style="font-family:'Arial'">
  <tr <%if smlx<>"1" then%>onmouseover="showimg('sm1','sm_11.jpg')" onmouseout="showimg('sm1','sm_1.jpg')"<%end if%>>
                                	<td width="34%" align="center" height="45px"><img src="<%if smlx="1" then%>images/sm_11.jpg<%else%>images/sm_1.jpg<%end if%>" id="sm1" /></td>
                           	<td width="66%"><a href="<%=linkUrl%>?lm=3&smlx=1" <%if smlx="1" then%> style="color:#FF0000"<%end if%>>Mobile Power</a></td>
                           	  </tr>
                              	<tr <%if smlx<>"2" then%>onmouseover="showimg('sm2','sm_22.jpg')" onmouseout="showimg('sm2','sm_2.jpg')"<%end if%>>
                                	<td width="34%" align="center" height="45px"><img src="<%if smlx="2" then%>images/sm_22.jpg<%else%>images/sm_2.jpg<%end if%>" id="sm2" /></td>
                               	  <td width="66%"><a href="<%=linkUrl%>?lm=3&smlx=2" <%if smlx="2" then%> style="color:#FF0000"<%end if%>>Digital film</a></td>
                           	  </tr>
                              	<tr <%if smlx<>"3" then%>onmouseover="showimg('sm3','sm_33.jpg')" onmouseout="showimg('sm3','sm_3.jpg')"<%end if%>>
                                	<td width="34%" align="center" height="45px"><img src="<%if smlx="3" then%>images/sm_33.jpg<%else%>images/sm_3.jpg<%end if%>" id="sm3" /></td>
                               	  <td width="66%"><a href="<%=linkUrl%>?lm=3&smlx=3" <%if smlx="3" then%> style="color:#FF0000"<%end if%>>Reader</a></td>
                           	  </tr>
                              	<tr <%if smlx<>"4" then%>onmouseover="showimg('sm4','sm_44.jpg')" onmouseout="showimg('sm4','sm_4.jpg')"<%end if%>>
                                	<td width="34%" align="center" height="45px"><img src="<%if smlx="4" then%>images/sm_44.jpg<%else%>images/sm_4.jpg<%end if%>" id="sm4"  /></td>
                               	  <td width="66%"><a href="<%=linkUrl%>?lm=3&smlx=4" <%if smlx="4" then%> style="color:#FF0000"<%end if%>>Charger</a></td>
                           	  </tr>
                              	<tr <%if smlx<>"5" then%>onmouseover="showimg('sm5','sm_55.jpg')" onmouseout="showimg('sm5','sm_5.jpg')"<%end if%>>
                                	<td width="34%" align="center" height="45px"><img src="<%if smlx="5" then%>images/sm_55.jpg<%else%>images/sm_5.jpg<%end if%>" id="sm5"  /></td>
                               	  <td width="66%"><a href="<%=linkUrl%>?lm=3&smlx=5" <%if smlx="5" then%> style="color:#FF0000"<%end if%>>Other</a></td>
                           	  </tr>
                            </table>
                        </div>
                        </td>
                    </tr>
                </table>
                <%end if%>
				<script language="javascript" type="text/javascript">
					function showimg(id,src){
						document.getElementById(id).src='images/'+src;
					}
				</script>