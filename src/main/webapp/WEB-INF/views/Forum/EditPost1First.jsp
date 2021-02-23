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
	 console.log("123")
	if (confirm("確定刪除此筆帖子(${bean.post_tit})?")){
		document.forms[0].action = "<c:url value='/tw/hanjee/PostDelete/${bean.post_no}'/>";
		document.forms[0].method = "POST";
		document.forms[0].submit();
		
	}else{
		
	}
		}
function confirmUpdate(id){
	  var result = confirm("確定更新並送出此筆記錄(帳號:" + id.trim() + ")?");
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
		<form:form method='POST' modelAttribute="bean">
			<input type="hidden" name="noname" id='putOrDelete' value="">
			<c:if test='${bean.post_no != null}'>
				<form:hidden path="post_no" />
				<br>&nbsp;
			</c:if>

			<fieldset class="fieldset-auto-width">
				<legend>文章標題/內容修改</legend>
				<table>
					<tr>
						<td align='right'>標題：<br>&nbsp;
						</td>
						<td><form:input path="post_tit" /><br>&nbsp;</td>
					</tr>

					<tr>
						<td align='left'>文章內容：<br>&nbsp;
						</td>
						<td width="400"><form:textarea path="post_content" rows="4"
								cols="20"></form:textarea> <br>&nbsp;</td>
					</tr>

<!-- 					<tr> -->
<!-- 					<td align='left'>修改照片：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input type="file" path="productImage" /></td> --%>

<!-- 					</tr> -->




					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='修改' name='updateBtn'
							onclick="confirmUpdate('${bean.post_no}');">&nbsp; <input
							type='submit' value='刪除' name='deleteBtn'
							onclick="confirmDelete(${bean.post_no})"></td>
					</tr>

				</table>
			</fieldset>
		</form:form>
		<a href="<c:url value='/tw/hanjee/posts'/>">回首頁</a>
</body>
</html>