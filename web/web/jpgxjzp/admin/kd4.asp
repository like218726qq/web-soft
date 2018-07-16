<%
Response.CodePage=65001
Response.Charset="UTF-8"
Function tohtml(str)
    'if str=null or str="" or str =Null then 
	'str=""
	'else 
	if str<>"" then
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	'end if
	end if
	tohtml = str
End Function
%>
	<link rel="stylesheet" href="../kindeditor4/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor4/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor4/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor4/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('.kindeditor4', {
				cssPath : '../kindeditor4/plugins/code/prettify.css',
				uploadJson : '../kindeditor4/asp/upload_json.asp',
				fileManagerJson : '../kindeditor4/asp/file_manager_json.asp',
				allowFileManager : true,
				filterMode : false, 
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
