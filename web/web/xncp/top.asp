<script type="text/javascript" language="javascript">

	 function AddFavorite(sURL, sTitle){
		sURL = encodeURI(sURL); 
		try{
			window.external.addFavorite(sURL, sTitle);   
		}catch(e){
			try{
				window.sidebar.addPanel(sTitle, sURL, ""); 
			}catch (e) {
						alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
			}
		}
	}
	function SetHome(url){
		if (document.all) {
			document.body.style.behavior='url(#default#homepage)';
			document.body.setHomePage(url); 
		}else{ 
				alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
		} 
	}
	 
	</script>
<div class="header">
    	<div class="head">
        	<div class="sc"><form method="get" action="pro.asp" id="sform" name="sform" f>
                	<input type="text"  id="keyword" name="keyword" style="width:100px; float:left;"/>
                    <input type="submit"  id="button" name="button" value="搜索"  style=" float:left; cursor:pointer;"/>
                    </form>
            	<a href="javascript:;" onClick="this.style.behavior='url(#default#homepage)'; this.setHomePage(location.href);"><img src="images/index_11.jpg" width="16" height="16" />设为首页</a><a onclick="AddFavorite(window.location,document.title)"href="javascript:void(0)"><img src="images/index_13.jpg" width="17" height="16" />加入收藏</a>
            </div>
            <div class="clear"></div>
            <div class="headn">
            	<div class="logo"><img src="images/index_16.jpg" width="254" height="81" /></div>
                <div class="headR">
                	<div class="fw"><img src="images/index_17.jpg" width="315" height="36" /></div>
                    <div class="clear"></div>
                    <div class="nav">
                    	<ul>
                        	<li><a href="index.asp" <% if k=1 then response.Write("class='ato'")%>>首  页</a></li>
                            <li><a href="about.asp?id=1" <% if k=2 then response.Write("class='ato'")%>>关于我们</a></li>
                            <li><a href="pro.asp" <% if k=3 then response.Write("class='ato'")%>>产品展示</a></li>
                            <li><a href="news.asp" <% if k=4 then response.Write("class='ato'")%>>新闻资讯</a></li>
                            <li><a href="project.asp" <% if k=5 then response.Write("class='ato'")%>>服务项目</a></li>
                            <li><a href="case.asp" <% if k=6 then response.Write("class='ato'")%>>合作案例</a></li>  
                            <li class="nobg"><a href="contact.asp" <% if k=7 then response.Write("class='ato'")%>>联系我们</a></li>                                                        
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </div>