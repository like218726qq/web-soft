<!--#include file="conn.asp" -->
<!--#include file="cart_class.asp"-->
<!--#include file="md5.asp" -->
<%
w_url=request("w_url")
id=trim(request("id"))
act=trim(request("act"))
ac=trim(request("ac"))

if w_url="" then
	w_url=request.ServerVariables("HTTP_REFERER")
end if
set cart=new UserCart
cart.CreateCart


'增加单个产品
if act="add" then
	pro_num=1
	if id="" or not isnumeric(id) then
		call msg("参数错误","")
	end if
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from order_co where id="&id&""
	rs.open sql,conn,1,1
	if rs.eof then
		call msg("该信息不存在","")
	else
		id=md5(id)
	    cart.additem id,rs("title"),rs("pro_guige"),rs("pro_money"),"",pro_num,rs("img_sl"),rs("pro_no"),rs("id")
	end if
	rs.close
	set rs=nothing

'更新数量
elseif act="up" then

	if id="" then
		call msg("参数错误","")
	else
		if request("pro_num_"&id)="" or not checknum(request("pro_num_"&id)) then
			call msg("参数错误","")
		else
			cart.ModifItem id,request("pro_num_"&id),1
		end if
	end if

	
'删除产品
elseif act="del" then
	if id="" then
		call msg("参数错误","")
	end if
	cart.DelItem(id)

'清空购物车
elseif act="clear" then
	cart.RemoveAll
end if

response.Redirect("car.asp?w_url="&server.URLEncode(w_url)&"")
response.End()
%>
