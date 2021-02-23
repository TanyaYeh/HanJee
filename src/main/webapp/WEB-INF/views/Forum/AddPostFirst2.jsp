<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>新增文章</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
<link rel='stylesheet' href="<c:url value='/css/styles.css'/>"
	type="text/css" />
</head>
<body>
	<section>
		<div align="center">
			<h1 style="text-align: center">新增文章</h1>
		</div>
	</section>

	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">

		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="poBean" action="add"
			class='form-horizontal' enctype="multipart/form-data">
			<form:hidden path="post_no" />
			<br>&nbsp;
			<table border="1">
				<tr>
					<td colspan="2" align="center">新增文章內容</td>

				</tr>
				<tr>
					<td align='left'>標題：<br>&nbsp;
					</td>
					<td width="400"><form:input path="post_tit" /><br>&nbsp;
					</td>
				</tr>

				<tr>
					<td align='left'>留言者：<br>&nbsp;
					</td>
					<td width="400"><c:out value="${poBean.mb.nickname}"></c:out><br>&nbsp;
					</td>
				</tr>

				<tr>
					<td align='left'>留言內容：<br>&nbsp;
					</td>
					<td width="400"><form:textarea path="post_content" rows="4"
							cols="20"></form:textarea> <br>&nbsp;</td>
				</tr>
				<tr>

					<td align='left'>修改照片：<br>&nbsp;
					</td>
					<td><form:input type="file" path="productImage" /></td>



				</tr>




				<tr>
					<td colspan='2' align='center'><input type='submit' value='提交'></td>
				</tr>




			</table>
		</form:form>
		<br> <a href="<c:url value='/tw/hanjee/posts'/>">回首頁</a>


	</section>
</body>
</html>
