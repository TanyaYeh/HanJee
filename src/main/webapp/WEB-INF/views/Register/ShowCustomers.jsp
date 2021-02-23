<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<meta charset="UTF-8">
<title>顯示客戶資料和編輯</title>
</head>
<body>
	<div align='center'>
		<h3>客戶資料</h3>
		<hr>
		<table border='1'>
			<tr>
				<th width='60'>編輯</th>
				<th width='160'>客戶姓名</th>
			</tr>
			<c:choose>
				<c:when test="${not empty customerBeanList}">
					<c:forEach var='customer' items="${customerBeanList}">
						<tr>
							<td align='center'><a
								href='modifyCustomer/${MemberBean.member_id}'>${MemberBean.member_id}</a></td>
							<td>${customer.name}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				查無Customer資料
			</c:otherwise>
			</c:choose>
		</table>
		<br> <a href="<c:url value='/index' />">回首頁</a>
	</div>
</body>
</html>