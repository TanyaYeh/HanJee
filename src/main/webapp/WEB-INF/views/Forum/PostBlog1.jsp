<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>清單</title>
<link rel='stylesheet' href="<c:url value='/css/styles.css'/>"
	type="text/css" />
	
	
	
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>${forum.forum_name}</h1>
			</div>


			<div align='center'>
				<a href="<c:url value='/' />">回首頁</a>
			</div>

			<div align='center'>
				<a href="<c:url value='AddPost' />">發表文章</a>
			</div>



		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<table > 
<!-- <table style="border: black 1px solid;">  -->
<!-- 			給他格子 -->
				<tr>
					<th width="10%">論壇版塊</th>
					<th width="20%">文章標題</th>
					<th width="20%">圖片</th>				
					<th width="20%">發表人</th>
					<th width="20%">發表時間</th>
				</tr>
				<c:forEach var='post' items='${posts}'>
					<tr>
						<td>${post.forumBean.forum_name}</td>
						<td><a
							href="<spring:url value='post?post_no=${post.post_no}'/>"
							class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>${post.post_tit}
						</a></td>

						<td><img width='150' height='150'
							src="<c:url value='/tw/hanjee/getPicture/${post.post_no}' />" /></td>

						<td>${post.mb.nickname}</td>


						<td width='500' >${post.post_time}</td>




					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
</body>
</html>