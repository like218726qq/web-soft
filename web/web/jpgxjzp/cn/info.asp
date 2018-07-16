<!--#include file="products.asp"-->
<%
fid=request.QueryString("fid")
if fid="" then 
response.Redirect("products.asp")
elseif fid="49" then
response.Redirect("products.asp")
elseif fid="48" then
response.Redirect("video.asp")
elseif fid="47" then
response.Write("<script>window.open('http://www.tx315.com/wlynfj.aspx')</script>")
elseif fid="46" then
response.Redirect("service.asp")
elseif fid="45" then
response.Redirect("culture.asp")
else 
response.Redirect("products.asp")
end if
%>
