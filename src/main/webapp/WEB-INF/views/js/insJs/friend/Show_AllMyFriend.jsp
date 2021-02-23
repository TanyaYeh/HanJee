<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Show ALL My Friend</title>

<style type="text/css">
/* .tb1 { */
/* 	display: inline */
/* } */
.friendList {
	/* 					border:1px black solid; */
	/* border-collapse: collapse; */
	
}

.friendList tr {
	/* border-collapse: collapse; */
	
}

.friendList th {
	/* border-collapse: collapse; */
	
}

/* .friendList td {
					 border: 1px black solid; 
					 border-collapse: collapse; 
				}  */
th {
	border: 1px black solid;
	border-collapse: collapse;
}

td {
	border: 1px black solid;
	text-align: center;
}

tr {
	border: 1px black solid;
}

.innerBox {
	border: 1px;
}

.btnbox {
	display: flex;
	justify-content: flex-start;
	border: 1px;
}

.btnDisplay {
	display: inline-block;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	data-crossorigin="anonymous"></script>
</head>

<body>

	<div align='center' class="div1">
		<h3>好友清單資料</h3>
		<hr>
		<table class="tb1 friendList">
			<tr>
				<th width='90'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='100'>綽 號</th>
				<th width='60'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='80'>星 座</th>
				<th width='50'>身 高</th>
				<th width='50'>體 重</th>
				<th width='90'>簡 述</th>
				<th width='90'>關 係</th>
				<th width='90'>按 鍵</th>
			</tr>

			<c:choose>
				<c:when test="${empty friendIDList}">
					<tr>
						<td colspan='11' align='center'><font color='red'>查無好友資料</font></td>
					</tr>
				</c:when>
				<c:otherwise>

					<c:forEach var="listFriend" items="${friendIDList }">

						<c:set var="friendId" scope="session" value="${listFriend}" />
						<tr>

							<td align="center"><img style="width: 80px; height: 80px"
								src='<c:url value="/friend/getPicture/${listFriend}" />'></td>

							<td>${memMap[listFriend].realname}</td>
							<td>${memMap[friendId].nickname}</td>
							<td>${memMap[friendId].gender}</td>
							<td>${peInfoMap[friendId].per_rel}</td>
							<td>${peInfoMap[friendId].per_con}</td>
							<td>${peInfoMap[friendId].per_high}</td>
							<td>${peInfoMap[friendId].per_wei}</td>
							<td><input type="text" rows="4" cols="8" id="comment"
								value="${frBMap[friendId].comment}"></td>
								
							<td><select id="close_rel">
									<option value="" disabled selected hidden>${frBMap[friendId].close_rel}</option>
									<option value="一般好友">一般好友</option>
									<option value="麻吉">麻吉</option>
									<option value="閨密">閨密</option>
									<option value="摯友">摯友</option>
							</select></td>

							<td class="innerBox btnbox" width='95'>
								<button class="btnDisplay" id="btn${memMap[friendId].member_id}"
									type="button">修改</button>&nbsp;&nbsp;
								<button class="btnDisplay"
									id="delete${memMap[friendId].member_id}" type="button">刪除</button>
							</td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
	</div>

	<script type="text/javascript">
			
			ele = ${friendIDList}
			console.log(ele)
			for(const i of ele){
				var friendid=i.toString();
				console.log(friendid);
				$("#btn"+friendid).click(function(){
				 	$.ajax({
			 		url:"updateFriend",
			 		type:"POST",
			 		data:{
			 			comment:$("#comment").val(),
			 			close_rel:$("#close_rel").val(),
			 			friendId: i,
			 		},
			 		success:function(data){
			 			$(location).prop("href","/Show_AllMyFriend.jsp");
			 			$("#update").click(function() {
							alert("更新成功");
						})
			 		}
			 	})
					});
				
			}
			
			
			for(const i of ele){
				var friendid=i.toString();
				console.log(friendid);
			$("#delete"+friendid).click(function(){
			 	$.ajax({
		 		url:"deleteFriend",
		 		type:"POST",
		 		data:{
		 			friendId: i,
		 		},
		 		success:function(data){
		 			$(location).prop("href","/Show_AllMyFriend.jsp");
		console.log(data);
		$("#update").click(function() {
			alert("刪除成功");
		})
		 		}
		 	})
				})
			
			}	
				
			
			
			
// 			$("#btn"+ele).click(function(){
// 				alert("haha");
// 				});
			


// })

// $("#delete").click(function(){
// 	$.ajax({
// 		url:"/updateFriend/${listFriend}",
// 		type:"POST",
// 		data:{
// 			comment:$("#comment").val(),
// 			close_rel:$("#close_rel").val()
// 		},
// 		success:function(data){
// 			$(location).prop("href","/updateFriend/${listFriend}");
// 		}
// 	})
// })

</script>
	<hr>
	<div align="center">
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp; <a
			href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
	</div>
</body>

</html>