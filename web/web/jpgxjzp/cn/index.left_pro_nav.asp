<!--#include file="html.url.asp"-->
<%
select case url_filename
case "about.asp":
%>
<div class="p_list fl">
		<div class="p_l_tit"></div>
		<div class="p_l_con">
			<ul>
            <%call tol_co_nav(4,"about.asp")%>
			</ul>
		</div>
</div>
<%
case "contact.asp":
%>
<div class="p_list fl">
		<div class="p_l_tit"></div>
		<div class="p_l_con">
			<ul>
            <%call tol_co_nav(5,"contact.asp")%>
			</ul>
		</div>
</div>
<%
case "news.asp":
%>
<div class="p_list fl">
		<div class="p_l_tit"></div>
		<div class="p_l_con">
			<ul>
            <%call info_lm_nav(13,"news.asp")%>
			</ul>
		</div>
</div>
<%
case "news_show.asp":
%>
<div class="p_list fl">
		<div class="p_l_tit"></div>
		<div class="p_l_con">
			<ul>
            <%call info_lm_nav(13,"news.asp")%>
			</ul>
		</div>
</div>
<%
case else:
%>
<div class="p_list fl">
		<div class="p_l_tit"></div>
		<div class="p_l_con">
			<ul>
            <%call pro_lm_nav()%>
			</ul>
		</div>
</div>
<%
end select
%>
