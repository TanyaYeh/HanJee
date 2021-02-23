<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>交遊(友)網</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../css/main.css" />
	</head>
	<body>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  data-crossorigin="anonymous"></script>
		<!-- Header -->
			<header id="header">
				<div class="inner">
					<div class="content">
						<h1>交遊網</h1>
						<h2>~由遊~<br />
							~有友~</h2>
						<a href="#" class="button big alt"><span>Let's Go</span></a>
					</div>
					<a href="#" class="button hidden"><span>Let's Go</span></a>
				</div>
			</header>

		<!-- Main -->
			<div id="main">
				<div class="inner">
					<div class="columns">

						<!-- Column 1 (horizontal, vertical, horizontal, vertical) -->
							<div class="image fit">
								<a href="<c:url value='/friend/showInf' />"><img src="../images/pic01.jpg" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="<c:url value='/showAllMyFriend' />"><img src="../images/pic02.jpg" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="<c:url value='/queryFriendRequest' />"><img src="../images/pic03.png" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="<c:url value='/showAllMember' />"><img src="../images/pic04.png" alt="" /></a>
							</div>

						<!-- Column 2 (vertical, horizontal, vertical, horizontal) -->
							<div class="image fit">
								<a href="<c:url value='/tw/hanjee/ShowAllSentence' />"><img src="../images/pic06.jpg" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="<c:url value='/queryCon' />"><img src="../images/pic05.png" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="detail1.html"><img src="../images/pic08.jpg" alt="" /></a>
							</div>
							<div class="image fit">
								<a href="detail1.html"><img src="../images/pic07.jpg" alt="" /></a>
							</div>
				</div>
				</div>
			</div>
		<br>
		<div style="border:3px">好友推薦清單</div>
<%-- 		<div><form> foreach ${advice_fr.friend_id }</form></div> --%>
			
			<div align='center'>
		<hr>
		<table border='1'>
			<tr>
				<th width='120'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='56'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='90'>星 座</th>
				<th width='65'>按鍵</th>
			</tr>
			
			<c:choose>
				<c:when test="${empty Person_InfoList}">
					<tr>
						<td colspan='6' align='center'><font color='red'>暫無建議好友:可藉由購買行程，來遇見你生命中的另一個(他/她)喔♥♥♥</font></td>
					</tr>
				</c:when>
				<c:otherwise>

			<c:forEach var="person_Info" items="${Person_InfoList}" >
				<tr>
				<td align="center">
				<img style="width: 80px; height: 80px"
					src='<c:url value="/friend/getPicture/${person_Info.getBean().member_id}" />'></td>
	 				<td align="center">${person_Info.getBean().realname}</td>
					<td align="center">${person_Info.getBean().gender}</td>
			        <td align="center">${person_Info.per_rel}</td>
					<td align="center">${person_Info.per_con}</td>
<%--   這個或下面那行都行,Show_Basic_Info.jsp有用到		 <td align="center"><input type="button" value="加好友" onclick="location.href='<c:url value="/" />'"></td> --%>
					<td align="center"><a href='<c:url value="/addFriend/${person_Info.getBean().member_id}/-1" />'><button id="add">加好友</button></a></td>
				
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp;
	</div>
		
		<script type="text/javascript">
	$("#add").click(function(){
		alert("已送出邀請");
	})
	</script>
		<script src="../js/jquery.min.js"></script>
			<script src="../js/skel.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>
</body>
</html>