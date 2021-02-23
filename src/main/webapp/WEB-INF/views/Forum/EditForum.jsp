<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function confirmDelete(id) {
	 console.log("顯示主題刪除跳出視窗")
	if (confirm("確定刪除此筆帖子(${beenf.forum_name})?")){
		document.forms[0].action = "<c:url value='/tw/hanjee/ForumDelete'/>";
		document.forms[0].method = "POST";
		document.forms[0].submit();
		
	}else{
		
	}
		}
 function confirmUpdate(id){
	  var result = confirm("確定送出此筆記錄(帳號:" + id.trim() + ")?");
	  if (result) {
//		  document.forms[0].putOrDelete.name = "_method";
//		  document.forms[0].putOrDelete.value = "PUT";
	      return true;
	  }
	  return false;
 }
</script>


</head>
<body>
	<div>
		<form:form method='POST' modelAttribute="beenf">
			<input type="hidden" name="noname" id='putOrDelete' value="">
			
				<form:input type="hidden" path="forum_no" />
				<br>&nbsp;
			

		
				<table>
					<tr>
						<td align='right'>主題：<br>&nbsp;
						</td>
						<td><form:input path="forum_name" /><br>&nbsp;</td>
					</tr>
					<tr>
						<td align='right'>簡介：<br>&nbsp;
						</td>
						<td><form:input path="forum_des" /><br>&nbsp;</td>
					</tr>
					


					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='修改' name='updateBtn'
							onclick="confirmUpdate('${beenf.forum_no}');">&nbsp; <input
							type='submit' value='刪除' name='deleteBtn'
							onclick="confirmDelete(${beenf.forum_no})"></td>
					</tr>

				</table>
			
		</form:form>
		<a href="<c:url value='/tw/hanjee/forums'/>">回首頁</a>
		
		
</body>
</html>