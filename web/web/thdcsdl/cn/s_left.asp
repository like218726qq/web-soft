<table width="207" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td  bgcolor="#ffffff"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="4" valign="top"  style="background:url(images/index_13.gif) no-repeat"></td>
                    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <!--<tr>
                        <td height="7" ></td>
                      </tr>-->
                      <tr>
                        <td background="images/index_15.gif" height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="18" height="16" style="background:url(images/index_25.gif) no-repeat"></td>
                            <td width="10">&nbsp;</td>
                            <td class="Products"><b>售后支持</b></td>
                          </tr>
                        </table></td>
                      </tr>
					  
					  <%
					set rs=server.CreateObject("adodb.recordset")
					sql="select * from info_lm where fid=15 order by px desc,id_lm desc"
					rs.open sql,conn,1,1
					if not rs.eof then
						do until rs.eof 
				%>
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="10"></td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="21">&nbsp;</td>
                                <td width="5" height="5"><img src="images/index_30.gif" width="5" height="5" /></td>
                                <td width="10">&nbsp;</td>
                                <td class="boby"><a  href="shouhao.asp?lm=<%=rs("id_lm")%>"><%=rs("title_lm")%></a></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="8"></td>
                          </tr>
                          <tr>
                            <td><img src="images/lines.jpg" width="199" height="1" /></td>
                          </tr>
						  
                        </table></td>
                      </tr>
				
					   <%
				  	  rs.movenext
					  loop
					 end if
					 rs.close
					 set rs=Nothing
				  %>
					  
					 <tr><td height="10"></td></tr> 
                      
                      
                    </table></td>
                    <td width="4"  valign="top"  style="background:url(images/index_17.gif) no-repeat"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr>
                <td><a href="contact.asp"><img src="images/index_61.gif" width="207" height="63" border="0" /></a></td>
              </tr>
              <tr>
			   <%		
				
				  set rs=server.CreateObject("adodb.recordset")
				  rs.open "select * from tol_co where ID=5",conn,1,1
				  if not rs.eof then				
				  z_body1=rs("z_body")
				  end if
				  rs.close
				  set rs=nothing
				  %>	
                <td style="font-size:12px; line-height:24px; padding-top:10px; padding-left:10px;"><!--<img src="images/index_65.gif" width="207" height="140" />-->
				<%=z_body1%></td>
              </tr>
              <tr>
                <td height="20"></td>
              </tr>
            </table>
