<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script>
function createXMLHttpRequest() {
	var ajaxHttp=null;
	if(window.XMLHttpRequest) {
		ajaxHttp= new XMLHttpRequest();
	}
	else if(window.ActiveXObject) {
		ajaxHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	return ajaxHttp
}

function getdata(vname,url){
	obj=document.getElementById(vname)
	obj.innerHTML="<div style=\"width:150px;height:50px;margin:50px auto;font-size:12px;color:#666;\"><img src=\"loading.gif\">&nbsp;数据加载中...</div>";
	var ajaxHttp = createXMLHttpRequest();
	if (ajaxHttp!=null) {
		ajaxHttp.onreadystatechange =function(){
			if (ajaxHttp.readyState == 4){
				if (ajaxHttp.status == 200){
					str=ajaxHttp.responseText;
					obj.innerHTML=str;
				}
				 ajaxHttp = null;
			}
		}
		ajaxHttp.open("GET", url+"&r="+Math.random() ,true);
		ajaxHttp.setRequestHeader("Content-Type", "text/html;charset=utf-8");
		ajaxHttp.send(null);
	}
} 
</script>
</head>

<body>
<input type="button" onclick="getdata('dis_div','shows.asp?id=1')" value="点击试试"/>
<input type="button" onclick="getdata('dis_div','shows.asp?id=2')" value="点击试试"/>
<input type="button" onclick="getdata('dis_div','shows.asp?id=3')" value="点击试试"/>
<div id="dis_div" style="width:800px; height:800px; border:1px solid #ccc;">

</div>
</body>
</html>
