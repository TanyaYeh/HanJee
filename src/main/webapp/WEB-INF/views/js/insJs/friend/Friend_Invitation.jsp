<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend Invitation</title>
</head>
<body>

<div align='center'>
		<h3>好友邀請</h3>
		<hr>
		<table border='1'>
			<tr>
				<th width='120'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='56'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='90'>星 座</th>
				<th width='105'>按 鍵</th>
			</tr>

		<c:choose>
				<c:when test="${empty piBeanList}">
					<tr>
						<td colspan='6' align='center'><font color='red'>暫無好友邀請:可藉由購買行程，來遇見你生命中的另一個(他/她)喔♥♥♥</font></td>
					</tr>
				</c:when>
				<c:otherwise>

			<c:forEach var="piBeanList" items="${piBeanList}" >
				<tr>
				<td align="center">
				<img style="width: 80px; height: 80px"
					src='<c:url value="/friend/getPicture/${piBeanList.getBean().member_id}" />'></td>
	 				<td align="center">${piBeanList.getBean().realname}</td>
					<td align="center">${piBeanList.getBean().gender}</td>
			        <td align="center">${piBeanList.per_rel}</td>
					<td align="center">${piBeanList.per_con}</td>
					<td align="center"><a href='<c:url value="/addFriend/${piBeanList.getBean().member_id}/1" />'><button id="add">同意</button></a>
					<a href='<c:url value="/addFriend/${piBeanList.getBean().member_id}/0" />'><button id="add">拒絕</button></a>
					</td>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<br>
		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
</div>
</body>
</html>