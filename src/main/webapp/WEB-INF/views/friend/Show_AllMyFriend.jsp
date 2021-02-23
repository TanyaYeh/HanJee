<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/fragment/Top.jsp" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Show ALL My Friend</title>

<style type="text/css">
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

/* .innerBox { */
/* 	border: 1px; */
/* } */

/* .btnbox { */
/* 	display: flex; */
/* 	justify-content: flex-start; */
/* 	border: 1px; */
/* } */

/* .btnDisplay { */
/* 	display: inline-block; */
/* 	margin: 0 auto */
/* } */




@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:#A7A1AE;
  background-color: #E6EBDF;
  
}

h1 {
  font-size:3em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #FB667A;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #FB667A;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: center;
	  overflow: hidden;
	  width: 90%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
	  padding-bottom: 2%;
	  padding-top: 2%;
/*   padding-left:2%;   */
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #2C3446;
}

.container th {
	  background-color: #1F2739;
}

.container td:first-child { color: #FB667A; }

.container tr:hover {
   background-color: #464A52;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }

}

</style>

</head>

<body style="background-color:#E6EBDF ">
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		data-crossorigin="anonymous"></script>


	<div align='center'>
		<h3>好友清單資料</h3>
		<hr>
		<table class="container">
			<tr>
				<th width='90'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='100'>綽 號</th>
				<th width='60'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='80'>星 座</th>
				<th width='50'>身 高</th>
				<th width='50'>體 重</th>
				<th width='90'>小 聊 天 室</th>
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
						<tr id="friendcolumn${memMap[listFriend].member_id}">

							<td align="center"><img style="width: 80px; height: 80px"
								src='<c:url value="/friend/getPicture/${listFriend}" />'></td>

							<td>${memMap[listFriend].realname}</td>
							<td>${memMap[listFriend].nickname}</td>
							<td>${memMap[listFriend].gender}</td>
							<td>${peInfoMap[listFriend].per_rel}</td>
							<td>${peInfoMap[listFriend].per_con}</td>
							<td>${peInfoMap[listFriend].per_high}</td>
							<td>${peInfoMap[listFriend].per_wei}</td>
							<td><input type="text" rows="4" cols="8"
								id="comment${memMap[listFriend].member_id}"
								value="${frBMap[listFriend].comment}"></td>

							<td><select id="close_rel${memMap[listFriend].member_id}">
									<option value="" disabled selected hidden>${frBMap[listFriend].close_rel}</option>
									<option value="一般好友">一般好友</option>
									<option value="麻吉">麻吉</option>
									<option value="閨密">閨密</option>
									<option value="摯友">摯友</option>
							</select></td>

							<td class="innerBox btnbox" width='95'>
								<button class="btnDisplay"
									id="btn${memMap[listFriend].member_id}" type="button">修改</button>&nbsp;&nbsp;
								<button class="btnDisplay"
									id="delete${memMap[listFriend].member_id}" type="button">刪除</button>
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
			 			comment:$("#comment"+i).val(),
			 			close_rel:$("#close_rel"+i).val(),
			 			friendId: i,
			 		},
			 		success:function(data){
			 			alert("更新成功");
			 			$("#comment"+i).value=data;
			 		}
			 	})
					});
				$("#delete"+friendid).click(function(){
				 	$.ajax({
			 		url:"deleteFriend",
			 		type:"POST",
			 		data:{
			 			friendId: i,
			 		},
			 		success:function(data){
			 			alert("刪除成功");
}
			 	});
				 	
					});
				
// 				$(location).prop("href","/Show_AllMyFriend.jsp");
//		 		console.log(data);
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