<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show ALL Member</title>
</head>
<body>

	<div align='center'>
		<h3>會員資料</h3>
		<hr>
		<table border='1'>
			<tr>
				<th width='120'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='56'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='90'>星 座</th>
			</tr>

			<c:forEach var="person_Info" items="${Person_InfoList}" >
				<tr>
				<td align="center">
				<img style="width: 80px; height: 80px"
					src='<c:url value="/friend/getPicture/${person_Info.getBean().member_id}" />'></td>
	 				<td align="center">${person_Info.getBean().realname}</td>
					<td align="center">${person_Info.getBean().gender}</td>
			        <td align="center">${person_Info.per_rel}</td>
					<td align="center">${person_Info.per_con}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/friend/piForm'/> ">回交友首頁</a>

	</div>
</body>
</html>