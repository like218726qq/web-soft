<%@ CODEPAGE=65001 %>

<html>
<head>
<meta charset="utf-8" />
</head>
<body>
<!--#include file="asp/demo.asp"-->
	<form name="example" method="post" action="test.asp">
		<textarea name="content1" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
</body>
</html>
