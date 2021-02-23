<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<title>會員管理頁面</title>
</head>
<body>


	<table class="table">
		<tr class="table-primary">
			<th>會員編號</th>

			<th>會員帳號</th>
			<th>會員真實姓名</th>
			<th>會員地址</th>
			<th>禁言</th>
			<th>黑名單</th>
		</tr>

		<c:forEach var="allMember" items="${allMemberMap}">
	
			<tr class="table-info">
				<td>${allMember.value.member_id}</td>
				<td>${allMember.value.account}</td>
				<td>${allMember.value.realname}</td>
				<td>${allMember.value.address}</td>
				<td><input type="button" id="notype${allMember.value.member_id}" value="禁言"></td>
				<td><input type="button" id="kill${allMember.value.member_id}" value="黑你">
					<input type="button" id="revive${allMember.value.member_id}" value="復活"></td>
			</tr>
		</c:forEach>
		<tr><td></td><td colspan="5" style="align:'center'"><a href="<c:url value='managerback'/>">回管理員首頁</a></td>
		</tr>
	</table>
	<script>
	var memberID=${memID}
	console.log(memberID)
	for(let i =0;i<=memberID.length;i++){
		$("#notype"+memberID[i]).click(function(){
			$.ajax({
				url: "shutup",
				type: "Post",
				data: {
					memID: memberID[i]
				},
				success : function(){
					alert("禁言成功");
				}
			})
		})
		$("#kill"+memberID[i]).click(function(){
			$.ajax({
				url: "kill",
				type: "Post",
				data: {
					memID: memberID[i]
				},
				success : function(){
					alert("要提醒會員");
				}
			})
		})
		$("#revive"+memberID[i]).click(function(){
			$.ajax({
				url: "revive",
				type: "Post",
				data: {
					memID: memberID[i]
				},
				success : function(){
					alert("復活他，不用念咒");
				}
			})
		})
	}
	</script>
</body>
</html>