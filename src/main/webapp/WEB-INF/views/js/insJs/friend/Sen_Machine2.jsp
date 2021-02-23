<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="Top.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>勾心，勾走你的心</title>

<style type="text/css">
body {
	background-color: pink;
}
</style>

</head>
<body>

	<div align='center'>
		<h2>勾心語錄</h2>
		<hr>
		<table border="1">
			<tr>
				<td width='120' align='center'>勾心編號</td>
				<td width='600' align='center'>勾心內容</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${empty Sentence}">
						<tr height='36'>
							<td colspan='2' align='center'><font color='red'>查無語錄內容</font></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var='sen' items='${Sentence}'>
							<tr>
								<td align='center'>&nbsp;${sen.sentence_id}</td>
								<td align='center'>${sen.sentence}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>

		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
	</div>

</body>
</html>